<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>백신예약</title>

<script type="text/javascript" src="/semi/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
	alert($('header h1').html());
	history.go(-1);
})
</script>
</head>
<body>
<header>
<h1 style="color:white;">
<%= request.getAttribute("message") %>
</h1>
</header>
</body>
</html>