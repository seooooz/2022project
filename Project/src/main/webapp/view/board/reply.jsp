<%@page import="board3.offerBoardDAO"%>
<%@page import="utils.JSFunction"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ page import="board3.CommentDTO" %>  
<%
// String idx = request.getParameter("comidx");
// System.out.println(idx);
offerBoardDAO dao = new offerBoardDAO();
CommentDTO dto = dao.comselectidx();
List<CommentDTO> comLists = dao.comselectView(onum);

%>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script>
function deletePost(){
	var confirmed = confirm("정말로 삭제하겟습니까?");
	if(confirmed){
		var form = document.writeFrm;
		form.method = "post";
// 		form.action = "DeleteProcess.jsp";
		form.action = "/board/comdelete.do";
		form.submit();
	}
}

// $(document).ready(function(){
	
// 	  textchange = false;
// 	  $('#Tbutton').click(function(){
// 	    if(textchange){
// 	      textchange = false;
// 	      $('#Tbutton').text('댓글 쓰기');
// 	    }else{
// 	      textchange = true;
// 	      $('#Tbutton').text('댓글 취소');
// 	    }
	    
// 	    $('#divToggle').toggle('500',function(){
// 	      $(this).css('color','white');
// // 	    $('#divToggle').remove();
// 	    });
// 	  })
// 	})


</script> 
<style>
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
          <!-- OFFER 댓글 목록 start  -->
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
// 													} else {
// 														int virtualNum = 0;
// 														int countNum = 0;
														
// 														for (offerBoardDTO dto : boardLists) {
// 															virtualNum = totalCount - (((pageNum - 1) * pageSize) + countNum++);
													%>
													<div> <!-- 댓글이 있을 때 -->
														<ul class="paper_list">
															<li class="py-4">
															<div class="flex flex-col ">
																<div class="flex items-center gap-x-3">
																	<div class="flex flex-1 items-center gap-x-3"> id
																		<div><%= cdto.getId()  %></div>
																		<div><%= cdto.getComment() %></div>
																		<div><%= cdto.getDate() %></div>
																	</div>
																</div>	
															</div>
															</li>
															<li>
																<button id="Tbutton" class="bi bi-arrow-return-right">댓글 쓰기</button>
																<div id="divToggle" style="display:none">
																<form name="replyFrm" method="post" action="../../Process/offer/replyProcess.jsp">
																
																<input name = "comidx" value=<%= cdto.getIdx()%>>
																<input name = "pnum" value=<%= cdto.getPostNum()%>>
																
																<textarea name="reply" rows="5" cols="50"></textarea>
																<button type="submit">댓글 쓰기</button>
																</form>
																</div>
															</li>
														</ul>
													</div>
												</div>	
<%-- 																	<%} --%>
// 							}
								%>
												
					<!-- OFFER 댓글 목록 end  -->