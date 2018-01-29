package edu.numberone.studystar.dao;

import java.util.List;

import edu.numberone.studystar.entity.Question;

/**
 * ���������Ҫ���ڹ����������ɾ�Ĳ�
 * 
 * */
public interface QuestionDao {
	
	
	/**
	 * ��ѯ����
	 * @param sql ��Ҫ��ѯ�����
	 * @param params��Ҫ��ѯ�Ĳ���
	 * @return ����questtion�ļ���
	 * 
	 * */
	public List<Question>  findQuestionsFromDB(String sql ,String parms[]);
	
	
	
	/**
	 * ��ѯ����
	 * @param question ��Ҫ�޸ĵ�����
	 * @return �޸ĺ�Ľ����ʶ �� 1����ɹ���0����ʧ��
	 * 
	 * */
	public int updateQuestionToDB(Question question);
	
	
	/**
	 * ��ѯ����
	 * @param question ��Ҫ���ӵ�����
	 * @return �޸ĺ�Ľ����ʶ �� 1����ɹ���0����ʧ��
	 * 
	 * */
	public int addQuestionToDB(Question question);
	
	
	
	/**
	 * ��ѯ����
	 * @param questions ��Ҫɾ��������ļ���
	 * @return �޸ĺ�Ľ����ʶ �� 1����ɹ���0����ʧ��
	 * 
	 * */
	public int deleteQuestionToDB(List<Question> questions);

}
