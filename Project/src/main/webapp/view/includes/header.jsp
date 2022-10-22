<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Focus - Bootstrap Admin Dashboard </title>
    
    <link rel="stylesheet" href="../../resources/css/main.css">
<!--     <link rel="stylesheet" href="../../resources/vendor/pickadate/themes/default.css"> -->
<!--     <link rel="stylesheet" href="../../resources/vendor/pickadate/themes/default.date.css"> -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="../../resources/images/favicon.png">
    <link rel="stylesheet" href="../../resources/vendor/owl-carousel/css/owl.carousel.min.css">
    <link rel="stylesheet" href="../../resources/vendor/owl-carousel/css/owl.theme.default.min.css">
    <link href="../../resources/vendor/jqvmap/css/jqvmap.min.css" rel="stylesheet">
    <link href="../../resources/css/style.css" rel="stylesheet">
    



</head>

<body>
<%
// 메인 페이지로 이동 했을때 세션에 값이 담겨있는지 체크
String UserId = null;
if(session.getAttribute("UserId") != null){
   UserId = (String)session.getAttribute("UserId");
}
%>

    <!--*******************
        Preloader start
    ********************-->
    <div id="preloader">
        <div class="sk-three-bounce">
            <div class="sk-child sk-bounce1"></div>
            <div class="sk-child sk-bounce2"></div>
            <div class="sk-child sk-bounce3"></div>
        </div>
    </div>
    <!--*******************
        Preloader end
    ********************-->


    <!--**********************************
        Main wrapper start
    ***********************************-->
    <div id="main-wrapper">

        <!--**********************************
            Nav header start
        ***********************************-->
        <div class="nav-header">
            <a href="../../view/board/index.jsp" class="brand-logo">
                <img class="logo-abbr" src="../../resources/images/logo.png" alt="">
<!--                 <img class="logo-compact" src="../../resources/images/4Dlogo.png" alt=""> -->
                <img style="width:100px;" class="brand-title" src="../../resources/images/4Dlogo.png" alt="">
<!--                 <img class="logi-title" src="../../resources/images/4Dlogo.png" alt=""> -->
            </a>

            <div class="nav-control">
                <div class="hamburger">
                    <span class="line"></span><span class="line"></span><span class="line"></span>
                </div>
            </div>
        </div>
        <!--**********************************
            Nav header end
        ***********************************-->
        
        <!--**********************************
            Header start // 검색, 프로필
        ***********************************-->
        <div class="header">
            <div class="header-content">
                <nav class="navbar navbar-expand">
                
                    <div class="collapse navbar-collapse justify-content-between">
                        <div class="header-left">
                            <div class="dropdown">
                                <span class="p-3 c-pointer" data-toggle="dropdown">
                                </span>
<!--                                     <i class="mdi mdi-magnify"></i> -->
<!--                                 <div class="dropdown-menu p-0 m-0"> -->
<!--                                     <form> -->
<!--                                         <input class="form-control" type="search" placeholder="Search" aria-label="Search"> -->
<!--                                     </form> -->
<!--                                 </div> -->
                            </div>
                        </div>

                        <ul class="navbar-nav header-right">
                            <!-- 우측 상단 아이콘(프로필) 시작 -->
                            <li class="active nav-item dropdown header-profile">
                                <a class="nav-link" href="#" role="button" data-toggle="dropdown">
                                    <i class="mdi mdi-account"></i>
                                </a>
                                
                                
                            <%
                               // 로그인 하지 않았을 때 보여지는 화면
                               if(UserId == null){
                            %>
                            
                            
                                <div class="dropdown-menu dropdown-menu-right">
  <!-- 드롭다운메뉴바)프로필 -->              <a href="/view/board/register.jsp" class="dropdown-item">
                                        <i class="icon-user"></i>
                                        <span class="ml-2">Sign Up </span>
                                    </a>
                                    <a href="/view/board/login.jsp" class="dropdown-item">
                                        <i class="icon-key"></i>
                                        <span class="ml-2">Login </span>
                                    </a>
                                </div>
                                <%
                               } else if(UserId.equals("admin")){
                            	%>
                            	<div class="dropdown-menu dropdown-menu-right">
  <!-- 드롭다운메뉴바)프로필 -->              <a href="/view/board/admin.jsp" class="dropdown-item">
                                        <i class="icon-user"></i>
                                        <span class="ml-2">admin </span>
                                    </a>
                                    <a href="/Process/LogoutProcess.jsp" class="dropdown-item">
                                        <i class="icon-key"></i>
                                        <span class="ml-2">Logout</span>

                                    </a>
                                </div>
                            	
                            	<%
                               }
                               else { // 로그인이 되어 있는 상태에서 보여주는 화면
                                %>
                                
                                <div class="dropdown-menu dropdown-menu-right">
  <!-- 드롭다운메뉴바)프로필 -->              <a href="/view/board/loginProfile.jsp" class="dropdown-item">
                                        <i class="icon-user"></i>
                                        <span class="ml-2">Profile </span>
                                    </a>
                                    <a href="../../resources/email-inbox.html" class="dropdown-item">
                                        <i class="icon-envelope-open"></i>
                                        <span class="ml-2">Inbox </span>
                                    </a>
                                    <a href="/Process/LogoutProcess.jsp" class="dropdown-item">
                                        <i class="icon-key"></i>
                                        <span class="ml-2">Logout</span>

                                    </a>
                                </div>
                            </li>
                           <!-- 우측 상단 아이콘(프로필) 끝 -->
                        <%
                               }
                        %>
                        </ul>
                    </div>
                </nav>
            </div>
        </div>
        <!--**********************************
            Header end ti-comment-alt
        ***********************************-->
        