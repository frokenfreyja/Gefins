<!DOCTYPE html>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<html class="grid" lang="is">

    <head>
    	<link href="https://fonts.googleapis.com/css?family=Droid+Serif:400,400i|Raleway:400,700" rel="stylesheet">
    	<link href="https://fonts.googleapis.com/css?family=Merriweather" rel="stylesheet">        
        <title>Ny auglysing</title>
        <link rel="stylesheet" type="text/css" href="<c:url value="/css/nyauglysing.css"/>"/>
        
    <script>
    var loadFile=function(event) {
        var image = document.getElementById('output');
        image.src = URL.createObjectURL(event.target.files[0]);
    }
    </script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    </head>
    
    <body>
       <body>
    <header id="s0">
      <div class="header-container">
        <div class="lg"></div>
        <div class="layer"></div>
        <div class="header-bg">
          <div class="navbar">
     
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
          </div>
          <div class="h-wrapper">
            <div class="m-title">
              <h1><a href="/forsida">GEFINS</a></h1>
            </div>  
                </div>
    </div>
          </div>
        </div>
      </div>
      
      <main>
      
      <div class="grid">
          <div class="row">
          	<div class="col col1-audur">
            
              
            </div>
            
            <div class="col col2-form">
          	  <p class="nyauglysing">Ný auglýsing</p>
          	  
      
      <sf:form method="POST" modelAttribute="item" action="/nyauglysing" enctype="multipart/form-data">
      
      <table class="tafla">
            <tr>
                <td> Heiti auglýsingar:</td>
                <%--the `path` attribute matches the `name` attribute of the Entity that was passed in the model--%>
                <td><sf:textarea path="itemName" class="formbox" type="text" placeholder="" required="required"/></td>
           		<td>Afhendingartími:</td>
                    <%--the `path` attribute matches the `note` attribute of the Entity that was passed in the model--%>
                <td><sf:textarea path="pickupTime" class="formbox" type="text" placeholder="" required="required"/></td>
            </tr>
            <tr>
                <td>Lýsing:</td>
                    <%--the `path` attribute matches the `note` attribute of the Entity that was passed in the model--%>
                <td><sf:textarea path="description" class="formbox" type="text" placeholder="" required="required"/></td>
           	    <td>Sími:</td>
                    <%--the `path` attribute matches the `note` attribute of the Entity that was passed in the model--%>
                <td><sf:textarea path="phone" class="formbox" type="text" placeholder="" required="required"/></td>
            </tr>
            <tr>
            <td>Flokkur:</td>
                    <%--the `path` attribute matches the `note` attribute of the Entity that was passed in the model--%>
                <td>
                <sf:select path="tag" class="checkflokkar">
                <sf:option value="Húsgögn">Húsgögn</sf:option>
                <sf:option value="Fatnaður">Fatnaður</sf:option>
                <sf:option value="Barnavörur">Barnavörur</sf:option>
                <sf:option value="Raftæki">Raftæki</sf:option>
                <sf:option value="Verkfæri">Verkfæri</sf:option>
                <sf:option value="Farartæki">Farartæki</sf:option>
                <sf:option value="Matur">Matur</sf:option>
                <sf:option value="Dýr">Dýr</sf:option>
         		</sf:select>
            </td> 
                <td>Póstnúmer:</td>
                    <%--the `path` attribute matches the `note` attribute of the Entity that was passed in the model--%>
                <td><sf:input path="zipcode" class="formbox" type="text" placeholder="" required="required"/></td>
            </tr>          
            <tr>
                <td><p class="myndTakki">
                    <sf:label for="mynd" path="mynd" style="cursor: pointer;">Setja inn mynd</sf:label>
                </p></td>
                <td>
                    <p><sf:input path="mynd" type="file" id="mynd" accept="image/*" name="mynd" onchange="loadFile(event)" style="display: none;" multiple="multiple" /></p>
                    <p><img path="output" id="output" width="200"></p>
                </td>
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