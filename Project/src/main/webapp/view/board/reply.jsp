<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script>
$('.faq_list__item').click(function() {
    $(this).children('.faq_content').slideToggle();
 })

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

 $('#faq_list__item').click(function() {
      $(this).children('.faq_content').slideToggle();
   })

</script> 
          <!-- OFFER 댓글 목록 start  -->
												<c:choose>
													<c:when test="${ empty comLists }"> <!-- 댓글이 없을 때 -->
														<li>
															<div align="center">
																등록된 댓글이 없습니다^^*
															</div>
														</li>
													</c:when>
													<c:otherwise> <!-- 댓글이 있을 때 -->
													<c:forEach items = "${ comLists }" var="com" varStatus="loop">
														<ul class="paper_list">
															<li class="py-4">
															<div class="flex flex-col ">
																<div class="flex items-center gap-x-3">
																	<div class="flex flex-1 items-center gap-x-3"> id
																		<div>${ com.id }</div>
																		<div>${ com.comment }</div>
																		<div>${ com.date }</div>
																	</div>
																</div>	
															</div>
															</li>
															<li>
																<button id=" faq_list__item" class="bi bi-arrow-return-right">댓글 쓰기</button>
																<div id="divToggle" >
																<form name="replyFrm" method="post" action="/board/reply.do">
																
																<input name = "order" value=${ com.order }>
																<input name = "comidx" value=${ com.idx }>
																<input name = "pnum" value=${ com.postNum }>
																
																<textarea class="faq_content"  name="reply" rows="5" cols="50"></textarea>
																<button type="submit">댓글 쓰기</button>
																</form>
																</div>
															</li>
														</ul>
													</c:forEach>
													</c:otherwise>
												</c:choose>	
												
					<!-- OFFER 댓글 목록 end  -->