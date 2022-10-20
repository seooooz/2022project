<%@page import="utils.JSFunction"%>
<%@page import="java.util.List"%>
<%@page import="utils.CommentDTO"%>
<%@page import="board2.careerBoardDTO"%>
<%@page import="board2.careerBoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>
<%@include file="../includes/navbar.jsp"%> 
<%
String cnum = request.getParameter("num");

careerBoardDAO dao = new careerBoardDAO();
dao.updateVisitCount(cnum);
careerBoardDTO dto = dao.selectView(cnum);
List<CommentDTO> ccomLists = dao.comselectView(cnum);
dao.close();
%>
<script src="http://code.jquery.com/jquery-latest.js"></script>

<script>
function deleditPost(str){
	
	if(str == '수정'){
	 	var confirmed1 = confirm("게시물을 수정하겠습니까?");
		
	 	if(confirmed1){
	 		var form = document.writeFrm;
	 		form.method = "post";
	 		form.action = "career_edit.jsp";
	 		form.submit();
	 	}
	}
	else if(str == '삭제'){
		var confirmed = confirm("게시물을 삭제하겠습니까?");
		
	 	if(confirmed){
	 		var form = document.writeFrm;
	 		form.method = "post";
	 		form.action = "../../Process/career/DeleteProcess.jsp";
	 		form.submit();
	 	}
	 	
	}
	else if(str == '대댓삭제'){
	 		var form = document.redelFrm;
	 		form.method = "post";
	 		form.action = "../../Process/career/ComDelProcess.jsp";
	 		form.submit();
}
}

function reportFrm(args1,args2) {
	var onum = args1;
	var tuid = args2;
	window.open("<c:url value='career_report.jsp?num="
				+ onum + "&tuid="+tuid+"'/>", "Reporttext", "width=500, height=500");
}

