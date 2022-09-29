<%@page import="board1.skillBoardDTO"%>
<%@page import="board1.skillBoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>
<%@include file="../includes/navbar.jsp"%> 
<%
String snum = request.getParameter("num");

skillBoardDAO sdao = new skillBoardDAO();
sdao.updateVisitCount(snum);
skillBoardDTO sdto = sdao.selectView(snum);
sdao.close();
%>
<script>
function skilldeletePost(){
	var confirmed = confirm("게시물을 삭제하겟습니까?");
	
	if(confirmed){
		var form = document.writeFrm;
		form.method = "post";
		form.action = "DeleteProcess.jsp";
		form.submit();
	}
}
</script>  
<style>
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

.tright{
    float: right;
}
</style>
<form name="writeFrm">
        <!--**********************************
            Content body start
        ***********************************-->
        <div class="content-body">

            <div class="container-fluid col-lg-8">
                <div class="row page-titles mx-0">
                    <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="javascript:void(0)">Email</a></li>
                            <li class="breadcrumb-item active"><a href="javascript:void(0)">Read</a></li>
                        </ol>
                    </div>
                </div>
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
                                          		 <form name="offercomFrm" method="post" action="../../Process/offer/ComWriteProcess.jsp">
                                                    <div class="media pt-3">
                                                        <div class="media-body">
                                                             <h3 class="btitle my-1"><%= sdto.getTitle() %></h3>
                                                        </div>
                                                        
                                                        <div>
                                                        	<!-- 목록으로 돌아가기 -->
                                                        <a href="skill.jsp" class="text-muted "><i
                                                                class="fa fa-reply"></i> </a>
                                                        <%
														if(session.getAttribute("UserId") != null && session.getAttribute("UserId").toString().equals(sdto.getId())){
														%>
                                                        <div class="pull-right">
                                                        <!-- 수정하기 -->        
                                                        <a href="javascript:void()" class="text-muted ml-3"><i
                                                                class="bi bi-pencil-fill"></i> </a>
                                                        <!-- 삭제하기 -->        
                                                        <a href="javascript:skilldeletePost();" class="text-muted ml-3"><i
                                                                class="fa fa-trash"></i></a>
                                                        </div>
                                                        <%
														}
														%>
                                                        </div>
                                                    </div>
                                                    
                                                    <div class="media mb-4 mt-5">
                                                        <div class="media-body"> 
                                                        <span class="pull-right" style="margin-left: 5px;"><%= sdto.getVisitcount() %></span>
                                                        	<i class="bi bi-eye pull-right"></i>
                                                        	<img class="pf rounded-circle pull-left" alt="image" src="../../resources/images/pf.png">
                                                            <h5 class="bid"><%= sdto.getId() %></h5>
                                                            <p class="bpostdate"><%= sdto.getPostdate() %></p>
                                                        </div>
                                                    </div>
                                                    <div class="b bcontent bread-content-body">
                                                        <p><%= sdto.getContent() %></p>
                                                    </div>
                                                    <div>
                                                    	<%= sdto.getCate() %>
                                                    </div>
                                                        <hr>
                                                        <h5 class="pt-3">COMMENT</h5>
                                                    <div class="form-group pt-3">
                                                    	<input name="pnum" value =<%= sdto.getNum() %>>
                                                        <textarea class="btextarea w-100" name="comment" cols="30" rows="5"  placeholder="댓글을 쓰려면 로그인이 필요합니다."></textarea>
                                                    </div>
                                                <div class="text-right">
                                                    <button class="btn btn-primary btn-sl-sm mb-5" type="submit">Send</button>
                                                </div>
                                                </form>	
                                                
                                                
                                                
                                                </div>
                                                </div>
            								
<%-- <%@include file="reply.jsp" %>  --%>
<!-- OFFER 댓글 목록 start  -->
											
					<!-- OFFER 댓글 목록 end  -->
												</div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="center_btn">
										<%
										if(session.getAttribute("UserId") != null && session.getAttribute("UserId").toString().equals(sdto.getId())){
										%>
										<button type="button" onclick="location.href='Edit.jsp?num=<%= sdto.getNum() %>';" class="btn btn-outline-dark">수정하기</button>
										<button type="button" onclick="skilldeletePost();" class="btn btn-outline-dark">삭제하기</button>
										<%
										}
										%>
										<button type="button" onclick="location.href='skill.jsp';" class="btn btn-outline-dark">목록 보기</button>
									</div>
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
               </form> 
        <!--**********************************
            Content body end
        ***********************************-->

<%@include file="../includes/footer.jsp"%>