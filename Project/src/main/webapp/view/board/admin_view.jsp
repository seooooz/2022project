<%@page import="admin.adminBoardDTO"%>
<%@page import="admin.adminBoardDAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>
<%@include file="../includes/navbar.jsp"%> 
<%
String num = request.getParameter("anum");

adminBoardDAO dao = new adminBoardDAO();
dao.updateVisitCount(num);
adminBoardDTO dto = dao.selectView(num);
dao.close();
%>

<script>
function deleditPost(str){
	
	if(str == '수정'){
	 	var confirmed1 = confirm("게시물을 수정하겠습니까?");
		
	 	if(confirmed1){
	 		var form = document.writeFrm;
	 		form.method = "post";
	 		form.action = "admin_edit.jsp";
	 		form.submit();
	 	}
	}
	else if(str == '삭제'){
		var confirmed = confirm("게시물을 삭제하겠습니까?");
		
	 	if(confirmed){
	 		var form = document.writeFrm;
	 		form.method = "post";
	 		form.action = "../../Process/admin/DeleteProcess.jsp";
	 		form.submit();
	 	}
	}
}

function reportFrm(args1,args2) {
	var onum = args1;
	var tuid = args2;
	window.open("<c:url value='career_report.jsp?num="
				+ onum + "&tuid="+tuid+"'/>", "Reporttext", "width=500, height=500");
}
</script>  
<!-- <form name="writeFrm"> -->
        <!--**********************************
            Content body start
        ***********************************-->
        <div class="content-body">

            <div class="container-fluid col-lg-8">
                <!-- row -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="ml-0 ml-sm-4 ml-sm-0">
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="right-box-padding">
                                                <div class="read_content">
                                                   <form name="writeFrm">
                                          		 
                                                    <div class="media pt-3">
                                                        <div class="media-body">
                                                        	<input type="hidden" name="pnum" value =<%= dto.getAnum() %>>
                                                            <h3 class="btitle my-1"><%= dto.getTitle() %></h3>
                                                        </div>
                                                        
                                                        <div>
                                                        	<!-- 목록으로 돌아가기 -->
                                                        <%
														if(UserId != null && UserId.equals("admin")){
														%>
                                                        <a href="admin.jsp" class="text-muted "><i
                                                                class="fa fa-reply"></i> </a>
                                                        <div class="pull-right">
                                                        <!-- 수정하기 -->        
                                                        <a href="javascript:deleditPost('수정')" class="text-muted ml-3"><i
                                                                class="bi bi-pencil-fill"></i></a>
                                                        <!-- 삭제하기 -->        
                                                        <a href="javascript:deleditPost('삭제');" class="text-muted ml-3"><i
                                                                class="fa fa-trash"></i></a>
                                                        </div>
                                                        <%
														}else {
															if(dto.getBrd_code() == 1){
														%>
                                                        	<a href="skill.jsp" class="text-muted "><i class="fa fa-reply"></i> </a>
                                                        <%}else if(dto.getBrd_code()==2){ %>
                                                        	<a href="career" class="text-muted "><i class="fa fa-reply"></i> </a>
                                                        <%}else{ %>
                                                        	<a href="offer.jsp" class="text-muted "><i class="fa fa-reply"></i> </a>
														<%}
														} %>
                                                        </div>
                                                    </div>
                                                    
                                                    <div class="media mb-4 mt-5">
                                                        <div class="media-body"> 
                                                        <span class="pull-right" style="margin-left: 5px;"><%= dto.getVisitcount() %></span>
                                                        	<i class="bi bi-eye pull-right"></i>
                                                        	<img class="pf rounded-circle pull-left" alt="image" src="../../resources/images/pf.png">
                                                            <h5 class="bid">관리자</h5>
                                                            <p class="bpostdate"><%= dto.getPostdate() %></p>
                                                        </div>
                                                    </div>
                                                    <div class="b bcontent bread-content-body">
                                                        <p><%=dto.getContent() %></p>
                                                    </div>
                                                    </form>
                                    
                                                </div>
            								
<!-- OFFER 댓글 목록 start  -->
											
					<!-- OFFER 댓글 목록 end  -->
													
												</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
               </div> 
        <!--**********************************
            Content body end
        ***********************************-->

<%@include file="../includes/footer.jsp"%>