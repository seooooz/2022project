<%@page import="utils.CommentDTO"%>
<%@page import="java.util.List"%>
<%@page import="board3.offerBoardDAO"%>
<%@page import="board3.offerBoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@include file="../includes/header.jsp"%>
<%@include file="../includes/navbar.jsp"%>
<%
	String onum = request.getParameter("onum");
	System.out.println(onum);
	//offerboard 게시물 불러오기
	offerBoardDAO odao = new offerBoardDAO();
	odao.updateVisitCount(onum);
	offerBoardDTO odto = odao.selectView(onum);
	List<CommentDTO> comLists = odao.comselectView(onum);
	odao.close();	
%>    
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
function deleditPost(str){
	
	if(str == '수정'){
	 	var confirmed1 = confirm("게시물을 수정하겠습니까?");
		
	 	if(confirmed1){
	 		var form = document.writeFrm;
	 		form.method = "post";
	 		form.action = "offer_edit.jsp";
	 		form.submit();
	 	}
	}
	else if(str == '삭제'){
		var confirmed = confirm("게시물을 삭제하겠습니까?");
		
	 	if(confirmed){
	 		var form = document.writeFrm;
	 		form.method = "post";
	 		form.action = "../../Process/offer/DeleteProcess.jsp";
	 		form.submit();
	 	}
	}
}
	
function reportFrm(args1,args2) {
	var onum = args1;
	var tuid = args2;
	window.open("<c:url value='offer_report.jsp?onum="
				+ onum + "&tuid="+tuid+"'/>", "Reporttext", "width=500, height=500");
}

$(function(){
	// 추천버튼 클릭시(추천 추가 또는 추천 제거)
	$("#rec_update").click(function(){
		
		
		$.ajax({
			url: "/Project/RecUpdate.do",
            type: "POST",
            data: {
                no: <%=odto.getNum()%>,
                id: '${UserId}',
                code: ${1},
                like: ${1}
                
            },
            
            success: function (mycount) {
            	
		        recCount();
		        recCount2();
		        
		        if(mycount == 0){
	        		$('#rec_update').attr('class','bi-hand-thumbs-up-fill');
	        	}else{
	        		$('#rec_update').attr('class','bi-hand-thumbs-up');
	        		
	        	}
 
            },
		})
		
	})
	
	$("#rec_update2").click(function(){
		
			
		$.ajax({
			url: "/Project/RecUpdate.do",
            type: "POST",
            data: {
                no: <%=odto.getNum()%>,
                id: '${UserId}',
                code: ${1},
                like: ${2}
            },
            success: function (mycount) {
            	recCount();
            	recCount2();
            	if(mycount == 0){
   	        		$('#rec_update2').attr('class','bi-hand-thumbs-down-fill');
   	        	}else{
   	        		$('#rec_update2').attr('class','bi-hand-thumbs-down');
   	        		
   	        	}
            },
		})
		
	})


// 게시글 추천수
function recCount() {
	$.ajax({
		url: "/Project/RecLikeCount.do",
        type: "POST",
        data: {
            no: <%=odto.getNum()%>,
            code: ${1}
        },
        success: function (count) {
        	
        	$(".rec_count1").html(count);
        	
        },
      
	})
	
};

function recCount2() {
	$.ajax({
		url: "/Project/RecHateCount.do",
        type: "POST",
        data: {
        	id: '${UserId}',
            no: <%=odto.getNum()%>,
            code: ${1}
        },
        success: function (count2) {
        	$(".rec_count2").html(count2);
        	
        },
      
	})
};
recCount();
recCount2();// 처음 시작했을 때 실행되도록 해당 함수 호출
})
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

