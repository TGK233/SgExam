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
		<meta http-equiv="Content-Type" content="text/html; charset=gbk">
		<title>SgExam���߿���ϵͳ|�޸�����</title>
		<link href="css/common.css" rel="stylesheet" type="text/css">
		<link href="css/list.css" rel="stylesheet" type="text/css">
		<script src="js/jquery-1.9.1.min.js" type="text/javascript"></script>
		<script src="js/js.js" type="text/javascript"></script>
		<script src="js/check.js" type="text/javascript"></script>
	</head>

	<body>
		<div class="clear list_top ovhi psRe">
			<jsp:include page="../top.jsp"></jsp:include>
			<ul class="psRe">
				<img src="images/study_background_img.png" />
				<div class="list_grd_bg psAb"></div>
			</ul>
			<a class="disin psAb menuname" href="jsp/student/student_modify_password.jsp">�޸�����&nbsp;&nbsp;Modify&nbsp;Password</a>
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
						<form name="" action="ModifyPasswordServlet?flagId=1&userID=${stu_id }" method="post" onsubmit="return login_pwd_username()">
							<table border="2" class="schoolLeader">
								<tbody>
									<tr>
										<th colspan="5">
											<p style="text-align: center;"><strong>�޸�����</strong></p>
										</th>
									</tr>
									<tr>
										<td colspan="5">
											<div id="modpwdCue" class="cue">����ĸ��ͷ��������6-18֮�䣬ֻ�ܰ����ַ������ֺ��»��ߡ�</div>
										</td>
									</tr>
									<tr>
										<td colspan="2" width="40%">������</td>
										<td colspan="3" width="60%"><input class="passwordinput" type="text" id="oldpassword" value="" name="oldpass"/></td>
									</tr>
									<tr>
										<td colspan="2" width="40%">������</td>
										<td colspan="3" width="60%"><input class="passwordinput" type="text" id="newpassword" value="" name="newpass"/></td>
									</tr>
									<tr>
										<td colspan="2" width="40%">ȷ������</td>
										<td colspan="3" width="60%"><input class="passwordinput" type="text" id="confirmpassword" value="" name="repass"/></td>
									</tr>
									<tr>
										<td colspan="5">
											<input class="btn btn6" type="submit" value="ȷ���޸�" />
											<input class="btn btn6" value="����" type="reset">
											<input class="btn btn6" onClick="history.go(-1)" value="����" type="button">
										</td>
									</tr>
								</tbody>
							</table>
						</form>
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