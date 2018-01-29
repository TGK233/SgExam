package edu.numberone.studystar.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import edu.numberone.studystar.dao.PersonInfomationDao;
import edu.numberone.studystar.entity.Manager;
import edu.numberone.studystar.entity.Student;
import edu.numberone.studystar.utils.DBUtils;

public class StudentInformationDaoImple implements PersonInfomationDao<Student> {

	/**
	 * �����ݿ��ø�����Ϣ
	 * 
	 * @param person
	 *            ��Ҫ���ҵ�ѧ����Ϣ
	 * @return �����Ѳ��ҵ�ѧ����Ϣ ��������ҳɹ��򷵻ظ�����Ϣ�����򷵻�Ϊnull
	 * 
	 */
	@Override
	public Student findPersonInforFromDB(Student person) {
		// TODO Auto-generated method stub

		String s_id = null;

		Connection conn = null;

		PreparedStatement preparedStatement = null;

		ResultSet reSet = null;

		DBUtils dbUtils = null;

		if (person != null) {
			s_id = person.getS_id();

			// ����Ҫ���ҵ�ѧ��ѧ�Ž����жϣ����ѧ����ѧ�Ų�Ϊnull,��õ�ѧ����ѧ��
			s_id = person.getS_id() != null ? ("".equals(person.getS_id()) ? null : person.getS_id()) : null;

			if (s_id != null) {

				try {
					dbUtils = DBUtils.getInstance();
					conn = dbUtils.openConnection();
					StringBuffer sql = new StringBuffer();
					sql.append(
							"select S_ID,S_Pass,S_Name,S_Sex ,student.CLS_ID as clazzId,classes.CLS_Name as clazzName from student left outer join classes");
					sql.append(" on student.CLS_ID = classes.CLS_ID");
					sql.append(" where 1=1");
					sql.append(" and S_ID =?;");

					preparedStatement = conn.prepareStatement(sql.toString());

					if (preparedStatement != null) {
						preparedStatement.setString(1, s_id);

						reSet = preparedStatement.executeQuery();

						if (reSet.next()) {

							Student stu = new Student();
							stu.setS_id(reSet.getString("S_ID"));
							stu.setS_name(reSet.getString("S_Name"));
							stu.setS_pass(reSet.getString("S_Pass"));
							stu.setS_sex(reSet.getString("S_Sex"));
							stu.setCls_Id(reSet.getString("clazzId"));
							stu.setCls_Name(reSet.getString("clazzName"));

							System.out.println("name :" + stu.getS_name() + "clazz:" + stu.getCls_Name());

							return stu;

						}

					}

				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} finally {

					dbUtils.disResultSet(reSet);
					dbUtils.disSatement(preparedStatement);
					dbUtils.disConnection(conn);

				}

			}

		}

		return null;
	}

	/**
	 * �޸�ѧ������Ϣ
	 * 
	 * @param manager
	 *            ��Ҫ�޸ĵ�ѧ��
	 * 
	 */
	@Override
	public int updatepersonInformationToDB(Student student) {
		// TODO Auto-generated method stub
		String s_id = null;

		Connection conn = null;

		PreparedStatement preparedStatement = null;

		int result = 0;

		DBUtils dbUtils = null;

		if (student != null) {

			// ����Ҫ���ҵĹ����Ž����жϣ���������Ų�Ϊnull,��õ�ѧ����ѧ��
			s_id = student.getS_id() != null ? ("".equals(student.getS_id()) ? null : student.getS_id()) : null;

			if (s_id != null) {

				try {
					dbUtils = DBUtils.getInstance();
					conn = dbUtils.openConnection();
					StringBuffer sql = new StringBuffer();
					sql.append("UPDATE student SET S_ID=?,S_Name=?,S_Pass=?,S_Sex=?,CLS_ID=?");
					sql.append(" where 1=1");
					sql.append(" and S_ID = ?;");

					preparedStatement = conn.prepareStatement(sql.toString());
					preparedStatement.setString(1, student.getS_id());
					preparedStatement.setString(2, student.getS_name());
					preparedStatement.setString(3, student.getS_pass());
					preparedStatement.setString(4, student.getS_sex());
					preparedStatement.setString(5, student.getCls_Id());
					preparedStatement.setString(6, s_id);

					result = preparedStatement.executeUpdate();

					return result;

				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} finally {

					dbUtils.disSatement(preparedStatement);
					dbUtils.disConnection(conn);

				}

			}

		}

		return 0;
	}

