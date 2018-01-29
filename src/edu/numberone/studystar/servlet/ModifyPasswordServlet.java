package edu.numberone.studystar.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.SingleThreadModel;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import edu.numberone.studystar.daoimpl.ModifyData;


@WebServlet("/ModifyPasswordServlet")
public class ModifyPasswordServlet extends HttpServlet  {
	private static final long serialVersionUID = 1L;
	  
  
    public ModifyPasswordServlet() {
        super();
      
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int flagId=Integer.parseInt(request.getParameter("flagId").toString());
		System.out.println(flagId);
		/*HttpSession session=request.getSession(); //
		String username=(String) session.getAttribute("studentID");*/
		
		String userID=request.getParameter("userID");
		System.out.println(userID);
		//String username="laoshi";
		//String username="manager";//ֻ����ʱ�Ĳ������ݣ��������в�������Ҫʹ�õ�
		
		String oldpass=request.getParameter("oldpass");
		String newpass=request.getParameter("newpass");
		String repass=request.getParameter("repass");
		String sql1=null;
		String sql2=null;
		
		
		if(flagId==1){
			sql1="select S_Pass from Student where S_ID=?";//S_Name��S_ID;
			sql2="update Student set S_Pass=? where S_ID=?";
		}
		else if(flagId==2){
			sql1="select T_Pass from Teacher where T_ID=?";//T_Name��T_ID;
			sql2="update Teacher set T_Pass=? where T_ID=?";
		}
		else if(flagId==3){
			
			sql1="select M_Pass from Manager where M_ID=?";//T_Name��T_ID;
			sql2="update Manager set M_Pass=? where M_ID=?";
		}
		ModifyData md=new ModifyData();
		boolean isSuccess=md.ModifyPass(sql1, sql2, userID, oldpass, newpass, repass);
		if(isSuccess){
			System.out.println("�����޸ĳɹ���");
			//������ҳ������ʾ������Ϣ���û�
		}else{
			System.out.println("�����޸�ʧ�ܣ�");
			//������ҳ������ʾ������Ϣ���û�
			
			System.out.println(oldpass);
			System.out.println(newpass);
			System.out.println(repass);
		}
		
		
	}

}
