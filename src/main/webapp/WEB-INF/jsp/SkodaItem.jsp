<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
        <%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
            <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
                <%@ page contentType="text/html; charset=UTF-8" %>
                    <html class="grid" lang="is">
                    <head>
                        <link href="https://fonts.googleapis.com/css?family=Droid+Serif:400,400i|Raleway:400,700" rel="stylesheet">
                        <link href="https://fonts.googleapis.com/css?family=Merriweather" rel="stylesheet">
                        <link href="https://fonts.googleapis.com/css?family=Fjalla+One|Old+Standard+TT:400,700|Oswald:400,600|Vidaloka" rel="stylesheet">
                        <title>Skoða nánar</title>
                        <link rel="stylesheet" type="text/css" href="<c:url value=" /css/skodaitem.css "/>"/>
                        <!- <link rel="stylesheet" type="text/css" href="<c:url value="/css/grid.css"/>"/>
                    </head>
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
                        <main class="main">
                            <div class="main__grid">
                                <div class="main__row">
                                    <div class="main__col">
                                    </div>
                                    <div class="main__col">
                                        <%--Birtir upplýsingar um það item sem valið er í auglýsingalista á forsíðunni þegar notandi er ekki innskráður--%>
                                            <c:choose>
                                                <c:when test="${not empty skodaitem}">
                                                    <div class="img"><img src="${pageContext.request.contextPath}/resources/images/${skodaitem.myndName}" /></div>
                                    </div>
                                    <div class="main__col">
                                        <table class="oneitemtable">
                                            <tr>
                                                <th colspan="2">${skodaitem.itemName}</th>
                                            </tr>
                                            <tr>
                                                <td class="title">Lýsing: </td>
                                                <td class="info">${skodaitem.description}</td>
                                            </tr>
                                            <tr>
                                                <td class="title">Póstnúmer: </td>
                                                <td class="info">${skodaitem.zipcode}</td>
                                            </tr>
                                            <tr>
                                                <td class="title">Afhendingartími: </td>
                                                <td class="info">${skodaitem.pickupTime}</td>
                                            </tr>
                                            <tr>
                                                <td class="title">Flokkur: </td>
                                                <td class="info">${skodaitem.tag}</td>
                                            </tr>
                                            <tr>
                                                <td class="title">Fjöldi í röð: </td>
                                                <td class="info">${fn:length(skodaitem.users)}</td>
                                            </tr>
                                        </table>
                                        </c:when>
                                        <%--If all tests are false, then do this--%>
                                            <c:otherwise>
                                                <h3>Engar auglýsingar</h3>
                                            </c:otherwise>
                                            </c:choose>
                                            <div class="userImg"><img src="${pageContext.request.contextPath}/resources/images/usericon.png" />${skodaitem.userName}</div>
                                    </div>
                                    <div class="main__col">
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