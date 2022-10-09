<%@page import="utils.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
session.invalidate();
JSFunction.alertLocation(response, "로그아웃 하셨습니다.", "/view/board/index.jsp");
%>
