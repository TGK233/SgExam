package edu.numberone.studystar.service;

import java.util.List;

import edu.numberone.studystar.entity.Course;
import edu.numberone.studystar.entity.Pager;
import edu.numberone.studystar.entity.Question;
import edu.numberone.studystar.entity.QuestionType;

public interface QuestionService {
	
	
	
	
	/**�޸�������Ϣ��model
	 * @param question ��Ҫ�޸ĵ�������Ϣ
	 * @return �������޸ĵ�������Ϣ ������޸ĳɹ��򷵻سɹ���ʾ��ʶ�����򷵻�Ϊnull
	 * 
	 * */
   public int updateQuestionToModel(Question question);
   
   
   
 
     /**
   	 *��������������Ϣ
   	 * 
   	 * */
      public Pager<Question> findQuestionFromModel(int pageNum, int pageSize,String type,String keyword);
      
      /**
     	 *���ݲ���������Ϣ
     	 * 
     	 * */
        public Question findQuestionById(String id);
        
        /*
    	 * ���ݲ�����������
    	 * */
       public List<QuestionType> findAllQuestionType();
       
       /*���ݲ�����������
   	 * 
   	 * */
      public List<Course> findAllCourseType();
      
      /*���ݿγ̡��������Ͳ�������
     	 * 
     	 * */
        public List<Question> findAllQuestion(String courseType,String questionType);
        /*��������id��������
     	 * 
     	 * */
        public List<Question> findSelectedQuestion(String[] qids);
   
   
   /**
  	 *���������Ϣ��model
  	 *@param person ��Ҫ���person
  	 * 
  	 * */
   public int AddQuestionToModel(Question question);
   
   /**
 	 *ɾ��������Ϣ��model
 	 * @param questions ��Ҫ��Ҫɾ����question����
 	 * */
   public int deletePersonInformationToMedel(List<Question> questions);

}
