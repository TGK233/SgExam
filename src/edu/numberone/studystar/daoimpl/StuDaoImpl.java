package edu.numberone.studystar.daoimpl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.PreparedStatement;

import edu.numberone.studystar.utils.DBUtils;

public class StuDaoImpl {

	public String AchieveName(String status,String id,String password) {
		String table=null;
		String STM_Name = null;
		String STM_ID=null;
		String STM_Pass=null;
		switch (status) {
		case "student":
			table = "student";
			STM_Name = "S_Name";
			STM_ID = "S_ID";
			STM_Pass = "S_Pass";
			break;
		case "teacher":
			table = "teacher";
			STM_Name = "T_Name";
			STM_ID = "T_ID";
			STM_Pass = "T_Pass";
			break;
		case "admin":
			table = "manager";
			STM_Name = "M_Name";
			STM_ID = "M_ID";
			STM_Pass = "M_Pass";
			break;
		}
		
		Connection conn = DBUtils.getInstance().openConnection();
		String sql ="";
		sql += "select "+STM_Name;
		sql	+= " from "+table;
		sql	+= " where "+STM_ID+"=?";
		sql += " and "+STM_Pass+"=?";

		try {
			// ����ִ�ж���
			PreparedStatement pstat = conn.prepareStatement(sql);
			pstat.setString(1, id);
			pstat.setString(2, password);
			// pstat.executeQuery()�᷵��һ�������
			ResultSet rs =pstat.executeQuery();
			// ����rs�ص�next()����������������������Ϊ�棬��ô���ʾ������
			if (rs.next()) {
				return rs.getString(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			// �ر����ݿ�����
			//util.disConnection(conn);
		}
		// �����û��Ƿ��ڱ��д��ڵĲ���ֵ
		return null;
	}

}
