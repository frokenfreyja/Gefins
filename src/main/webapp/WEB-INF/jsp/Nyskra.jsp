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
                    <title>Forsida</title>
                    <title>Nyskra</title>
                    <link rel="stylesheet" type="text/css" href="<c:url value=" /css/nyskra.css "/>"/>
                </head>
                
                <script>
                    function myFunction() {
                        var x = document.getElementById("Demo");
                        if (x.className.indexOf("w3-show") == -1) {
                            x.className += " w3-show";
                        } else {
                            x.className = x.className.replace(" w3-show", "");
                        }
                    }
                </script>
                <body>
                
                    <header>
                        <div class="header-container">
                            <div class="header-bg">
                                <div class="navbar">
                                    <div class="nav">
                                        <a href="/nyskra">Nýskrá</a>
                                        <a href="/innskra">Innskrá</a>
                                    </div>
                                </div>
                                <div class="m-title">
                                    <h1><a href="/forsida">GEFINS</a></h1>
                                </div>
                            </div>
                        </div>
                    </header>
                    
                    <main>
                        <div class="grid">
                            <div class="row">
                                <div class="col col-extra">
                                </div>
                                <div class="col col-main">
                                    <%-- Form til þess að skrá nýjan notanda--%>
                                        <p class="createuser">Nýskráning</p>
                                        <sf:form method="POST" modelAttribute="user" action="/nyskra">
                                            <table class="create">
                                                <tr>
                                                    <td> Notendanafn:</td>
                                                    <%--the `path` attribute matches the `name` attribute of the Entity that was passed in the model--%>
                                                        <td>
                                                            <sf:input path="userName" type="text" class="createbox" placeholder="" required="required" />
                                                        </td>
                                                </tr>
                                                <tr>
                                                    <td>Lykilorð:</td>
                                                    <%--the `path` attribute matches the `note` attribute of the Entity that was passed in the model--%>
                                                        <td>
                                                            <sf:input path="password" type="text" class="createbox" placeholder="" required="required" />
                                                        </td>
                                                </tr>
                                                <tr>
                                                    <td>Netfang:</td>
                                                    <%--the `path` attribute matches the `note` attribute of the Entity that was passed in the model--%>
                                                        <td>
                                                            <sf:input path="email" type="text" class="createbox" placeholder="" required="required" />
                                                        </td>
                                                </tr>
                                                <tr>
                                                    <td>Símanúmer:</td>
                                                    <%--the `path` attribute matches the `note` attribute of the Entity that was passed in the model--%>
                                                        <td>
                                                            <sf:input path="phone" type="text" maxlength="7" class="createbox" placeholder="" required="required" />
                                                        </td>
                                                </tr>
                                                <tr>
                                                    <td>Heimilisfang:</td>
                                                    <%--the `path` attribute matches the `note` attribute of the Entity that was passed in the model--%>
                                                        <td>
                                                            <sf:input path="location" type="text" class="createbox" placeholder="" required="required" />
                                                        </td>
                                                </tr>
                                                <tr>
                                                    <td>Póstnúmer:</td>
                                                    <%--the `path` attribute matches the `note` attribute of the Entity that was passed in the model--%>
                                                        <td>
                                                            <sf:input path="zipcode" type="text" maxlength="3" class="createbox" placeholder="" required="required" />
                                                        </td>
                                                </tr>
                                            </table>
                                            <div class="errorMessage">
                                                <c:if test="${not empty nyskraError}">
                                                    ${nyskraError}
                                                </c:if>
                                            </div>
                                            <div class="submit">
                                                <input type="submit" class="createbutton" VALUE="Nýskrá" />
                                            </div>
                                        </sf:form>
                                </div>
                                <div class="col col-extra">
                                </div>
                            </div>
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