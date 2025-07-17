<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Edit Blog</title>
   <link rel="stylesheet" href="<c:url value='/resources/css/style.css' />">

</head>
<body>
    <h2>Edit Blog Post</h2>
    <form method="post" action="/edit/${blog.id}">
        <label>Title:</label><br/>
        <input type="text" name="title" value="${blog.title}" required><br/>

        <label>Content:</label><br/>
        <textarea name="content" rows="5" cols="40" required>${blog.content}</textarea><br/>

        <p><strong>Author:</strong> ${blog.author}</p>

        <button type="submit">Apply Changes</button>
    </form>
    <br/>
    <a href="/personal">Cancel</a>
</body>
</html>
