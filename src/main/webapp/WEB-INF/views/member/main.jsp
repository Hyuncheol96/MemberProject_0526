<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-30
  Time: 오전 10:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>
    <h2>main.jsp</h2>
    로그인 회원 정보: ${loginMember} <br>
    세션에 담은 memberId: ${sessionScope.loginMemberId} <br>
    세션에 담은 id: ${sessionScope.loginId}<br>
    <a href="/header"> header로 이동</a> <br>
    <button class="btn btn-primary" onclick="location.href='/update-form'">수정</button> <br>
</body>
<script>
    const updateForm = () => {
        location.href = "/update-form";
    }
</script>
</html>
