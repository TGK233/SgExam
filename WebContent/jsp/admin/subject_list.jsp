<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK"%>
<%@ page import="edu.numberone.studystar.entity.Question"%>
<%@ page import="edu.numberone.studystar.entity.Pager" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	/*�����Ŀ��·��  */
	String mPath = config.getServletContext().getContextPath();
%>

<!---------------------------------------------------------  -->

<%!int currentPage = 1;
	int pageSize = 2;
	int totalPage = 2;%>

<%

	Pager<Question> pager = (Pager<Question>) request.getAttribute("pager");

	if (pager != null) {

		currentPage = pager.getCurrentPage();
		pageSize = pager.getPageSize();
		totalPage = pager.getTotalPage();
	}
%>


<!---------------------------------------------------------  -->


<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>"></base>
<meta charset="gbk">
<title>SgExam���߿���ϵͳ|�������</title>
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
					<li><a href="#">��ã�${adm_name }</a></li>
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
							<li><a href="jsp/admin/index.jsp"><i class="icon-font">&#xe012;</i>������Ϣ</a>
							</li>
							<li><a href="ManageAdminServlet?flag=find&pageNum=1"><i
									class="icon-font">&#xe012;</i>����Ա����</a></li>
							<li><a href="jsp/admin/news_list.jsp"><i
									class="icon-font">&#xe012;</i>��Ϣ����</a></li>
							<li class="on"><a href="servlet/ManageQuestion.do?flag=find&type=0&pager=1&manager=admin"><i
									class="icon-font">&#xe008;</i>�������</a></li>
							<li><a href="PaperManageServlet?operation=update"><i
									class="icon-font">&#xe005;</i>���Թ���</a></li>
							<li><a href="ManageStudentServlet?flag=find&pageNum=1"><i
									class="icon-font">&#xe005;</i>ѧ������</a></li>
							<li><a href="ManageTeacherServlet?flag=find&pageNum=1"><i
									class="icon-font">&#xe005;</i>��ʦ����</a></li>
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
						class="crumb-step">&gt;</span><span class="crumb-name">�������</span>
				</div>
			</div>
			<div class="search-wrap">
				<div class="search-content">
					<form action="#" method="post">
						<table class="search-tab">
							<tr>
								<th width="120">ѡ�����:</th>
								<td><select name="search-sort" id="">
										<option value="-1">ȫ��</option>
										<option value="1">��ѡ��</option>
										<option value="2">��ѡ��</option>
										<option value="3">�����</option>
										<option value="4">�ж�</option>
										<option value="5">������</option>
								</select></td>
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
							<a href="servlet/ManageQuestion.do?flag=toAdd"><i class="icon-font">��</i>�������</a>
							<a id="batchDel" href="javascript:void(0)"><i
								class="icon-font">��</i>����ɾ��</a> <a id="updateOrd"
								href="javascript:void(0)"><i class="icon-font">��</i>��������</a>
						</div>
					</div>
					<div class="result-content">
						<table class="result-tab" width="100%">
							<tr>
								<th class="tc" width="5%"><input class="allChoose" name=""
									type="checkbox"></th>
								<th width="7%">�������</th>
								<th width="8%">��Ŀ����</th>
								<th width="20%">��Ŀ</th>
								<th width="20%">ѡ��</th>
								<th width="20%">��</th>
								<th width="10%">��ֵ</th>

								<th width="10%">����</th>
							</tr>
							<c:if test="${! empty pager }">
								<c:if
									test="${! empty pager.getDateList() && pager.getDateList().size() >0 }">
									<c:forEach items="${pager.getDateList() }" var="question" varStatus="v">

										<tr>
											<td class="tc"><input name="id[]" value="59"
												type="checkbox"></td>

											<td>${v.index+1}</td>
											<td>
											<c:choose>
											<c:when test="${question.getQ_type()=='q1'}">
											��ѡ��
											</c:when>
											<c:when test="${question.getQ_type()=='q2'}">
											��ѡ��
											</c:when>
											<c:when test="${question.getQ_type()=='q3'}">
											�����
											</c:when>
											<c:when test="${question.getQ_type()=='q4'}">
											�ж���
											</c:when>
											<c:when test="${question.getQ_type()=='q5'}">
											������
											</c:when>
											</c:choose>
											</td>
											<td>${question.getQ_title()}</td>
											<td>${question.getQ_select()}</td>
											<td>
											<c:choose>
											<c:when test="${question.getQ_type()=='q4'}">
											${question.q_answer=='1'?'��':'��'}
											</c:when>
											<c:when test="${question.getQ_type()!='q4'}">
											${question.q_answer}
											</c:when>
											</c:choose>
											</td>
											<td>${question.getQ_score().toString()}</td>


											<td><a class="link-update"
												href="servlet/ManageQuestion.do?flag=findOne&q_id=${question.getQ_id()}">�޸�</a>
												<a class="link-del"
												href="servlet/ManageQuestion.do?flag=delete&manager=admin&type=0&pager=1&q_id=${question.getQ_id()}">ɾ��</a></td>
										</tr>

									</c:forEach>
								</c:if>

								<c:if
									test="${ empty pager.getDateList() || pager.getDateList().size() == 0 }">
									û���κ�������Ϣ</c:if>
							</c:if>

						</table>
						<div class="list-page">&nbsp;&nbsp;<input class="btn btn-primary btn3 mr10" value="��ҳ" type="button" onclick="homeClick()"><input class="btn btn-primary btn3 mr10" value="��һҳ" type="button" onclick="preiousClick()"> <%=pageSize %>�� <%=currentPage %>/<%=totalPage %>ҳ&nbsp;&nbsp;<input class="btn btn-primary btn3 mr10" value="��һҳ" type="button" onclick="nextClick()"><input class="btn btn-primary btn3 mr10" value="βҳ" type="button" onclick="lastClick()">
						
						</div>
					</div>
				</form>
			</div>
		</div>
		<!--/main-->
		
		<script type="text/javascript">
    var homeClick = function(){
		var hr;

		/* var stuname = document.getElementById("name").value;
		var stuSex = document.getElementById("sex").value; */
		
		
		/* servlet/ManageQuestion.do?flag=find&type=0&pager=1&manager=admin */
		
		
		hr = "servlet/ManageQuestion.do?flag=find&type=0&pager=1&manager=admin";
		window.open(hr, "_self");
	} 

	 var nextClick = function() {
		 var hr;

	/* 	var stuname = document.getElementById("name").value;
		var stuSex = document.getElementById("sex").value; */
		var totalPage =<%=totalPage%>;
		var currentPage = <%=currentPage%>;

		
		
		if(currentPage >= totalPage){
			currentPage =totalPage;
		
			alert("�Ѿ������һҳ");
			
		}else{
			currentPage++;
		
		}
		

		hr = "servlet/ManageQuestion.do?flag=find&type=0&pager="+currentPage+"&manager=admin";
		
		window.open(hr, "_self");
	} 
	
	var preiousClick = function(){
		var hr;
	/* 	var stuname = document.getElementById("name").value;
		var stuSex = document.getElementById("sex").value;
		 */
		
		var totalPage =<%=totalPage%>;
		var currentPage = <%=currentPage%>;
		
       if(currentPage >= totalPage){
			
    	   currentPage = totalPage
			
			
		}
 
		if (currentPage <= 1) {
			alert("�Ѿ��ǵ�һҳ��")
		} else {
			currentPage --;
		}
	
		hr = "servlet/ManageQuestion.do?flag=find&type=0&pager="+currentPage+"&manager=admin";
		
	
		window.open(hr, "_self");
	} 
	
	 var lastClick = function() {

		/* var stuname = document.getElementById("name").value;
		var stuSex = document.getElementById("sex").value; */
		var totalPage =<%=totalPage%>;
		
		hr = "servlet/ManageQuestion.do?flag=find&type=0&pager="+totalPage+"&manager=admin";
		
		window.open(hr, "_self");
	} 
</script>
	</div>
</body>

</html>