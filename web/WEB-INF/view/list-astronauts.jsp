<%--
  Created by IntelliJ IDEA.
  User: Doma
  Date: 19.02.2019
  Time: 15:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Astronauti</title>

    <!-- reference stylesheet --->
    <link type="text/css"
          rel="stylesheet"
          href="${pageContext.request.contextPath}/resources/css/style.css"/>
</head>
<body>
    <div id="wrapper">
        <div id="header">
            <h2>Astronauti</h2>
        </div>
    </div>

    <div id="container">
        <div id="content">
            <%--put new button: Add Astronaut--%>

            <input type="button" value="Přidat astronauta"
                   onclick="window.location.href='showFormForAdd'; return false;"
                class="add-button"
            /><br>
                <form:form action="search" method="get">
                    Hledej astronauta: <input type="text" name="theSearchName"/>
                    <input type="submit" value="Hledat" class="add-button"/>
                </form:form>

            <table>
                <tr>
                    <th>Křestní jméno</th>
                    <th>Přijmení</th>
                    <th>Datum narození</th>
                    <th>Akce</th>
                </tr>
                <%--Loop over and print astronauts--%>
                <c:forEach var="tempAstronaut" items="${astronauts}">

                    <%--construct an update link with customer id--%>
                    <c:url var="updateLink" value="/astronaut/showFormForUpdate">
                        <c:param name="astronautId" value="${tempAstronaut.id}"/>
                    </c:url>
                    <c:url var="deleteLink" value="/astronaut/delete">
                        <c:param name="astronautId" value="${tempAstronaut.id}"/>
                    </c:url>

                    <tr>
                        <td>${tempAstronaut.firstName}</td>
                        <td>${tempAstronaut.lastName}</td>
                        <td>${tempAstronaut.dateOfBirth}</td>
                        <td>
                            <%--dipsplay the update link--%>
                            <a href="${updateLink}">Update</a>
                            |
                            <%--display the delte link--%>
                            <a href="${deleteLink}" onclick="if (!( confirm('Are you sure you want to delete ${tempAstronaut.firstName} ${tempAstronaut.lastName}?')))return false">Delete</a>

                        </td>
                        <td></td>
                    </tr>

                </c:forEach>



            </table>
        </div>
    </div>


</body>
</html>
