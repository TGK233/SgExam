<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="gbk"%>
<%@ page import="edu.numberone.studystar.entity.Question"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>"></base>
<meta charset="GBK">
<title>SgExam���߿���ϵͳ|�������</title>
<link rel="stylesheet" type="text/css" href="css/teacher_common.css" />
<link rel="stylesheet" type="text/css" href="css/teacher_main.css" />
<script type="text/javascript" src="<%=path%>/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript">
$(function(){
	var skipBtn=$("#skip");
	var startBtn=$("#startPage");
	var upBtn=$("#upPage");
	var nextBtn=$("#nextPage");
	var endBtn=$("#endPage");
	
	//��תҳ��
	function skipPage(page){
	with (document.getElementById("page")) {  
	    method = "post";  
	    action = "servlet/ManageQuestion.do?flag=find&manager=teacher&pager="+page;
	    submit();  
		}  
		 }
	
skipBtn.click(function(){
	var page=document.getElementById("skipPage").value;
	 skipPage(page);
});

startBtn.click(function(){
	var page='${pager.currentPage}';
	 skipPage(page);
});
upBtn.click(function(){
	var page=Number('${pager.currentPage}')-1;
	if(page!=0){
	 skipPage(page);
	 }else{
		 skipPage(1);
	 }
});
nextBtn.click(function(){
	var page=Number('${pager.currentPage}')+1;
	if(page>'${pager.totalPage}'){
	 skipPage('${pager.currentPage}');
	 }else{
		 skipPage(page);
	 }
});
endBtn.click(function(){
	var page='${pager.totalPage}';
	 skipPage(page);
});

});
</script>
</head>

<body>
	<div class="topbar-wrap white">
		<div class="topbar-inner clearfix">
			<div class="topbar-logo-wrap clearfix">
				<ul class="navbar-list clearfix">
					<li><a href="jsp/teacher/index.jsp">SgExam���߿���ϵͳ</a></li>
				</ul>
			</div>
			<div class="top-info-wrap">
				<ul class="top-info-list clearfix">
					<li><a href="#">��ã�${tea_name }</a></li>
					<li><a href="jsp/teacher/modify_password.jsp">�޸�����</a></li>
					<li><a href="QuitServlet?status=teacher">�˳�</a></li>
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
									<a href="servlet/ScoreCorrectServlet.do?operation=toScoreCorrect"><i class="icon-font">&#xe005;</i>�����Ծ�</a>
								</li>
								<li>
									<a href="CountServlet"><i class="icon-font">&#xe005;</i>�ɼ�ͳ��</a>
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
					<i class="icon-font">��</i> <a href="jsp/teacher/index.jsp">��ҳ</a><span
						class="crumb-step">&gt;</span><span class="crumb-name">�������</span>
				</div>
			</div>
			<div class="search-wrap">
				<div class="search-content">
					<form action="servlet/ManageQuestion.do?flag=find&pager=1&manager=teacher" method="post">
						<table class="search-tab">
							<tr>
								<th width="120">ѡ��������:</th>
								<td><select name="type" id="catid" class="required">
								<option value="0" >������Ŀ</option>
											<option value="q1" ${type=='q1'?selected:""}>��ѡ��</option>
											<option value="q2" ${type=='q2'?selected:""}>��ѡ��</option>
											<option value="q3" ${type=='q3'?selected:""}>�����</option>
											<option value="q4" ${type=='q4'?selected:""}>�ж�</option>
											<option value="q5" ${type=='q5'?selected:""}>������</option>
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
						<table class="result-tab" width="100%" id="result-tab">
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
											<td>A:${question.getSelect()[0]}
											B:${question.getSelect()[0]}
											C:${question.getSelect()[0]}
											D:${question.getSelect()[0]}</td>
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
											<td>${question.q_score}</td>


											<td><a class="link-update"
												href="servlet/ManageQuestion.do?flag=findOne&q_id=${question.getQ_id()}">�޸�</a>
												<a class="link-del"
												href="servlet/ManageQuestion.do?flag=delete&manager=teacher&type=0&pager=1&q_id=${question.getQ_id()}">ɾ��</a></td>
										</tr>

									</c:forEach>
								</c:if>

								<c:if
									test="${ empty pager.getDateList() || pager.getDateList().size() == 0 }">
									û���κ�������Ϣ</c:if>
							</c:if>



						</table>


					</div>
				</form>
				<jsp:include page="/jsp/page.jsp"></jsp:include>
			</div>
		</div>
		<!--/main-->
	</div>
</body>

</html>