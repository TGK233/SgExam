package edu.numberone.studystar.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.LinkedList;

import edu.numberone.studystar.entity.*;
import edu.numberone.studystar.utils.DBUtils;

public class QuestionDaoImpl {
	
	private Connection conn = null;
	private Statement st = null;
	private ResultSet rs = null;
	private PreparedStatement ps = null;
	
	
	/*
	 * ������:getQuestion
	 * ����:	question Question����	����ѡ������
	 * 		page ���α���	��������0��ʾ��ѯ�ĵڼ�ҳ������С��0��ʾ��ѯȫ�����
	 * 		number ���α���	��ҳ������0ʱ��ʾ���ؽ������
	 * ����ֵ:	LinkedList<Question>���͵�����
	 * */
	
	public LinkedList<Question> getQuestion(Question question, int page, int number){
		LinkedList<Question> ques = new LinkedList<Question>();
		
		StringBuilder sql = new StringBuilder();
		sql.append("Select * from question where 1 = 1");
		
		if(question.getQ_id() != null){
			sql.append(" and q_id = '" + question.getQ_id() + "'");
		}
		
		if(question.getQ_title() != null){
			sql.append(" and q_title like '%"  + question.getQ_title() + "%'");
		}
		
		if(question.getQ_type() != null){
			sql.append(" and q_type = '" + question.getQ_type() + "'");
		}
		
		if(question.getQ_select() != null){
			sql.append(" and q_select like '%" + question.getQ_select() + "%'");
		}
		
		if(question.getQ_score() != null){
			sql.append(" and a_date = '" + question.getQ_score() + "'");
		}
		
		if(number > 0){
			page = (page - 1) * number;
			sql.append(" limit " + page + ", " + number);
		}
		
		try{
			conn = DBUtils.getInstance().openConnection();
			st = conn.createStatement();
			rs = st.executeQuery(sql.toString());
			Question que;
			while(rs.next()){
				que = new Question();
				que.setQ_id(rs.getString("q_id"));
				que.setQ_title(rs.getString("q_title"));
				que.setQ_type(rs.getString("q_type"));
				que.setQ_select(rs.getString("q_select"));
				que.setQ_answer(rs.getString("q_answer"));
				que.setQ_score(rs.getString("q_score"));
				ques.add(que);
			}
		}catch(Exception e){
			e.printStackTrace();
			ques = null;
		}finally{
			resouseClose();
		}
		return ques;
	}
	
	/*
	 * ������:getQuestion
	 * ����:	qList String ����qList(��Ŀ��Ŵ�)����Ŀ
	 * 		page ���α���	��������0��ʾ��ѯ�ĵڼ�ҳ������С��0��ʾ��ѯȫ�����
	 * 		number ���α���	��ҳ������0ʱ��ʾ���ؽ������
	 * ����ֵ:	LinkedList<Question>���͵�����
	 * */
	
	public LinkedList<Question> getQuestion(String qList, int page, int number){
		LinkedList<Question> ques = new LinkedList<Question>();
		
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT * FROM question WHERE LOCATE(CONCAT('@', q_id, '@'), '"+ qList +"')");
		
		if(number > 0){
			page = (page - 1) * number;
			sql.append(" limit " + page + ", " + number);
		}
		
		try{
			conn = DBUtils.getInstance().openConnection();
			st = conn.createStatement();
			rs = st.executeQuery(sql.toString());
			Question que;
			while(rs.next()){
				que = new Question();
				que.setQ_id(rs.getString("q_id"));
				que.setQ_title(rs.getString("q_title"));
				que.setQ_type(rs.getString("q_type"));
				que.setQ_select(rs.getString("q_select"));
				que.setQ_answer(rs.getString("q_answer"));
				que.setQ_score(rs.getString("q_score"));
				ques.add(que);
			}
		}catch(Exception e){
			e.printStackTrace();
			ques = null;
		}finally{
			resouseClose();
		}
		return ques;
	}
	
	/*
	 *������:deleteQuestion
	 *����:	question Question����	����ѡ������
	 *����ֵ:	String�����ַ���,��ʾ��ѯ���
	 * */
	public String deleteQuestion(Question question){
		String resultStr = "";
		int strCount = 0;
		StringBuilder sql = new StringBuilder();
		sql.append("delete from question where 1 = 1");
		
		if(question.getQ_id() != null){
			sql.append(" and q_id = '" + question.getQ_id() + "'");
			strCount++;
		}
		
		
		if(strCount == 0){
			resultStr = "CANNOT_DELETE_ALL_QUESTION";
		}else{
			try{
				conn = DBUtils.getInstance().openConnection();
				st = conn.createStatement();
				if(st.executeUpdate(sql.toString()) > 0){
					resultStr = "DELETE_QUESTION_SUCCESS";
				}else{
					resultStr = "DELETE_QUESTION_FAILURE";
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
	 *������:updateQuestion	���·�������������
	 *����:	question Question����	����ѡ������
	 *����ֵ:	String�����ַ���,��ʾ��ѯ���
	 * */
	public String updateQuestion(Question question){
		String resultStr = "";
		String sql = "update question set q_type = ?, q_title = ?, q_select = ?, q_score = ?, q_answer = ? where q_id = ?";
		
		if(question.getQ_id() == null){
			resultStr = "CANNOT_UPDATE_ANNOUNCEMENT_WITH_NULL_ID";
		}else{
			try{
				conn = DBUtils.getInstance().openConnection();
				ps = conn.prepareStatement(sql);
				ps.setString(1, question.getQ_type());
				ps.setString(2, question.getQ_title());
				ps.setString(3, question.getQ_select());
				ps.setString(4, question.getQ_score());
				ps.setString(5, question.getQ_answer());
				ps.setString(6, question.getQ_id());
				int result = ps.executeUpdate();
				if(result == 1){
					resultStr = "UPDATE_QUESTION_SUCCESS";
				}else if(result == 0){
					resultStr = "UPDATE_QUESTION_FAILURE";
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
	 *������:addQusetion	���·�������������
	 *����:	question Question����	��Ӷ���
	 *����ֵ:	String�����ַ���,��ʾ��ѯ���
	 * */
	public String addQuestion(Question question){
		String resultStr = "";
		String sql = "insert into question (q_type, q_title, q_select, q_score, q_answer) values(?, ?, ?, ?, ?)";
		
		try{
			conn = DBUtils.getInstance().openConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, question.getQ_type());
			ps.setString(2, question.getQ_title());
			ps.setString(3, question.getQ_select());
			ps.setString(4, question.getQ_score());
			ps.setString(5, question.getQ_answer());
			int result = ps.executeUpdate();
			if(result == 1){
				resultStr = "ADD_QUESTION_SUCCESS";
			}else if(result == 0){
				resultStr = "ADD_QUSETION_FAILURE";
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