.recom{
 margin-left: 5rem;
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
                <div>
			<a href="javascript:reportFrm(<%=odto.getNum()%>,'<%=odto.getId()%>')" class="title_a">신고하기</a>
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
                                                        	<input name="pnum" value =<%= odto.getNum() %>>
                                                             <h3 class="btitle my-1"><%= odto.getTitle() %></h3>
                                                        </div>
                                                          <div>
                                                        	<!-- 목록으로 돌아가기 -->
                                                        <a href="offer.jsp" class="text-muted "><i
                                                                class="fa fa-reply"></i> </a>
                                                        <%
														if(session.getAttribute("UserId") != null && session.getAttribute("UserId").toString().equals(odto.getId())){
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
                                                        <span class="pull-right" style="margin-left: 5px;"><%= odto.getVisitcount() %></span>
                                                        	<i class="bi bi-eye pull-right"></i>
                                                        	<img class="pf rounded-circle pull-left" alt="image" src="../../resources/images/pf.png">
                                                            <h5 class="bid"><%= odto.getId() %></h5>
                                                            <!-- 좋아요 싫어요 버튼 시작 -->
                                                            <div class="pull-right">
                                                            	<c:if test="${UserId != null}">

																<i  id="rec_update" class="bi bi-hand-thumbs-up"></i>
																&nbsp;<span class="rec_count1"></span>
																
															
																<i id="rec_update2" class="bi bi-hand-thumbs-down"></i>
																&nbsp;<span class="rec_count2"></span>
																</c:if>
															</div>
															<!-- 좋아요 싫어요 버튼 끝 -->
                                                            <p class="bpostdate"><%= odto.getPostdate() %></p>
                                                        </div>
                                                    </div>
                                                    <div class="b bcontent bread-content-body">
                                                        <p><%= odto.getContent() %></p>
                                                    </div>
                                                    <div>
                                                    	<%= odto.getCate() %>
                                                    </div>
                                                </form> 
                                                 <form name="offercomFrm" method="post" action="../../Process/offer/ComWriteProcess.jsp">
                                                    	<input name="pnum" value =<%= odto.getNum() %>>
                                                        <hr>
                                                        <h5 class="pt-3">COMMENT</h5>
                                                    <div class="form-group pt-3">
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
														
														for (CommentDTO dto : comLists) {
// 															virtualNum = totalCount - (((pageNum - 1) * pageSize) + countNum++);
															offerBoardDAO odao1 = new offerBoardDAO();
															List<CommentDTO> reLists = odao1.reselectView(onum, dto.getGroupNum());
															odao1.close();
													%>
												<div> <!-- 댓글이 있을 때 -->
														<div class="paper_list">
															<div class="py-4">
<!-- 															<div class="flex flex-col "> -->
<!-- 																<div class="flex items-center gap-x-3"> -->
																	<div class="flex flex-1 items-center gap-x-3"> id
																		<div><%= dto.getId()  %></div>
																		<div><%= dto.getComment() %></div>
																		<div><%= dto.getDate() %></div>
																	</div>
<!-- 																</div>	 -->
<!-- 															</div> -->
															</div>
															<div>
																<form name="redelFrm" method="post" action="../../Process/offer/ComDelProcess.jsp">
																<input type="hidden"  name = "comidx" value=<%= dto.getIdx()%>>
																<input type="hidden"  name = "pnum" value=<%= dto.getPostNum()%>>
																<input type="hidden"  name = "id" value=<%= dto.getId()%>>
																<button class="flex">댓글 삭제</button>
																</form>
															</div>
																<button id="Tbutton" class="flex bi bi-arrow-return-right">댓글 쓰기</button>
																
																<div id="divToggle" >
																<form name="replyFrm" method="post" action="../../Process/offer/replyProcess.jsp">
																
																<input type="hidden"  name = "comidx" value=<%= dto.getIdx()%>>
																<input type="hidden"  name = "pnum" value=<%= dto.getPostNum()%>>
																
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
																<form name="redelFrm" method="post" action="../../Process/offer/ComDelProcess.jsp">
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
            								
<%-- <%@include file="reply.jsp" %>  --%>
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