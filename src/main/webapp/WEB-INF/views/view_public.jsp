<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Public Blogs</title>
    <link rel="stylesheet" href="<c:url value='/resources/css/style.css' />">
</head>
<body>

    <h2>All Blogs</h2>

    <div style="text-align: center; margin-bottom: 20px;">
        <a href="/search">
            <button>Search Blogs</button>
        </a>
    </div>

    <c:forEach items="${blogs}" var="blog">
        <div class="blog-card">
            <h3>${blog.title}</h3>
            <p>${blog.content}</p>
            <p><em>By: ${blog.author}</em></p>
        </div>
    </c:forEach>

    <a href="/dashboard">Back to Dashboard</a>

</body>
</html>
