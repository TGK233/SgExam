package edu.numberone.studystar.serviceimpl;

import java.util.List;

import edu.numberone.studystar.dao.QuestionDao;
import edu.numberone.studystar.daoimpl.QuestionDaoImple;
import edu.numberone.studystar.entity.Course;
import edu.numberone.studystar.entity.Pager;
import edu.numberone.studystar.entity.Question;
import edu.numberone.studystar.entity.QuestionType;
import edu.numberone.studystar.jdbc.JdbcQuery;
import edu.numberone.studystar.jdbc.JdbcUtils;
import edu.numberone.studystar.service.QuestionService;

public class QuestionServiceImple implements QuestionService {

	/**
	 * �޸�������Ϣ��model
	 * 
	 * @param question
	 *            ��Ҫ�޸ĵ�������Ϣ
	 * @return �������޸ĵ�������Ϣ ������޸ĳɹ��򷵻سɹ���ʾ��ʶ�����򷵻�Ϊnull
	 * 
	 */
	@Override
	public int updateQuestionToModel(Question question) {
		// TODO Auto-generated method stub
		QuestionDao questionDao = new QuestionDaoImple();
		int result = questionDao.updateQuestionToDB(question);

		if (result == 1) {
			return result;
		}
		return 0;
	}

	/**
	 * ��������������Ϣ
	 * 
	 */
	@Override
	public Pager<Question> findQuestionFromModel(int pageNum, int pageSize, String type,String keyword) {
		// TODO Auto-generated method stub
		QuestionDao questionDao = new QuestionDaoImple();
		//int startIndex = (pageNum - 1) * pageSize;// ��ʼ��ѯ������
		StringBuilder sql = new StringBuilder();
		sql.append("select * from question where 1=1");
		if (!"0".equals(type)) {
			sql.append(" and Q_Type='" + type+"'");
		}
		if (!"".equals(keyword)&&null!=keyword) {
			sql.append(" and q_title like"+" '%" +keyword+"%'");
		}
		//sql.append(" limit " + startIndex);
		//sql.append("," + pageSize);
		List<Question> questions = questionDao.findQuestionsFromDB(sql.toString(), null);
		if (questions != null) {
			// ��ҳ��ѯ
			Pager<Question> pager = new Pager<>(questions,pageNum, pageSize);
			if (pager != null) {
				return pager;
			}
		}
		return null;
	}

	/**
	 * ���������Ϣ��model
	 * 
	 * @param person
	 *            ��Ҫ���person
	 * 
	 */
	@Override
	public int AddQuestionToModel(Question question) {
		// TODO Auto-generated method stub
		QuestionDao questionDao = new QuestionDaoImple();
		int result = questionDao.addQuestionToDB(question);

		if (result == 1) {
			return result;
		}
		return 0;
	}

	/**
	 * ɾ��������Ϣ��model
	 * 
	 * @param questions
	 *            ��Ҫ��Ҫɾ����question����
	 */
	@Override
	public int deletePersonInformationToMedel(List<Question> questions) {
		// TODO Auto-generated method stub
		QuestionDao questionDao = new QuestionDaoImple();
		int result = questionDao.deleteQuestionToDB(questions);

		if (result == 1) {
			return result;
		}
		return 0;
	}

	@Override
	public Question findQuestionById(String id) {
		// TODO Auto-generated method stub
		String sql=new String();
		sql="select * from question where q_id='"+id+"'";
		JdbcQuery querys = JdbcUtils.createNativeQuery( sql, Question.class);
		Question question=querys.getBean();
		return question;
	}

	@Override
	public List<QuestionType> findAllQuestionType() {
		// TODO Auto-generated method stub
		String sql=new String();
		sql="select * from questionType";
		JdbcQuery querys = JdbcUtils.createNativeQuery( sql, QuestionType.class);
		List<QuestionType> list=(List<QuestionType>) querys.getResultList();
		return list;
	}

	@Override
	public List<Course> findAllCourseType() {
		// TODO Auto-generated method stub
		String sql=new String();
		sql="select * from course";
		JdbcQuery querys = JdbcUtils.createNativeQuery( sql, Course.class);
		List<Course> list=(List<Course>) querys.getResultList();
		return list;
	}

	@Override
	public List<Question> findAllQuestion(String courseType, String questionType) {
		// TODO Auto-generated method stub
		StringBuffer sql=new StringBuffer();
		sql.append("select * from question");
		if(null!=courseType&&!courseType.equals("0")){
			sql.append(" where course_id='"+courseType+"'");
		}
		if(null!=questionType&&!questionType.equals("0")){
			sql.append(" and q_type='"+questionType+"'");
		}
		System.out.println(sql.toString());
		System.out.println(Question.class);
		JdbcQuery querys = JdbcUtils.createNativeQuery(sql.toString(), Question.class);
		List<Question> list=(List<Question>) querys.getResultList();
		return list;
	}

	@Override
	public List<Question> findSelectedQuestion(String[] qids) {
		// TODO Auto-generated method stub
		StringBuffer sql=new StringBuffer();
		sql.append("select * from question where q_id in (");
		for(int i=0;i<qids.length;i++){
			if(i!=qids.length-1){
			sql.append("'"+qids[i]+"',");
			}else{
				sql.append("'"+qids[i]+"'");
			}
		}
		sql.append(")");
		JdbcQuery querys = JdbcUtils.createNativeQuery(sql.toString(), Question.class);
		List<Question> list=(List<Question>) querys.getResultList();
		return list;
	}

}
