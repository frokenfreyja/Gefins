<!DOCTYPE html>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<html class="grid" lang="is">

    <head>
    	<link href="https://fonts.googleapis.com/css?family=Droid+Serif:400,400i|Raleway:400,700" rel="stylesheet">
        <title>Form</title>
        <link rel="stylesheet" type="text/css" href="<c:url value="/css/form.css"/>"/>
        
        <script>
        
      function opnaNyskra() {
         window.open("/nyskra");
      }
      function opnaInnskra() {
      	 window.open("/innskra");
      }
  </script>
    </head>
    
    <body>
      <div class="headbar">
      <a href="/prufa" class="gefins">GEFINS</a>
      <div class="headbar__buttons">
      <button class="headbar__buttonnyskra" onclick="opnaNyskra()">Nýskrá</button>
      <button class="headbar__buttoninnskra" onclick="opnaInnskra()">Innskrá</button>
      </div>
      </div>
      
      <main>
      
      <div class="grid">
          <div class="row">
          	<div class="col col3-left">
              <div class="text">
              <p class="text_leitaeftir">Leita eftir</p><br>
              <p class="text_trengja">Flokkar</p>
              <input type="checkbox" id="husgogn" class="checkboxes" /><label for="husgogn"> Húsgögn</label><br>
              <input type="checkbox" id="fatnadur" class="checkboxes" /><label for="fatnadur"> Fatnaður</label><br>
              <input type="checkbox" id="barnavorur" class="checkboxes" /><label for="barnavorur"> Barnavörur</label><br>
              <input type="checkbox" id="raftaeki" class="checkboxes" /><label for="raftaeki"> Raftæki</label><br>
              <input type="checkbox" id="verkfaeri" class="checkboxes" /><label for="verkfaeri"> Verkfæri</label><br>
              <input type="checkbox" id="farartaeki" class="checkboxes" /><label for="farartaeki"> Farartæki</label><br>
              <input type="checkbox" id="matur" class="checkboxes" /><label for="matur"> Matur</label><br>
              <input type="checkbox" id="dyr" class="checkboxes" /><label for="dyr"> Dýr</label><br>
              <form:checkbox path="Prufa" value="Bird watching"/>
              <div class="borderfront"></div>
              </div>
            </div>
            
            <div class="col col9-right">
          	  <p class="nyauglysing">Setja inn nýja auglýsingu</p>
          	  
      
      <sf:form method="POST" modelAttribute="form" action="/formid">
      
      <table class="tafla">
            <tr>
                <td> Heiti auglýsingar:</td>
                <%--the `path` attribute matches the `name` attribute of the Entity that was passed in the model--%>
                <td><sf:input path="heiti" type="text" placeholder=""/></td>
            </tr>
            <tr>
                <td>Lýsing:</td>
                    <%--the `path` attribute matches the `note` attribute of the Entity that was passed in the model--%>
                <td><sf:textarea path="lysing" type="text" placeholder=""/></td>
            </tr>
            <tr>
                <td>Afhendingartími:</td>
                    <%--the `path` attribute matches the `note` attribute of the Entity that was passed in the model--%>
                <td><sf:textarea path="aftimi" type="text" placeholder=""/></td>
            </tr>
           
       </table>
       <div class="submit">
       <input type="submit" class="formbutton" VALUE="Í lagi"/>
       </div>
       </sf:form>
       
       </div>
      
      
      	
      
        
      </main>
       
       
    </body>
</html>