<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>
    
    <%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
	%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<base href="<%=basePath%>"></base>
		<meta charset="gbk">
		<title>SgExam���߿���ϵͳ|�ɼ�ͳ��</title>
		<link rel="stylesheet" type="text/css" href="css/teacher_common.css" />
		<link rel="stylesheet" type="text/css" href="css/teacher_main.css" />
		<script type="text/javascript" src="<%=path%>/js/jquery-1.9.1.min.js"></script>
	</head>
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
							<a href="jsp/teacher/index.jsp">��ã�${tea_name }</a>
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
								<li>
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
								<li class="on">
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
					<div class="crumb-list"><i class="icon-font">��</i>
						<a href="jsp/teacher/index.jsp">��ҳ</a><span class="crumb-step">&gt;</span><span class="crumb-name">��Ŀ�����</span></div>
				</div>
				<div class="search-wrap">
					<div class="search-content">
						<form action="#" method="post">
							<table class="search-tab">
								<tr>
									<th width="120">�����γ�:</th>
									<td>
										<select name="c_id" >
										<option value="0">��ѡ��γ�</option>
										<c:forEach items="${courseList }" var="course">
										<option value="${course.c_id}">${course.c_name}</option>
										</c:forEach>
										</select>
									</td>
									<th width="120">�����༶:</th>
										<td>
										<select name="c_id" >
										<option value="0">��ѡ��༶</option>
										<c:forEach items="${classesList }" var="classes">
										<option value="${classes.cls_id}">${classes.cls_name}</option>
										</c:forEach>
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
									<th width="10%">���Ա��</th>
									<th width="15%">��������</th>
									<th width="10%">��������</th>
									<th width="10%">����������</th>
									<th width="10%">��������</th>
									<th width="10%">��������</th>
									<th width="15%">������</th>
								</tr>
								<c:if
									test="${! empty pager.getDateList() && pager.getDateList().size() >0 }">
								<c:forEach var="count" items="${pager.getDateList() }"  varStatus="v">
									<c:set var="flag" value="1"></c:set>
									<tr>
									<td>${v.index+1 }</td>
									<td>${count.p_name }</td>
									<td>${count.allPeople}</td>
										<td >
											${count.nopass}
										</td>
										<td>${count.pass}</td>
										<td><fmt:formatNumber value="${count.nopass/count.allPeople*100}" pattern="0.00" var="nopassLv"/>
										${nopassLv }%
										</td>
										<td><fmt:formatNumber value="${count.pass/count.allPeople*100}" pattern="0.00" var="passLv"/>
										${passLv }%
										</td>
									</tr>
								</c:forEach>
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