window.onload=function(){
	$.ajax({
	url: "/Project/MyLike.do",
	type: "POST",
	data: {
		id: '${UserId}',
		no: <%=dto.getNum()%>,
		code: ${2}
	},
		success: function (t) {
			 
	        if(t > 0){
        		$('#rec_update').attr('class','bi-hand-thumbs-up-fill');
        	}else{
        		$('#rec_update2').attr('class','bi-hand-thumbs-down-fill');
        		
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
                no: <%=dto.getNum()%>,
                id: '${UserId}',
                code: ${2},
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
                no: <%=dto.getNum()%>,
                id: '${UserId}',
                code: ${2},
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
            no: <%=dto.getNum()%>,
            code: ${2}
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
            no: <%=dto.getNum()%>,
            code: ${2}
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
.side{
margin-left: 1.5rem !important;
margin-right: 1.5rem !important;
}
.f{
color : black !important;
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
color: rgb(107 114 128);
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
.comm{
margin-left : 1rem;
margin-right : 1rem;
}
.recomm{
margin-left : 2rem;
margin-right : 2rem;
}

.allcomm{
margin: 5rem 0 0 0;
}

.float{
float: left;
}

.clear{
clear: both;
}

.line{
   border-bottom: 1px solid #dee2e6;
}
.rounded {
 border-radius: 39px !important;
}
.cate{
 color : black !important;
 background-color: rgb(241 241 241);
 padding : 3px 8px;
}
.mart{
 margin-top : 4rem;
}

.top{
    display: flex;
 }
</style>
<!-- <form name="writeFrm"> -->
        <!--**********************************
            Content body start
        ***********************************-->
        <div class="content-body">

            <div class="container-fluid col-lg-8">
                    <div class="p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
                        <ol class="top tright">
                            <li class="breadcrumb-item"><a class="f" href="career.jsp">커리어</a></li>
                            <li class="breadcrumb-item active"><a class="f" href="javascript:void(0)"><%=dto.getCate() %></a></li>
                        </ol>
                </div>
			<a href="javascript:reportFrm(<%=dto.getNum()%>,'<%=dto.getId()%>')" class="title_a">신고하기</a>                
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
                                                        	<input type="hidden" name="pnum" value =<%= dto.getNum() %>>
                                                            <h3 class="btitle my-1"><%= dto.getTitle() %></h3>
                                                        </div>
                                                        
                                                        <div>
                                                        	<!-- 목록으로 돌아가기 -->
                                                        <a href="career.jsp" class="text-muted "><i
                                                                class="fa fa-reply"></i> </a>
                                                        <%
														if(session.getAttribute("UserId") != null && session.getAttribute("UserId").toString().equals(dto.getId())){
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
                                                        <span class="pull-right" style="margin-left: 5px;"><%= dto.getVisitcount() %></span>
                                                        	<i class="bi bi-eye pull-right"></i>
                                                        	<img class="pf rounded-circle pull-left" alt="image" src="../../resources/images/pf.png">
                                                            <h5 class="bid"><%= dto.getId() %></h5>
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
                                                            <p class="bpostdate"><%= dto.getPostdate() %></p>
                                                        </div>
                                                    </div>
                                                    <div class="b bcontent bread-content-body mart">
                                                        <p><%=dto.getContent() %></p>
                                                    </div>
                                                    <div>
                                                    	<img alt=""
											               style="height: auto; width: 100%"
											               src="../../Uploads/<%=dto.getFilename()%>">
                                                    </div>
                                                    <div class="mart">
                                                    	<a class="cate rounded"><%=dto.getCate()%></a>
                                                    </div>
                                                    </form>
                                                    <div class="allcomm">
                                                    <form name="offercomFrm" method="post" action="../../Process/career/ComWriteProcess.jsp">
                                                        <h5 class="pt-3">COMMENT</h5>
                                                    <div class="form-group pt-3">
                                                    	<input type="hidden" name="pnum" value =<%=dto.getNum()%>>
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
												careerBoardDAO cdao = new careerBoardDAO();
												int comcount = cdao.countCom(Integer.valueOf(dto.getNum()));
												cdao.close();
												%>
                                                <p class="b"><%=comcount %>개의 댓글</p>
                                                <div>
													<%
													if(ccomLists.isEmpty()){   // 댓글이 없을 때 
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
														
														for (CommentDTO cdto : ccomLists) {
// 															virtualNum = totalCount - (((pageNum - 1) * pageSize) + countNum++);
															careerBoardDAO dao1 = new careerBoardDAO();
															List<CommentDTO> reLists = dao1.reselectView(cnum, cdto.getGroupNum());
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
																<form method="post" action="../../Process/career/ComDelProcess.jsp">
																<input type="hidden"  name = "comidx" value=<%= cdto.getIdx()%>>
																<input type="hidden"  name = "pnum" value=<%= cdto.getPostNum()%>>
																<input type="hidden"  name = "id" value=<%= cdto.getId()%>>
																<button class="pull-right btn btn-default text-muted">댓글 삭제</button>
																</form>
															</div>
																<div class="accordion-header" id="headingOne">
																<button class="accordion-button btn float" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne<%=cdto.getIdx()%>" aria-expanded="true" aria-controls="collapseOne<%=cdto.getIdx()%>"><i class="bi bi-arrow-return-right"></i>댓글 달기</button>
																</div>
                                    							<div class="accordion-collapse collapse clear" id="collapseOne<%=cdto.getIdx()%>" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
                                    							&nbsp;
																<form name="replyFrm" method="post" action="../../Process/career/replyProcess.jsp">
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
																<button class="accordion-button btn" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo<%=cdto.getIdx()%>" aria-expanded="true" aria-controls="collapseTwo<%=cdto.getIdx()%>"><i class="bi bi-chat-text-fill"></i>&nbsp;대댓글 열기</button>
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
																<form name="redelFrm">
																<input type="hidden" name = "comidx" value=<%= redto.getIdx()%>>
																<input type="hidden"  name = "pnum" value=<%= redto.getPostNum()%>>
																<input type="hidden"  name = "id" value=<%= redto.getId()%>>
																<a href="javascript:deleditPost('대댓삭제');">댓글 삭제</a>
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