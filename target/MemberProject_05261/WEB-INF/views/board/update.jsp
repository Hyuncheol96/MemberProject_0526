<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-30
  Time: 오전 11:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <style>
        .container {
            max-width: 500px;
        }
    </style>

</head>
<body>
    <div class="container">
        <h2 class="display-4 fw-normal">글수정 페이지</h2>
        <div class="py-5 text-center">
            <form action="/board/update" method="post" name="updateForm">
                글번호: <input class="form-control mb-2" type="text" name="id" value="${boardUpdate.id}" readonly>
                제목: <input class="form-control mb-2" type="text" name="boardTitle" value="${boardUpdate.boardTitle}">
                작성자: <input class="form-control mb-2" type="text" name="boardWriter" value="${boardUpdate.boardWriter}" readonly>
                내용<br><textarea name="boardContents" cols="60" rows="20">${boardUpdate.boardContents}</textarea><br>
                <input class="btn btn-primary" type="submit" value="수정완료">
            </form>
        </div>
    </div>
</body>

</html>
