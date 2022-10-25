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
	else if(str == '반려'){
		var confirmed = confirm("게시물을 반려하겠습니까?");
		
	 	if(confirmed){
	 		var form = document.writeFrm;
	 		form.method = "post";
	 		form.action = "../../Process/offer/ReportDeleteProcess.jsp";
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

window.onload=function(){
	$.ajax({
	url: "/Project/MyLike.do",
	type: "POST",
	data: {
		id: '${UserId}',
		no: <%=odto.getNum()%>,
		code: ${3}
	},
		success: function (t) {
			 
	        if(t > 0){
        		$('#rec_update').attr('class','bi-hand-thumbs-up-fill');
        	}
        	else{
        		$('#rec_update').attr('class','bi-hand-thumbs-up');
           	}
        	
 } ,
 error : function(){
              alert('실패 ㅠㅠ');
  }
});
	$.ajax({
	url: "/Project/MyHate.do",
	type: "POST",
	data: {
		id: '${UserId}',
		no: <%=odto.getNum()%>,
		code: ${3}
	},
		success: function (t) {
			 
	        if(t > 0){
        		$('#rec_update2').attr('class','bi-hand-thumbs-down-fill');
        		
        	}
        	else{
        		$('#rec_update2').attr('class','bi-hand-thumbs-down');
           	}
        	
 } ,
 error : function(){
              alert('실패 ㅠㅠ');
  }
});
};

$(function(){
	// 추천버튼 클릭시(추천 추가 또는 추천 제거)
	$("#rec_update").click(function(){
		
		
		$.ajax({
			url: "/Project/RecUpdate.do",
            type: "POST",
            data: {
                no: <%=odto.getNum()%>,
                id: '${UserId}',
                code: ${3},
                like: ${1}
                
            },
            
            success: function (mycount) {
            	
		        recCount();
		        recCount2();
		        
		        if(mycount == 0){
	        		$('#rec_update').attr('class','bi-hand-thumbs-up-fill');
	        		$('#rec_update2').attr('class','bi-hand-thumbs-down');
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
                code: ${3},
                like: ${2}
            },
            success: function (mycount) {
            	recCount();
            	recCount2();
            	if(mycount == 0){
   	        		$('#rec_update2').attr('class','bi-hand-thumbs-down-fill');
   	        		$('#rec_update').attr('class','bi-hand-thumbs-up');
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
            code: ${3}
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
            code: ${3}
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


        <!--**********************************
            Content body start
        ***********************************-->
        <div class="content-body">

            <div class="container-fluid col-lg-8">
                    <div class="p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
                        <ol class="top tright">
                            <li class="breadcrumb-item"><a href="offer.jsp">오퍼</a></li>
                            <li class="breadcrumb-item active"><a class="a"><%=odto.getCate() %></a></li>
                        </ol>
                </div>
			<a href="javascript:reportFrm(<%=odto.getNum()%>,'<%=odto.getId()%>')" class="regray">
			<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABmJLR0QA/wD/AP+gvaeTAAABFElEQVQ4jZWTsW7CMBRF7zPphoQtJBbWDqgZUL+gUjcUMyBE24WxA4i/AfUnyshaCT4AsSDERzA4Yislr1OsOBAT3mbn+OReyQY8Y6RmIzX7GGFhFY2O1V7DBwPAoa6bsdITRxCr7hhMX+fg9OOTHOq6GZyxZMbU1PSnFYhTMAewBRAmD7+v6QFpFiTNgtJ18EcdAI8A1gDPHfux2mvEKvq4VSGW3aGpRSpdUx7gdj9kIbbXDhMQ0uZ7l90TeSipVAZFf0+I3vJ7FwJiLhQQ87tXwO1+COCpSACgxc8D57sj8MW3TK6GI/DFzzBODSsoET8dp4YVlIlv2UwNKygTP8PaGgQAs9Xe++KKZvLSoot7cO/8A38uU3NBh/JVAAAAAElFTkSuQmCC">
			신고하기
			</a>                
                <!-- row -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="ml-0 side ml-sm-0">
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="right-box-padding">
                                                <div class="read_content">
                                          		<form name="writeFrm">
                                                    <div class="media pt-3">
                                                        <div class="media-body">
                                                        	<input type="hidden" name="pnum" value =<%= odto.getNum() %>>
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
														}else if((UserId != null) && UserId.equals("admin")){
														%>
														 <!-- 삭제하기 -->        
                                                        <a href="javascript:deleditPost('삭제');" class="text-muted ml-3"><i
                                                                class="fa fa-trash"></i></a>
                                                                <!-- 반려 -->        
                                                        <a href="javascript:deleditPost('반려');" class="text-muted ml-3">
                                                        <i class="bi bi-arrow-clockwise"></i>
                                                        </a>
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
                                                    <div>
                                                    <p class="f"><i class=" bi bi-calendar-check"></i>&nbsp;<%=odto.getDday() %></p>
                                                    <p class="f"><i class="bi bi-person-plus-fill"></i>&nbsp;<%=odto.getMemNum() %></p>
                                                    </div>
                                                    <div class="b bcontent bread-content-body mart">
                                                        <p><%= odto.getContent() %></p>
                                                    </div>
                                                    <div class="mart">
                                                    	<a class="cate rounded"><%=odto.getCate()%></a>
                                                    </div>
                                                    </form>
                                                    <div class="allcomm">
                                                    <form name="offercomFrm" method="post" action="../../Process/offer/ComWriteProcess.jsp">
                                                        <h5 class="pt-3">COMMENT</h5>
                                                    <div class="form-group pt-3">
                                                    	<input type="hidden" name="pnum" value =<%=odto.getNum()%>>
                                                    	<%if(UserId != null) {%>
                                                        <textarea id="retext" class="btextarea w-100" name="comment" cols="30" rows="5"  placeholder= "<%=UserId %>님 댓글을 입력해주세요."></textarea>
                                                    	<%}else{%>
                                                        <textarea id="retext" class="btextarea w-100" name="comment" cols="30" rows="5"  placeholder="댓글을 쓰려면 로그인이 필요합니다."></textarea>
                                                   		<%} %>
                                                    </div>
                                                <div class="text-right">
                                                    <button class="btn btn-primary btn-sl-sm mb-5" type="submit">댓글 쓰기</button>
                                                </div>
                                                </form>	
                                                </div>
                                                <%
												offerBoardDAO cdao = new offerBoardDAO();
												int comcount = cdao.countCom(Integer.valueOf(odto.getNum()));
												cdao.close();
												%>
                                                <p class="b"><%=comcount %>개의 댓글</p>
                                                <div>
													<%
													if(comLists.isEmpty()){   // 댓글이 없을 때 
													} else {
														int virtualNum = 0;
														int countNum = 0;
														
														for (CommentDTO dto : comLists) {
															offerBoardDAO odao1 = new offerBoardDAO();
															List<CommentDTO> reLists = odao1.reselectView(onum, dto.getGroupNum());
															odao1.close();
													%>
												<div> <!-- 댓글이 있을 때 -->
														<div class="paper_list">
															<div class="py-4 comm">
																		<div class="b bid"><%= dto.getId()  %></div>
																		<div class="bpostdate"><%= dto.getDate() %></div>
																		<div style="font-size:16px;" class="b comment"><%= dto.getComment() %></div>
																		
															</div>
															<div>
																<form method="post" action="../../Process/offer/ComDelProcess.jsp">
																<input type="hidden"  name = "comidx" value=<%= dto.getIdx()%>>
																<input type="hidden"  name = "pnum" value=<%= dto.getPostNum()%>>
																<input type="hidden"  name = "id" value=<%= dto.getId()%>>
																<button class="pull-right btn btn-default text-muted">댓글 삭제</button>
																</form>
															</div>
																<div class="accordion-header" id="headingOne">
																<button class="accordion-button btn float" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne<%=dto.getIdx()%>" aria-expanded="true" aria-controls="collapseOne<%=dto.getIdx()%>"><i class="bi bi-arrow-return-right"></i>댓글 달기</button>
																</div>
                                    							<div class="accordion-collapse collapse clear" id="collapseOne<%=dto.getIdx()%>" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
                                    							&nbsp;
																<form name="replyFrm" method="post" action="../../Process/offer/replyProcess.jsp">
																<input type="hidden" name = "comidx" value=<%= dto.getIdx()%>>
																<input type="hidden"  name = "pnum" value=<%= dto.getPostNum()%>>
																<textarea style="width:90%;" name="reply" rows="1" ></textarea>
																<button class="pull-right btn btn-primary" type="submit">
																댓글 쓰기
																</button>
																</form>
																</div>
														</div>
												<div>
													<%
													if(reLists.isEmpty()){   // 대댓글이 없을 때 
													%>
													<a style="opacity: 0;">대댓글 없음</a>
													<%
													} else {
													%>
													<div class="accordion-header" id="headingTwo">
																<button class="accordion-button btn" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo<%=dto.getIdx()%>" aria-expanded="true" aria-controls="collapseTwo<%=dto.getIdx()%>"><i class="bi bi-chat-text-fill"></i>&nbsp;대댓글 열기</button>
													</div>
													<%	
														for (CommentDTO redto : reLists) {
													%>
													<div class="accordion-collapse collapse" id="collapseTwo<%=dto.getIdx()%>" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
													<div  class="recom"> <!-- 대댓글이 있을 때 -->
														<div class="paper_list recomm">
															<div class="py-4">
																		<div class="b bid"><%= redto.getId()  %></div>
																		<div class="bpostdate"><%= redto.getDate() %></div>
																		<div style="font-size:16px;" class="b comment"><%= redto.getComment() %></div>
															</div>
															<div>
																<form name="redelFrm" method="post" action="../../Process/offer/ReDelProcess.jsp">
																<input type="hidden"  name = "comidx" value=<%= redto.getIdx()%>>
																<input type="hidden"  name = "pnum" value=<%= redto.getPostNum()%>>
																<input type="hidden"  name = "id" value=<%= redto.getId()%>>
																<button class="btn btn-default text-muted">댓글 삭제</button>
																</form>
															</div>
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
 <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
<%@include file="../includes/footer.jsp"%>