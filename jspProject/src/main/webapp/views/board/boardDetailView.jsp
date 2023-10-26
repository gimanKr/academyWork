<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.board.model.vo.Board, com.kh.common.model.vo.Attachment" %>
<%
    Board b = (Board)request.getAttribute("b");
    //글번호, 카테고리명, 제목, 내용, 작성자 아이디, 작성일

    Attachment at = (Attachment)request.getAttribute("at");
    //없다면 null
    //있다면 파일번호, 원본명, 수정명, 저장경로
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .outer{
        background: rgb(174, 246, 248);
        color: black;
        width: 1000px;
        height: auto;
        margin: auto;
        margin-top: 50px;
    }
    .outer table{
        border: 1px solid white;
        border-collapse: collapse;
    }
    .outer table tr, .outer table td{
        border: 1px solid white;
    }
</style>
</head>
<body>
    <%@ include file="../common/menubar.jsp" %>

    <div class="outer">
        <br>
        <h2 align="center">일반게시판 상세보기</h2>
        <br>

        <table id="detail-area" border="1" align="center">
            <tr>
                <th width="70">카테고리</th>
                <th width="70"><%=b.getCategory()%></th>
                <th width="70">제목</th>
                <th width="350"><%=b.getBoardTitle()%></th>
            </tr>
            <tr>
                <th>작성자</th>
                <th><%=b.getBoardWriter()%></th>
                <th>작성일</th>
                <th><%=b.getCreateDate()%></th>
            </tr>
            <tr>
                <th>내용</th>
                <td colspan="3">
                    <p style="height: 200px;"><%=b.getBoardContent()%></p>
                </td>
            </tr>
            <tr>
                <th>첨부파일</th>
                <td colspan="3">
                   <%if(at == null){%>
                        <!-- case1 첨부파일이 없을 경우-->
                        첨부파일이 없습니다.
                    <%}else{ %>
                        <!-- case2 첨부파일이 있을 경우-->
                        <a download="<%=at.getOriginName()%>" href="<%=contextPath%>/<%=at.getFilePath()+at.getChangeName()%>"><%=at.getOriginName()%></a>
                    <%}%>
                </td>
            </tr>

        </table>
        <br>

        <div align="center">
            <a href="<%=contextPath%>/list.bo?cpage=1" class="btn btn-sm btn-info">목록가기</a>

            <!-- 로그인한 사용자가 게시글의 작성자일 경우 사용가능-->
            <%if(loginUser != null && loginUser.getUserId().equals(b.getBoardWriter())){%>
                <a href="<%=contextPath%>/updateForm.bo?bno=<%=b.getBoardNo()%>" class="btn btn-sm btn-warning">수정하기</a>
                <a href="<%=contextPath%>/boardDelete.bo?num=<%=b.getBoardNo()%>" class="btn btn-sm btn-danger">삭제하기</a>
            <%}%>
        </div>
        <br>
        <div id="reply-area">
            <table align="center">
                <thead>
                    <tr>
                        <th>댓글작성</th>
                        <%if(loginUser != null){%>
                            <td>
                                <textarea id="reply-content" cols="50" rows="3"></textarea>
                            </td>
                            <td>
                                <button onclick="insertReply()">댓글작성</button>
                            </td>
                        <%}else{%>
                            <td>
                                <textarea id="reply-content" cols="50" rows="3" readonly>로그인 후 작성 가능</textarea>
                            </td>
                            <td>
                                <button onclick="insertReply()">댓글작성</button>
                            </td>
                        <%}%>
                    </tr>
                </thead>
                <tbody>
                    
                </tbody>
            </table>
            <script>
                window.onload = function(){
                    //댓글 가져와서 그려주기
                    selectReplyList();
                    // 2초마다 함수실행
                    setInterval(selectReplyList,2000)
                }
                function selectReplyList(){
                    $.ajax({
                        url : "rlist.bo",
                        data : {
                            bno : <%=b.getBoardNo()%>
                        },
                        success:function(res){
                            let str = '';
                            for(let reply of res){
                                str+="<tr>"
                                        +"<td>"+reply.replyWriter+"</td>"
                                        +"<td>"+reply.replyContent+"</td>"
                                        +"<td>"+reply.createDate+"</td>"    
                                    +"</tr>";
                            }
                            document.querySelector("#reply-area tbody").innerHTML = str;

                        },
                        error:function(){
                            console.log("댓글조회중 ajax통신 실패")
                        }

                    })
                }
                function insertReply(){
                    $.ajax({
                        url : "rinsert.bo",
                        data : {
                            content : document.getElementById("reply-content").value,
                            bno : <%=b.getBoardNo()%>
                        },
                        type:"post",
                        success:function(res){
                            if(res > 0){
                                document.getElementById("reply-content").value = "";
                                selectReplyList();
                            }
                        },
                        error:function(){
                            console.log("댓글작성중 ajax통신 실패")
                        }
                    })
                }
            </script>
        </div>




    </div>
</body>
</html>