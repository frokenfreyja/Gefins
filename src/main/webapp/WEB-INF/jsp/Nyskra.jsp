<!DOCTYPE html>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<html class="grid" lang="is">

    <head>
    	<link href="https://fonts.googleapis.com/css?family=Droid+Serif:400,400i|Raleway:400,700" rel="stylesheet">
        <title>Form</title>
        <link rel="stylesheet" type="text/css" href="<c:url value="/css/nyskra.css"/>"/>
        
    </head>
    
    <body>
      <div class="headbar">
      <a href="/prufa" class="gefins">GEFINS</a>
      <div class="headbar__buttons">
      <button class="headbar__buttonnyskra">Nýskrá</button>
      <button class="headbar__buttoninnskra">Innskrá</button>
      </div>
      </div>
      
      <main>

<div class="grid">
          <div class="row">   
            <div class="col col-left">
<p class="nyauglysing">Nýskráning</p>
<sf:form method="POST" modelAttribute="nyskraning" action="/nyskra">
      
      <table class="tafla">
            <tr>
                <td> Nafn:</td>
                <%--the `path` attribute matches the `name` attribute of the Entity that was passed in the model--%>
                <td><sf:input path="nafn" type="text" placeholder=""/></td>
            </tr>
            <tr>
                <td>Lykilorð:</td>
                    <%--the `path` attribute matches the `note` attribute of the Entity that was passed in the model--%>
                <td><sf:textarea path="lykilord" type="text" placeholder=""/></td>
            </tr>
            <tr>
                <td>Netfang:</td>
                    <%--the `path` attribute matches the `note` attribute of the Entity that was passed in the model--%>
                <td><sf:textarea path="netfang" type="text" placeholder=""/></td>
            </tr>
            <tr>
                <td>Símanúmer:</td>
                    <%--the `path` attribute matches the `note` attribute of the Entity that was passed in the model--%>
                <td><sf:textarea path="simi" type="text" placeholder=""/></td>
            </tr>
            <tr>
                <td>Heimilisfang:</td>
                    <%--the `path` attribute matches the `note` attribute of the Entity that was passed in the model--%>
                <td><sf:textarea path="heimili" type="text" placeholder=""/></td>
            </tr>
            <tr>
                <td>Póstnúmer:</td>
                    <%--the `path` attribute matches the `note` attribute of the Entity that was passed in the model--%>
                <td><sf:textarea path="zip" type="text" maxlength="3" placeholder=""/></td>
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
        <c:when test="${not empty nyskraningar}">
            <%--Create a table for the Postit Notes--%>
            <div class="nyskrapost">

                <%--For each postit note, that is in the list that was passed in the model--%>
                <%--generate a row in the table--%>
                <%--Here we set `postit` as a singular item out of the list `postitNotes`--%>
   
                   
                        <%--We can reference attributes of the Entity by just entering the name we gave--%>
                        <%--it in the singular item var, and then just a dot followed by the attribute name--%>

                        <%--The String in the note attribute--%>
                        <p>${nyskra.nafn}</p>
                        <p>${nyskra.lykilord}</p>
                        <p>${nyskra.netfang}</p>
                        <p>${nyskra.simi}</p>
                        <p>${nyskra.heimili}</p>
                        <p>${nyskra.zip}</p>
                   
           
            </div>
        </c:when>

        <%--If all tests are false, then do this--%>
        <c:otherwise>
            
        </c:otherwise>
    </c:choose>
    </div>
  </main>
       
       
    </body>
</html>