<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>
    
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
		<title>SgExam���߿���ϵͳ|������Ϣ</title>
		<link href="css/common.css" rel="stylesheet" type="text/css">
		<link href="css/list.css" rel="stylesheet" type="text/css">
		<script src="js/jquery-1.9.1.min.js" type="text/javascript"></script>
		<script src="js/js.js" type="text/javascript"></script>
	</head>

	<body>
		<div class="clear list_top ovhi psRe">
			<jsp:include page="../top.jsp"></jsp:include>
			<ul class="psRe">
				<img src="images/study_background_img.png" />
				<div class="list_grd_bg psAb"></div>
			</ul>
			<a class="disin psAb menuname" href="jsp/student/student_personal.jsp">��������&nbsp;&nbsp;Personal Information</a>
		</div>
		<div class="crumbs_left lf"></div>
		<div class="crumbs lh35 lf crumb">
			<a href="servlet/StudentServlet.do?operation=toIndex">�� ҳ</a>&nbsp;&nbsp;&sdot;&nbsp;&nbsp;
			<a href="jsp/student/student_personal.jsp">��������</a>
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
					<li>
						<a class="subnav_a" href="jsp/student/student_news.jsp">��Ϣ����</a>
					</li>
					<li class="on">
						<a class="subnav_a" href="jsp/student/student_personal.jsp">��������</a>
					</li>
				</ul>
			</div>
			<div class="list-content rt list_main">
				<div class="article psRe">
					<h1>��������</h1>
					<div class="bk20"></div>
					<div class="content detail">
						<table border="2" class="schoolLeader">
							<tbody>
								<tr>
									<th colspan="4">
										<p style="text-align: center;"><strong>������Ϣ</strong></p>
									</th>
								</tr>
								<tr>
									<td rowspan="4" colspan="2" width="33.33%">
										<img src="images/clownf.png" width="50%"/>
									</td>
									<td><strong>ѧ��</strong></td>
									<td style="text-align: left;">${stu_id }</td>
								</tr>
								<tr>
									<td><strong>����</strong></td>
									<td style="text-align: left;">${stu_name }</td>
								</tr>
								<tr>
									<td><strong>�Ա�</strong></td>
									<td style="text-align: left;">${stu_sex }</td>
								</tr>
								<tr>
									<td><strong>רҵ���༶</strong></td>
									<td style="text-align: left;">${cls_name }</td>
								</tr>
								<tr>
									<td colspan="2" width="50%">
										<a href="jsp/student/student_modify_password.jsp">�޸�����</a>
									</td>
									<td colspan="2" width="50%">
										<a href="jsp/student/login.jsp">��ȫ�˳�</a>
									</td>
								</tr>
							</tbody>
						</table>
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