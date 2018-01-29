<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>
   <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %> 
   
   <%@page import="edu.numberone.studystar.daoimpl.*, edu.numberone.studystar.entity.*,java.util.*,java.util.Date,java.text.*"%>
   <%@page import="java.sql.*" %>
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
		AnnouncementDaoImpl adi = new AnnouncementDaoImpl();
		Announcement ann = new Announcement();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		Date now=new Date();
		String nowStr=sdf.format(now);
		ann.setA_startTime(nowStr);
		ann.setA_endTime(nowStr);
		
		LinkedList<Announcement> anns = adi.getAnnouncement(ann, 0, 10);
		
		request.setAttribute("anns", anns);
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
			<a href="#">��Ϣ����</a>
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
			<div class="list rt list_main">
				<h1 class="list_title">��Ϣ����</h1>
				<ul class="ovhi">
				
				<c:forEach var="ann" items="${anns}" varStatus="status">
          	<li>
				<a href="jsp/student/student_news_text.jsp?search_id=${ ann.a_id}" title="${ann.a_title } ">
							
				<font class="cor3 rt padl10">����ʱ��:${ann.a_startTime }</font>${ann.a_title }</a>
			</li>
              </c:forEach>       

		
    	</ul>
    	
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
				<a class="disin padlr10" href="#">΢��΢��</a>
				<a class="disin padlr10" href="#">�б깫��</a>
				<a class="disin padlr10" href="#">�˲���Ƹ</a>
			</p>
			<p class="padt5 textc white lh20">��Ȩ����&nbsp;&copy;&nbsp;SgExam���߿���ϵͳ&nbsp;&nbsp;��ICP��&nbsp;00000001��&nbsp;�湫������000000000001</p>
			<div class="foot_bg psAb"></div>
		</div>
	</body>

</html>