package edu.numberone.studystar.daoimpl;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import edu.numberone.studystar.dao.PersonInfomationDao;
import edu.numberone.studystar.entity.Manager;
import edu.numberone.studystar.utils.DBUtils;

public class ManagerInformationDaoImple implements PersonInfomationDao<Manager> {

	/**
	 * �����ݿ��ø�����Ϣ
	 * 
	 * @param person
	 *            ��Ҫ���ҵ�ѧ����Ϣ
	 * @return �����Ѳ��ҵĹ���Ա��Ϣ ��������ҳɹ��򷵻ظ�����Ϣ�����򷵻�Ϊnull
	 * 
	 */
	@Override
	public Manager findPersonInforFromDB(Manager person) {
		// TODO Auto-generated method stub
		String m_id = null;

		Connection conn = null;

		PreparedStatement preparedStatement = null;

		ResultSet reSet = null;

		DBUtils dbUtils = null;

		if (person != null) {
			m_id = person.getM_id();

			// ����Ҫ���ҵĹ����Ž����жϣ���������Ų�Ϊnull,��õ�ѧ����ѧ��
			m_id = person.getM_id() != null ? ("".equals(person.getM_id()) ? null : person.getM_id()) : null;

			if (m_id != null) {

				try {
					dbUtils = DBUtils.getInstance();
					conn = dbUtils.openConnection();
					StringBuffer sql = new StringBuffer();
					sql.append("select M_ID,M_Pass,M_Name,M_LastLoginTime from manager");
					sql.append(" where 1=1");
					sql.append(" and M_ID = ?;");

					preparedStatement = conn.prepareStatement(sql.toString());
					preparedStatement.setString(1, m_id);

					reSet = preparedStatement.executeQuery();

					if (reSet.next()) {
						Manager manager = new Manager();
						manager.setM_id(reSet.getString("M_ID"));
						manager.setM_pass(reSet.getString("M_Pass"));
						manager.setM_name(reSet.getString("M_Name"));

						// SimpleDateFormat simpleDateFormat = new
						// SimpleDateFormat("yyyy-MM-dd- hh:mm:ss");

						// reSet.getTimestamp("M_LastLoginTime")��ȡ���ݿ��DateTime����
						manager.setM_LastLoginTime(reSet.getTimestamp("M_LastLoginTime"));
						return manager;
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
	 * �޸Ĺ���Ա����Ϣ
	 * 
	 * @param manager
	 *            ��Ҫ�޸ĵĹ���Ա
	 * 
	 */
	public int updatepersonInformationToDB(Manager manager) {
		// TODO Auto-generated method stub
		String m_id = null;

		Connection conn = null;

		PreparedStatement preparedStatement = null;

		int result = 0;

		DBUtils dbUtils = null;

		if (manager != null) {
			m_id = manager.getM_id();

			// ����Ҫ���ҵĹ����Ž����жϣ���������Ų�Ϊnull,��õ�ѧ����ѧ��
			m_id = manager.getM_id() != null ? ("".equals(manager.getM_id()) ? null : manager.getM_id()) : null;

			if (m_id != null) {

				try {
					dbUtils = DBUtils.getInstance();
					conn = dbUtils.openConnection();
					StringBuffer sql = new StringBuffer();
					sql.append("UPDATE manager SET M_Name=?,M_Pass=?, M_LastLoginTime=?");
					sql.append(" where 1=1");
					sql.append(" and M_ID = ?;");

					preparedStatement = conn.prepareStatement(sql.toString());

					preparedStatement.setString(1, manager.getM_name());
					preparedStatement.setString(2, manager.getM_pass());
					preparedStatement.setTimestamp(3, manager.getM_LastLoginTime());
					preparedStatement.setString(4, m_id);

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
	 * �޸Ĺ���Ա�ϴε�¼��ʱ��
	 * 
	 * @param manager��Ҫ�޸ĵĹ���Ա
	 * 
	 */
	public int updateManagerLastTime(Manager manager) {

		// TODO Auto-generated method stub
		String m_id = null;

		Connection conn = null;

		PreparedStatement preparedStatement = null;

		int result = 0;

		DBUtils dbUtils = null;

		if (manager != null) {
			m_id = manager.getM_id();

			// ����Ҫ���ҵĹ����Ž����жϣ���������Ų�Ϊnull,��õ�ѧ����ѧ��
			m_id = manager.getM_id() != null ? ("".equals(manager.getM_id()) ? null : manager.getM_id()) : null;

			if (m_id != null) {

				try {
					dbUtils = DBUtils.getInstance();
					conn = dbUtils.openConnection();
					StringBuffer sql = new StringBuffer();
					sql.append("UPDATE manager SET M_LastLoginTime=?");
					sql.append(" where  M_ID =?;");

					System.out.println("sql-->" + sql.toString());
					preparedStatement = conn.prepareStatement(sql.toString());
					preparedStatement.setTimestamp(1, manager.getM_LastLoginTime());
					preparedStatement.setString(2, m_id);

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
	 * �����ݿ��ø�����Ϣ
	 * 
	 * @param sql
	 *            ���Ҹ�����Ϣ��sql���
	 * @param ��������
	 * @return �����Ѳ��ҵĸ�����Ϣ ��������ҳɹ��򷵻ظ�����Ϣ�����򷵻�Ϊnull
	 * 
	 */
	@Override
	public List<Manager> findPersonInforFromDB(String sql, String[] parms) {
		// TODO Auto-generated method stub
		DBUtils dbUtils = null;
		Connection conn = null;

		ResultSet resultSet = null;

		PreparedStatement preparedStatement = null;
		dbUtils = DBUtils.getInstance();
		conn = dbUtils.openConnection();

		List<Manager> list = new ArrayList<Manager>();

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
						Manager manager = new Manager();
						manager.setM_id(resultSet.getString("M_ID"));
						manager.setM_pass(resultSet.getString("M_Pass"));
						manager.setM_name(resultSet.getString("M_Name"));
						manager.setM_LastLoginTime(resultSet.getTimestamp("M_LastLoginTime"));
						list.add(manager);

					}

					return list;
				}

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

			throw new RuntimeException(e.getMessage());
		} finally {
			dbUtils.disResultSet(resultSet);
			dbUtils.disSatement(preparedStatement);
			dbUtils.disConnection(conn);

		}

		return null;
	}

	/**
	 * ��ӹ�����Ա
	 * 
	 * @param manager
	 *            ��Ҫ��ӵĹ���Ա
	 * 
	 */
	@Override
	public int addPersonInformationToDB(Manager manager) {
		String m_id = null;

		Connection conn = null;

		PreparedStatement preparedStatement = null;

		int result = 0;

		DBUtils dbUtils = null;

		if (manager != null) {
			m_id = manager.getM_id();

			// ����Ҫ���ҵĹ����Ž����жϣ���������Ų�Ϊnull,��õ�ѧ����ѧ��
			m_id = manager.getM_id() != null ? ("".equals(manager.getM_id()) ? null : manager.getM_id()) : null;

			if (m_id != null) {

				try {
					dbUtils = DBUtils.getInstance();
					conn = dbUtils.openConnection();
					StringBuffer sql = new StringBuffer();
					sql.append("insert into manager(M_ID,M_Pass,M_Name,M_LastLoginTime) values (?,?,?,?)");

					preparedStatement = conn.prepareStatement(sql.toString());
					preparedStatement.setString(1, manager.getM_id());
					
					preparedStatement.setString(2, manager.getM_pass());
					preparedStatement.setString(3, manager.getM_name());
					preparedStatement.setTimestamp(4, manager.getM_LastLoginTime());

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
	 * ɾ������Ա��Ϣ
	 * 
	 * @param managers
	 *            ��Ҫɾ���Ĺ�����Ա
	 * 
	 */
	@Override
	public int deletePersonInformationToDB(List<Manager> managers) {
		// TODO Auto-generated method stub
		String m_id = null;

		Connection conn = null;

		PreparedStatement preparedStatement = null;

		int result = 0;

		DBUtils dbUtils = null;

		if (managers != null && managers.size() > 0) {

			for (int i = 0; i < managers.size(); i++) {
				m_id = managers.get(i).getM_id();

				// ����Ҫ���ҵĹ����Ž����жϣ���������Ų�Ϊnull,��õ�ѧ����ѧ��
				m_id = managers.get(i) != null
						? ("".equals(managers.get(i).getM_id()) ? null : managers.get(i).getM_id()) : null;

				if (m_id != null) {

					try {
						dbUtils = DBUtils.getInstance();
						conn = dbUtils.openConnection();
						StringBuffer sql = new StringBuffer();
						sql.append("DELETE from manager where M_ID = ?;");

						preparedStatement = conn.prepareStatement(sql.toString());
						preparedStatement.setString(1, m_id);

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
