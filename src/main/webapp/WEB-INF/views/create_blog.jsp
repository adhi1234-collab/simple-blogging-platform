<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Create Blog</title>
    <link rel="stylesheet" href="<c:url value='/resources/css/style.css' />">

</head>
<body>
    <h2>Create New Blog</h2>
    <form method="post" action="/create">
        <label>Title:</label><br/>
        <input type="text" name="title" required><br/>

        <label>Content:</label><br/>
        <textarea name="content" rows="5" cols="40" required></textarea><br/>

        <label>Author:</label><br/>
        <input type="text" name="author" value="${sessionScope.user.username}" readonly><br/><br/>

        <button type="submit">Upload</button>
    </form>
    <br/>
    <a href="/dashboard">Back to Dashboard</a>
</body>
</html>
