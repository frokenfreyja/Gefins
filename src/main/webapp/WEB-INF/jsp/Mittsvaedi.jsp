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
        <link rel="stylesheet" type="text/css" href="<c:url value="/css/mittsvaedi.css"/>"/>
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
      <div class="grid">
          <div class="row">  
           <div class="col col-100">
           <h1>Mitt svæði</h1>
           
                 </div>
           
            <div class="col col-left">
            
<p class="minarauglysingar">Mínar auglýsingar</p>

        </div>
       
       <div class="col col-right">
        <p class="minarradir">Mínar raðir</p>
     
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