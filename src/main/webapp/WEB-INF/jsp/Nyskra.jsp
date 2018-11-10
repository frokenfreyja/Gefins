<!DOCTYPE html>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<html class="grid" lang="is">

    <head>
    	<link href="https://fonts.googleapis.com/css?family=Droid+Serif:400,400i|Raleway:400,700" rel="stylesheet">
    	<link href="https://fonts.googleapis.com/css?family=Merriweather" rel="stylesheet">        
    	<title>Forsida</title>
        <title>Nyskra</title>
        <link rel="stylesheet" type="text/css" href="<c:url value="/css/nyskra.css"/>"/>
        
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
            <div class="col col1-audur">
            
              
            </div> 
            <div class="col col-left">
            
<p class="nyskraning">Nýskráning</p>
<sf:form method="POST" modelAttribute="user" action="/nyskra">
      
      <table class="tafla">
            <tr>
                <td> Nafn:</td>
                <%--the `path` attribute matches the `name` attribute of the Entity that was passed in the model--%>
                <td><sf:textarea path="userName" class="formbox" type="text" placeholder="" required="required"/></td>
            </tr>
            <tr>
                <td>Lykilorð:</td>
                    <%--the `path` attribute matches the `note` attribute of the Entity that was passed in the model--%>
                <td><sf:textarea path="password" class="formbox" type="text" placeholder="" required="required"/></td>
            </tr>
            <tr>
                <td>Netfang:</td>
                    <%--the `path` attribute matches the `note` attribute of the Entity that was passed in the model--%>
                <td><sf:textarea path="email" class="formbox" type="text" placeholder="" required="required"/></td>
            </tr>
            <tr>
                <td>Símanúmer:</td>
                    <%--the `path` attribute matches the `note` attribute of the Entity that was passed in the model--%>
                <td><sf:textarea path="phone" class="formbox" type="text" maxlength="7" placeholder="" required="required"/></td>
            </tr>
            <tr>
                <td>Heimilisfang:</td>
                    <%--the `path` attribute matches the `note` attribute of the Entity that was passed in the model--%>
                <td><sf:textarea path="location" class="formbox" type="text" placeholder="" required="required"/></td>
            </tr>
            <tr>
                <td>Póstnúmer:</td>
                <%--the `path` attribute matches the `note` attribute of the Entity that was passed in the model--%>
                <td><sf:input path="location" class="formbox" type="text" maxlength="3" placeholder="" required="required"/></td>
            </tr>
            
           
       </table>
       <div class="submit">
       <input type="submit" class="nyskrabutton" VALUE="Nýskrá"/>
       </div>
       </sf:form>
        </div>
       
       <div class="col col-right">
        <p class="nyauglysing">Um mig</p>
       <c:choose>
        <%--If the model has an attribute with the name `forms`--%>
        <c:when test="${not empty userinn}">
            <%--Create a table for the Postit Notes--%>
            <div class="nyskrapost">

                <%--For each postit note, that is in the list that was passed in the model--%>
                <%--generate a row in the table--%>
                <%--Here we set `postit` as a singular item out of the list `postitNotes`--%>

                        <%--We can reference attributes of the Entity by just entering the name we gave--%>
                        <%--it in the singular item var, and then just a dot followed by the attribute name--%>

                        <%--The String in the note attribute--%>
                        <p>${nyskra.userName}</p>
                        <p>${nyskra.password}</p>
                        <p>${nyskra.email}</p>
                        <p>${nyskra.phone}</p>
                        <p>${nyskra.location}</p>
                        <p>${nyskra.zipcode}</p>
                    
            </div>
        </c:when>

        <%--If all tests are false, then do this--%>
        <c:otherwise>
            
        </c:otherwise>
    </c:choose>
    </div>
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