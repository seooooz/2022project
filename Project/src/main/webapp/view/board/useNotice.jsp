<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="board4.SetBoardDAO"%>
<%@page import="board4.SetBoardDTO"%>
<%@page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<%@include file="../includes/header.jsp" %>
<%@include file="../includes/navbar.jsp" %>
<link href="../../resources/css/styles.css" rel="stylesheet" />
<link href="../../resources/css/style.css" rel="stylesheet">
<%

System.out.println("세팅방법 세션 아이디 : " + UserId);

ArrayList<SetBoardDTO> list1 = new ArrayList<SetBoardDTO>();
ArrayList<SetBoardDTO> list2 = new ArrayList<SetBoardDTO>();
SetBoardDAO dao = new SetBoardDAO();

list1 = dao.SetboardList(3);
list2 = dao.SetboardList(4);
dao.close();


%>
    <body>
    <div class="content-body">
        <main class="flex-shrink-0">
         
            <!-- Page Content-->
            <section class="py-5">
                <div class="container">
                	<%if(UserId == null) {%>
                	<%} else if(UserId.equals("admin")){ %>
     	            	<div class="pull-right">
							<input type="button" class="btn btn-primary" value="게시글관리"
							onclick="location.href='/view/board/userNotice_list.jsp'">
						</div>	
					<% }%>
                    <div class="text-center mb-5">
                        <h1 class="fw-bolder">이용 방법</h1>
                        
                    </div>
                    <div class="row gx-5">
                        <div>
                            <!-- FAQ Accordion 1-->
                            <h2 class="fw-bolder mb-3">글 작성 방법</h2>
                        <% for (SetBoardDTO dto : list1) {
                            	
                        %>
                            <div class="f accordion mb-5" id="accordionExample">
                                <div class="accordion-item">
                                    <h3 class="accordion-header" id="headingOne"><button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne<%=dto.getSet_num()%>" aria-expanded="true" aria-controls="collapseOne<%=dto.getSet_num()%>"><%=dto.getSet_title() %></button></h3>
                                    <div class="accordion-collapse collapse" id="collapseOne<%=dto.getSet_num()%>" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
                                        <div class="accordion-body">
                                            <%=dto.getSet_content() %>
                                        </div>
                                    </div>
                                </div>
                             
                         <% } %>
                            </div>
                              
                            <!-- FAQ Accordion 2-->
                            <h2 class="fw-bolder mb-3">OFFER</h2>
                             <% for (SetBoardDTO dto2 : list2) {
                            	
                            %>
                            <div class="f accordion mb-5 mb-xl-0" id="accordionExample2">
                                <div class="accordion-item">
                                    <h3 class="accordion-header" id="headingOne"><button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne<%=dto2.getSet_num() %>" aria-expanded="true" aria-controls="collapseOne<%=dto2.getSet_num() %>"><%=dto2.getSet_title() %></button></h3>
                                    <div class="accordion-collapse collapse" id="collapseOne<%=dto2.getSet_num() %>" aria-labelledby="headingOne" data-bs-parent="#accordionExample2">
                                        <div class="accordion-body">
                                          <%=dto2.getSet_content() %>
                                        </div>
                                    </div>
                                </div>
                                 <%} %>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </main>
        
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </div>
    </body>
</html>
<%@include file="../includes/footer.jsp" %>   