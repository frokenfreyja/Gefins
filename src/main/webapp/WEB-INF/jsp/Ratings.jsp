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
                        <title>Stjörnugjöf</title>
                        <link rel="stylesheet" type="text/css" href="<c:url value=" /css/ratings.css "/>"/>
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
                        <main>
                            <div class="grid">
                                <div class="row">
                                    <div class="col col-extra">
                                    </div>
                                    <div class="col col-main">
                                    <%-- Form til þess að skrá nýja auglýsingu--%>                               
                                        <p class="newrate">Stjörnugjöf</p>
                                        <c:choose>
                                            <c:when test="${not empty skodaitem}">
                                                <table class="newrating">                    
                                                    <tr>
                                                        <c:choose>
                                                            <c:when test="${loggedInUsername == skodaitem.acceptedUser}">
                                                                <td class="title">Gefandi: </td>
                                                                <td class="info">${skodaitem.userName}</td>
                                                            </c:when>
                                                            <c:when test="${loggedInUsername == skodaitem.userName}">
                                                                <td class="title">Þiggjandi: </td>
                                                                <td class="info">${skodaitem.acceptedUser}</td>
                                                            </c:when>
                                                            <c:otherwise>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </tr>     
                                                </table>
                                            </c:when>
                                            </c:choose>
                                        <sf:form method="POST" modelAttribute="user" action="/giveRatings/${skodaitem.id}">
                                            <table class="newrating">
                                                    <td>Stjörnur:</td>
                                                    <td>
                                                        <sf:textarea path="stars" class="formbox" type="text" maxlength="1" placeholder="Stjörnur eru á bilinu 0-5" required="required" />
                                                    </td>   
                                                </tr>
                                            </table>
                                            <div class="submit">
                                                <input type="submit" class="formbutton" VALUE="Í lagi" />
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