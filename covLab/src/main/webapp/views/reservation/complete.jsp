<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function moveIndex(){
		self.close();
		opener.document.location = "/semi";
	}
</script>
</head>
<body>
	<button onclick="moveIndex()">완료되었습니다.</button>
</body>
</html>