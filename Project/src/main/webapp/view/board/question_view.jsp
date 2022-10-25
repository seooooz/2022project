<%@page import="utils.CommentDTO"%>
<%@page import="board4.QuestionBoardDTO"%>
<%@page import="board4.QuestionBoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@include file="../includes/header.jsp"%>
<%@include file="../includes/navbar.jsp"%>
<%@include file="/Process/IsLoggedIn.jsp" %>

<%
		System.out.println("============");
		System.out.println(request.getAttribute("qnum"));
		System.out.println(request.getParameter("qnum")); 
		System.out.println("============");

		String qnum = request.getParameter("qnum");
		QuestionBoardDAO dao = new QuestionBoardDAO();
		dao.updateVisitCount(qnum);
		QuestionBoardDTO dto = dao.selectView(qnum);
		List<CommentDTO> comLists = dao.comselectView(qnum);
	
		Date date = dto.getQpostdate();
		System.out.println(date);
		
		dao.close();
%>
<script>
	function pwdCheckForm(num) {
		
		if(confirm("삭제하시겠습니까?") == true){
			
			window.open("<c:url value='/view/board/questionPwdCheck.jsp?qnum="
				+ qnum + "&qid="+qid+"'/>", "PassWordCheck", "width=500, height=500");
		}else{
			return false;
		}
	
		

	}
</script>	

<style>

a:link { color: black; text-decoration: none;} 
a:visited { color: black; text-decoration: none;} 
a:hover { color: black; text-decoration: underline;}

.mt-5 {
margin-top: 1.5rem !important;
}
.b {
color:black;
font-size: 16px
}
.btitle {
font-size: 20px;
}

.bid {
margin-top: 0.3rem;
font-size: 15px;
font-weight: 100;
}

.bpostdate{
font-size: 12px;
font-weight: 100;
}
.bcontent {
margin-buttom: 5rem
}
.read_content textarea {
  color: #828690;
  border-color: rgba(0, 0, 0, 0.1);
  padding: 0.625rem 1.25rem; }
  .read-content textarea::placeholder {
    color: #abafb3; }
    
.pf {
	margin-right: 0.5rem;
}    

.com{
color:black;
}

.comdate{
font-size: 12px;
color: rgb(107 114 128);
}

.comment{
font-size:15px;
margin-top: 0.75rem;
}

.recom{
 margin-left: 5rem;
}

.card-center{
	margin-left: 1.5rem !important;
    margin-right: 1.5rem;
}
</style>
        <!--**********************************
            Content body start
        ***********************************-->
        <div class="content-body">

            <div class="container-fluid col-lg-8">
           			 <div class="p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
                        <ol class="top tright">
                            <li class="breadcrumb-item"><a href="question.jsp">문의사항</a></li>
                        </ol>
                      </div>
                <!-- row -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="card-center ml-0 ml-sm-0">
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="right-box-padding">
                                               <div class="toolbar" role="toolbar">
                                                <div class="table-responsive">
                                                    <div class="media pt-3">
                                                        <div class="media-body">
                                                            <h3 class="btitle my-1"><%=dto.getQtitle() %></h3>
                                                        </div>
                                                        <!-- 목록으로 돌아가기 -->
                                                        <a href="/view/board/question.jsp" class="text-muted "><i
                                                                class="fa fa-reply"></i> </a>
                                                        <%
														if(UserId != null && UserId.equals(dto.getQid())){
														%>        
                                                        <!-- 수정하기 -->        
                                                        <a href="javascript:void()" class="text-muted ml-3"><i
                                                                class="bi bi-pencil-fill"></i> </a>
                                                        <!-- 삭제하기 -->        
                                                        <a href="javascript:pwdCheckForm(<%=dto.getQnum()%>)" class="text-muted ml-3"><i
                                                                class="fa fa-trash"></i></a>
                                                        <%
														}
                                                        %>
                                                    </div>
                                                     <div class="media mb-4 mt-5">
                                                        <div class="media-body"> 
                                                        <span class="pull-right" style="margin-left: 5px;"><%= dto.getQvisitcount() %></span>
                                                        	<i class="bi bi-eye pull-right"></i>
                                                        	<img class="pf rounded-circle pull-left" alt="image" src="../../resources/images/pf.png">
                                                            <h5 class="bid"><%= dto.getQid() %></h5>
                                                            <p class="bpostdate"><%= dto.getQpostdate() %></p>
                                                        </div>
                                                    </div>
                                                    <div class="b bcontent bread-content-body mart">
                                                        <p><%= dto.getQcontent() %></p>
                                                    </div>
                                                    
                                                    <%
                                                    if(session.getAttribute("UserId").equals("admin")){
                                                    %>
                                                    <form name="offercomFrm" method="post" action="../../Process/question/ComWriteProcess.jsp">
                                                    	<input type="hidden" name="qnum" value =<%= dto.getQnum()%>>
                                                        <h5 class="pt-3">COMMENT</h5>
	                                                    <div class="form-group pt-3">
	                                                        <textarea class="btextarea w-100" name="comment" cols="30" rows="5"  placeholder="댓글을 쓰려면 로그인이 필요합니다."></textarea>
	                                                    </div>
	                                                	<div class="text-right">
	                                                    <button class="btn btn-primary btn-sl-sm mb-5" type="submit">Send</button>
	                                                	</div>
                                                	</form>	
                                                	
                                                	<%} %>
                                                	<br>
                                                	<br>
                                                	<hr>
													<div>
													<%
													if(comLists.isEmpty()){   // 댓글이 없을 때 
													%>
													<%
													} else {
														for (CommentDTO ccdto : comLists) {
													%>
													<div> <!-- 댓글이 있을 때 -->
														<div class="paper_list">
															<div class="py-4 comm">
																<div class="b bid">관리자</div>
																<div class="bpostdate"><%= ccdto.getDate() %></div>
																<div style="font-size:16px;" class="b comment"><%= ccdto.getComment() %></div>
															</div>
															 <%
		                                                    if(session.getAttribute("UserId").equals("admin")){
		                                                    %>
															<div>
																<form name="redelFrm" method="post" action="../../Process/question/ComDelProcess.jsp">
																<input type="hidden"  name = "comidx" value=<%= ccdto.getIdx()%>>
																<input type="hidden"  name = "qnum" value=<%= ccdto.getPostNum()%>>
																<input type="hidden"  name = "id" value=<%= ccdto.getId()%>>
																<button class="pull-right btn btn-default text-muted">댓글 삭제</button>
																</form>
															</div>
															<%
		                                                    }
															%>
														</div>
                                            		</div>
                                            		
                                            		<%		}
													}
												%>
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
       </div> 
       </div>
       </div>
        <!--**********************************
            Content body end
        ***********************************-->

<%@include file="../includes/footer.jsp"%>