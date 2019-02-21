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
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/animate/animate.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/select2/select2.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/perfect-scrollbar/perfect-scrollbar.css">
</head>
<body>


    <div id="limiter">
        <div id="container-table100">
            <div id="wrapper">
                <div id="header">
                    <h2>Astronauti</h2>
                </div>
            </div>
            <div id="wrap-table100">
                <div class="table100 ver1">

                    <div class="wrap-table100-nextcols js-pscroll">
                        <div class="table100-nextcols">
                            <table>
                                <thead>
                                <tr class="row100 head">
                                    <th>Křestní jméno</th>
                                    <th>Přijmení</th>
                                    <th>Datum narození</th>
                                    <th>Superschopnost</th>
                                    <th>Akce</th>
                                </tr>
                                </thead>
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
                                    <td>${tempAstronaut.superPower}</td>
                                    <td>
                                            <%--dipsplay the update link--%>
                                        <a href="${updateLink}">Upravit</a>
                                        |
                                            <%--display the delte link--%>
                                        <a href="${deleteLink}" onclick="if (!( confirm('Opravdu chcete vymazat ${tempAstronaut.firstName} ${tempAstronaut.lastName}?')))return false">Vymazat</a>

                                    </td>
                                    <td></td>
                                </tr>

                                </c:forEach>
                        </div>
                    </div>





                </div>
            </div>
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





            </table>
        </div>
    </div>


</body>
</html>
