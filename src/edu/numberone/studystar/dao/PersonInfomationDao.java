package edu.numberone.studystar.dao;

import java.util.List;
import java.util.Map;

import edu.numberone.studystar.entity.Manager;

public interface PersonInfomationDao<T> {
	
	
	
	/**
	 * �����ݿ��ø�����Ϣ
	 * @param person ��Ҫ���ҵĸ�����Ϣ
	 * @return �����Ѳ��ҵĸ�����Ϣ ��������ҳɹ��򷵻ظ�����Ϣ�����򷵻�Ϊnull
	 * 
	 * */
	public  T  findPersonInforFromDB(T person); 
	
	
	
	/**
	 * �����ݿ��ø�����Ϣ
	 * @param sql ���Ҹ�����Ϣ��sql���
	 * @param ��������
	 * @return �����Ѳ��ҵĸ�����Ϣ ��������ҳɹ��򷵻ظ�����Ϣ�����򷵻�Ϊnull
	 * 
	 * */
	public  List<T>  findPersonInforFromDB(String sql ,String []parms); 
	
	
	/**
	 * �޸Ĺ���Ա����Ϣ
	 * @param manager ��Ҫ�޸ĵĹ���Ա
	 * 
	 * */
	public int updatepersonInformationToDB(T person);
		// TODO Auto-generated method stub
	
	/**
	 * �����Ա
	 * @param person ��Ҫ�޸ĵĹ���Ա
	 * 
	 * */
	public int addPersonInformationToDB(T person);
		// TODO Auto-generated method stub
	
	
	/**
	 * ɾ����Ա��Ϣ
	 * @param persons ��Ҫɾ����Ա�ļ���
	 * 
	 * */
	public int deletePersonInformationToDB(List<T> persons);
		// TODO Auto-generated method stub
	
	

}
