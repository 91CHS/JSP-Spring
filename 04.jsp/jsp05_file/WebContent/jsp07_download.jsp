<%@page import="java.net.URLEncoder"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String fileName = request.getParameter("f");
	
	String fromPath = "D:/CHS/99.temp/upload/" + fileName;
	String toPath = "D:/CHS/99.temp/download/" + fileName;

	byte[] b = new byte[4096];  // 4kb단위로 읽게 해놓음
	File f = new File(toPath);  // 더미파일 하나 만들어놓기
	FileInputStream fis = new FileInputStream(fromPath); // fromPath의 파일을 읽음
	
	String sMimeType = getServletContext().getMimeType(fromPath); // mimetype = file type : pdf, exe, txt.... 
	if(sMimeType == null) sMimeType = "application/octet-stream";  // 타입지정은 필수. 이 부분은 외워.
	
	String sEncoding = new String(fileName.getBytes("utf-8"), "8859_1"); // 한글을 깨질 수 있어서 인코딩 
	String sEncoding1 = URLEncoder.encode(fileName, "utf-8");
	
	response.setContentType(sMimeType);		// 이부분도 외워야함.
	response.setHeader("Content-Transfer-Encoding", "binary");
	response.setHeader("Content-Disposition", "attachment; filename = " + sEncoding1);
	
	ServletOutputStream os = response.getOutputStream();
	int numRead;
	
	while((numRead=fis.read(b, 0, b.length)) != -1 ) {
		os.write(b, 0, numRead);
	}
	
	os.flush();
	os.close();
	fis.close();
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">	
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
 	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" 
		integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
		crossorigin="anonymous">  
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</head>
<body>
	<h3>파일다운로드성공!!</h3>
</body>
</html>