<%--
Created by IntelliJ IDEA.
User: Danny
Date: 1/18/2021
Time: 3:01 PM
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
    <title>luv2code Company Home Page</title>
</head>
<body>
    <h2>luv2code Company Home Page</h2>
    <hr>

    <p>
        Welcome to the luv2code Company Home Page
    </p>

    <!-- Logout - even for just a button, you need a from to POST the submission -->
    <form:form action="${pageContext.request.contextPath}/logout" method="post">
        <input type="submit" value="Logout">
    </form:form>

</body>
</html>
