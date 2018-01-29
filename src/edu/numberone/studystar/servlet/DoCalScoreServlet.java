package edu.numberone.studystar.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.numberone.studystar.entity.Paper;
import edu.numberone.studystar.entity.Question;
import edu.numberone.studystar.entity.Scores;
import edu.numberone.studystar.entity.SubAnswer;
import edu.numberone.studystar.service.PaperService;
import edu.numberone.studystar.service.QuestionService;
import edu.numberone.studystar.serviceimpl.PaperServiceImpl;
import edu.numberone.studystar.serviceimpl.QuestionServiceImple;
import edu.numberone.studystar.utils.UUIDUtils;


@WebServlet("/DoCalScoreServlet")
public class DoCalScoreServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//�����ַ�����
		request.setCharacterEncoding("gbk");
		response.setContentType("text/html;charset=gbk");
		response.setCharacterEncoding("gbk");
		//��ȡȡ�༶���
		String cid = request.getParameter("cid");
		//��ȡ���Ա��
		String pid = request.getParameter("pid");
		//��ȡѧ����Ϣ
		String sid = (String)request.getSession().getAttribute("stu_id");
		String sname = (String)request.getSession().getAttribute("stu_name");
		String cls_id = (String)request.getSession().getAttribute("cls_id");
		String cls_name = (String)request.getSession().getAttribute("cls_name");
		float score = 0;
		PaperService paperSev=new PaperServiceImpl();
		//���ݿ��Ա�Ų�ѯ����
		Paper paper=paperSev.findPaperById(pid);
		String pname=paper.getP_name();
		request.setAttribute("paper", paper);
		//��ȡ���еĿ�����
		String[] qids=paper.getQ_id().split("@");
		QuestionService questionService = new QuestionServiceImple();
		//���ݿ����Ų������еĿ���
		List<Question> questionList=questionService.findSelectedQuestion(qids);
		String sAnswer="";
		//����UUID�ɼ����
		UUIDUtils util=new UUIDUtils();
		String sc_id=util.getUUId();
		//�������п��⣬��ǰ��ҳ���ȡ��Ӧ �Ĵ𰸼����
		for(int i = 0; i < questionList.size(); ++i){
			Question que = questionList.get(i);
			sAnswer = request.getParameter(que.getQ_id());
			if(!que.getQ_type().equals("q5")){
				if(sAnswer != null){
					if(sAnswer.equalsIgnoreCase(que.getQ_answer())){
						score += Float.parseFloat(que.getQ_score());
					}
				}
				
			}else{//��������洢���������
				if(sAnswer != null){
					SubAnswer answer=new SubAnswer();
					answer.setQ_id(que.getQ_id());
					answer.setSc_id(sc_id);
					answer.setQ_title(que.getQ_title());
					answer.setS_id(sid);
					answer.setAnswer(sAnswer);
					answer.setRightAnswer(que.getQ_answer());
					answer.setQ_score(Float.parseFloat(que.getQ_score()));
					paperSev.saveSubAnswer(answer);
				}
			}
		}
		//�洢�͹���ɼ�
		paperSev.saveScore(sc_id, pid, sid, score, cid, pname,sname,cls_id,cls_name);
	 request.setAttribute("tips", "�����ύ�ɹ������Խ��������뿪������2����˳�ϵͳ��");
	 response.setHeader("ReFresh", "2;url='QuitServlet?status=student'");
	 request.getRequestDispatcher("jsp/student/student_tips.jsp").forward(request, response);
	}
	
}
