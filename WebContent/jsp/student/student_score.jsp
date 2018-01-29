<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*, edu.numberone.studystar.daoimpl.*, edu.numberone.studystar.entity.*"%>    
    <%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
	%>
<!DOCTYPE html>
<html>
	<head>
		<base href="<%=basePath%>"></base>
		<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
		<title>SgExam���߿���ϵͳ|�ҵĳɼ�</title>
		<link href="css/common.css" rel="stylesheet" type="text/css">
		<link href="css/list.css" rel="stylesheet" type="text/css">
		<script src="js/jquery-1.9.1.min.js" type="text/javascript"></script>
		<script src="js/js.js" type="text/javascript"></script>
	</head>

	<body>
	<% //��ȡѧ�����
		String stu_id = (String)session.getAttribute("stu_id");
		ScoresDaoImpl sdi = new ScoresDaoImpl();
		Scores sco = new Scores();
		sco.setS_id(stu_id);
		//���ҳ���ѧ�����гɼ�
		LinkedList<Scores> scores = sdi.getScores(sco, 0, 0);
		request.setAttribute("scores", scores);
	%>
		<div class="clear list_top ovhi psRe">
			<jsp:include page="../top.jsp"></jsp:include>
			<ul class="psRe">
				<img src="images/study_background_img.png" />
				<div class="list_grd_bg psAb"></div>
			</ul>
			<a class="disin psAb menuname" href="servlet/StudentServlet.do?operation=toMyTest">�ҵĳɼ�&nbsp;&nbsp;My Score</a>
		</div>
		<div class="crumbs_left lf"></div>
		<div class="crumbs lh35 lf crumb">
			<a href="servlet/StudentServlet.do?operation=toIndex">�� ҳ</a>&nbsp;&nbsp;&sdot;&nbsp;&nbsp;
			<a href="servlet/StudentServlet.do?operation=toMyTest">�ҵĳɼ�</a>
		</div>

		<div class="bk"></div>
		<div class="bagf wrap_list clear grd24 mar0a">
			<div class="list_left lf">
				<div id="wrap_sub"></div>
				<ul class="wrap_sub">
					<li>
						<a class="subnav_a" href="servlet/StudentServlet.do?operation=toMyTest">�ҵĿ���</a>
					</li>
					<li class="on">
						<a class="subnav_a" href="servlet/StudentServlet.do?operation=showScore">�ҵĳɼ�</a>
					</li>
					<li>
						<a class="subnav_a" href="jsp/student/student_news.jsp">��Ϣ����</a>
					</li>
					<li>
						<a class="subnav_a" href="jsp/student/student_personal.jsp">��������</a>
					</li>
				</ul>
			</div>

			<div class="list-content rt list_main">
				<div class="article psRe">
					<h1>�ҵĳɼ�</h1>
					<div class="bk20"></div>
					<div class="content detail">
						<style type="text/css">
							.content a {
								text-decoration: underline;
							}
						</style>
						<p>�װ���ͬѧ������������￴�������ڵĳɼ��Լ�����Ŷ��</p>

						<table border="1" cellpadding="0" cellspacing="0" id="changecolor" style="width: 100%;">

							<tbody>
								<tr>
									<td width="40%">��������</td>
									<td width="20%">����ʱ��</td>
									<td width="10%">�÷�</td>
									<td width="10%">�ɼ�״̬</td>
								</tr>
								
								<c:forEach var="sco" items="${scores}" varStatus="status">
									<tr>
										<td align="left">
											<a href="#">${sco.p_name}</a>
										</td>
										<td>${sco.sc_date}</td>
										<td>${sco.ifdone=='0'?'(�͹���)':'' }${sco.sc_score}</td>
										<td>${sco.ifdone=='0'?'δ�������':'�������' }</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>

						<div class="page">��һҳ | &lt;&lt;��һҳ 1
							<a href="#">2</a>
							<a href="#">3</a>
							<a href="#">4</a>
							<a href="#">5</a>
							<a href="#">6</a>
							<a href="#">7</a>
							<a href="#">8</a>
							<a href="#">��һҳ&gt;&gt;</a> |
							<a href="#">���һҳ</a>
						</div>
					</div>
					<div class="bk20"></div>
				</div>
			</div>
		</div>
		<script type="text/javascript">
			$(function() {
				$(".content.detail").find("img").each(function() {
					var w = $(this).width(),
						h = $(this).height();
					if(w >= 710 || w == 0) {
						$(this).css({
							width: 710,
							height: 710 * h / w
						});
					}
				});
			})
		</script>
		<div style="display:none;" id="goTopBtn" title="���ض���"> </div>
		<script type=text/javascript>
			goTopEx();
		</script>
		</div>
		<!--/wrap-->
		<div id="footer" class="psRe">
			<p class="padt10 textc white lh20">
				<a class="disin padlr10" href="#"> </a>
			</p>
			<p class="padt5 textc white lh20">��Ȩ����&nbsp;&copy;&nbsp;SgExam���߿���ϵͳ&nbsp;&nbsp;��ICP��&nbsp;00000001��&nbsp;�湫������000000000001</p>
			<div class="foot_bg psAb"></div>
		</div>
	</body>

</html>