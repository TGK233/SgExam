package edu.numberone.studystar.serviceimpl;

import edu.numberone.studystar.entity.Manager;
import edu.numberone.studystar.entity.Student;
import edu.numberone.studystar.entity.Teacher;
import edu.numberone.studystar.service.PersonInformationService;
import edu.numberone.studystar.service.PresonInformationFactoryService;

public class PersonInformationFactoryServiceImple implements PresonInformationFactoryService {

	/**
	 * ����һ�����ڲ鿴�û���Ϣ�Ĺ��������ڸ��ݲ�ͬ���û��鿴��ͬ����Ϣ
	 * 
	 * @param flag
	 *            �û���ݱ�ʶ������ʶ���û��ǽ�ʦ���������ѧ��
	 * 
	 * 
	 */
	@Override
	public PersonInformationService<?> personFactory(String flag) {
		// TODO Auto-generated method stub

		if (flag != null && !"".equals(flag)) {
			switch (flag) {
			case "student":

				PersonInformationService<Student> StudentInformationServiceImple = new StudentInformationServiceImple();
				return StudentInformationServiceImple;

			case "teacher":
				PersonInformationService<Teacher> teacherInformationServiceImple = new TeacherInformationServiceImple();
				return teacherInformationServiceImple;

			case "manager":
				PersonInformationService<Manager> managerInformationServiceImple = new ManagerInformationServiceImple();
				return managerInformationServiceImple;
			default:
				break;
			}
		}

		return null;

	}

}
