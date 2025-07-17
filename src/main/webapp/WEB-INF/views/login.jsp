<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
   <link rel="stylesheet" href="<c:url value='/resources/css/style.css' />">

</head>
<body>
<div class="container">
    <h2>Login</h2>
    <form action="/login" method="post">
        <input type="text" name="username" placeholder="Username" required />
        <input type="password" name="password" placeholder="Password" required />
        <button type="submit">Login</button>
    </form>
    <a href="/register">Don't have an account? Register</a>
</div>
</body>
</html>
