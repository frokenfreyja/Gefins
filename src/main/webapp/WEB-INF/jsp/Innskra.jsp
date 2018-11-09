<!DOCTYPE html>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<html class="grid" lang="is">

    <head>
    	<link href="https://fonts.googleapis.com/css?family=Droid+Serif:400,400i|Raleway:400,700" rel="stylesheet">
    	<link href="https://fonts.googleapis.com/css?family=Merriweather" rel="stylesheet">        
        <title>Form</title>
        <link rel="stylesheet" type="text/css" href="<c:url value="/css/innskra.css"/>"/>
        
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

		<div class="grid">
          <div class="row">   
            <div class="col col-left">
            <div class="innskra">
			<p class="innskraning">Innskráning</p>
			<sf:form method="POST" modelAttribute="user" action="/innskra">
      
     	    <table class="tafla">
            <tr>
                <td> Notendanafn:</td>
                <%--the `path` attribute matches the `name` attribute of the Entity that was passed in the model--%>
                <td><sf:input path="userName" class="formbox" type="text" placeholder=""/></td>
            </tr>
            <tr>
                <td>Lykilorð:</td>
                    <%--the `path` attribute matches the `note` attribute of the Entity that was passed in the model--%>
                <td><sf:textarea path="password" class="formbox" type="text" placeholder=""/></td>
            </tr>
           
       		</table>
       		<div class="submit">
            <input type="submit" class="innskrabutton" VALUE="Innskrá"/>
            </div>
            </div>
            
            </sf:form>
        </div>
       
       <div class="col col-right">
       <p class="innskraning">Nýr notandi</p>
       <c:choose>
        <%--If the model has an attribute with the name `forms`--%>
        <c:when test="${not empty userinnskra}">
            <%--Create a table for the Postit Notes--%>
            <div class="nyskrapost">

                <%--For each postit note, that is in the list that was passed in the model--%>
                <%--generate a row in the table--%>
                <%--Here we set `postit` as a singular item out of the list `postitNotes`--%>

                        <%--We can reference attributes of the Entity by just entering the name we gave--%>
                        <%--it in the singular item var, and then just a dot followed by the attribute name--%>

                        <%--The String in the note attribute--%>
                        <p>${innskra.userName}</p>
                        <p>${innskra.password}</p>    
            </div>
        </c:when>

        <%--If all tests are false, then do this--%>
        <c:otherwise>
            
        </c:otherwise>
    </c:choose>
    </div>
 
     </div>
          </div>
     
  </main>
       
       
       
    </body>
</html>