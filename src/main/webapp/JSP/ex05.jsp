<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.util.*" %>
<%@ page import ="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Calendar</title>
</head>
<body>
	
	<%
		// 자바문법
		Calendar todayCalendar = Calendar.getInstance();
		out.println(todayCalendar);
		
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy년 MM월 dd일");
		String dateString = formatter.format(todayCalendar.getTime());
		out.println("<br>" + dateString);
		
		// 날짜 계산
		todayCalendar.add(Calendar.DATE, 2);
		todayCalendar.add(Calendar.MONTH, 3);
		todayCalendar.add(Calendar.YEAR, 4);
		out.println("<br>" + formatter.format(todayCalendar.getTime()));
		
		// 날짜 비교
		Calendar calendar = Calendar.getInstance();
		
		// 앞에것이 더 크다	result = 1	(10 - 5)
		// 뒤에것이 더 크다  result = -1 (5 - 10)
		// 같다 result = 0  (10 - 10)
		int result = todayCalendar.compareTo(calendar);
		if(result > 0){
			out.println("todayCalendar 가 더 크다");
		} else if(result < 0) {
			out.println("calendar 가 더 크다.");
		} else {
			out.println("같다");
		}
		
		
		
		
	%>
		
	
</body>
</html>