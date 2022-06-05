<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-26
  Time: 오후 2:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
</head>
<body>
    <header>
        <div class="container mt-3"> <%-- mt-3 = 자기 기준으로 위를 3만큼 띄움 --%>
<%--        <a href="/member/login-form">로그인</a>--%>
        <c:choose>
            <c:when test="${sessionScope.loginId == null}">
                <a href="/">Home</a>
                <a href="/member/login-form">로그인</a>
                <a href="/member/save-form">회원가입</a>
            </c:when>
            <c:when test="${sessionScope.loginMemberId == 'admin'}">
                <a href="/member/admin-form">관리자페이지</a>
                <a href="/member/logout-form">로그아웃</a>
                <a href="/member/update-form">마이페이지</a>
            </c:when>
            <c:otherwise>
                <a href="/member/logout-form">로그아웃</a>
                <a href="/member/update-form">마이페이지</a>
            </c:otherwise>
        </c:choose>
        <a href="/board/paging">글목록</a>
        </div>
    </header>
</body>
</html>
