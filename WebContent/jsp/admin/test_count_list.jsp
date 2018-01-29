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
		<title>SgExam���߿���ϵͳ|�ɼ�ͳ��</title>
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
						<a href="jsp/admin/index.jsp">��ҳ</a><span class="crumb-step">&gt;</span><span class="crumb-name">��Ŀ�����</span></div>
				</div>
				<div class="search-wrap">
					<div class="search-content">
						<form action="#" method="post">
							<table class="search-tab">
								<tr>
									<th width="120">�����γ�:</th>
									<td>
										<select name="search-sort" id="">
											<option value="-1">ȫ��</option>
											<option value="1">c����</option>
											<option value="2">java</option>
											<option value="3">jsp</option>
											<option value="4">���</option>
											<option value="5">linux</option>
										</select>
									</td>
									<th width="70">�ؼ���:</th>
									<td><input class="common-text" placeholder="�ؼ���" name="keyword" value="" id="" type="text"></td>
									<td><input class="btn btn-primary btn2" name="sub" value="��ѯ" type="submit"></td>
								</tr>
							</table>
						</form>
					</div>
				</div>
				<div class="result-wrap">
					<form name="myform" id="myform" method="post">
						<div class="result-title">
							<div class="result-list">
								<a id="updateOrd" href="javascript:void(0)"><i class="icon-font">��</i>��������</a>
							</div>
						</div>
						<div class="result-content">
							<table class="result-tab" width="100%">
								<tr>
									<th class="tc" width="5%"><input class="allChoose" name="" type="checkbox"></th>
									<th width="10%">���Ա��</th>
									<th width="15%">����</th>
									<th width="10%">�����˱��</th>
									<th width="10%">�����γ�</th>
									<th width="15%">���԰༶</th>
									<th width="20%">����ʱ��</th>
									<th width="20%">����</th>
								</tr>
								<tr>
									<td class="tc"><input name="id[]" value="59" type="checkbox"></td>
									<td>1</td>
									<td>c����</td>
									<td>0000000001</td>
									<td>�����</td>
									<td>�������ѧ�뼼��1��</td>
									<td>2016-10-18 21:30:19��2016-10-18 21:31:10</td>
									<td>
										<a class="link-update" href="jsp/admin/test_revise.jsp">��Ŀ�����</a>
										<a class="link-update" href="jsp/admin/test_revise.jsp">����ֲ�</a>
									</td>
								</tr>
								<tr>
									<td class="tc"><input name="id[]" value="59" type="checkbox"></td>
									<td>1</td>
									<td>c����</td>
									<td>0000000001</td>
									<td>�����</td>
									<td>�������ѧ�뼼��1��</td>
									<td>2016-10-18 21:30:19��2016-10-18 21:31:10</td>
									<td>
										<a class="link-update" href="jsp/admin/test_revise.jsp">��Ŀ�����</a>
										<a class="link-update" href="jsp/admin/test_revise.jsp">����ֲ�</a>
									</td>
								</tr>
							</table>
							<div class="list-page"> 2 �� 1/1 ҳ</div>
						</div>
					</form>
				</div>
			</div>
			<!--/main-->
		</div>
	</body>

</html>