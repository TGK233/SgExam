<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
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
		<title>SgExam���߿���ϵͳ|������ʾ</title>
		<link rel="stylesheet" type="text/css" href="css/teacher_common.css" />
		<link rel="stylesheet" type="text/css" href="css/teacher_main.css" />
	</head>
	<script type="text/javascript" src="<%=path%>/js/jquery-3.1.1.js"></script>
	<body>
		<div class="topbar-wrap white">
			<div class="topbar-inner clearfix">
				<div class="topbar-logo-wrap clearfix">
					<ul class="navbar-list clearfix">
						<li>
							<a href="jsp/teacher/index.jsp">SgExam���߿���ϵͳ</a>
						</li>
					</ul>
				</div>
				<div class="top-info-wrap">
					<ul class="top-info-list clearfix">
						<li>
							<a href="#">��ã�${tea_name }</a>
						</li>
						<li>
							<a href="jsp/teacher/modify_password.jsp">�޸�����</a>
						</li>
						<li>
							<a href="QuitServlet?status=teacher">�˳�</a>
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
									<a href="jsp/teacher/index.jsp"><i class="icon-font">&#xe012;</i>��������</a>
								</li>
								<li>
									<a href="jsp/teacher/news_list.jsp"><i class="icon-font">&#xe012;</i>��Ϣ����</a>
								</li>
								<li class="on">
									<a href="servlet/ManageQuestion.do?flag=find&type=0&pager=1&manager=teacher"><i class="icon-font">&#xe008;</i>�������</a>
								</li>
								<li>
									<a href="PaperManageServlet?operation=update"><i class="icon-font">&#xe005;</i>���Թ���</a>
								</li>
								<li>
									<a href="Class_List_BrowseServlet?updateclassform=updateClassForm"><i class="icon-font">&#xe005;</i>�༶����</a>
								</li>
								<li>
									<a href="CountServlet"><i class="icon-font">&#xe005;</i>�ɼ�ͳ��</a>
								</li>
								<li>
									<a href="jsp/teacher/test_score_list.jsp"><i class="icon-font">&#xe005;</i>�ɼ�ͳ��</a>
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
						<a href="jsp/teacher/index.jsp">��ҳ</a><span class="crumb-step">&gt;</span>
						<a class="crumb-name" href="jsp/teacher/subject_list.jsp">������ʾ</a><span class="crumb-step">&gt;</span><span>�������</span></div>
				</div>
				<div class="result-wrap">
					<div class="result-content">
						<div style="width:600px ; margin: 0 auto; margin-top: 50px; box-shadow: 1px 1px 5px #666666;" class="panel panel-default">
			<div class="panel-heading">
				<h2 class="panel-title">������ʾ</h2>
			</div>
			<div class="panel-body">
				<div class="text-center text-danger">
					<span class="glyphicon glyphicon-remove-sign msg-icon"></span>
					<span class="msg-text">${error }</span><br />
					<a href="javascript:void(0);" onclick="window.history.go(-1);" class="btn btn-danger"><i class="glyphicon glyphicon-share-alt"></i> �� �� </a>
				</div>
			</div>
		</div>
					</div>
				</div>
			</div>
			<!--/main-->
		</div>

	</body>

</html>