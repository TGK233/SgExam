package edu.numberone.studystar.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.LinkedList;

import edu.numberone.studystar.entity.Classes;
import edu.numberone.studystar.utils.DBUtils;

public class ClassesDaoImpl {
	
	private Connection conn = null;
	private Statement st = null;
	private ResultSet rs = null;
	private PreparedStatement ps = null;
	
	
	/*
	 * ������:getClasses
	 * ����:	cls Classes����	����ѡ������
	 * 		page ���α���	��������0��ʾ��ѯ�ĵڼ�ҳ������С��0��ʾ��ѯȫ�����
	 * 		number ���α���	��ҳ������0ʱ��ʾ���ؽ������
	 * ����ֵ:	LinkedList<Classes>���͵�����
	 * */
	
	public LinkedList<Classes> getClasses(Classes cls,int page, int number){
		LinkedList<Classes> clses = new LinkedList<Classes>();
		
		StringBuilder sql = new StringBuilder();
		sql.append("Select * from classes where 1 = 1");
		
		if(cls.getCls_id() != null){
			sql.append(" and cls_id = '" + cls.getCls_id() + "'");
		}
		
		if(cls.getCls_name() != null){
			sql.append(" and cls_name = '"  + cls.getCls_name() + "'");
		}
		
		if(cls.getColl_id() != null){
			sql.append(" and coll_id = '" + cls.getColl_id() + "'");
		}
		
		if(number > 0){
			page = (page - 1) * number;
			sql.append(" limit " + page + ", " + number);
		}
		
		try{
			conn = DBUtils.getInstance().openConnection();
			st = conn.createStatement();
			rs = st.executeQuery(sql.toString());
			Classes ncls;
			while(rs.next()){
				ncls = new Classes();
				ncls.setCls_id(rs.getString("cls_id"));
				ncls.setCls_name(rs.getString("cls_name"));
				ncls.setColl_id(rs.getString("coll_id"));
				clses.add(ncls);
			}
		}catch(Exception e){
			e.printStackTrace();
			clses = null;
		}finally{
			resouseClose();
		}
		return clses;
	}
	
	/*
	 *������:deleteClasses
	 *����:	cls Annoucement����	����ѡ������
	 *����ֵ:	String�����ַ���,��ʾ��ѯ���
	 * */
	public String deleteClasses(Classes cls){
		String resultStr = "";
		int strCount = 0;
		StringBuilder sql = new StringBuilder();
		sql.append("delete from classes where 1 = 1");
		
		if(cls.getCls_id() != null){
			sql.append(" and cls_id = '" + cls.getCls_id() + "'");
			strCount++;
		}
		
		if(strCount == 0){
			resultStr = "CANNOT_DELETE_ALL_CLASSES";
		}else{
			try{
				conn = DBUtils.getInstance().openConnection();
				st = conn.createStatement();
				if(st.executeUpdate(sql.toString()) > 0){
					resultStr = "DELETE_CLASS_SUCCESS";
				}else{
					resultStr = "DELETE_CLASS_FAILURE";
				}
				
			}catch(Exception e){
				e.printStackTrace();
				
			}finally{
				resouseClose();
			}
		}
		
		return resultStr;
	}
	
	/*
	 *������:updateClasses	���·�������������
	 *����:	cls Classes����	����ѡ������
	 *����ֵ:	String�����ַ���,��ʾ��ѯ���
	 * */
	public String updateClasses(Classes cls){
		String resultStr = "";
		String sql = "update classes set cls_name = ?, coll_id = ? where cls_id = ?";
		
		if(cls.getCls_id() == null){
			resultStr = "CANNOT_UPDATE_CLASSES_WITH_NULL_ID";
		}else{
			try{
				conn = DBUtils.getInstance().openConnection();
				ps = conn.prepareStatement(sql);
				ps.setString(1, cls.getCls_name());
				ps.setString(2, cls.getColl_id());
				ps.setString(3, cls.getCls_id());
				int result = ps.executeUpdate();
				if(result == 1){
					resultStr = "UPDATE_CLASS_SUCCESS";
				}else if(result == 0){
					resultStr = "UPDATE_CLASS_FAILURE";
				}
				
			}catch(Exception e){
				e.printStackTrace();
				
			}finally{
				resouseClose();
			}
		}
		
		return resultStr;
	}
	
	/*
	 *������:addClasses	���·�������������
	 *����:	cls Classes����	��Ӷ���
	 *����ֵ:	String�����ַ���,��ʾ��ѯ���
	 * */
	public String addClasses(Classes cls){
		String resultStr = "";
		String sql = "insert into classes (cls_id, cls_name, coll_id) values(?, ?, ?)";
		
		try{
			conn = DBUtils.getInstance().openConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, cls.getCls_id());
			ps.setString(2, cls.getCls_name());
			ps.setString(3, cls.getColl_id());
			int result = ps.executeUpdate();
			if(result == 1){
				resultStr = "ADD_CLASS_SUCCESS";
			}else if(result == 0){
				resultStr = "ADD_CLASS_FAILURE";
			}
			
		}catch(Exception e){
			e.printStackTrace();
			
		}finally{
			resouseClose();
		}
		
		return resultStr;
	}
	
	
	private void resouseClose(){
		try{
			if(rs != null){
				rs.close();
			}
			if(st != null){
				st.close();
			}
			if(ps != null){
				ps.close();
			}
			if(conn != null){
				conn.close();
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
}
