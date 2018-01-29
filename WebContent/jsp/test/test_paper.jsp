<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*, edu.numberone.studystar.daoimpl.*, edu.numberone.studystar.entity.*"%>     
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
		<meta charset="utf-8">
		<title>SgExam���߿���ϵͳ|�ҵĿ���</title>
		<link href="css/test_paper_common.css" rel="stylesheet" type="text/css">
		<link href="css/list.css" rel="stylesheet" type="text/css">

		<script src="js/jquery-1.9.1.min.js" type="text/javascript"></script>
		<script src="js/js.js" type="text/javascript"></script>
		<script type="text/javascript">
		$(function(){
			var calcuate=function(endTime){
				console.log(endTime);
				var date2 = Date.parse(new Date(endTime));   // endtime Ϊ����ʱ��
				console.log(date2);
				var date1=new Date();  //��ʼʱ��
				var date3=date2-date1.getTime()  //ʱ���ĺ�����
				console.log(date3);
				//������������
				var days=Math.floor(date3/(24*3600*1000))
				//�����Сʱ��

				var leave1=date3%(24*3600*1000)    //����������ʣ��ĺ�����
				var hours=Math.floor(leave1/(3600*1000))
				//������������
				var leave2=leave1%(3600*1000)        //����Сʱ����ʣ��ĺ�����
				var minutes=Math.floor(leave2/(60*1000))
				//�����������
				var leave3=leave2%(60*1000)      //�����������ʣ��ĺ�����
				var seconds=Math.round(leave3/1000)
				$("#time").text(hours+"Сʱ "+minutes+" ����"+seconds+" ��");
				if(hours<=0&&minutes<=0&&seconds<=0){
					alert("����ʱ�䵽�����Խ�����")
					$("#submit").click();
				}
			}
			var endTime='${paper.p_date}'+" "+'${paper.endTime}';
			console.log("\'calcuate("+endTime+")\'");
			window.setInterval(calcuate,1000,endTime);
		})
		</script>
	</head>
	
	<body>
		<div class="clear list_top ovhi psRe">
			<div class="header psAb">
				<div class="psRe head">
					<h2 class="logo"><a class="disin" href="servlet/StudentServlet.do?operation=toIndex"><img src="images/index_logo.png" alt="SgExam���߿���ϵͳ"/></a></h2>
					<div class="menuname text_font">
						${paper.p_name}
					</div>
					<div class="clear hover_right psRe">
						<ul class="head_right">
							<li class="head_li rt head_responsive">
								<a class="animate2" href="QuitServlet?status=student"><span>�˳�ϵͳ</span></a>
							</li>
							<li class="head_li rt">
								<a class="animate2" href="#"><span></span></a>
							</li>
							<li class="head_li rt">
								<font class="vet lh35 disin">&nbsp;&nbsp;
									<a href="servlet/StudentServlet.do?operation=toIndex">��ã�</a>&nbsp;&nbsp;&sdot;&nbsp;&nbsp;
									<a href="jsp/student/student_personal.jsp">${stu_name }</a>&nbsp;&nbsp;&sdot;&nbsp;&nbsp;
									<a href="servlet/StudentServlet.do?operation=toIndex">ͬѧ</a>
								</font><i class="icos ico_id"></i></li>
							<li class="head_li rt h35">&nbsp;</li>
						</ul>
						<ul id="search_ul" class="text_time">
							������ʣʱ�䣺<span id="time">01:38:20</span>
						</ul>
					</div>
				</div>
			</div>
			<ul class="psRe">
				<img src="images/study_background_img.png" />
				<div class="list_grd_bg psAb"></div>
			</ul>
			<a class="disin psAb menuname" href="#">���ҳ��ſ���</a>
		</div>
		<div class="crumbs_left lf"></div>

		<div class="bk"></div>
		<div class="bagf wrap_list clear grd24 mar0a">
			<div class="list_left lf">
				<div id="wrap_sub"></div>
				
			</div>
			<div class="list-content rt list_main">
				<div class="article psRe">

					<form action="DoCalScoreServlet?cid=${paper.c_id}&pid=${pid}" method="post">
						<h3>һ����ѡ��</h3>
						<c:set var="number1" value="0"></c:set>
						<c:forEach var="que" items="${ques}" varStatus="status">
							<c:if test="${que.q_type == 'q1'}">
								<fieldset>
									<legend>${number1+1}.&nbsp;</legend>
									<p>${que.q_title}</p>
										<label><input type="radio" name="${que.q_id}" value="A" />A.${que.selects[0]}</label><br />
										<label><input type="radio" name="${que.q_id}" value="B" />B.${que.selects[1]}</label><br />
										<label><input type="radio" name="${que.q_id}" value="C" />C.${que.selects[2]}</label><br />
										<label><input type="radio" name="${que.q_id}" value="D" />D.${que.selects[3]}</label><br />
								</fieldset>
								<div class="bk20"></div>
							</c:if>
						</c:forEach>
						<h3>������ѡ��</h3>
						<c:set var="number2" value="0"></c:set>
						<c:forEach var="que" items="${ques}" varStatus="status">
							<c:if test="${que.q_type == 'q2'}">
								<fieldset>
									<legend>${number2+1}.&nbsp;</legend>
									<p>${que.q_title}</p>
										<label><input type="checkbox" name="${que.q_id}" value="A" />A.${que.selects[0]}</label><br />
										<label><input type="checkbox" name="${que.q_id}" value="B" />B.${que.selects[1]}</label><br />
										<label><input type="checkbox" name="${que.q_id}" value="C" />C.${que.selects[2]}</label><br />
										<label><input type="checkbox" name="${que.q_id}" value="D" />D.${que.selects[3]}</label><br />
								</fieldset>
								<div class="bk20"></div>
							</c:if>
						</c:forEach>
						<h3>���������</h3>
						<c:set var="number3" value="0"></c:set>
						<c:forEach var="que" items="${ques}" varStatus="status">
							<c:if test="${que.q_type == 'q3'}">
								<fieldset>
									<legend>${number3+1}.&nbsp;</legend>
									<span>${que.q_title}</span>
									<input type="text" name="${que.q_id}"/>
								</fieldset>
								<div class="bk20"></div>
							</c:if>
						</c:forEach>
						<h3>�ġ��ж���</h3>
						<c:set var="number4" value="0"></c:set>
						<c:forEach var="que" items="${ques}" varStatus="status">
							<c:if test="${que.q_type == 'q4'}">
								<fieldset>
									<legend>${number4+1}.&nbsp;</legend>
									<p>${que.q_title}</p>
										<label><input type="radio" name="${que.q_id}" value="1" />��</label>
										<label><input type="radio" name="${que.q_id}" value="0" />��</label><br />
								</fieldset>
								<div class="bk20"></div>
							</c:if>
						</c:forEach>
						<h3>�塢������</h3>
						<c:set var="number5" value="0"></c:set>
						<c:forEach var="que" items="${ques}" varStatus="status">
							<c:if test="${que.q_type == 'q5'}">
								<fieldset>
									<legend>${number5+1}.&nbsp;</legend>
									<p>${que.q_title}</p>
									<textarea rows="5" cols="50" name="${que.q_id}"></textarea>
								</fieldset>
								<div class="bk20"></div>
							</c:if>
						</c:forEach>
						<div class="inputArea">
							<input type="submit" id="submit" style="margin-top:20px;margin-left:100px;" class="button_blue" value="�ύ����" />
						</div>
					</form>
					<div class="bk20"></div>
				</div>
			</div>
		</div>
		<script type="text/javascript">
			$(function() {
				$(".content.detail").find("img").each(function() {
					var w = $(this).width(),
						h = $(this).height();
					if(w >= 710 || w == 0) {
						$(this).css({
							width: 710,
							height: 710 * h / w
						});
					}
				});
			})
		</script>
		<div style="display:none;" id="goTopBtn" title="���ض���"> </div>
		<script type=text/javascript>
			goTopEx();
		</script>
		</div>
		<!--/wrap-->
		<div id="footer" class="psRe">
			<p class="padt10 textc white lh20">
				<a class="disin padlr10" href="#">΢��΢��</a>
				<a class="disin padlr10" href="#">�б깫��</a>
				<a class="disin padlr10" href="#">�˲���Ƹ</a>
			</p>
			<p class="padt5 textc white lh20">��Ȩ����&nbsp;&copy;&nbsp;SgExam���߿���ϵͳ&nbsp;&nbsp;��ICP��&nbsp;00000001��&nbsp;�湫������000000000001</p>
			<div class="foot_bg psAb"></div>
		</div>
	</body>

</html>