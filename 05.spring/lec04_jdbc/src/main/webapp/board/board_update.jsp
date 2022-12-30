<%@page import="com.lec.jdbc.vo.UserVO"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
boolean log = (boolean)session.getAttribute("isAdmin");
UserVO user = (UserVO)session.getAttribute("user");
%>

<c:set var="userName" value="<%=user.getName() %>"/>
<c:set var="admin" value="<%=log %>"/>

<!DOCTYPE html>
<html>
<head>
   <title>Spring Framework</title>
   <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">   
   <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" 
      integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" 
      crossorigin="anonymous">
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>   
</head>
<body>
   <div class="container" align="center">
      <div class="mt-4 p-5 bg-primary text-white rounded">
         <h3>Board Update</h3>
         <p>상세설명.....................</p>
         
      </div>
      <br>
      
      <form action="updateBoard.do" method="post">
		
			<div class="input-group-text mb-3">
				<div class="input-group-text"><i class="fas fa-user"></i></div>
				<input type="text" class="form-control" value="${ board.getSeq() }" disabled>
			</div>
			
			<div class="input-group-text mb-3">
				<div class="input-group-text"><i class="fas fa-user"></i></div>
				<input type="text" name="title" id="title" class="form-control" value="${ board.getTitle() }" required>
			</div>

			<div class="input-group-text mb-3">
				<div class="input-group-text"><i class="fas fa-user"></i></div>
				<input type="text" name="writer" id="writer" class="form-control" value="${ board.getWriter() }" required>
			</div>
	
			<div class="input-group-text mb-3">
				<div class="input-group-text"><i class="fas fa-user"></i></div>
				<input type="text" name="content" id="content" class="form-control" value="${ board.getContent() }" required>
			</div>
			
			<input type="hidden" name="seq" id="seq" class="form-control" value="${ board.getSeq() }">
			<c:if test="${userName==board.getWriter() || admin}">
			<button type="submit" class="btn btn-primary text-white"><b>"${ board.getSeq() }"</b>를 수정하겠습니까?</button>
			</c:if>
			<a href="getBoardList.do" class="btn btn-primary text-white"> <b>돌아가기 </b></a>
		</form>
      
      
   </div>      
</body>
</html>   