package edu.numberone.studystar.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;



import edu.numberone.studystar.utils.DBUtils;

public class ModifyData {
	private Connection conn;
	private PreparedStatement pst;
	private ResultSet rs;
	public String pass;
	//�޸�����Ĳ��裺
	//1.ͨ���Ѿ���¼���û�����ѯ����ԭ���룬
	//2.��ȡ���������������ȷ��������������ֵ��
	//3.�ж�ԭ������������ֵ�Ƿ���ȣ������ȣ�������ж���������ȷ��������������ֵ�Ƿ�һ�£����һ�£��Ͱ��������滻��ԭ����
	
	//String sql1="select S_Pass from Student where S_Name=?";//S_Name��S_ID;
	//sql2="update Student set S_Pass=? where S_Name=?";
	public boolean ModifyPass(String sql1,String sql2,String username,String oldpass,String newpass,String repass){
		 
		 
		 try {
			 //���ݵ�¼�û���ѯ������
			//sql1="select S_Pass from Student where S_Name=?";//S_Name��S_ID
			conn=DBUtils.getInstance().openConnection();
			pst=conn.prepareStatement(sql1);
			pst.setString(1,username);
			rs=pst.executeQuery();
			while(rs.next()){
				//String pass=rs.getString(1);   //�ӽ�����еõ����������ݿ�����û�����
				pass=rs.getString(1);
			
			if(pass.equals(oldpass)&&newpass.equals(repass)){
				//sql2="update Student set S_Pass=? where S_Name=?";
				pst=conn.prepareStatement(sql2);
				pst.setString(1, newpass);
				pst.setString(2, username);
				pst.executeUpdate();
			}else{
				System.out.print("�����޸�ʧ�ܣ�  ");
				if(!pass.equals(oldpass)){
					System.out.println("������д�ľ��������");
				}
				return false;
				//System.out.println("�����޸�ʧ�ܣ�");
				
			}
			}
			
			rs.close();
			pst.close();
			conn.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return true;
	}
}
