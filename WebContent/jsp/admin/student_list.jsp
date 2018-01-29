<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK"%>

<%@page import="edu.numberone.studystar.entity.Student"%>
<%@page import="edu.numberone.studystar.entity.Pager"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	/*�����Ŀ��·��  */
	String mPath = config.getServletContext().getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>"></base>
<meta charset="gbk">
<title>SgExam���߿���ϵͳ|ѧ������</title>
<link rel="stylesheet" type="text/css" href="css/admin_common.css" />
<link rel="stylesheet" type="text/css" href="css/admin_main.css" />
</head>

<body>
	<div class="topbar-wrap white">
		<div class="topbar-inner clearfix">
			<div class="topbar-logo-wrap clearfix">
				<ul class="navbar-list clearfix">
					<li><a href="jsp/admin/index.jsp">SgExam���߿���ϵͳ</a></li>
				</ul>
			</div>
			<div class="top-info-wrap">
				<ul class="top-info-list clearfix">
					<li><a href="jsp/admin/index.jsp">��ã�${adm_name }</a></li>
					<li><a href="jsp/admin/modify_password.jsp">�޸�����</a></li>
					<li><a href="QuitServlet?status=admin">�˳�</a></li>
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
								<li class="on">
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
				<div class="crumb-list">
					<i class="icon-font">��</i> <a href="jsp/admin/index.jsp">��ҳ</a><span
						class="crumb-step">&gt;</span><span class="crumb-name">ѧ������</span>
				</div>
			</div>
			<div class="search-wrap">
				<div class="search-content">
					<form action="#" method="post">
						<table class="search-tab">
							<tr>
								<th width="70">�ؼ���:</th>
								<td><input class="common-text" placeholder="�ؼ���"
									name="keyword" value="" id="" type="text"></td>
								<td><input class="btn btn-primary btn2" name="sub"
									value="��ѯ" type="submit"></td>
							</tr>
						</table>
					</form>
				</div>
			</div>
			<div class="result-wrap">
				<form name="myform" id="myform" method="post">
					<div class="result-title">
						<div class="result-list">
							<a href="jsp/admin/student_add.jsp"><i class="icon-font">��</i>���ѧ��</a>
							<a id="batchDel" href="javascript:void(0)"><i
								class="icon-font">��</i>����ɾ��</a> <a id="updateOrd"
								href="javascript:void(0)"><i class="icon-font">��</i>��������</a>
						</div>
					</div>
					<div class="result-content">
						<table class="result-tab" width="100%">
							<tr>
								<th class="tc" width="10%"><input class="allChoose" name=""
									type="checkbox"></th>
								<th width="10%">ѧ��</th>
								<th width="20%">����</th>
								<th width="10%">�Ա�</th>
								<th width="20%">����</th>
								<th width="20%">�༶</th>
								<th width="20%">����</th>
							</tr>

						
							<c:if
								test="${requestScope.pager != null && requestScope.pager.getDateList().size() > 0}">

								<c:forEach items="${requestScope.pager.getDateList() }"
									var="stu">
									<tr>
										<td class="tc"><input name="id[]" value="59"
											type="checkbox"></td>
										<td>${stu.getS_id()}</td>
										<td>${stu.getS_name()}</td>
										<td>${stu.getS_sex()}</td>
										<td>${stu.getS_pass()}</td>
										<td>${stu.getCls_Name()}</td>
										<td><a class="link-update"
											href="jsp/admin/student_revise_info.jsp?s_id=${stu.getS_id()}&s_name=${stu.getS_name()}&s_pass=${stu.getS_pass()}&s_sex=${stu.getS_sex()}&cls_id=${stu.getCls_Id()}">�޸���Ϣ</a> 
											<a class="link-del" href="ManageStudentServlet?flag=delete&pageNum=1&s_id=${stu.getS_id()}">ɾ��</a></td>
									</tr>
								</c:forEach>
						</table>
						</c:if>


						<c:if
							test="${requestScope.pager == null || requestScope.pager.getDateList().size() == 0}">
							</table>
							<div class="list-page">��ǰҳû�����ݣ�</div>
						</c:if> 

					</div>
				</form>
			</div>
		</div>
		<!--/main-->
	</div>
</body>

</html>