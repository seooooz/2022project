<%@page import="java.net.URLEncoder"%>
<%@page import="utils.CommentDTO"%>
<%@page import="java.util.List"%>
<%@page import="board1.skillBoardDTO"%>
<%@page import="board1.skillBoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../includes/header.jsp"%>
<%@include file="../includes/navbar.jsp"%>
<%
String snum = request.getParameter("num");

skillBoardDAO sdao = new skillBoardDAO();
sdao.updateVisitCount(snum);
skillBoardDTO sdto = sdao.selectView(snum);
List<CommentDTO> comLists = sdao.comselectView(snum);
sdao.close();
%>

<script src="http://code.jquery.com/jquery-latest.js"></script>
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
function redeletePost(str){
	
	if(str == '대댓삭제'){
	 		var form = document.redelFrm;
	 		form.method = "post";
	 		form.action = "../../Process/skill/ComDelProcess.jsp";
	 		form.submit();
}
}

function reportFrm(args1,args2) {
	var onum = args1;
	var tuid = args2;
	window.open("<c:url value='skill_report.jsp?num="
				+ onum + "&tuid="+tuid+"'/>", "Reporttext", "width=500, height=500");
}

window.onload=function(){
	$.ajax({
	url: "/Project/MyLike.do",
	type: "POST",
	data: {
		id: '${UserId}',
		no: <%=sdto.getNum()%>,
		code: ${1}
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
		no: <%=sdto.getNum()%>,
		code: ${1}
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
                no: <%=sdto.getNum()%>,
                id: '${UserId}',
                code: ${1},
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
                no: <%=sdto.getNum()%>,
                id: '${UserId}',
                code: ${1},
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
            no: <%=sdto.getNum()%>,
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
            no: <%=sdto.getNum()%>,
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

        <!--**********************************
            Content body start
        ***********************************-->
        <div class="content-body">

            <div class="container-fluid col-lg-8">
                    <div class="p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
                        <ol class="top tright">
                            <li class="breadcrumb-item"><a href="career.jsp">기술</a></li>
                            <li class="breadcrumb-item active"><a class="a"><%=sdto.getCate() %></a></li>
                        </ol>
                </div>
			<a href="javascript:reportFrm(<%=sdto.getNum()%>,'<%=sdto.getId()%>')" class="title_a">신고하기</a>                
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
                                                        	<input type="hidden" name="pnum" value =<%=sdto.getNum()%>>
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
                                                            <p class="bpostdate"><%= sdto.getPostdate() %></p>
                                                            
                                                        </div>
                                                    </div>
                                                    <div class="b bcontent bread-content-body mart">
                                                        <p><%= sdto.getContent() %></p>
                                                    </div>
                                                    <div>
                                                    	<%if(sdto.getFilesize() > 0){ %>
                                                    	<a href="../../Process/DownloadProcess.jsp?fname=<%=URLEncoder.encode(sdto.getFilename(), "UTF-8")%>"><%=sdto.getFilename() %></a>
                                                    	<%}else{ }%>
                                                    </div>
                                                    <div class="mart">
                                                    	<a class="cate rounded"><%=sdto.getCate()%></a>
                                                    </div>
                                                    </form>
                                                    <div class="allcomm">
						    
                                                    <form name="offercomFrm" method="post" action="../../Process/skill/ComWriteProcess.jsp">
                                                        <h5 class="pt-3">COMMENT</h5>
                                                    <div class="form-group pt-3">
                                                    	<input type="hidden" name="pnum" value =<%=sdto.getNum()%>>
                                                        
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
												skillBoardDAO cdao = new skillBoardDAO();
												int comcount = cdao.countCom(Integer.valueOf(sdto.getNum()));
												cdao.close();
												%>
                                                <p class="b"><%=comcount %>개의 댓글</p>
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
															skillBoardDAO dao1 = new skillBoardDAO();
															List<CommentDTO> reLists = dao1.reselectView(snum, cdto.getGroupNum());
															dao1.close();
													%>
												<div> <!-- 댓글이 있을 때 -->
												<hr>
														<div class="paper_list">
															<div class="py-4 comm">
																		<div class="b bid"><%= cdto.getId()  %></div>
																		<div class="bpostdate"><%= cdto.getDate() %></div>
																		<div style="font-size:16px;" class="b comment"><%= cdto.getComment() %></div>
																		
															</div>
															<div>
																<form name="redelFrm" method="post" action="../../Process/skill/ComDelProcess.jsp">
																<input type="hidden"  name = "ccomidx" value=<%= cdto.getIdx()%>>
																<input type="hidden"  name = "cnum" value=<%= cdto.getPostNum()%>>
																<input type="hidden"  name = "cid" value=<%= cdto.getId()%>>
																<button class="pull-right btn btn-default text-muted">댓글 삭제</button>
																</form>
															</div>
																<div class="accordion-header" id="headingOne">
																<button class="accordion-button btn float" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne<%=cdto.getIdx()%>" aria-expanded="true" aria-controls="collapseOne<%=cdto.getIdx()%>"><i class="bi bi-arrow-return-right"></i>댓글 달기</button>
																</div>
                                    							<div class="accordion-collapse collapse clear" id="collapseOne<%=cdto.getIdx()%>" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
                                    							&nbsp;
																<form name="replyFrm" method="post" action="../../Process/skill/replyProcess.jsp">
																<input type="hidden" name = "comidx" value=<%= cdto.getIdx()%>>
																<input type="hidden"  name = "pnum" value=<%= cdto.getPostNum()%>>
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
														<button class="accordion-button btn" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo<%=cdto.getIdx()%>" aria-expanded="true" aria-controls="collapseTwo<%=cdto.getIdx()%>">
														<i class="bi bi-chat-text-fill"></i>&nbsp;대댓글 열기</button>
													</div>
													
													<%	
														for (CommentDTO redto : reLists) {
														%>
													<div class="accordion-collapse collapse" id="collapseTwo<%=cdto.getIdx()%>" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
													<div  class="recom"> <!-- 대댓글이 있을 때 -->
														<div class="paper_list recomm">
															<div class="py-4">
																		<div class="b bid"><%= redto.getId()  %></div>
																		<div class="bpostdate"><%= redto.getDate() %></div>
																		<div style="font-size:16px;" class="b comment"><%= redto.getComment() %></div>
															</div>
															<div>
																<form name="redelFrm" method="post" action="../../Process/skill/ReDelProcess.jsp">
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
																									
													<%
														}	
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
               </div>
        <!--**********************************
            Content body end
        ***********************************-->
 <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
<%@include file="../includes/footer.jsp"%>