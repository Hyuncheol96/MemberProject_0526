<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-31
  Time: 오후 4:28
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
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
<div class="container">
    <h2 class="display-4 fw-normal">회원정보 수정</h2>
    <div class="py-5 text-center">

        <form action="/member/update" method="post" name="updateForm">
            아이디: <input class="form-control mb-2" type="text" name="memberId" value="${sessionScope.loginMemberId}" readonly>
<%--            비밀번호: <input class="form-control mb-2" type="text" name="memberPassword" id="pwConfirm" placeholder="비밀번호를 입력하세요">--%>
            비밀번호: <input class="form-control mb-2" type="password" name="memberPassword" value="${updateMember.memberPassword}">
            이름: <input class="form-control mb-2" type="text" name="memberName" value="${updateMember.memberName}" readonly>
            Email: <input class="form-control mb-2" type="text" name="memberEmail" value="${updateMember.memberEmail}">
            Mobile: <input class="form-control mb-2" type="text" name="memberMobile" value="${updateMember.memberMobile}">
            <input class="btn btn-primary" type="submit" value="수정완료">
<%--            <input class="btn btn-primary" type="button" onclick="update()" value="정보수정"> &lt;%&ndash; 그냥 button을 사용하면 바로 보내버림 &ndash;%&gt;--%>
        </form>
    </div>
</div>
</body>
<script>
    const update = () => {
        console.log("update 함수호출");
        // 사용자가 입력한 비밀번호 값 가져오기
        const pwConfirm = document.getElementById("pwConfirm").value;
        // DB에서 가져온 비밀번호 가져오기
        const pwDB = '${updateMember.memberPassword}';
        console.log("pwConfirm: " + pwConfirm + ", pwDB: " + pwDB);
        // 비밀번호 일치하면 form태그에 입력한 내용을 컨트롤러로 요청.
        // 일치하지 않으면 alert으로 비밀번호 틀린다고 보여줌.
        if (pwConfirm == pwDB) {
            updateForm.submit(); // 해당 폼을 submit 하는 js 함수
        } else {
            alert("비밀번호가 틀립니다.");
        }
    }
</script>
</html>
