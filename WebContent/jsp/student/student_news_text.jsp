<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>
    
      <%@page import="edu.numberone.studystar.daoimpl.*, edu.numberone.studystar.entity.*,java.util.*,edu.numberone.studystar.service.*,edu.numberone.studystar.serviceimpl.* "%>
   		
   		  
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
		<title>SgExam���߿���ϵͳ|��Ϣ����</title>
		<link href="css/common.css" rel="stylesheet" type="text/css">
		<link href="css/list.css" rel="stylesheet" type="text/css">
		<script src="js/jquery-1.9.1.min.js" type="text/javascript"></script>
		<script src="js/js.js" type="text/javascript"></script>
	</head>

	<body>
		<%
				AnnouncementService adi = new AnnouncementServiceImpl();
				
				String search_id = request.getParameter("search_id");
				Announcement ann = adi.findNewById(search_id);
				
				request.setAttribute("ann", ann);

				%>
				
				
	
		<div class="clear list_top ovhi psRe">
			<jsp:include page="../top.jsp"></jsp:include>
			<ul class="psRe">
				<img src="images/study_background_img.png" />
				<div class="list_grd_bg psAb"></div>
			</ul>
			<a class="disin psAb menuname" href="#">��Ϣ����&nbsp;&nbsp;News & Announcement</a>
		</div>
		<div class="crumbs_left lf"></div>
		<div class="crumbs lh35 lf crumb">
			<a href="servlet/StudentServlet.do?operation=toIndex">�� ҳ</a>&nbsp;&nbsp;&sdot;&nbsp;&nbsp;
			<a href="#">��Ϣ����</a>&nbsp;&nbsp;&sdot;&nbsp;&nbsp;
			<a href="#">${ann.a_title}</a>
		</div>

		<div class="bk"></div>
		<div class="bagf wrap_list clear grd24 mar0a">
			<div class="list_left lf">
				<div id="wrap_sub"></div>
				<ul class="wrap_sub">
					<li>
						<a class="subnav_a" href="servlet/StudentServlet.do?operation=toMyTest">�ҵĿ���</a>
					</li>
					<li>
						<a class="subnav_a" href="servlet/StudentServlet.do?operation=showScore">�ҵĳɼ�</a>
					</li>
					<li class="on">
						<a class="subnav_a" href="jsp/student/student_news.jsp">��Ϣ����</a>
					</li>
					<li>
						<a class="subnav_a" href="jsp/student/student_personal.jsp">��������</a>
					</li>
				</ul>
			</div>
			<div class="list-content rt list_main">
				<div class="article psRe">
			
				
				
				<h1 id="article_h1">${ann.a_title}</h1>
					<div class="time">
						����ʱ��:
						${ann.a_startTime}
					</div>
					
					<div class="content detail">
						<p style="text-align: left">
						<span style="font-size: 14px">
							<span style="font-family: ����">
							${ann.a_content}
							</span>
						</span>
						</p>
					</div>
							
			
				</div>
				
			</div>
		</div>

		<div style="display:none;" id="goTopBtn" title="���ض���"> </div>
		<script type=text/javascript>
			goTopEx();
		</script>
		</div>
		<!--/wrap-->
		<div id="footer" class="psRe">
			<p class="padt10 textc white lh20">
				<a class="disin padlr10" href="#">΢��΢��</a>
				<a class="disin padlr10" href="#">�б깫��</a>
				<a class="disin padlr10" href="#">�˲���Ƹ</a>
			</p>
			<p class="padt5 textc white lh20">��Ȩ����&nbsp;&copy;&nbsp;SgExam���߿���ϵͳ&nbsp;&nbsp;��ICP��&nbsp;00000001��&nbsp;�湫������000000000001</p>
			<div class="foot_bg psAb"></div>
		</div>
	</body>

</html>