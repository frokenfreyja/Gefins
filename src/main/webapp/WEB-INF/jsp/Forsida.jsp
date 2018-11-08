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
        <link rel="stylesheet" type="text/css" href="<c:url value="/css/forsida.css"/>"/>
       <!- <link rel="stylesheet" type="text/css" href="<c:url value="/css/grid.css"/>"/> 
        
        <script>
    
  </script>
    </head>
    
    <body>
    <header id="s0">
      <div class="header-container">
        <div class="lg"></div>
        <div class="layer"></div>
        <div class="header-bg">
          <div class="navbar">
      <div class="nav">
        <a href="/nyskra">Nýskrá</a>
        <a href="/innskra">Innskrá</a>
      </div>
          </div>
          <div class="h-wrapper">
            <div class="m-title">
              <h1>GEFINS</h1>
            </div>
            <div class="undertitle">
              Fyrir jörðina okkar
            </div>
            <div class="btn header-btn">
              <span>Setja inn auglýsingu</span>
              <a href="/nyauglysing"></a>
            </div>
                </div>
    


    </div>
          </div>
        </div>
      </div>
    </header>
    
      
      <main>
      
      	<div class="grid">
          <div class="row">
          	<div class="col col3-left">
              <div class="text">
              <p class="text_fyrirsogn">Leita eftir</p>
              <div class="checkbox_efra">
              <input type="checkbox" id="husgogn" class="checkboxes" /><label for="stadsetningu"> Staðsetningu</label><br>
              </div>
              <p class="text_fyrirsogn">Flokkar</p>
              <div class="checkbox_nedra">
              <input type="checkbox" id="husgogn" class="checkboxes" /><label for="husgogn"> Húsgögn</label><br>
              <input type="checkbox" id="fatnadur" class="checkboxes" /><label for="fatnadur"> Fatnaður</label><br>
              <input type="checkbox" id="barnavorur" class="checkboxes" /><label for="barnavorur"> Barnavörur</label><br>
              <input type="checkbox" id="raftaeki" class="checkboxes" /><label for="raftaeki"> Raftæki</label><br>
              <input type="checkbox" id="verkfaeri" class="checkboxes" /><label for="verkfaeri"> Verkfæri</label><br>
              <input type="checkbox" id="farartaeki" class="checkboxes" /><label for="farartaeki"> Farartæki</label><br>
              <input type="checkbox" id="matur" class="checkboxes" /><label for="matur"> Matur</label><br>
              <input type="checkbox" id="dyr" class="checkboxes" /><label for="dyr"> Dýr</label><br>
              </div>
              
              <div class="borderfront"></div>
              </div>
         
            </div>
            <div class="col col9-right">
          		<div class="listi">
                <p class="auglysing">Auglýsingar</p>
                
    <c:choose>
        <%--If the model has an attribute with the name `items`--%>
        <c:when test="${not empty items}">
            <%--Create a table for the Items--%>
            <table class="formtable">

                <%--For each Item, that is in the list that was passed in the model--%>
                <%--generate a row in the table--%>
                <%--Here we set `postit` as a singular item out of the list `postitNotes`--%>
                <tr>
   						<th>Fæst gefins</th>
   						<th>Lýsing</th>
   						<th>Afhendingartími</th>
   						<th>Flokkur</th>
 					</tr>
                <c:forEach var="nyauglysing" items="${items}">
                  
                    <tr class="rows">
                        <%--We can reference attributes of the Entity by just entering the name we gave--%>
                        <%--it in the singular item var, and then just a dot followed by the attribute name--%>

                        <td>${nyauglysing.itemName}</td>
                        <td>${nyauglysing.description}</td>
                        <td>${nyauglysing.pickupTime}</td>
                        <td>${nyauglysing.tag}</td>
                                              
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