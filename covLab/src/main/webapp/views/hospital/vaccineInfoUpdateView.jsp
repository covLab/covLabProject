<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="hospital.model.vo.VaccineInfo"%>
<%
VaccineInfo vi = (VaccineInfo)request.getAttribute("vi");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>백신 정보 수정</title>
<%@ include file="../common/stylesheet.jsp"%>

</head>
<body>
<br><Br>
<div align="center"><b>백신 정보 수정</b></div>
<form action="/semi/updatevcinfo" method="post">
						<table align="center">
							<tr>
								<th>제 목</th><th>제조사</th><th>제조국</th><th>최대접종횟수</th><th>유통기한</th>
								
							</tr>
							<tr>
								<td><input type="text" name="vname" size="10" readonly value="<%= vi.getVacName() %>"></td>
								<td><input type="text" name="vcompany" size="10" value="<%= vi.getMadeByCompany() %>"></td>
								<td><input type="text" name="vcountry" size="10" value="<%= vi.getMadeInCountry() %>"></td>
								<td><input type="text" name="maxcnt" size="10" value="<%= vi.getMaxIocCount() %>"></td>
								<td><input type="text" name="vexp" size="10" value="<%= vi.getExpDur() %>"></td>
								
							</tr>
							
								<tr align="center">
									<th colspan="5">
										<input type="submit" value="수정하기" class="btn btn-primary"> &nbsp; 
										<input type="reset" value="수정취소" class="btn btn-default"> &nbsp; 
										<%-- <input type="button" value="이전페이지로 이동" onclick="javascript:history.go(-1); return false;" class="btn btn-default"> &nbsp; 
										<input type="button"
										value="목록" onclick="javascript:location.href='/semi/blist?page=<%=currentPage%>'; return false;" class="btn btn-default">
									 --%></th>
								</tr>
							</table>

					</form>
</body>
</html>