package edu.numberone.studystar.service;

import java.util.List;

import edu.numberone.studystar.entity.Manager;
import edu.numberone.studystar.entity.Pager;

public interface PersonInformationService <T>{
	
	
	/**
	 * ��model��Dao���ø�����Ϣ
	 * @param person ��Ҫ���ҵĸ�����Ϣ
	 * @return �����Ѳ��ҵĸ�����Ϣ ��������ҳɹ��򷵻ظ�����Ϣ�����򷵻�Ϊnull
	 * 
	 * */
	public T findPersonInformationFromModel( T person);
	
	
	
	/**
	 * �޸ĸ�����Ϣ��model
	 * @param person ��Ҫ�޸ĵĸ�����Ϣ
	 * @return �������޸ĵĸ�����Ϣ ������޸ĳɹ��򷵻ظ�����Ϣ�����򷵻�Ϊnull
	 * 
	 * */
   public int updatePersonInformationToModel(T person);
   
   
   
   /**
	 *����������Ա��Ϣ
	 * 
	 * */
   public Pager<T> findAllPersonInformationFromModel(int pageNum, int pageSize);
   
   
   /**
  	 *�����Ա��Ϣ��model
  	 *@param person ��Ҫ���person
  	 * 
  	 * */
   public int AddPersonInformationToModel(T person);
   
   /**
 	 *�����Ա��Ϣ��model
 	 * @param persons ��Ҫ��Ҫɾ����person����
 	 * */
   public int deletePersonInformationToMedel(List<T> persons);

}
