package edu.numberone.studystar.servlet;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.filters.AddDefaultCharsetFilter;

import edu.numberone.studystar.entity.Manager;
import edu.numberone.studystar.entity.Pager;
import edu.numberone.studystar.entity.Teacher;
import edu.numberone.studystar.service.PersonInformationService;
import edu.numberone.studystar.service.PresonInformationFactoryService;
import edu.numberone.studystar.serviceimpl.ManagerInformationServiceImple;
import edu.numberone.studystar.serviceimpl.PersonInformationFactoryServiceImple;
import net.sf.json.JSONObject;

/**
 * Servlet implementation class ManageAdminServlet
 * 
 * �������Ա��Ϣ
 * 
 */
@WebServlet("/ManageAdminServlet")
public class ManageAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String path;

	private int pageSize = 0;// ���õ�ǰҳ���С

	@Override
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		super.init(config);

		this.path = config.getServletContext().getContextPath();
		this.pageSize = Integer.parseInt(config.getServletContext().getInitParameter("pageSize"));
	}

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ManageAdminServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		manageAdmin(request, response);

	}

	/**
	 * ������ɾ���ҵ����󣬲�����Ӧ����Ϣ
	 * 
	 */
	private void manageAdmin(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String flag = request.getParameter("flag");// ���������

		if (flag != null) {
			switch (flag) {
			case "find": {

				findAllManager(request, response);
				break;
			}
			case "add": {
				AddManager(request, response);
				break;
			}
			case "delete": {
				deleteManager(request, response);
				break;
			}
			case "update": {
				updateManager(request, response);
				break;
			}
			default:
				break;
			}
		}

	}

	
	/**
	 * �޸Ĺ���Ա��Ϣ
	 * 
	 * */
	private void updateManager(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String m_id = request.getParameter("m_id");
		String m_name = request.getParameter("m_name");
		String m_pass = request.getParameter("m_pass");
		Timestamp tsTimestamp = new Timestamp(new Date().getTime());
		System.out.println("updateManager-->m_id:"  + m_id);
		System.out.println("updateManager-->m_name:"  + m_name);
		System.out.println("updateManager-->m_pass:"  + m_pass);
		
		int result = 0;
		Manager manager = new Manager();
		manager.setM_id(m_id);
		manager.setM_name(m_name);
		manager.setM_pass(m_pass);
		manager.setM_LastLoginTime(tsTimestamp);
		PersonInformationService<Manager> managerInformationService = new ManagerInformationServiceImple();
		result = managerInformationService.updatePersonInformationToModel(manager);

		if (result == 1) {
			this.findAllManager(request, response);
		} else {
			try {
				response.getWriter().write("��ӹ���Աʧ��!���������");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	}

	/**
	 * 
	 * ��ӹ���Ա
	 */
	private void AddManager(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub

		String m_id = request.getParameter("m_id");
		String m_name = request.getParameter("m_name");
		String m_pass = request.getParameter("m_pass");
		Timestamp tsTimestamp = new Timestamp(new Date().getTime());
		int result = 0;
		Manager manager = new Manager();
		manager.setM_id(m_id);
		manager.setM_name(m_name);
		manager.setM_pass(m_pass);
		manager.setM_LastLoginTime(tsTimestamp);
		PersonInformationService<Manager> managerInformationService = new ManagerInformationServiceImple();
		result = managerInformationService.AddPersonInformationToModel(manager);

		if (result == 1) {
			this.findAllManager(request, response);
		} else {
			try {
				response.getWriter().write("��ӹ���Աʧ��!���������");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	}

	/***
	 * 
	 * ɾ���Ĺ���Ա
	 * 
	 */
	private void deleteManager(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub

		String  m_id = request.getParameter("m_id");
		
		System.out.println("deleteManager-->" + m_id);

		int result = 0;// ��ʶ�Ƿ�ɾ���ɹ�
		if (m_id != null) {
			List<Manager> managers = new ArrayList<Manager>();
			Manager manager = new Manager();
			manager.setM_id(m_id);
			managers.add(manager);
			System.out.println("m_ids[i]-->" + m_id);
			PersonInformationService<Manager> managerInformationService = new ManagerInformationServiceImple();
			if(managers.size() > 0){
				result = managerInformationService.deletePersonInformationToMedel(managers);
			}
		

		}

		// ����Ƿ�ɾ���ɹ�
		if (result == 1) {
			findAllManager(request, response);
		} else {

			try {
				response.getWriter().write("��ӹ���Աʧ��!���������");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

	}

	/***
	 * 
	 * �������еĹ���Ա
	 * 
	 */

	private void findAllManager(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		PersonInformationService<Manager> managerInformationService = new ManagerInformationServiceImple();
		Integer pageNum = Integer.parseInt(request.getParameter("pageNum"));

		if (pageNum != null) {

			Pager<Manager> pager = managerInformationService.findAllPersonInformationFromModel(pageNum, this.pageSize);

			try {
				// ��õ�ǰ������·��
				request.setAttribute("pager", pager);
				String url = "/jsp/admin/admin_list.jsp";
				request.getRequestDispatcher(url).forward(request, response);
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
