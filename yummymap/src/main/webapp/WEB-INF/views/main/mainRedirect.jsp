<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
<script type="text/javascript">
navigator.geolocation.getCurrentPosition(function(position) {
	let longitude = position.coords.longitude;
	let latitude = position.coords.latitude;
	location.href = '/yummymap/main/mainRedirect.mmy?x='+longitude+'&y='+latitude;
});
</script>
</html>