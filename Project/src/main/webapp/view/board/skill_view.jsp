<%@page import="utils.CommentDTO"%>
<%@page import="java.util.List"%>
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
List<CommentDTO> comLists = sdao.comselectView(snum);
%>
<script>

function deleditPost(str){
	
	if(str == '수정'){
	 	var confirmed1 = confirm("게시물을 수정하겠습니까?");
		
	 	if(confirmed1){
	 		var form = document.writeFrm;
	 		form.method = "post";
	 		form.action = "skill_edit.jsp";
	 		form.submit();
	 	}
	}
	else if(str == '삭제'){
		var confirmed = confirm("게시물을 삭제하겠습니까?");
		
	 	if(confirmed){
	 		var form = document.writeFrm;
	 		form.method = "post";
	 		form.action = "../../Process/skill/DeleteProcess.jsp";
	 		form.submit();
	 	}
	}
}

function reportFrm(args1,args2) {
	var onum = args1;
	var tuid = args2;
	window.open("<c:url value='skill_report.jsp?num="
				+ onum + "&tuid="+tuid+"'/>", "Reporttext", "width=500, height=500");
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
                                                <form name="writeFrm">
                                                    <div class="media pt-3">
                                                        <div class="media-body">
                                                        	<input name="pnum" value =<%=sdto.getNum()%>>
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
                                                        <a href="javascript:deleditPost('수정')" class="text-muted ml-3"><i
                                                                class="bi bi-pencil-fill"></i></a>
                                                        <!-- 삭제하기 -->        
                                                        <a href="javascript:deleditPost('삭제');" class="text-muted ml-3"><i
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
                                                    	<img alt=""
											               style="height: auto; width: 100%"
											               src="../../Uploads/<%=sdto.getFilename()%>">
                                                    	<%= sdto.getCate() %>
                                                    </div>
                                                    </form>
                                                     <form name="offercomFrm" method="post" action="../../Process/skill/ComWriteProcess.jsp">
                                                        <hr>
                                                        <h5 class="pt-3">COMMENT</h5>
                                                    <div class="form-group pt-3">
                                                    	<input name="pnum" value =<%=sdto.getNum()%>>
                                                        <textarea class="btextarea w-100" name="comment" cols="30" rows="5"  placeholder="댓글을 쓰려면 로그인이 필요합니다."></textarea>
                                                    </div>
                                                <div class="text-right">
                                                    <button class="btn btn-primary btn-sl-sm mb-5" type="submit">Send</button>
                                                </div>
                                                </form>	
                                                <div>
													<%
													if(comLists.isEmpty()){   // 댓글이 없을 때 
													%>
														<li>
															<div align="center">
																등록된 댓글이 없습니다^^*
															</div>
														</li>
													<%
													} else {
														int virtualNum = 0;
														int countNum = 0;
														
														for (CommentDTO cdto : comLists) {
// 															virtualNum = totalCount - (((pageNum - 1) * pageSize) + countNum++);
															List<CommentDTO> reLists = sdao.reselectView(snum, cdto.getGroupNum());
													%>
												<div> <!-- 댓글이 있을 때 -->
														<div class="paper_list">
															<div class="py-4">
<!-- 															<div class="flex flex-col "> -->
<!-- 																<div class="flex items-center gap-x-3"> -->
																	<div class="flex flex-1 items-center gap-x-3"> id
																		<div><%= cdto.getId()  %></div>
																		<div><%= cdto.getComment() %></div>
																		<div><%= cdto.getDate() %></div>
																	</div>
<!-- 																</div>	 -->
<!-- 															</div> -->
															</div>
															<div>
																<form name="redelFrm" method="post" action="../../Process/skill/ComDelProcess.jsp">
																<input type="hidden"  name = "comidx" value=<%= cdto.getIdx()%>>
																<input type="hidden"  name = "pnum" value=<%= cdto.getPostNum()%>>
																<input type="hidden"  name = "id" value=<%= cdto.getId()%>>
																<button class="flex">댓글 삭제</button>
																</form>
															</div>
																<button id="Tbutton" class="flex bi bi-arrow-return-right">댓글 쓰기</button>
																
																<div id="divToggle" >
																<form name="replyFrm" method="post" action="../../Process/skill/replyProcess.jsp">
																
																<input type="hidden"  name = "comidx" value=<%= cdto.getIdx()%>>
																<input type="hidden"  name = "pnum" value=<%= cdto.getPostNum()%>>
																
																<textarea name="reply" rows="5" cols="50"></textarea>
																<button type="submit">댓글 쓰기</button>
																</form>
																</div>
														</div>
												<div>
													<%
													if(reLists.isEmpty()){   // 대댓글이 없을 때 
													%>
														<li>
															<div align="center">
																등록된 대댓글이 없습니다^^*
															</div>
														</li>
													<%
													} else {
// 														int virtualNum = 0;
// 														int countNum = 0;
														
														for (CommentDTO redto : reLists) {
// 															virtualNum = totalCount - (((pageNum - 1) * pageSize) + countNum++);
													%>
													<div  class="recom"> <!-- 대댓글이 있을 때 -->
														<div class="paper_list">
															<div class="py-4">
<!-- 															<div class="flex flex-col "> -->
<!-- 																<div class="flex items-center gap-x-3"> -->
																	<div class="flex flex-1 items-center gap-x-3"> id
																		<div"><%= redto.getId()  %></div>
																		<div><%= redto.getComment() %></div>
																		<div><%= redto.getDate() %></div>
																	</div>
<!-- 																</div>	 -->
<!-- 															</div> -->
															</div>
															<div>
																<form name="redelFrm" method="post" action="../../Process/skill/ComDelProcess.jsp">
																<input type="hidden" name = "comidx" value=<%= redto.getIdx()%>>
																<input type="hidden"  name = "pnum" value=<%= redto.getPostNum()%>>
																<input type="hidden"  name = "id" value=<%= redto.getId()%>>
																<button class="flex">댓글 삭제</button>
																</form>
															</div>
														</div>
													</div>
												</div>
											</div>	
												<%		}
													}
														}
													}
												%>
                                                </div>
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