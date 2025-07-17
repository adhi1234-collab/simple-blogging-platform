<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Search Blogs</title>
<link rel="stylesheet" href="<c:url value='/resources/css/style.css' />">

</head>
<body>
    <h2>Search Blogs</h2>

    <form method="post" action="/search">
        <input type="text" name="topic" placeholder="Search by Topic"/>
        <input type="text" name="author" placeholder="Search by Author"/>
        <button type="submit">Search</button>
    </form>

    <hr/>

    <c:if test="${not empty results}">
        <h3>Search Results:</h3>
        <c:forEach items="${results}" var="blog">
            <div class="blog-card">
                <h3>${blog.title}</h3>
                <p>${blog.content}</p>
                <p><em>By: ${blog.author}</em></p>
                <hr/>
            </div>
        </c:forEach>
    </c:if>

    <c:if test="${empty results}">
        <p><strong>No blogs found.</strong></p>
    </c:if>

    <a href="/public">Back to Public Blogs</a>
</body>
</html>
