<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Your Blogs</title>
<link rel="stylesheet" href="<c:url value='/resources/css/style.css' />">

</head>
<body>
    <h2>Your Personal Blogs</h2>

    <c:forEach items="${blogs}" var="blog">
        <div class="blog-card">
            <h3>${blog.title}</h3>
            <p>${blog.content}</p>
            <p><em>By: ${blog.author}</em></p>
            <a href="/edit/${blog.id}">Edit</a> |
            <a href="/delete/${blog.id}" onclick="return confirm('Are you sure?')">Delete</a>
            <hr/>
        </div>
    </c:forEach>

    <a href="/dashboard">Back to Dashboard</a>
</body>
</html>
