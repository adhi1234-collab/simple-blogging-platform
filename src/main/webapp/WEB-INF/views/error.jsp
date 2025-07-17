<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Error</title>
<link rel="stylesheet" href="<c:url value='/resources/css/style.css' />">

</head>
<body>
    <h2>Error Occurred</h2>
    <p>${errorMessage}</p>
    <a href="/">Go Home</a>
</body>
</html>
