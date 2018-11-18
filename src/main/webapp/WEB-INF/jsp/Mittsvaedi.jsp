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
        <title>Mitt svæði</title>
        <link rel="stylesheet" type="text/css" href="<c:url value="/css/mittsvaedi.css"/>"/>
       <!- <link rel="stylesheet" type="text/css" href="<c:url value="/css/grid.css"/>"/> 
        

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
                                 <a href="#">Stillingar</a>
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
               <h1 class="titill">Mitt svæði</h1>
            </div>
            <div class="main__row">  
               <div class="main__col">
                  <h2>Mínar auglýsingar</h2>
                  <c:choose>
                          <c:when test="${not empty myItems}">
                             <%--Create a table for the Items--%>
                             <table class="formtable">
                                <c:forEach var="myitem" items="${myItems}">
                                   <tr class="rows">
                                      <%--We can reference attributes of the Entity by just entering the name we gave--%>
                                      <%--it in the singular item var, and then just a dot followed by the attribute name--%>
                                      <td><a href="/skodaitemloggedin/${myitem.id}">${myitem.itemName}</a></td>
                                      <td>${myitem.description}</td>
                                      <td>${myitem.pickupTime}</td>
                                      <td>${myitem.tag}</td>
                                      <td>
                                         <div class="img"><img src="${pageContext.request.contextPath}/resources/images/${myitem.myndName}"/></div>
                                      </td>
                                      <td>
                                       <sf:form method="POST" modelAttribute="item" action="/mittsvaedi/${myitem.id}">
                                          <div class="submit">
                                             <input type="submit" class="eydabutton" VALUE="Eyða"/>
                                          </div>
                                       </sf:form>
                                      </td>
                                   </tr>
                                </c:forEach>
                             </table>
                          </c:when>
                          <%--If all tests are false, then do this--%>
                          <c:otherwise>
                             <h3>Engar auglýsingar</h3>
                          </c:otherwise>
                       </c:choose>
                  </div>
                  <div class="main__col">
                     <h2>Hlutir sem ég er í röð fyrir</h2>
                     <c:choose>
                           <%--If the model has an attribute with the name `items`--%>
                           <c:when test="${not empty itemsIWant}">
                              <%--Create a table for the Items--%>
                              <table class="formtable">
                              
                                 <c:forEach var="itemwant" items="${itemsIWant}">
                                    <tr class="rows">
                                       <%--We can reference attributes of the Entity by just entering the name we gave--%>
                                       <%--it in the singular item var, and then just a dot followed by the attribute name--%>
                                       <td><a href="/skodaitemloggedin/${itemwant.id}">${itemwant.itemName}</a></td>
                                       <td>${itemwant.description}</td>
                                       <td>${itemwant.pickupTime}</td>
                                       <td>${itemwant.tag}</td>
                                       <td>
                                          <div class="img"><img src="${pageContext.request.contextPath}/resources/images/${itemwant.myndName}"/></div>
                                       </td>
                                    </tr>
                                 </c:forEach>
                              </table>
                           </c:when>
                           <%--If all tests are false, then do this--%>
                           <c:otherwise>
                              <h3>Engar auglýsingar</h3>
                           </c:otherwise>
                        </c:choose>
                     </div>

      </main>
      <footer class="footer">
        <div class="footer__grid">
           <div class="footer__row">
              <div class="footer__col">
                 <ul class="footer__links">
                    <li class="li"><a class="footer__link" href="/umgefins">Um Gefins</a></li>
                    <li class="li"><a class="footer__link" href="/notkunarskilmalar">Notkunarskilmálar</a></li>
                 </ul>
              </div>
              <div class="footer__col">
                 <ul class="footer__links">
                    <li class="li"><a class="footer__link" href="/samband">Hafa samband</a></li>
                    <li class="li"><a class="footer__link" href="/snidugt">Eitthvað sniðugt</a></li>
                 </ul>
              </div>
              <div class="footer__col">
                 <ul class="footer__links">
                    <li class="li"><a class="footer__link" href="/umgefins">Meira sniðugt</a></li>
                    <li class="li"><a class="footer__link" href="/notkunarskilmalar">Enn þá meira sniðugt</a></li>
                 </ul>
              </div>
              <div class="footer__col">
                 <ul class="footer__links">
                    <li class="li"><a class="footer__link" href="/samband">Eitthvað töff</a></li>
                    <li class="li"><a class="footer__link" href="/snidugt">Meira töff</a></li>
                 </ul>
              </div>
           </div>
        </div>
        <p class="footer__credit">© 2018 GEFINS</p>
     </footer>
       
       
    </body>
</html>