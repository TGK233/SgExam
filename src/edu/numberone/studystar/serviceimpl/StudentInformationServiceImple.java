package edu.numberone.studystar.serviceimpl;

import java.util.List;

import org.apache.commons.lang.text.StrBuilder;

import edu.numberone.studystar.dao.PersonInfomationDao;
import edu.numberone.studystar.daoimpl.ManagerInformationDaoImple;
import edu.numberone.studystar.daoimpl.StudentInformationDaoImple;
import edu.numberone.studystar.entity.Manager;
import edu.numberone.studystar.entity.Pager;
import edu.numberone.studystar.entity.Student;
import edu.numberone.studystar.service.PersonInformationService;

public class StudentInformationServiceImple implements PersonInformationService<Student> {

	/**
	 * ��model��Dao����ѧ����Ϣ
	 * 
	 * @param student
	 *            ��Ҫ���ҵ�ѧ����Ϣ
	 * @return �����Ѳ��ҵ�ѧ����Ϣ ��������ҳɹ��򷵻�ѧ����Ϣ�����򷵻�Ϊnull
	 * 
	 */
	@Override
	public Student findPersonInformationFromModel(Student student) {
		// TODO Auto-generated method stub

		PersonInfomationDao<Student> personInfomationDao = new StudentInformationDaoImple();
		Student stu = personInfomationDao.findPersonInforFromDB(student);

		if (stu != null) {
			return stu;
		}

		return null;
	}

	/**
	 * ��model���޸�ѧ����Ϣ
	 * 
	 * @param student
	 *            ��Ҫ�޸ĵ�ѧ����Ϣ
	 * @return �����޸ú�Ľ��
	 * 
	 */
	@Override
	public int updatePersonInformationToModel(Student student) {
		// TODO Auto-generated method stub
		PersonInfomationDao<Student> personInfomationDao = new StudentInformationDaoImple();
		int result = personInfomationDao.updatepersonInformationToDB(student);
		if (result == 1) {
			return result;
		}

		return 0;
	}

	/**
	 * 
	 * ��������ѧ����Ϣ
	 */
	@Override
	public Pager<Student> findAllPersonInformationFromModel(int pageNum, int pageSize) {

		int startIndex = (pageNum - 1) * pageSize;// ��ʼ��ѯ������
		PersonInfomationDao<Student> personInfomationDao = new StudentInformationDaoImple();
		StringBuffer sql = new StringBuffer();
		sql.append(
				"select S_ID,S_Pass,S_Name,S_Sex ,student.CLS_ID as clazzId,classes.CLS_Name as clazzName from student left outer join classes");
		sql.append(" on student.CLS_ID = classes.CLS_ID");
		sql.append(" where 1=1");
		sql.append(" limit " + startIndex);
		sql.append("," + pageSize);
		List<Student> list = personInfomationDao.findPersonInforFromDB(sql.toString(), null);
		// ��ҳ��ѯ
		Pager<Student> pager = new Pager<>(pageNum, pageSize, list);
		if (pager != null) {
			return pager;
		}

		return null;
	}

	/**
	 * ���ѧ����Ϣ
	 * 
	 * @param person��Ҫ���ѧ������Ϣ
	 * 
	 */
	@Override
	public int AddPersonInformationToModel(Student person) {
		// TODO Auto-generated method stub
		PersonInfomationDao<Student> personInfomationDao = new StudentInformationDaoImple();
		int result = personInfomationDao.addPersonInformationToDB(person);
		if (result == 1) {
			return result;
		}

		return 0;
	}

	/**
	 * ɾ��ѧ����Ϣ
	 * 
	 * @param persons��Ҫshanchuѧ������Ϣ
	 * 
	 */
	@Override
	public int deletePersonInformationToMedel(List<Student> persons) {
		// TODO Auto-generated method stub
		PersonInfomationDao<Student> personInfomationDao = new StudentInformationDaoImple();
		int result = personInfomationDao.deletePersonInformationToDB(persons);
		if (result == 1) {
			return result;
		}

		return 0;
	}

}
