<!DOCTYPE html>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<html class="grid" lang="is">

    <head>
    	<link href="https://fonts.googleapis.com/css?family=Droid+Serif:400,400i|Raleway:400,700" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Merriweather" rel="stylesheet">        
        <title>Mittsvaedi</title>
        <link rel="stylesheet" type="text/css" href="<c:url value="/css/skodaitem.css"/>"/>
       <!- <link rel="stylesheet" type="text/css" href="<c:url value="/css/grid.css"/>"/> 
        

    </head>
    
    <body>
   <div class="header-container">
        
        <div class="header-bg">
          
     
        <div class="collapsible-menu">
        <input type="checkbox" id="menu">
        <label for="menu">Notendanafn</label>
    	<div class="menu-content">
        <ul>
            <li><a href="#"></a>Mitt svæði</li>
            <li><a href="#"></a>Stillingar</li>
            <li><a href="#"></a>Útskrá</li>
         </ul>


      </div>
          </div>
          <div class="h-wrapper">
            <div class="m-title">
              <h1><a href="/forsida">GEFINS</a></h1>
            </div>  
                </div>
   
        </div>  
                </div>
      
      <main>
 <c:choose>
        <%--If the model has an attribute with the name `items`--%>
        <c:when test="${not empty items}">
            <%--Create a table for the Items--%>
            <table class="Itemtafla">

                <%--For each Item, that is in the list that was passed in the model--%>
                <%--generate a row in the table--%>
                <%--Here we set `postit` as a singular item out of the list `postitNotes`--%>
             
                <c:forEach var="nyauglysing" items="${items}">
                  
                    <tr>
                        <%--We can reference attributes of the Entity by just entering the name we gave--%>
                        <%--it in the singular item var, and then just a dot followed by the attribute name--%>
                        <th>${nyauglysing.itemName}</th>
                     </tr>
                      <tr>
                        <td>${nyauglysing.description}</td>
                         </tr>
                          <tr>
                        <td>${nyauglysing.pickupTime}</td>
                        <td>${nyauglysing.tag}</td>
                        <td><img src="${pageContext.request.contextPath}/resources/images/${mynd}"/></td>
                                              
                    </tr>
                </c:forEach>
            </table>
        </c:when>

        <%--If all tests are false, then do this--%>
        <c:otherwise>
            <h3>Engar auglýsingar</h3>
        </c:otherwise>
    </c:choose>
      </main>
        <footer>
         
		<div class="footer1">
		<a href="/umgefins">Um Gefins.is</a>
        <a href="/notkunarskilmalar">Notkunarskilmálar</a>
        </div>
		<div class="footer2">
        <a href="/samband">Hafa samband</a>
        <a href="/snidugt">Eitthvað sniðugt</a>
		</div>
		</div>
		<div class="footer3">
			<p class="footer2__bottom">© GEFINS 2018</p>
	</footer>
       
       
    </body>
</html>