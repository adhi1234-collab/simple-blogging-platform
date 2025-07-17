<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Dashboard</title>
    <link rel="stylesheet" href="<c:url value='/resources/css/style.css' />">
</head>
<body>

<div class="container">
    <h2>Dashboard</h2>

    <div class="dashboard-links">
        <a href="/create">Create Blog</a>
        <a href="/public">View Public Blogs</a>
        <a href="/personal">View Personal Blogs</a>
        <a href="/logout">Logout</a>
    </div>
</div>

</body>
</html>