	/**
	 * �����ݿ���ѧ����Ϣ
	 * 
	 * @param sql
	 *            ����ѧ����Ϣ��sql���
	 * @param ��������
	 * @return �����Ѳ��ҵ�ѧ����Ϣ ��������ҳɹ��򷵻�ѧ����Ϣ�����򷵻�Ϊnull
	 * 
	 */
	@Override
	public List<Student> findPersonInforFromDB(String sql, String[] parms) {
		// TODO Auto-generated method stub
		DBUtils dbUtils = null;
		Connection conn = null;

		ResultSet resultSet = null;

		PreparedStatement preparedStatement = null;
		dbUtils = DBUtils.getInstance();
		conn = dbUtils.openConnection();

		List<Student> list = new ArrayList<Student>();

		try {

			if (conn != null) {
				preparedStatement = conn.prepareStatement(sql);

				if (preparedStatement != null) {
					if (parms != null && parms.length > 0) {
						for (int i = 0; i < parms.length; i++) {
							System.out.println("i-->" + i);
							preparedStatement.setString(i + 1, parms[i]);
						}
					}
					System.out.println(sql);
					resultSet = preparedStatement.executeQuery();

					ResultSetMetaData reData = resultSet.getMetaData();

					while (resultSet.next()) {
						Student stu = new Student();
						stu.setS_id(resultSet.getString("S_ID"));
						stu.setS_name(resultSet.getString("S_Name"));
						stu.setS_pass(resultSet.getString("S_Pass"));
						stu.setS_sex(resultSet.getString("S_Sex"));
						stu.setCls_Id(resultSet.getString("clazzId"));
						stu.setCls_Name(resultSet.getString("clazzName"));
						list.add(stu);

					}

					return list;
				}

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

			throw new RuntimeException(e.getMessage());
		}finally {
			dbUtils.disResultSet(resultSet);
			dbUtils.disSatement(preparedStatement);
			dbUtils.disConnection(conn);

		}

		return null;
	}

	@Override
	public int addPersonInformationToDB(Student student) {
		// TODO Auto-generated method stub
		String s_id = null;

		Connection conn = null;

		PreparedStatement preparedStatement = null;

		int result = 0;

		DBUtils dbUtils = null;

		if (student != null) {

			// ����Ҫ���ҵĹ����Ž����жϣ���������Ų�Ϊnull,��õ�ѧ����ѧ��
			s_id = student.getS_id() != null ? ("".equals(student.getS_id()) ? null : student.getS_id()) : null;

			if (s_id != null) {

				try {
					dbUtils = DBUtils.getInstance();
					conn = dbUtils.openConnection();
					StringBuffer sql = new StringBuffer();
					sql.append("insert into student(s_id,s_pass,s_name,s_sex,cls_id) values (?,?,?,?,?)");

					preparedStatement = conn.prepareStatement(sql.toString());
					preparedStatement.setString(1, student.getS_id());
					preparedStatement.setString(2, student.getS_pass());
					preparedStatement.setString(3, student.getS_name());
					preparedStatement.setString(4, student.getS_sex());
					preparedStatement.setString(5, student.getCls_Id());

					result = preparedStatement.executeUpdate();

					return result;

				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} finally {

					dbUtils.disSatement(preparedStatement);
					dbUtils.disConnection(conn);

				}

			}

		}
		return 0;
	}

	
	/**
	 * ɾ��ѧ����Ϣ
	 * */
	@Override
	public int deletePersonInformationToDB(List<Student> students) {
		// TODO Auto-generated method stub
		String s_id = null;

		Connection conn = null;

		PreparedStatement preparedStatement = null;

		int result = 0;

		DBUtils dbUtils = null;

		if (students != null && students.size() > 0) {
			
			
			for(int i= 0 ; i < students.size();i++){
				s_id = students.get(i).getS_id();

				// ����Ҫ���ҵĹ����Ž����жϣ���������Ų�Ϊnull,��õ�ѧ����ѧ��
				s_id = students.get(i).getS_id() != null ? ("".equals(students.get(i).getS_id()) ? null : students.get(i).getS_id()) : null;

				if (s_id != null) {

					try {
						dbUtils = DBUtils.getInstance();
						conn = dbUtils.openConnection();
						StringBuffer sql = new StringBuffer();
						sql.append("DELETE from student where S_ID = ?;");

						preparedStatement = conn.prepareStatement(sql.toString());
						preparedStatement.setString(1, students.get(i).getS_id());
						

						result = preparedStatement.executeUpdate();


					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} finally {

						dbUtils.disSatement(preparedStatement);
						dbUtils.disConnection(conn);

					}

				}

			}
			return result;
		
		}

		return 0;
	}

}
