<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-26
  Time: 오후 2:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script src="/resources/js/jquery.js"></script>
    <style>
        .container {
            max-width: 500px;
        }
    </style>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
    <div class="container">
        <h2 class="display-4 fw-normal">save.jsp</h2>
        <div class="py-5 text-center">
            <form action="/member/save" method="post" enctype="multipart/form-data">
                <input class="form-control mb-2" type="text" name="memberId" placeholder="아이디"><br>
                <input class="form-control mb-2" type="text" name="memberPassword" placeholder="비밀번호"><br>
                <input class="form-control mb-2" type="text" name="memberName" placeholder="이름"><br>
                <input class="form-control mb-2" type="text" name="memberEmail" placeholder="이메일"><br>
                <input class="form-control mb-2" type="text" name="memberMobile" placeholder="전화번호"><br>
                <textarea class="form-control mb-2" name="memberProfile" cols="30" rows="10"></textarea>
                첨부파일: <input type="file" name="memberFile">
                <input class="btn btn-primary" type="submit" value="가입">
            </form>
        </div>
    </div>

</body>
</html>
