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
         <h3>Board List</h3>
			<c:if test="${ boardList.isEmpty() }">
				<h5><p class="bg-danger text-white">등록된 게시판 글이 존재하지 않습니다!!</p></h5>
			</c:if>
         
      </div>
      <br>
      
      <table class="table table-hover">
			<thead>
				<th scope="col">게시글번호</th>
				<th scope="col">제목</th>
				<th scope="col">글쓴이</th>
				<th scope="col">내용</th>
				<th scope="col">날짜</th>
				<th scope="col">조회수</th>
			</thead>
			<tbody>
			<c:forEach  var="board" items="${ boardList }">
				<tr>
					<td scope="row">${ board.getSeq() }</td>
					<td>${ board.getTitle() }</td>
					<td>${ board.getWriter() }</td>
					<td scope="row"><a href="selectBoard.do?seq=${ board.getSeq() }">${ board.getContent() }</a></td>
					<td>${ board.getRegdate() }</td>
					<td>${ board.getCnt() }</td>
					<td align="center">
					<c:if test="${userName==board.getWriter() || admin}">
					<a href="deleteBoard.do?seq=${ board.getSeq() }" class="btn btn-danger"><i class="fas fa-trash"></i></a>
					</c:if>
					</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
   </div>  
   <br>
   
   	<div class="container">
		<div class="row">
			
			<div class="col-sm-2">
				<!-- button trigger modal form - board add -->
				<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addboard">게시판등록</button>
			</div>
			
			<div class="col-sm-auto">
				
				<ul class="pagination justify-content-center">					
					<c:if test="${ pageInfo.getStartPage() != 1 }">
						<li class="page-item"><a href="getBoardList.do?p=1" class="page-link"><i class="fas fa-fast-backward"></i></a></li>
						<li class="page-item"><a href="getBoardList.do?p=${ pageInfo.getStartPage() - 10 }" class="page-link"><i class="fas fa-backward"></i></a></li>				
					</c:if>
				
					<c:set var="cp" value="${ pageInfo.getCurrentPage() }"/>
				
					<c:forEach var="page" begin="${ pageInfo.getStartPage() }" end="${ pageInfo.getEndPage() }">
						<li class="page-item ${ (cp==page)  ? 'active' : ''}"><a href="getBoardList.do?p=${page}" class="page-link">${page}</a></li>
					</c:forEach>
					<c:if test="${ pageInfo.getEndPage() < pageInfo.getTotalPages() }">
						<li class="page-item"><a href="getBoardList.do?p=${ pageInfo.getEndPage() + 1 }" class="page-link"><i class="fas fa-forward"></i></a></li>				
						<li class="page-item"><a href="getBoardList.do?p=${ pageInfo.getTotalPages() }" class="page-link"><i class="fas fa-fast-forward"></i></a></li>				
					
					</c:if>
	<a href="logout.do" class="btn btn-primary" style="float:right">로그아웃</a>
				</ul>
						
			</div>
		</div>
	</div>
	
   
   	<!--게시판등록 modal form  -->
	<div id="addboard" class="modal fade" data-bs-backdrop="static" data-bs-keyboard="false" tableindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
		
			<form action="insertBoard.do" method="post">
			
				<div class="modal-content">
					
					<div class="modal-header">
						<h1 class="motal-title fs-5" id="staticBackdropLabel">게시판등록하기</h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div> <!-- modal-header -->
					
					<div class="modal-body">
						<div class="input-group mb-3">
						<div class="input-group-text"><i class="fas fa-user"></i></div>
							<input type="text" name="title" class="form-control" id="title" required placeholder="제목을 입력하세요....">
						</div>
						<div class="input-group mb-3">
							<div class="input-group-text"><i class="fas fa-address-book"></i></div>    
						    <input type="text" class="form-control" readonly placeholder="${userName}">       
					     	<input type="hidden" name="writer" id= "writer" value="${userName}">
						</div>
						<div class="input-group mb-3">
							<div class="input-group-text"><i class="fas fa-kiwi-bird"></i></div>
							<input type="text" name="content" class="form-control" id="content" required placeholder="내용을 입력하세요....">
						</div>

					</div> <!-- modal-body -->
 					
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
						<button type="submit" class="btn btn-primary">Add Board</button>
					</div> <!-- modal-footer -->
				</div> <!-- modal-content -->
			</form>	
		</div> <!-- modal diaglog -->
	</div> <!-- modal end -->
   
       
</body>
</html>   