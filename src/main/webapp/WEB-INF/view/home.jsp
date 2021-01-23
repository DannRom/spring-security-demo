<%--
Created by IntelliJ IDEA.
User: Danny
Date: 1/18/2021
Time: 3:01 PM
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!-- note taglib directory above is different for base and security. This is because
security taglib is developed by the spring security team -->

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

    <!-- display username and role -->
    <p>
        User: <security:authentication property="principal.username"/>
        <br><br>
        Role(s): <security:authentication property="principal.authorities"/>
    </p>

    <security:authorize access="hasRole('MANAGER')">
        <!-- Anything within this block can only be seen if user has the role MANAGER.
        All this content is not only not displayed on client side, it isn't even sent
        to their client. Therefore, inspecting page source will not display this info.
        This is why I placed the comments within the tag space instead of outside.
        If a user tries to access the link below "/leaders" then they can still do
        that through the url. This is why we use antMatcher().hasRole() in our security
        configuration file. This access tag is used to only hide links and content within
        a page. -->


        <!-- Add a link to point to /leaders ... this is for the manager.
        ALso note pageContext selects the page, request.contextPath gets the path
        of the selected page. -->
        <p>
            <a href="${pageContext.request.contextPath}/leaders">Leadership Meeting</a>
            (Only for manager peeps)
        </p>
    </security:authorize>

    <security:authorize access="hasRole('ADMIN')">
        <!-- Add a link to point to /systems ... this is for the admins -->
        <p>
            <a href="${pageContext.request.contextPath}/systems">IT Systems Meeting</a>
            (Only for admin peeps)
        </p>
    </security:authorize>

    <!-- Logout - even for just a button, you need a from to POST the submission -->
    <form:form action="${pageContext.request.contextPath}/logout" method="post">
        <input type="submit" value="Logout">
    </form:form>

</body>
</html>
