<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
        <%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
            <%@ page contentType="text/html; charset=UTF-8" %>
                <html class="grid" lang="is">
                <head>
                    <link href="https://fonts.googleapis.com/css?family=Droid+Serif:400,400i|Raleway:400,700" rel="stylesheet">
                    <link href="https://fonts.googleapis.com/css?family=Merriweather" rel="stylesheet">
                    <link href="https://fonts.googleapis.com/css?family=Fjalla+One|Old+Standard+TT:400,700|Oswald:400,600|Vidaloka" rel="stylesheet">
                    <title>Stillingar</title>
                    <link rel="stylesheet" type="text/css" href="<c:url value=" /css/settings.css "/>"/>
                </head>
                <body>
                    <header>
                        <div class="header-container">
                            <div class="header-bg">
                                <div class="navbar">
                                    <div class="nav">
                                        <div class="dropdown">
                                            <button class="dropbtn">${loggedInUsername}
                                                <i class="fa fa-caret-down"></i>
                                            </button>
                                            <div class="dropdown-content">
                                                <a href="/mittsvaedi">Mitt svæði</a>
                                                <a href="/settings">Stillingar</a>
                                                <a href="/utskra">Útskrá</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="h-wrapper">
                                    <div class="m-title">
                                        <h1><a href="/forsidaloggedin">GEFINS</a></h1>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </header>
                    <main class="main">
                        <div class="main__grid">
                            <div class="main__row">
                                <div class="main__col">
                                    <%-- Form til þess að breyta nýskráningarupplýsingum notanda--%>
                                    <p class="settingstitle">Stillingar</p>
                                    <sf:form method="POST" modelAttribute="user" action="/settings">
                                        <table class="settingstable">
                                            <tr>
                                                <td> Notendanafn:</td>
                                                <%--the `path` attribute matches the `name` attribute of the Entity that was passed in the model--%>
                                                    <td>
                                                        <sf:input class="inputbox" path="userName" type="text" placeholder="" required="required" />
                                                    </td>
                                            </tr>
                                            <tr>
                                                <td>Lykilorð:</td>
                                                <%--the `path` attribute matches the `note` attribute of the Entity that was passed in the model--%>
                                                    <td>
                                                        <sf:input class="inputbox" path="password" type="text" placeholder="" required="required" />
                                                    </td>
                                            </tr>
                                            <tr>
                                                <td>Netfang:</td>
                                                <%--the `path` attribute matches the `note` attribute of the Entity that was passed in the model--%>
                                                    <td>
                                                        <sf:input class="inputbox" path="email" type="text" placeholder="" required="required" />
                                                    </td>
                                            </tr>
                                            <tr>
                                                <td>Símanúmer:</td>
                                                <%--the `path` attribute matches the `note` attribute of the Entity that was passed in the model--%>
                                                    <td>
                                                        <sf:input class="inputbox" path="phone" type="text" maxlength="7" placeholder="" required="required" />
                                                    </td>
                                            </tr>
                                            <tr>
                                                <td>Heimilisfang:</td>
                                                <%--the `path` attribute matches the `note` attribute of the Entity that was passed in the model--%>
                                                    <td>
                                                        <sf:input class="inputbox" path="location" type="text" placeholder="" required="required" />
                                                    </td>
                                            </tr>
                                            <tr>
                                                <td>Póstnúmer:</td>
                                                <%--the `path` attribute matches the `note` attribute of the Entity that was passed in the model--%>
                                                    <td>
                                                        <sf:input class="inputbox" path="zipcode" type="text" maxlength="3" placeholder="" required="required" />
                                                    </td>
                                            </tr>
                                        </table>
                                        <div class="errorMessage">
                                            <c:if test="${not empty stillingarError}">
                                                ${stillingarError}
                                            </c:if>
                                        </div>
                                        <div class="submit">
                                            <input type="submit" class="editbutton" VALUE="Staðfesta" />
                                        </div>
                                    </sf:form>
                                    <sf:form method="POST" modelAttribute="user" action="/settings/${user.id}">
                                        <div class="submit">
                                            <input type="submit" class="deletebutton" VALUE="Eyða aðgangi"/>
                                        </div>
                                    </sf:form>
                                </div>
                    </main>
                    <footer class="footer">
                            <div class="footer__grid">
                                <div class="footer__row">
                                    <div class="footer__col">
                                        <ul class="footer__links">
                                            <li class="li"><a class="footer__link" href="/umgefins">Um Gefins</a></li>
                                        </ul>
                                    </div>
                                    <div class="footer__col">
                                        <ul class="footer__links">
                                            <li class="li"><a class="footer__link" href="/hafasamband">Hafa samband</a></li>
                                        </ul>
                                    </div>
                                    <div class="footer__col">
                                        <ul class="footer__links">
                                            <li class="li"><a class="footer__link" href="/notkunarskilmalar">Notkunarskilmálar</a></li>                                    </ul>
                                    </div>
                                    <div class="footer__col">
                                        <ul class="footer__links">
                                            <li class="li"><a class="footer__link" href="/hofundar">Höfundar</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <p class="footer__credit">© 2018 GEFINS</p>
                        </footer>
                </body>
                </html>