package edu.numberone.studystar.serviceimpl;

import java.util.List;

import org.apache.commons.lang.text.StrBuilder;

import edu.numberone.studystar.dao.PersonInfomationDao;
import edu.numberone.studystar.daoimpl.ManagerInformationDaoImple;
import edu.numberone.studystar.entity.Manager;
import edu.numberone.studystar.entity.Pager;
import edu.numberone.studystar.service.PersonInformationService;

public class ManagerInformationServiceImple implements PersonInformationService<Manager> {

	/**
	 * ��model��Dao���ù���Ա��Ϣ
	 * 
	 * @param teacher
	 *            ��Ҫ���ҵĹ���Ա��Ϣ
	 * @return �����Ѳ��ҵĹ���Ա��Ϣ ��������ҳɹ��򷵻ع���Ա��Ϣ�����򷵻�Ϊnull
	 * 
	 */
	@Override
	public Manager findPersonInformationFromModel(Manager manager) {
		// TODO Auto-generated method stub
		PersonInfomationDao<Manager> personInfomationDao = new ManagerInformationDaoImple();
		Manager manage = personInfomationDao.findPersonInforFromDB(manager);

		if (manage != null) {
			return manage;
		}

		return null;
	}

	@Override
	public int updatePersonInformationToModel(Manager manager) {
		// TODO Auto-generated method stub

		PersonInfomationDao<Manager> personInfomationDao = new ManagerInformationDaoImple();
		int result = personInfomationDao.updatepersonInformationToDB(manager);
		System.out.println("result--->" + result);
		if (result == 1) {
			return result;
		}

		return 0;
	}

	/**
	 * ���ҳ����й���Ա��Ϣ
	 * 
	 */
	@Override
	public Pager<Manager> findAllPersonInformationFromModel(int pageNum, int pageSize) {
		// TODO Auto-generated method stub
		PersonInfomationDao<Manager> personInfomationDao = new ManagerInformationDaoImple();
		 
		int startIndex = (pageNum - 1) * pageSize;// ��ʼ��ѯ������
		StrBuilder sql = new StrBuilder();
		sql.append("select * from manager where 1=1");
		sql.append(" limit " + startIndex);
		sql.append("," + pageSize);
		List<Manager> list = personInfomationDao.findPersonInforFromDB(sql.toString(), null);

		//��ҳ��ѯ
		Pager<Manager> pager = new Pager<>(pageNum, pageSize, list);
		if (pager != null) {
			return pager;
		}

		return null;
	}

	@Override
	public int AddPersonInformationToModel(Manager manager) {
		// TODO Auto-generated method stub
		PersonInfomationDao<Manager> personInfomationDao = new ManagerInformationDaoImple();
		int result = personInfomationDao.addPersonInformationToDB(manager);
		System.out.println("result--->" + result);
		if (result == 1) {
			return result;
		}

		return 0;
	}

	/**
	 * �����Ա��Ϣ��model
	 * 
	 * @param managers
	 *            ��Ҫ��Ҫɾ����managers����
	 */
	@Override
	public int deletePersonInformationToMedel(List<Manager> managers) {
		// TODO Auto-generated method stub
		PersonInfomationDao<Manager> personInfomationDao = new ManagerInformationDaoImple();
		int result = personInfomationDao.deletePersonInformationToDB(managers);
		System.out.println("result--->" + result);
		if (result == 1) {
			return result;
		}

		return 0;
	}

	/**
	 * �޸Ĺ���Ա�ϴε�¼��ʱ��
	 * 
	 * @param manager��Ҫ�޸ĵĹ���Ա
	 * 
	 */
	public int updateManagerLastTime(Manager manager) {

		ManagerInformationDaoImple managerInfomationDao = new ManagerInformationDaoImple();
		int result = managerInfomationDao.updateManagerLastTime(manager);
		System.out.println("result--->" + result);
		if (result == 1) {
			return result;
		}

		return 0;

	}

}
