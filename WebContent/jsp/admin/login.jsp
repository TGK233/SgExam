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
		<meta charset="gbk">
		<title>SgExam���߿���ϵͳ|����Ա��¼</title>
		<link rel="stylesheet" type="text/css" href="css/login.css" />
		<script src="js/jquery-1.9.1.min.js" type="text/javascript"></script>
		<script type="text/javascript" charset="gbk">
		$(function(){
			showError();
		});
		function showError(){
			var error=$("#error");
			if(error.val()=="code"){
				alert("��֤�����!����������!");
			}else if(error.val()=="user"){
				alert("�û���������������������룡");
			}
		}
    	function change(){
    		var img=document.getElementById("image1");
    		//��һ�������������ʹ��ÿһ�ε�ˢ����ַ���ͱ仯�����¶�λ�������
    		img.src="IdentifyingCodeServlet?t=" + new Date().getTime();
    	}
    	</script>
	</head>

	<body>
	<div class="b3"></div>
		<div class="admin_login_wrap">
			<h1>SgExam���߿���ϵͳ</h1>
			<h1 style="margin-top:-30px;margin-bottom: 20px">��̨����</h1>		
			<div class="login">
			<div class="header" style="text-align: center;">
			<label style="font-size:20px;line-height:51px">����Ա��¼</label>
			</div>
				<div class="web_login" style="margin-top:20px">
					<form action="StudentAndTeacherAdminLoginServlet?status=admin" method="post">
						<input type="hidden" id="error" value="${error}"/>
						<ul class="reg_form">
							<li>
								<label for="user" class="input-tips2">�û�����</label>
								<input type="text" name="adminID" value="" id="adminID" size="35" class="inputstyle2" />
							</li>
							<li>
								<label for="pwd" class="input-tips2">���룺</label>
								<input type="password" name="adminPassword" value="" id="adminPassword" size="35" class="inputstyle2" />
							</li>
							<li>
								<label for="yanzheng" class="input-tips2">��֤�룺</label>
								<div class="inputOuter2">
									<input type="text" id="yanzheng" name="code" maxlength="16" class="inputstyle2" style="width: 135px; float: left;" />
									<img id="image1" src="IdentifyingCodeServlet" height="38px" onclick="change()"/>
								</div>
							</li>
							<li style="height: 30px;">
								<label for="yanzheng" class="input-tips2"></label>
								<label><input type="checkbox" name="autoLogin" value="1" />�������Զ���½</label>
							</li>
							<li>
								<input type="submit" tabindex="3" value="�ύ" class="button_blue" />
							</li>
						</ul>
					</form>
				</div>
			</div>
		</div>
		<jsp:include page="../login_footer.jsp"></jsp:include>
	</body>
</html>