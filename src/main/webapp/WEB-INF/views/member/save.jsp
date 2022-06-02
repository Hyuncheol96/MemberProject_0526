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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
    <style>
        .container {
            max-width: 500px;
        }
    </style>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
    <div class="container">
        <h2 class="display-4 fw-normal">회원가입</h2>
        <div class="py-5 ">
            <form action="/member/save" method="post" enctype="multipart/form-data">
                <i id="idIcon-result" class="bi bi-tags-fill"></i>아이디<br><input class="form-control mb-2" type="text" onblur="duplicateCheck()" id="memberId" name="memberId" placeholder="ID를 만들어주세요 띄어쓰기 없이 영/숫자 6-10자"><p id="check-result"></p>
                <p id="memberId-result"></p>
                <span id="dup-check-result"></span><br>
                <i id="pwIcon-result" class="bi bi-tags-fill"></i>비밀번호<br><input class="form-control mb-2" type="text" onblur="memberPassword()" id="memberPassword" name="memberPassword" placeholder="비밀번호 입력 8-15자의 영문 대소문자, 숫자, 특수문자(-_!#$) 조합">
                <p id="memberPassword-result"></p>
                <i id="pwcIcon-result" class="bi bi-tags-fill"></i>비밀번호 확인<br><input type="password" size="80" id="pwCheck" onblur="memberPwCk()" id="memberPwCk" class="form-control mb-2"  placeholder="위의 비밀번호를 다시 입력해주세요.">
                <p id="memberPwCk-result"></p>
                이름<input class="form-control mb-2" type="text" onblur="memberName()" name="memberName" placeholder="이름">
                Email<input class="form-control mb-2" type="text" onblur="memberEmail()" name="memberEmail" placeholder="이메일">
                전화번호<input class="form-control mb-2" type="text" onblur="memberMobile()" name="memberMobile" placeholder="전화번호">
                첨부파일: <input type="file" name="memberFile">
                <input class="btn btn-primary" type="submit" value="가입">
            </form>
        </div>
    </div>
</body>
<script>
    const duplicateCheck = () => {
        const memberId = document.getElementById("memberId").value;
        const checkResult = document.getElementById("dup-check-result");
        $.ajax({
            type: "post", // http request method
            url: "/member/duplicate-check", // 요청주소 (컨트롤러 주소값)
            data: {"memberId": memberId}, // 전송하는 파라미터
            dataType: "text", // 리턴받을 데이터 형식
            success: function (result) {
                if (result == "ok") {
                    // 사용 가능한 아이디
                    checkResult.innerHTML = "사용가능한 아이디 입니다.";
                    checkResult.style.color = "green";
                } else {
                    // 이미 사용중인 아이디
                    checkResult.innerHTML = "이미 사용중인 아이디 입니다.";
                    checkResult.style.color = "red";
                }
                // alert("ajax 성공");
            },
            error: function () {
                alert("오타체크");
            }
        });

    }
</script>
<script>
    function duplicateCheck() {
        console.log("함수호출됨");
        const memberId = document.getElementById("memberId").value;
        const exp = /^[a-z\d]{6,10}$/;
        console.log(`memberId: ${memberId}`);
        console.log(memberId.length);
        const memberIdResult = document.getElementById("memberId-result");
        const idIconResult = document.getElementById("idIcon-result");

        if(memberId.match(exp)) {
            memberIdResult.innerHTML = "사용 가능합니다."
            memberIdResult.style.color = "#2183d3";
            idIconResult.style.color = "#2183d3";
        } else {
            memberIdResult.innerHTML = "영/숫자 6-10자 조합으로 입력해주세요.";
            memberIdResult.style.color = "red";
            idIconResult.style.color = "red";
        }
    }


        function memberPassword() {
            const memberPw = document.getElementById("memberPassword").value;
            const exp = /^(?=.*[a-z])(?=.*\d)(?=.*[-_!#$])[A-Za-z\d-_!#$]{8,15}$/;
            console.log(`memberPssword: ${memberPassword}`);
            console.log(memberPw.length);
            const pwResult = document.getElementById("memberPassword-result");
            const pwIconResult = document.getElementById("pwIcon-result");

            if(memberPassword.match(exp)) {
                pwResult.innerHTML = "사용 가능합니다."
                pwResult.style.color = "#2183d3";
                pwIconResult.style.color = "#2183d3";
            } else {
                pwResult.innerHTML = "띄어쓰기 없는 8~15자의 영문 대/소문자, 숫자, 특수문자(-_!#$) 조합으로 입력해주세요.";
                pwResult.style.color = "red";
                pwIconResult.style.color = "red";
            }
    }
    function memberPwCk() {
        const memberPw = document.getElementById("memberPw").value;
        const memberPwCk = document.getElementById("memberPwCk").value;
        console.log(`memberPwCk: ${memberPassword}`);
        console.log(memberPwCk.length);
        const memberPwCkResult = document.getElementById("memberPwCk-result");
        const pwcIconResult = document.getElementById("pwcIcon-result")
        if(memberPwCk.length == 0){
            memberPwCkResult.innerHTML = "비밀번호가 일치하지않습니다.";
            memberPwCkResult.style.color = "red";
            pwcIconResult.style.color = "red";
        }else if(memberPw == memberPwCk){
            memberPwCkResult.innerHTML = "비밀번호가 일치합니다.";
            memberPwCkResult.style.color = "#2183d3";
            pwcIconResult.style.color = "#2183d3";

        }else {
            memberPwCkResult.innerHTML = "비밀번호가 일치하지않습니다.";
            memberPwCkResult.style.color = "red";
            pwcIconResult.style.color="red";
        }
    }
</script>

</html>
