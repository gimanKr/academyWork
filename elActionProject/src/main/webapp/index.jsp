<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>* EL(Expression Language) 표현언어</h1>
	<p>
		기존에 사용했던 표현식(출력식) &lt;= name =&gt;와 같이 <br>
		JSP상에서 표현하고자하는 값을 \${name}의 형식으로 표현해서 작성하는 것
	</p>
	
	<h4><a href="el.do">01_EL의 기본구문</a></h4>
	<h4><a href="operation.do">02_EL의 연산자</a></h4>
	<br>
	<!-- 
		*JSP를 이루는 구성인자
		1.스크립팅 원소 : JSP페이지에서 자바코드를 직접 기술할 수 있게 하는 기능
					ex) 스크립틀릿, 표현식(출력식) 등등...
		2. 지시어 : JSP페이지정보에 대한 내용을 표현한다거나 또 다른 페이지를 포함할 때 사용
				  JSP 기능을 확장시키는 라이브러리 등록할떄도 사용한다.
				  ex) page지시어, include지시어, taglib지시어
		3. 액션태그(표준액션태그, 커스텀액션태그) : xml기술을 이용해서 기존의 jsp문법을 확장하는 기술을 제공하는 태그
	 	
	 		>> 표준액션태그  : JSP페이지에서 바로 사용가능(별도의 변동이 필요하지 않다.)
	 					  모든 태그명 앞에 jsp: 접두어를 붙임
	 		
	 		>> 커스텀액션태그 : JSP페이지에서 바로 사용 불가능(별도의 라이브러리 연동 필요)
	 					   모든 태그명 앞에 jsp:외의 다른 접두어를 붙임(종류가 다양)
	 					   가장 대표적으로 유용한 라이브러리는 == JSTL
	 -->
	<h1>JSP Action Tag</h1>
	<p>XML기술을 이용해서 기존의 JSP문법을 확장시키는 기술을 제공하는 태그들</p>
	<h3>1. 표준액션태그</h3>
	<a href="views/2_standardAction/01_include.jsp">01_jsp:include</a>
	
	
	
	
	
	
	
</body>
</html>