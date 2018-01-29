<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="GBK"%>
    
    <%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
    /*�����Ŀ��·��  */
    String mPath = config.getServletContext().getContextPath();
	%>
<!DOCTYPE html>
<html>
	<head>
		<base href="<%=basePath%>"></base>
		<meta charset="gbk">
		<title>SgExam���߿���ϵͳ|��Ϣ����</title>
		<link rel="stylesheet" type="text/css" href="css/admin_common.css" />
		<link rel="stylesheet" type="text/css" href="css/admin_main.css" />
	</head>

	<body>
		<div class="topbar-wrap white">
			<div class="topbar-inner clearfix">
				<div class="topbar-logo-wrap clearfix">
					<ul class="navbar-list clearfix">
						<li>
							<a href="jsp/admin/index.jsp">SgExam���߿���ϵͳ</a>
						</li>
					</ul>
				</div>
				<div class="top-info-wrap">
					<ul class="top-info-list clearfix">
						<li>
							<a href="jsp/admin/index.jsp">��ã�${adm_name }</a>
						</li>
						<li>
							<a href="jsp/admin/modify_password.jsp">�޸�����</a>
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
								<li class="on">
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
						<a href="jsp/admin/index.jsp">��ҳ</a><span class="crumb-step">&gt;</span>
						<a class="crumb-name" href="jsp/admin/news_list.jsp">��Ϣ����</a><span class="crumb-step">&gt;</span><span>������Ϣ</span>
					</div>
				</div>
				<div class="result-wrap">
					<div class="result-content">
						<form action="DoAddAnnoucementServlet" method="post" id="myform" name="myform">
							<table class="insert-tab" width="100%">
								<tbody>
									<tr>
										<th><i class="require-red">*</i>���⣺</th>
										<td>
											<input class="common-text required" id="title" name="a_title" size="50" value="" type="text">
										</td>
									</tr>
									<tr>
										<th><i class="require-red">*</i>���ݣ�</th>
										<td><textarea name="a_content" class="common-textarea" id="content" cols="30" style="width: 98%;" rows="10"></textarea></td>
									</tr>

									<tr>
										<th><i class="require-red">*</i>�����ˣ�</th>
										<td>
											<input class="common-text required" id="people" name="a_author" size="50" value="����Ա" type="text">
										</td>
									</tr>
									<tr>
										<th><i class="require-red">*</i>����ʱ�䣺</th>
										<td>
											<input class="common-text required disabled" id="time" name="time" size="50" value="" type="text" disabled="disabled">
										</td>
									</tr>
									<tr>
										<th></th>
										<td>
											<input class="btn btn-primary btn6 mr10" value="�ύ" type="submit">
											<input class="btn btn6" value="����" type="reset">
											<input class="btn btn6" onClick="history.go(-1)" value="����" type="button">
										</td>
									</tr>
								</tbody>
							</table>
						</form>
					</div>
				</div>
				<script src="js/time.js" type="text/javascript" charset="bgk"></script>
			</div>
			<!--/main-->
		</div>
	</body>

</html>