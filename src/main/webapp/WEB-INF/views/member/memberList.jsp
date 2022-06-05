<%--
  Created by IntelliJ IDEA.
  User: khc_9
  Date: 2022-06-02
  Time: 오후 3:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html  xmlns:th="http://www.thymeleaf.org"> <%-- th를 쓰기 위함. --%>
<head>
    <title>admin.jsp</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script src="/resources/js/jquery.js"></script>
</head>
<style>
    .table {
        border: 1px solid;
        width: 1100px;
    }
    thead {
        border-bottom: 1px solid gray;
    }
    .member {
        border: 1px solid;
    }
    .member:hover {
        transition: all 0.3s;
        background: #DED369;
    }
    #search {
        border: 1px solid lightgray;
    }
    /*.container {*/
    /*    display: flex;*/
    /*    justify-content: center;*/
    /*}*/
    /*.memberCenter {*/
    /*    text-align: center;*/
    /*}*/
</style>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
<div id="comment-list">
    <table class="table">
        <tr>
            <th>번호</th>
            <th>아이디</th>
            <th>이름</th>
            <th>이메일</th>
            <th>전화번호</th>
            <th>삭제</th>

        </tr>
        <c:forEach items="${memberList}" var="member">
            <tr>
                <td>${member.id}</td>
                <td>${member.memberId}</td>
                <td>${member.memberName}</td>
                <td>${member.memberEmail}</td>
                <td>${member.memberMobile}</td>

                <td><a href="/member/delete?id=${member.id}">삭제</a></td>
                    <%--                <td><a href="/delete?id=${member.id}">삭제</a></td>--%>
            </tr>
        </c:forEach>
    </table>
</div>

</body>

</html>
