<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Register</title>
    <link rel="stylesheet" href="<c:url value='/resources/css/style.css' />">

</head>
<body>
<div class="container">
    <h2>Register</h2>
    <form action="/register" method="post">
        <input type="text" name="username" placeholder="Username" required />
        <input type="password" name="password" placeholder="Password" required />
        <button type="submit">Register</button>
    </form>
    <a href="/login">Already have an account? Login</a>
</div>
</body>
</html>