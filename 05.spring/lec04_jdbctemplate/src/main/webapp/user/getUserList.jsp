<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<title>Spring Framework</title>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>	
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" 
		integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" 
		crossorigin="anonymous">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container" align="center">
		<div class="mt-4 p-5 bg-primary text-white rounded">
			<h3>사용자목록</h3>
			<c:if test="${ userList.isEmpty() }">
				<h5><p class="bg-danger text-white">등록된 사용자 정보가 존재하지 않습니다!!</p></h5>
			</c:if>
		</div> 
		
		${searchVO.toString()} <hr>
		${userList.toString()}
		
		<br>
			
		<form action="getUserList.do" method="post" id="userForm">   
			<input type="hidden" id="curPage" name="curPage" value="${searchVO.getCurPage()}"> 
			<input type="hidden" id="rowSizePerPage" name="rowSizePerPage" value="${searchVO.getRowSizePerPage()}">
	   		<div class="row mt-3 justify-content-center">
				<div class="col-auto me-1">
					<label for="id" class="input-group-text">${searchVO.getCurPage()} of ${searchVO.getTotalRowCount()}</label>
				</div>
 		    	<div class="col-auto">
					<select class="form-select" id="searchCategory" name="searchCategory">
				    	<option value="">분류</option>							
				    	<option value="xxx">관리자</option>							
				    	<option value="yyy">사용자</option>						
					</select>
				</div> 
		    	<div class="col-auto me-1">
					<select class="form-select" id="searchType" name="searchType">
				    	<option value="">검색</option>							
				    	<option value="name" ${searchVO.getSearchType()=="name" ? "selected" : "" }>사용자명</option>							
				    	<option value="id" ${searchVO.getSearchType()=="id" ? "selected" : ""}>아이디</option>						
					</select>
				</div>
				<div class="col-3 me-1">			
					<input class="form-control me-2" name="searchWord" type="text" placeholder="input search keyword..." />
				</div>
				<div class="col-5 btn-group"> 		
			    	<input type="reset" id="btnReset" class="col-1 btn btn-primary me-2" value="초기화">
			    	<input type="submit" class="col-1 btn btn-primary me-2" value="Search">
			    	<a href="user/insertUser.jsp" class="col-1 btn btn-primary me-2">사용자등록</a>
					<a href="logout.do" class="col-1 btn btn-primary">logout</a>
	        	</div>
			</div>
		</form> <!-- getUserList.do -->
	
		<div class="container mt-3">		
			<div class="row mt-4">
				<table class="table table-hover table-bordered">
					<thead class="table-dark text-center">
						<th scope="col">USER ID</th>
						<th scope="col">사용자명</th>
						<th scope="col">관리자</th>
						<th scope="col">삭제</th>
					</thead>
					<tbody>
					<c:forEach  var="user" items="${ userList }">
						<tr>
							<td scope="row"><a href="updateUser.do?id=${ user.getId() }">${ user.getId() }</a></td>
							<td>${ user.getName() }</td>
							<td>${ user.getRole() }</td>
							<td align="center">
								<a href="deleteUser.do?id=${ user.getId() }" class="btn btn-danger"><i class="fas fa-trash"></i>
								</a>
							</td>
						</tr>
					</c:forEach>				
					</tbody>
				</table>
			</div>	
		</div> <!-- 게시판 -->
 	
		<div class="row align-items-start mt-3">
			<ul class="col pagination justify-content-center">
			
				<c:set var="cp" value="${searchVO.getCurPage()}"/>
				<c:set var="rp" value="${searchVO.getRowSizePerPage()}"/>
				<c:set var="fp" value="${searchVO.getFirstPage()}"/>
				<c:set var="lp" value="${searchVO.getLastPage()}"/>
				<c:set var="ps" value="${searchVO.getPageSize()}"/>
				<c:set var="tp" value="${searchVO.getTotalPageCount()}"/>
				<c:set var="sc" value="${searchVO.getSearchCategory()}"/>
				<c:set var="st" value="${searchVO.getSearchType()}"/>
				<c:set var="sw" value="${searchVO.getSearchWord()}"/>
																
				<c:if test="${ fp != 1 }">
					<li class="page-item"><a href="getUserList.do?curPage=1&rowSizePerPage=${rp}&searchType=${st}&searchWord=${sw}" class="page-link"><i class="fas fa-fast-backward"></i></a></li>
					<li class="page-item"><a href="getUserList.do?curPage=${fp-1}&rowSizePerPage=${rp}&searchType=${st}&searchWord=${sw}" class="page-link"><i class="fas fa-backward"></i></a></li>				
				</c:if>
			
				<c:forEach var="page" begin="${fp}" end="${lp}">
					<li class="page-item ${cp==page ? 'active' : ''}"><a href="getUserList.do?curPage=${page}&rowSizePerPage=${rp}&searchType=${st}&searchWord=${sw}" class="page-link">${page}</a></li>
				</c:forEach>
				
				<c:if test="${ lp < tp }">
					<li class="page-item"><a href="getUserList.do?curPage=${lp+ps}&rowSizePerPage=${rp}&searchType=${st}&searchWord=${sw}" class="page-link"><i class="fas fa-forward"></i></a></li>				
					<li class="page-item"><a href="getUserList.do?curPage=${tp}&rowSizePerPage=${rp}&searchType=${st}&searchWord=${sw}" class="page-link"><i class="fas fa-fast-forward"></i></a></li>				
				</c:if>
			</ul> <!-- pagination -->	

			<div class="col-auto me-1">
				<div class="input-group mb-3">
					<span class="input-group-text"><i class="fas fa-list"></i></span>
					<select class="col-auto form-select" id="rowPerPage" name="rowPerPage">
				    	<option value="10" ${ rp == 10 ? "selected" : "" }>10</option>							
				    	<option value="20" ${ rp == 20 ? "selected" : "" }>20</option>							
				    	<option value="30" ${ rp == 30 ? "selected" : "" }>30</option>							
				    	<option value="40" ${ rp == 40 ? "selected" : "" }>40</option>							
				    	<option value="50" ${ rp == 50 ? "selected" : "" }>50</option>												
					</select>
				</div>
			</div> <!-- rowSizePerPage -->   	
		</div> <!-- 페이징 -->
		
	</div> <!-- main  -->
							
	<script>
		$(function() {
			
			// 목록 갯수 변경
			$('#rowPerPage').change(function(e) {
				$('#curPage').val(1);
				$('#rowSizePerPage').val($(this).val());
				$('#userForm').submit();
			});	//#rowPerPage
			
			// 초기화 버튼 클릭
			$('#btnReset').click(function() {
				$('#curPage').val(1);
				$('#userForm').find("select[name='searchCategory'] option:eq(0)").attr("selected", "selected");
				$('#userForm').find("select[name='searchType'] option:eq(0)").attr("selected", "selected");
				$('#userForm').find("input[name='searchWord']").val("");
				$('#userForm').submit();
			}); // #id_btn_reset.cli			
			
		})
	</script>
	
</body>
</html>		