<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
    .outer{
        background: rgb(174, 246, 248);
        color: black;
        width: 500px;
        margin: auto;
        margin-top: 50px;
    }

    #enroll-form table{margin: auto;}
    #enroll-form input{margin: 5px;}
</style>

</head>
<body>
    <%@ include file="../common/menubar.jsp" %>

    <div class="outer">
        <br>
        <h2 align="center">회원가입</h2>

        <form action="<%=contextPath %>/insert.me" id="enroll-form" method="post">
            <table>
                <tr>
                    <td>* 아이디</td>
                    <td><input type="text" name="userId" maxlength="12" required></td>
                    <td><button type="button" onclick="idCheck()">중복확인</button></td>
                </tr>
                <tr>
                    <td>* 비밀번호</td>
                    <td><input type="password" name="userPwd" maxlength="15" required></td>
                    <td></td>
                </tr>
                <tr>
                    <td>* 비밀번호 확인</td>
                    <td><input type="password" name="userPwdCheck" maxlength="15" required></td>
                    <td></td>
                </tr>
                <tr>
                    <td>* 이름</td>
                    <td><input type="text" name="userName" maxlength="6" required></td>
                    <td></td>
                </tr>
                <tr>
                    <td>전화번호</td>
                    <td><input type="text" name="phone" placeholder="- 포함해서 입력"></td>
                    <td></td>
                </tr>
                <tr>
                    <td>이메일</td>
                    <td><input type="email" name="email" ></td>
                    <td></td>
                </tr>
                <tr>
                    <td>주소</td>
                    <td><input type="text" name="address" ></td>
                    <td></td>
                </tr>
                <tr>
                    <td>관심분야</td>
                    <td colspan="2">
                        <input type="checkbox" name="interest" id="sports" value="운동">
                        <label for="sports">운동</label>

                        <input type="checkbox" name="interest" id="climbing" value="등산">
                        <label for="climbing">등산</label>

                        <input type="checkbox" name="interest" id="fishing" value="낚시">
                        <label for="fishing">낚시</label>
                        <br>
                        <input type="checkbox" name="interest" id="cooking" value="요리">
                        <label for="cooking">요리</label>

                        <input type="checkbox" name="interest" id="game" value="게임">
                        <label for="game">게임</label>

                        <input type="checkbox" name="interest" id="movie" value="영화">
                        <label for="movie">영화</label>
                    </td>
                </tr>
            </table>

            <br><br>

            <div align = "center">
                <button type="submit" disabled onclick="return checkPwd();">회원가입</button>
                <button type="reset">초기화</button>
            </div>

            <br><br>

        </form>

        <script>
            function checkPwd(){
                let pwdInput = document.querySelector("#enroll-form input[name=userPwd]");
                let pwdCheckInput = document.querySelector("#enroll-form input[name=userPwdCheck]");
                if (pwdInput.value !== pwdCheckInput.value) {
                    alert("비밀번호가 일치하지 않습니다.");
                    return false;
                }
            }
            function idCheck(){
                // 중복확인 버튼 클릭시 사용자가 입력한 아이디값을 서버에 보내서 조회요청(존재여부)=> 응답데이터 돌려받기
                // 1) 사용불가능일 경우 => alert로 메세지 출력, 다시 입력할수 있도록 유도
                // 2) 사용가능한 경우 => 진짜 사용할건지 의사 물어봄
                //                      > 사용하겠다는 경우 => 더이상 수정 못하게끔, 회원가입버튼 활성
                //                      > 사용하지 않겠다는 경우 => 다시 입력할 수 있도록 유도

                const inInput = document.querySelector("#enroll-form input[name=userId]");
                console.log(inInput);
                $.ajax({
                    url : "idCheck.me",
                    data : {
                        "checkId" : inInput.value
                    },
                    success : function(res){
                        if(res === "NNNNY"){
                            if(confirm("사용가능한 아이디입니다. 사용하시겠습니까?")){
                                let submitBtn = document.querySelector("#enroll-form button[type=submit]");
                                submitBtn.removeAttribute("disabled");
                                disabled.setAttribute("readonly",true);
                            }else{
                                inInput.focus();
                            }
                        }else{
                            alert("사용하실수 없는 아이디입니다.");
                            inInput.focus();
                        }
                    },
                    error : function(){
                        console.log("아이디 중복체크용 ajax통신실패");
                    }
                })
            }
        </script>
    </div>
</body>
</html>