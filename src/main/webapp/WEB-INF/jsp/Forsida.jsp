<!DOCTYPE html>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<html class="grid" lang="is">

    <head>
    	<link href="https://fonts.googleapis.com/css?family=Droid+Serif:400,400i|Raleway:400,700" rel="stylesheet">
        <title>Forsida</title>
        <link rel="stylesheet" type="text/css" href="<c:url value="/css/prufa.css"/>"/>
       <!- <link rel="stylesheet" type="text/css" href="<c:url value="/css/grid.css"/>"/> 
        
        <script>
    
  </script>
    </head>
    
    <body>
      <div class="headbar">
      <a href="/forsida" class="gefins">GEFINS</a>
      <div class="headbar__buttons">
      <a href="nyskra" class="headbar__buttonnyskra">Nýskrá</a>
      <a href="innskra" class="headbar__buttoninnskra">Innskrá</a>
      </div>
      </div>
      
      <main>
      
      	<div class="grid">
          <div class="row">
          	<div class="col col3-left">
              <div class="text">
              <p class="text_leitaeftir">Leita eftir</p><br>
              <p class="text__trengja">Flokkar</p>
              <input type="checkbox" id="husgogn" class="checkboxes" /><label for="husgogn"> Húsgögn</label><br>
              <input type="checkbox" id="fatnadur" class="checkboxes" /><label for="fatnadur"> Fatnaður</label><br>
              <input type="checkbox" id="barnavorur" class="checkboxes" /><label for="barnavorur"> Barnavörur</label><br>
              <input type="checkbox" id="raftaeki" class="checkboxes" /><label for="raftaeki"> Raftæki</label><br>
              <input type="checkbox" id="verkfaeri" class="checkboxes" /><label for="verkfaeri"> Verkfæri</label><br>
              <input type="checkbox" id="farartaeki" class="checkboxes" /><label for="farartaeki"> Farartæki</label><br>
              <input type="checkbox" id="matur" class="checkboxes" /><label for="matur"> Matur</label><br>
              <input type="checkbox" id="dyr" class="checkboxes" /><label for="dyr"> Dýr</label><br>
              <div class="borderfront"></div>
              </div>
         
            </div>
            <div class="col col9-right">
          		<div class="listi">
                <p class="auglysing">Auglýsingar</p>
                <form action="/nyauglysing">
                <input type="submit" class="nyauglysingbutton" VALUE="Setja inn auglýsingu"/>
                </form>
                 	 <%--Choose what code to generate based on tests that we implement--%>
    <c:choose>
        <%--If the model has an attribute with the name `items`--%>
        <c:when test="${not empty items}">
            <%--Create a table for the Items--%>
            <table class="formtable">

                <%--For each Item, that is in the list that was passed in the model--%>
                <%--generate a row in the table--%>
                <%--Here we set `postit` as a singular item out of the list `postitNotes`--%>
                <c:forEach var="nyauglysing" items="${items}">
                    <tr>
                        <%--We can reference attributes of the Entity by just entering the name we gave--%>
                        <%--it in the singular item var, and then just a dot followed by the attribute name--%>

                        <td>${nyauglysing.itemName}</td>
                        <td>${nyauglysing.description}</td>
                        <td>${nyauglysing.pickupTime}</td>
                        <td><img src="${nyauglysing.image}"></td>
                        
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
          </div>
        </div>
                </div>
            </div>
          </div>
        </div>
        
       </main>
       
    </body>
</html>