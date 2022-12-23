<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- add(), sub(), mul(), div() 메서드를 생성 후 각 결과를 출력하기 -->
	<%!	int val1;
	    int val2;
	
		int add(int x,int y) { return x + y ; }
	    int sub(int x,int y) { return x - y ; }
	    int mul(int x,int y) { return x * y ; }
	    double div(double x,double y) { return x / y ; }
	%>
	
	  10 + 20 = <%=add(10,20)%>  <br>
	  10 - 20 = <%=sub(10,20)%>  <br>
	  10 * 20 = <%=mul(10,20)%>  <br>
	  10 / 20 = <%=div(10,20)%>  <br><hr>
	  
	<% val1 = 10;
	   val2 = 20;
	   int result1 = add(val1,val2);
	   int result2 = sub(val1,val2);
	   int result3 = mul(val1,val2);
	   double result4 = div(val1,val2);
	   %>
	   
	  <%=val1%> + <%=val2%> = <%=result1%> <br>
	  <%=val1%> - <%=val2%> = <%=result2%> <br>
	  <%=val1%> * <%=val2%> = <%=result3%> <br>
	  <%=val1%> / <%=val2%> = <%=result4%> <br>
	   

</body>
</html>