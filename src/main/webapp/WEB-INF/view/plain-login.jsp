<%--
  Created by IntelliJ IDEA.
  User: Danny
  Date: 1/20/2021
  Time: 7:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Custom Login Page</title>
    <style>
        /* Note: this is a CSS comment. Dot selector is for class names, hashtag(#) is for id attributes */
        .failed {
            color: red;
        }
    </style>
</head>
<body>
    <h3>My Custom Login Page</h3>

    <!-- authenticateTheUser is defined in DemoSecurityConfig. Spring security does the magic here.
    Spring security also expects two input fields named as username & password; this is necessary.
    The default input names that spring security searches for can be changed in DemoSecurityConfig. -->
    <form:form method="POST" action="${pageContext.request.contextPath}/authenticateTheUser" >

        <!-- If the login fails, spring sec. will resend the login page with an error parameter.
        The following checks for that error parameter and displays an error message. -->
        <c:if test="${param.error != null}">
            <i class="failed">Sorry! You entered an invalid username/password.</i>
        </c:if>

        <p>
            Username: <input type="text" name="username">
        </p>

        <p>
            Password: <input type="password" name="password">
        </p>

        <input type="submit" value="Login">
    </form:form>
</body>
</html>