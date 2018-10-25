<!DOCTYPE html>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<html class="grid" lang="is">

    <head>
    	<link href="https://fonts.googleapis.com/css?family=Droid+Serif:400,400i|Raleway:400,700" rel="stylesheet">
        <title>Form</title>
        <link rel="stylesheet" type="text/css" href="<c:url value="/css/innskra.css"/>"/>
        
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
<p class="nyauglysing">Innskráning</p>
<sf:form method="POST" modelAttribute="form" action="/innskra">
      
      <table class="tafla">
            <tr>
                <td> Notendanafn:</td>
                <%--the `path` attribute matches the `name` attribute of the Entity that was passed in the model--%>
                <td><sf:input path="notenda" type="text" placeholder=""/></td>
            </tr>
            <tr>
                <td>Lykilorð:</td>
                    <%--the `path` attribute matches the `note` attribute of the Entity that was passed in the model--%>
                <td><sf:textarea path="passlogin" type="text" placeholder=""/></td>
            </tr>
           
       </table>
       <div class="submit">
       <input type="submit" class="innskrabutton" VALUE="Innskrá"/>
       </div>
       </sf:form>
        </div>
       
       <div class="col col-right">
      
    </div>
  </main>
       
       
    </body>
</html>