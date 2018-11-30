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
                        <link rel="stylesheet" type="text/css" href="<c:url value=" /css/skodaitemaccepted.css "/>"/>
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
                                    <h1 class="acceptedTitill">Þú hefur verið merktur sem þiggjandi vöru</h1>
                                </div>
                                <div class="main__row">
                                    <div class="extra__col">
                                    </div>
                                    <div class="main__col">
                                        <%--Birtir upplýsingar um item sem notandi hefur verið samþykktur sem þiggjandi fyrir--%>
                                                <c:choose>
                                                    <c:when test="${not empty skodaitem}">
                                                        <table class="oneitemtable">
                                                            <tr>
                                                                <td>
                                                                    <h2 class="myitem">Varan mín: </h2></td>
                                                                <td class="theitem">${skodaitem.itemName}</td>
                                                            </tr>
                                                            <div class="img"><img src="${pageContext.request.contextPath}/resources/images/${skodaitem.myndName}" /></div>
                                    </div>
                                    <tr>
                                        <td class="title">Lýsing: </td>
                                        <td class="info">${skodaitem.description}</td>
                                    </tr>
                                    <tr>
                                        <td class="title">Afhendingartími: </td>
                                        <td class="info">${skodaitem.pickupTime}</td>
                                    </tr>
                                    <tr>
                                        <td class="title">Flokkur: </td>
                                        <td class="info">${skodaitem.tag}</td>
                                    </tr>
                                    </table>
                                    </c:when>
                                    <%--If all tests are false, then do this--%>
                                        <c:otherwise>
                                            <h3>Þessi auglýsing er ekki lengur til</h3>
                                        </c:otherwise>
                                        </c:choose>
                                        <sf:form method="POST" modelAttribute="item" action="/skodaitemirod/${skodaitem.id}">
                                            <div class="submit">
                                                <input type="submit" class="queuebutton" VALUE="Hætta við" onclick="return confirm('Ertu viss um að þú viljir hætta við?');"/>
                                            </div>
                                        </sf:form>
                                </div>
                                <div class="main__col">
                                
                                <%--Birtir ítarlegri upplýsingar um gefanda itemsins--%>                                
                                    <h2 class="userinfo">Upplýsingar um gefandann</h2>
                                    <c:choose>
                                        <c:when test="${not empty skodaitem}">
                                            <table class="giverinfotable">
                                                <tr>
                                                    <td>Notendanafn: </td>
                                                    <td>${skodaitem.userName}</td>
                                                </tr>
                                                <tr>
                                                    <td class="title">Staðsetning: </td>
                                                    <td class="info">${skodaitem.location}</td>
                                                </tr>
                                                <tr>
                                                    <td class="title">Póstnúmer: </td>
                                                    <td class="info">${skodaitem.zipcode}</td>
                                                </tr>
                                                <tr>
                                                    <td class="title">Símanúmer: </td>
                                                    <td class="info">${skodaitem.phone}</td>
                                                </tr>
                                                <tr>
                                                    <td class="title">Stjörnugjöf: </td>
                                                    <td class="info"><img src="${ownerRating}"/></td>
                                                </tr>
                                            </table>
                                        </c:when>
                                        <%--If all tests are false, then do this--%>
                                            <c:otherwise>
                                                <h3>Engar upplýsingar</h3>
                                            </c:otherwise>
                                    </c:choose>
                                    <c:choose>
                                       <c:when test="${not empty userEmail}">
                                           <table class="giverinfotable">
                                                               
                                               <tr>
                                                   <td class="title">Netfang: </td>
                                                   <td class="info">${userEmail}</td>
                                               </tr>
                                               
                                           </table>
                                       </c:when>
                                       <%--If all tests are false, then do this--%>
                                           <c:otherwise>
                                               <h3>Engar upplýsingar</h3>
                                           </c:otherwise>
                                   </c:choose>

                                   <sf:form method="POST" modelAttribute="item" action="/ratings/${skodaitem.id}">
                                   <div class="submit">
                                       <input type="submit" class="queuebutton" VALUE="Stjörnugjöf" />
                                   </div>
                               </sf:form>
                                    
                                </div>
                                <div class="extra__col">
                                </div>
                            </div>
                            </div>
                        </main>
                        <footer class="footer">
                        <div class="footer__grid">
                            <div class="footer__row">
                                <div class="footer__col">
                                    <ul class="footer__links">
                                        <li class="li"><a class="footer__link" href="/notkunarleidbeiningar">Notkunarleiðbeiningar</a></li>                                   
                                    </ul>
                                </div>
                                <div class="footer__col">
                                    <ul class="footer__links">
                                        <li class="li"><a class="footer__link" href="/hafasamband">Hafa samband</a></li>
                                    </ul>
                                </div>
                                <div class="footer__col">
                                    <ul class="footer__links">
                                        <li class="li"><a class="footer__link" href="/umgefins">Um Gefins</a></li>     
                                    </ul>                               
                                </div>
                                <div class="footer__col">
                                    <ul class="footer__links">
                                        <li class="li"><a class="footer__link" href="/notkunarskilmalar">Notkunarskilmálar</a></li>                                    </ul>                                        
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <p class="footer__credit">© 2018 GEFINS</p>
                    </footer>
                </body>
                </html>