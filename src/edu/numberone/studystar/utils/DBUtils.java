package edu.numberone.studystar.utils;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

/**
 * ����ģʽ�������ݿ������࣬�����������ݿ�
 * 
 */

public class DBUtils {

	// ���ö���ģʽ��������ģʽ
	private static DBUtils dbUtils = new DBUtils();

	private DBUtils() {

	}

	public static DBUtils getInstance() {
		return dbUtils;
	}

	/**
	 * ���Connection
	 * 
	 * @param
	 * @return ���ػ�õ�Connection����
	 * 
	 */
	public Connection openConnection() {

		String driver = null;
		String url = null;
		String username = null;
		String password = null;

		Properties pro = new Properties();
		InputStream input = this.getClass().getClassLoader().getResourceAsStream("config/jdbc.properties");

		try {
			pro.load(input);
			driver = pro.getProperty("driver");
			url = pro.getProperty("url");
			username = pro.getProperty("user");
			password = pro.getProperty("password");

			try {
				Class.forName(driver);
				try {
					return DriverManager.getConnection(url, username, password);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * �ر�Connection
	 * 
	 * @param conn
	 *            ��Ҫ�رյ�Conection����
	 * @return
	 * 
	 */
	public void disConnection(Connection conn) {
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	/**
	 * �ر�statement
	 * 
	 * @param statement
	 *            ��Ҫ�رյ�statement����
	 * @return
	 * 
	 */
	public void disSatement(Statement statement) {

		if (statement != null) {
			try {
				statement.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	}

	
	/**
	 * �ر�resultSet
	 * 
	 * @param resultSet
	 *            ��Ҫ�رյ�resultSet����
	 * @return
	 * 
	 */
	public void disResultSet(ResultSet resultSet) {

		if (resultSet != null) {
			try {
				resultSet.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

	}

}
