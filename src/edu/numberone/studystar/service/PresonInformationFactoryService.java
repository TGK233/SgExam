package edu.numberone.studystar.service;

public interface PresonInformationFactoryService {
	
	
	
	/**
	 * ����һ�����ڲ鿴�û���Ϣ�Ĺ��������ڸ��ݲ�ͬ���û��鿴��ͬ����Ϣ
	 * @param personID �û���id
	 * 
	 * 
	 * */
	public PersonInformationService<?> personFactory(String flag);

}
