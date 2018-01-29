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
		<title>SgExam���߿���ϵͳ|������</title>
		<link rel="stylesheet" type="text/css" href="css/teacher_common.css" />
		<link rel="stylesheet" type="text/css" href="css/teacher_main.css" />
	</head>

	<body>
		<div class="topbar-wrap white">
			<div class="topbar-inner clearfix">
				<div class="topbar-logo-wrap clearfix">
					<ul class="navbar-list clearfix">
						<li>
							<a href="index.html">SgExam���߿���ϵͳ</a>
						</li>
					</ul>
				</div>
				<div class="top-info-wrap">
					<ul class="top-info-list clearfix">
						<li>
							<a href="jsp/admin/index.jsp">��ã�${adm_name }</a>
						</li>
						<li>
							<a href="modify_password.html">�޸�����</a>
						</li>
						<li>
							<a href="QuitServlet?status=admin">�˳�</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="container clearfix">
			<div class="sidebar-wrap">
				<div class="sidebar-title">
					<h1>�˵�</h1>
				</div>
				<div class="sidebar-content">
					<ul class="sidebar-list">
						<li>
							<ul class="sub-menu">
								<li>
									<a href="jsp/admin/index.jsp"><i class="icon-font">&#xe012;</i>������Ϣ</a>
								</li>
								<li>
									<a href="ManageAdminServlet?flag=find&pageNum=1"><i class="icon-font">&#xe012;</i>����Ա����</a>
								</li>
								<li>
									<a href="jsp/admin/news_list.jsp"><i class="icon-font">&#xe012;</i>��Ϣ����</a>
								</li>
								<li>
									<a href="servlet/ManageQuestion.do?flag=find&type=0&pager=1&manager=admin"><i class="icon-font">&#xe008;</i>�������</a>
								</li>
								<li>
									<a href="PaperManageServlet?operation=update"><i class="icon-font">&#xe005;</i>���Թ���</a>
								</li>
								<li>
									<a href="ManageStudentServlet?flag=find&pageNum=1"><i class="icon-font">&#xe005;</i>ѧ������</a>
								</li>
								<li>
									<a href="ManageTeacherServlet?flag=find&pageNum=1"><i class="icon-font">&#xe005;</i>��ʦ����</a>
								</li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
			<!--/sidebar-->
			<div class="main-wrap">

				<div class="crumb-wrap">
					<div class="crumb-list"><i class="icon-font">��</i>
						<a href="index.html">��ҳ</a><span class="crumb-step">&gt;</span><span class="crumb-name">������</span></div>
				</div>
				<div class="result-wrap">
					<div class="result-title">
						<h1>������</h1>
					</div>
					<div class="result-content">
						<ul class="sys-info-list">
							<li>
								<label class="res-lab">���Ա��</label><span class="res-info">0000000001</span>
							</li>
							<li>
								<label class="res-lab">����</label><span class="res-info">c����</span>
							</li>
							<li>
								<label class="res-lab">�����γ�</label><span class="res-info">�����</span>
							</li>
							<li>
								<label class="res-lab">���԰༶</label><span class="res-info">�����1��</span>
							</li>
							<li>
								<label class="res-lab">������</label><span class="res-info">100%</span>
							</li>
							<li>
								<label class="res-lab"></label>
								<input class="btn btn6" onClick="history.go(-1)" value="����" type="button">
							</li>
						</ul>
					</div>
				</div>
			</div>
			<!--/main-->
		</div>
	</body>

</html>