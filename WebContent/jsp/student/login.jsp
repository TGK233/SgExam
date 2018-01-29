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
		<title>SgExam���߿���ϵͳ</title>
		<meta http-equiv="Content-Type" content="text/html; charset=gbk">
		<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
		<script type="text/javascript" src="js/login.js" charset="gbk"></script>
		<script type="text/javascript" src="js/check.js" charset=gbk></script>
		<link href="css/login.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript">
    	function change1(){
    		var img=document.getElementById("image1");
    		//��һ�������������ʹ��ÿһ�ε�ˢ����ַ���ͱ仯�����¶�λ�������
    		img.src="IdentifyingCodeServlet?t=" + new Date().getTime();
    	}
    	function change2(){
    		var img=document.getElementById("image2");
    		//��һ�������������ʹ��ÿһ�ε�ˢ����ַ���ͱ仯�����¶�λ�������
    		img.src="IdentifyingCodeServlet?t=" + new Date().getTime();
    	}
    	</script>
	</head>

	<body>
		<h1>SgExam���߿���ϵͳ</h1>
		<div class="login" style="margin-top:50px;">
			<div class="header">
				<div class="switch" id="switch">
					<a class="switch_btn_focus" id="switch_qlogin" href="javascript:void(0);">ѧ����¼</a>
					<a class="switch_btn" id="switch_login" href="javascript:void(0);">��ʦ��¼</a>
					<div class="switch_bottom" id="switch_bottom" style="position: absolute; width: 64px; left: 0px;"></div>
				</div>
			</div>
			<!-- ���ص����� -->
			<input type="hidden" id="error" value="${error}"/>
					<input type="hidden" id="status" value="${status}"/>
					<input type="hidden" id="id" value="${id}"/>
					<input type="hidden" id="password" value="${password}"/>
			<!--ѧ����¼-->
			<div class="web_qr_login" id="web_qr_login" style="display: block;">
				<div class="web_login">
					<form name="student_login" action="StudentAndTeacherAdminLoginServlet?status=student" method="post" onsubmit="return login_studentID_username()">
					<input type="hidden" id="password" value="${password}"/>
						<ul class="reg_form" id="reg-ul">
							<div id="studentCue" class="cue">������ѧ�ź�������е�¼</div>
							<li>
								<label for="user" class="input-tips2">ѧ�ţ�</label>
								<div class="inputOuter2">
									<input type="text" id="studentID" name="studentID" maxlength="16" class="inputstyle2" autocomplete="on"/>
								</div>
							</li>
							<li>
								<label for="passwd" class="input-tips2">���룺</label>
								<div class="inputOuter2">
									<input type="password" id="studentPassword" name="studentPassword" maxlength="16" class="inputstyle2" />
								</div>
							</li>
							<li>
								<label for="yanzheng" class="input-tips2">��֤�룺</label>
								<div class="inputOuter2">
									<input type="text" id="yanzheng" name="code" maxlength="16" class="inputstyle2" style="width: 135px; float: left;" />
									<img id="image1" src="IdentifyingCodeServlet" height="38px" onclick="change1()"/>
								</div>
							</li>
							<li style="height: 30px;">
								<label for="yanzheng" class="input-tips2"></label>
								<label><input type="checkbox" name="autoLogin" value="1" />�������Զ���½</label>
							</li>
							<li>
								<div class="inputArea">
									<input type="submit" id="reg" style="margin-top:10px;" class="button_blue" value="������¼" />
								</div>
							</li>
						</ul>
					</form>
				</div>
			</div>
			<!--ѧ����¼end-->
			<!--��ʦ��¼-->
			<div class="qlogin" id="qlogin" style="display: none; ">
				<div class="web_login">
					<form name="teacher_login" id="regUser" accept-charset="gbk" action="StudentAndTeacherAdminLoginServlet?status=teacher" method="post" onsubmit="return login_teacherID_username()">
						<ul class="reg_form" id="reg-ul">
							<div id="teacherCue" class="cue">������ְ���ź�������е�¼</div>
							<li>
								<label for="user" class="input-tips2">ְ���ţ�</label>
								<div class="inputOuter2">
									<input type="text" id="teacherID" name="teacherID" maxlength="16" class="inputstyle2" />
								</div>
							</li>
							<li>
								<label for="passwd" class="input-tips2">���룺</label>
								<div class="inputOuter2">
									<input type="password" id="teacherPassword" name="teacherPassword" maxlength="16" class="inputstyle2" />
								</div>
							</li>
							<li>
								<label for="yanzheng" class="input-tips2">��֤�룺</label>
								<div class="inputOuter2">
									<input type="text" id="yanzheng" name="code" maxlength="16" class="inputstyle2" style="width: 135px; float: left;" />
									<img id="image2" src="IdentifyingCodeServlet" height="38px" onclick="change2()"/>
								</div>
							</li>
							<li style="height: 30px;">
								<label for="yanzheng" class="input-tips2"></label>
								<label><input type="checkbox" name="autoLogin" value="1" />�������Զ���½</label>
							</li>
							<li>
								<div class="inputArea">
									<input type="submit" id="reg" style="margin-top:10px;" class="button_blue" value="������¼" />
								</div>
							</li>
						</ul>
					</form>
				</div>
			</div>
			<!--��ʦ��¼end-->
		</div>
		<div class="b1"></div>
		<div class="b2"></div>
		<jsp:include page="../login_footer.jsp"></jsp:include>
	</body>

</html>