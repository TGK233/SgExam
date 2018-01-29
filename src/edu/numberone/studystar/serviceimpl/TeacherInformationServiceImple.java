package edu.numberone.studystar.serviceimpl;

import java.util.List;

import edu.numberone.studystar.dao.PersonInfomationDao;
import edu.numberone.studystar.daoimpl.TeacherInformationDaoImple;
import edu.numberone.studystar.entity.Pager;
import edu.numberone.studystar.entity.Student;
import edu.numberone.studystar.entity.Teacher;
import edu.numberone.studystar.service.PersonInformationService;

public class TeacherInformationServiceImple implements PersonInformationService<Teacher> {

	/**
	 * ��model��Dao���ý�ʦ��Ϣ
	 * 
	 * @param teacher
	 *            ��Ҫ���ҵ�ѧ����Ϣ
	 * @return �����Ѳ��ҵĽ�ʦ��Ϣ ��������ҳɹ��򷵻ؽ�ʦ��Ϣ�����򷵻�Ϊnull
	 * 
	 */
	@Override
	public Teacher findPersonInformationFromModel(Teacher teacher) {
		// TODO Auto-generated method stub
		PersonInfomationDao<Teacher> personInfomationDao = new TeacherInformationDaoImple();
		Teacher tea = personInfomationDao.findPersonInforFromDB(teacher);

		if (tea != null) {
			return tea;
		}

		return null;
	}

	/**
	 * �޸Ľ�ʦ��Ϣ
	 * 
	 * @param person
	 *            ��Ҫ�޸Ľ�ʦ��Ϣ
	 * @return ������ɾ��ʦ����ʦ��Ϣ �������ʦ�ɹ�������1�����򷵻�0
	 * 
	 */
	@Override
	public int updatePersonInformationToModel(Teacher person) {
		// TODO Auto-generated method stub
		PersonInfomationDao<Teacher> personInfomationDao = new TeacherInformationDaoImple();
		int result = personInfomationDao.updatepersonInformationToDB(person);

		if (result == 1) {
			return result;
		}

		return 0;
	}

	/**
	 * �������еĽ�ʦ��Ϣ
	 * 
	 * @param teacher
	 *            ��Ҫ��ӽ�ʦ��Ϣ
	 * @return ��������ӽ�ʦ��Ϣ �������ӳɹ�������1�����򷵻�0
	 * 
	 */
	@Override
	public Pager<Teacher> findAllPersonInformationFromModel(int pageNum, int pageSize) {
		// TODO Auto-generated method stub
		PersonInfomationDao<Teacher> personInfomationDao = new TeacherInformationDaoImple();
		int startIndex = (pageNum - 1) * pageSize;// ��ʼ��ѯ������

		StringBuilder sql = new StringBuilder();
		sql.append(
				"select T_ID,T_Pass,T_Name,t_Job from teacher ");
		sql.append(" where 1=1");
		sql.append(" limit " + startIndex);
		sql.append("," + pageSize);

		List<Teacher> teachers = personInfomationDao.findPersonInforFromDB(sql.toString(), null);

		// ��ҳ��ѯ
		Pager<Teacher> pager = new Pager<>(pageNum, pageSize, teachers);
		if (pager != null) {
			return pager;
		}

		return null;
	}

	/**
	 * ����ӽ�ʦ��Ϣ��model
	 * 
	 * @param teacher
	 *            ��Ҫ��ӽ�ʦ��Ϣ
	 * @return ��������ӽ�ʦ��Ϣ �������ӳɹ�������1�����򷵻�0
	 * 
	 */
	@Override
	public int AddPersonInformationToModel(Teacher person) {
		// TODO Auto-generated method stub
		PersonInfomationDao<Teacher> personInfomationDao = new TeacherInformationDaoImple();
		int result = personInfomationDao.addPersonInformationToDB(person);

		if (result == 1) {
			return result;
		}

		return 0;
	}

	/**
	 * ��modelɾ����ʦ��Ϣ
	 * 
	 * @param teacher
	 *            ��Ҫɾ����ʦ��Ϣ
	 * @return ������ɾ����ʦ��Ϣ �����ɾ���ɹ�������1�����򷵻�0
	 * 
	 */
	@Override
	public int deletePersonInformationToMedel(List<Teacher> persons) {
		// TODO Auto-generated method stub
		PersonInfomationDao<Teacher> personInfomationDao = new TeacherInformationDaoImple();
		int result = personInfomationDao.deletePersonInformationToDB(persons);

		if (result == 1) {
			return result;
		}

		return 0;
	}

}
