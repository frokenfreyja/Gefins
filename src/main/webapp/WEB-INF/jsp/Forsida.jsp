<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<html class="grid" lang="is">
   <head>
      <link href="https://fonts.googleapis.com/css?family=Droid+Serif:400,400i|Raleway:400,700" rel="stylesheet">
      <link href="https://fonts.googleapis.com/css?family=Merriweather" rel="stylesheet">
      <link href="https://fonts.googleapis.com/css?family=Fjalla+One|Old+Standard+TT:400,700|Oswald:400,600|Vidaloka" rel="stylesheet">
      <title>Forsida</title>
      <link rel="stylesheet" type="text/css" href="
      <c:url value="/css/forsida.css"/>
      "/>
      <!- <link rel="stylesheet" type="text/css" href="
      <c:url value="/css/grid.css"/>
      "/> 
   </head>
   <body>
      <script>
         $('input[type="checkbox"]').on('change', function() {
    $('input[name="' + this.name + '"]').not(this).prop('checked', false);
});
      </script>
      <header>
         <div class="header-container">
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
               </div>
            </div>
         </div>
      </header>
      <main>
         <div class="grid">
            <div class="row">
               <div class="col col3-left">
                  <div class="text">
                     <p class="text_fyrirsogn">Staðsetning</p>
                     <form id="leitazip" action="sortzip">                    
                     
                           <div class="flokkar-tree">
                               <label class="flokkar-tree-item layer1">
                                   <input class="flokkar-tree-cb" type="checkbox">
                                   <span class="flokkar-tree-label">Höfuðborgarsvæðið</span>
                                   <div class="flokkar-tree-branches">
                           
                                       <label class="flokkar-tree-item layer2">
                                           <input class="flokkar-tree-cb" type="checkbox">
                                           <span class="flokkar-tree-label">Reykjavík</span>
                                           <div class="flokkar-tree-branches">
                                               <label class="flokkar-tree-item layer3">
                                                   <input class="flokkar-tree-cb" value="101" name="zip" type="checkbox" onChange="this.form.submit()">
                                                   <span class="flokkar-tree-label">101 - Miðbær/Vesturbær</span>
                                               </label>
                                               <label class="flokkar-tree-item layer3">
                                                   <input class="flokkar-tree-cb" value="103" name="zip" type="checkbox" onChange="this.form.submit()">
                                                   <span class="flokkar-tree-label">103 - Kringlan/Hvassaleyti</span>
                                               </label>
                                               <label class="flokkar-tree-item layer3">
                                                   <input class="flokkar-tree-cb" value="104" name="zip" type="checkbox" onChange="this.form.submit()">
                                                   <span class="flokkar-tree-label">104 - Vogar</span>
                                               </label>
                                               <label class="flokkar-tree-item layer3">
                                                   <input class="flokkar-tree-cb" value="105" name="zip" type="checkbox" onChange="this.form.submit()">
                                                   <span class="flokkar-tree-label">105 - Austurbær</span>
                                               </label>
                                               <label class="flokkar-tree-item layer3">
                                                   <input class="flokkar-tree-cb" value="107" name="zip" type="checkbox" onChange="this.form.submit()">
                                                   <span class="flokkar-tree-label">107 - Vesturbær</span>
                                               </label>
                                               <label class="flokkar-tree-item layer3">
                                                   <input class="flokkar-tree-cb" value="108" name="zip" type="checkbox" onChange="this.form.submit()">
                                                   <span class="flokkar-tree-label">108 - Austurbær</span>
                                               </label>
                                               <label class="flokkar-tree-item layer3">
                                                   <input class="flokkar-tree-cb" value="109" name="zip" type="checkbox" onChange="this.form.submit()">
                                                   <span class="flokkar-tree-label">109 - Bakkar/Seljahverfi</span>
                                               </label>
                                               <label class="flokkar-tree-item layer3">
                                                   <input class="flokkar-tree-cb" value="110" name="zip" type="checkbox" onChange="this.form.submit()">
                                                   <span class="flokkar-tree-label">110 - Árbær/Selás</span>
                                               </label>
                                               <label class="flokkar-tree-item layer3">
                                                   <input class="flokkar-tree-cb" value="111" name="zip" type="checkbox" onChange="this.form.submit()">
                                                   <span class="flokkar-tree-label">111 - Berg/Hólar/Fell</span>
                                               </label>
                                               <label class="flokkar-tree-item layer3">
                                                   <input class="flokkar-tree-cb" value="112" name="zip" type="checkbox" onChange="this.form.submit()">
                                                   <span class="flokkar-tree-label">112 - Grafarvogur</span>
                                               </label>
                                               <label class="flokkar-tree-item layer3">
                                                   <input class="flokkar-tree-cb" value="113" name="zip" type="checkbox" onChange="this.form.submit()">
                                                   <span class="flokkar-tree-label">113 - Grafarholt</span>
                                               </label>
                                               <label class="flokkar-tree-item layer3">
                                                   <input class="flokkar-tree-cb" value="114" name="zip" type="checkbox" onChange="this.form.submit()">
                                                   <span class="flokkar-tree-label">114 - Reykjavík</span>
                                               </label>
                                               <label class="flokkar-tree-item layer3">
                                                   <input class="flokkar-tree-cb" value="116" name="zip" type="checkbox" onChange="this.form.submit()">
                                                   <span class="flokkar-tree-label">116 - Kjalarnes</span>
                                               </label>
                                           </div>
                                       </label>
                           
                                       <label class="flokkar-tree-item layer2">
                                           <input class="flokkar-tree-cb" type="checkbox">
                                           <span class="flokkar-tree-label">Seltjarnarnes</span>
                                           <div class="flokkar-tree-branches">
                                               <label class="flokkar-tree-item layer3">
                                                   <input class="flokkar-tree-cb" value="170" name="zip" type="checkbox" onChange="this.form.submit()">
                                                   <span class="flokkar-tree-label">170 - Seltjarnarnes</span>
                                               </label>
                                           </div>
                                       </label>
                           
                                       <label class="flokkar-tree-item layer2">
                                           <input class="flokkar-tree-cb" type="checkbox">
                                           <span class="flokkar-tree-label">Kópavogur</span>
                                           <div class="flokkar-tree-branches">
                                               <label class="flokkar-tree-item layer3">
                                                   <input class="flokkar-tree-cb" value="200" name="zip" type="checkbox" onChange="this.form.submit()">
                                                   <span class="flokkar-tree-label">200 - Kópavogur</span>
                                               </label>
                                               <label class="flokkar-tree-item layer3">
                                                   <input class="flokkar-tree-cb" value="201" name="zip" type="checkbox" onChange="this.form.submit()">
                                                   <span class="flokkar-tree-label">201 - Kópavogur</span>
                                               </label>
                                               <label class="flokkar-tree-item layer3">
                                                   <input class="flokkar-tree-cb" value="203" name="zip" type="checkbox" onChange="this.form.submit()">
                                                   <span class="flokkar-tree-label">203 - Kópavogur</span>
                                               </label>
                                           </div>
                                       </label>
                           
                                       <label class="flokkar-tree-item layer2">
                                           <input class="flokkar-tree-cb" type="checkbox">
                                           <span class="flokkar-tree-label">Garðabær</span>
                                           <div class="flokkar-tree-branches">
                                               <label class="flokkar-tree-item layer3">
                                                   <input class="flokkar-tree-cb" value="210" name="zip" type="checkbox" onChange="this.form.submit()">
                                                   <span class="flokkar-tree-label">210 - Garðabær</span>
                                               </label>
                                               <label class="flokkar-tree-item layer3">
                                                   <input class="flokkar-tree-cb" value="225" name="zip" type="checkbox" onChange="this.form.submit()">
                                                   <span class="flokkar-tree-label">225 - Álftanes</span>
                                               </label>
                                           </div>
                                       </label>
                           
                                       <label class="flokkar-tree-item layer2">
                                           <input class="flokkar-tree-cb" type="checkbox">
                                           <span class="flokkar-tree-label">Hafnarfjörður</span>
                                           <div class="flokkar-tree-branches">
                                               <label class="flokkar-tree-item layer3">
                                                   <input class="flokkar-tree-cb" value="220" name="zip" type="checkbox" onChange="this.form.submit()">
                                                   <span class="flokkar-tree-label">220 - Hafnarfjörður</span>
                                               </label>
                                               <label class="flokkar-tree-item layer3">
                                                   <input class="flokkar-tree-cb" value="221" name="zip" type="checkbox" onChange="this.form.submit()">
                                                   <span class="flokkar-tree-label">221 - Hafnarfjörður</span>
                                               </label>
                                           </div>
                                       </label>
                           
                                       <label class="flokkar-tree-item layer2">
                                           <input class="flokkar-tree-cb" type="checkbox">
                                           <span class="flokkar-tree-label">Mosfellsbær</span>
                                           <div class="flokkar-tree-branches">
                                               <label class="flokkar-tree-item layer3">
                                                   <input class="flokkar-tree-cb" value="270" name="zip" type="checkbox" onChange="this.form.submit()">
                                                   <span class="flokkar-tree-label">270 - Mosfellsbær</span>
                                               </label>
                                               <label class="flokkar-tree-item layer3">
                                                   <input class="flokkar-tree-cb" value="271" name="zip" type="checkbox" onChange="this.form.submit()">
                                                   <span class="flokkar-tree-label">271 - Mosfellsbær</span>
                                               </label>
                                               <label class="flokkar-tree-item layer3">
                                                   <input class="flokkar-tree-cb" value="276" name="zip" type="checkbox" onChange="this.form.submit()">
                                                   <span class="flokkar-tree-label">276 - Mosfellsbær</span>
                                               </label>
                                           </div>
                                       </label>
                                   </div>
                               </label>
                           
                               <label class="flokkar-tree-item layer1">
                                   <input class="flokkar-tree-cb" type="checkbox">
                                   <span class="flokkar-tree-label">Vesturland</span>
                                   <div class="flokkar-tree-branches">
                           
                                       <label class="flokkar-tree-item layer2">
                                           <input class="flokkar-tree-cb" value="300" name="zip" type="checkbox" onChange="this.form.submit()">
                                           <span class="flokkar-tree-label">300 - Akranes</span>
                                       </label>
                           
                                       <label class="flokkar-tree-item layer2">
                                           <input class="flokkar-tree-cb" value="301" name="zip" type="checkbox" onChange="this.form.submit()">
                                           <span class="flokkar-tree-label">301 - Akranes dreifbýli</span>
                                       </label>
                           
                                       <label class="flokkar-tree-item layer2">
                                           <input class="flokkar-tree-cb" value="310" name="zip" type="checkbox" onChange="this.form.submit()">
                                           <span class="flokkar-tree-label">310 - Borgarnes</span>
                                       </label>
                           
                                       <label class="flokkar-tree-item layer2">
                                           <input class="flokkar-tree-cb" value="311" name="zip" type="checkbox" onChange="this.form.submit()">
                                           <span class="flokkar-tree-label">311 - Borgarnes deifbýli</span>
                                       </label>
                           
                                       <label class="flokkar-tree-item layer2">
                                           <input class="flokkar-tree-cb" value="320" name="zip" type="checkbox" onChange="this.form.submit()">
                                           <span class="flokkar-tree-label">320 - Reykholt Borgarfirði</span>
                                       </label>
                           
                                       <label class="flokkar-tree-item layer2">
                                           <input class="flokkar-tree-cb" value="340" name="zip" type="checkbox" onChange="this.form.submit()">
                                           <span class="flokkar-tree-label">340 - Stykkishólmur</span>
                                       </label>
                           
                                       <label class="flokkar-tree-item layer2">
                                           <input class="flokkar-tree-cb" value="345" name="zip" type="checkbox" onChange="this.form.submit()">
                                           <span class="flokkar-tree-label">345 - Flatey Breiðafirði</span>
                                       </label>
                           
                                       <label class="flokkar-tree-item layer2">
                                           <input class="flokkar-tree-cb" value="350" name="zip" type="checkbox" onChange="this.form.submit()">
                                           <span class="flokkar-tree-label">350 - Grundarfjörður</span>
                                       </label>
                           
                                       <label class="flokkar-tree-item layer2">
                                           <input class="flokkar-tree-cb" value="355" name="zip" type="checkbox" onChange="this.form.submit()">
                                           <span class="flokkar-tree-label">355 - Ólafsvík</span>
                                       </label>
                           
                                       <label class="flokkar-tree-item layer2">
                                           <input class="flokkar-tree-cb" value="356" name="zip" type="checkbox" onChange="this.form.submit()">
                                           <span class="flokkar-tree-label">356- Snæfellsbær</span>
                                       </label>
                           
                                       <label class="flokkar-tree-item layer2">
                                           <input class="flokkar-tree-cb" value="360" name="zip" type="checkbox" onChange="this.form.submit()">
                                           <span class="flokkar-tree-label">360 - Hellissandur</span>
                                       </label>
                           
                                       <label class="flokkar-tree-item layer2">
                                           <input class="flokkar-tree-cb" value="370" name="zip" type="checkbox" onChange="this.form.submit()">
                                           <span class="flokkar-tree-label">370 - Búðardalur</span>
                                       </label>
                           
                                       <label class="flokkar-tree-item layer2">
                                           <input class="flokkar-tree-cb" value="371" name="zip" type="checkbox" onChange="this.form.submit()">
                                           <span class="flokkar-tree-label">371 - Búðardalur dreifbýli</span>
                                       </label>
                           
                                       <label class="flokkar-tree-item layer2">
                                           <input class="flokkar-tree-cb" value="380" name="zip" type="checkbox" onChange="this.form.submit()">
                                           <span class="flokkar-tree-label">380 - Reykhólahreppur</span>
                                       </label>
                           
                                   </div>
                               </label>
                           
                               <label class="flokkar-tree-item layer1">
                                   <input class="flokkar-tree-cb" type="checkbox">
                                   <span class="flokkar-tree-label">Vestfirðir</span>
                                   <div class="flokkar-tree-branches">
                           
                                       <label class="flokkar-tree-item layer2">
                                           <input class="flokkar-tree-cb" value="400" name="zip" type="checkbox" onChange="this.form.submit()">
                                           <span class="flokkar-tree-label">400 - Ísafjörður</span>
                                       </label>
                           
                                       <label class="flokkar-tree-item layer2">
                                           <input class="flokkar-tree-cb" value="401" name="zip" type="checkbox" onChange="this.form.submit()">
                                           <span class="flokkar-tree-label">401 - Ísafjörður dreifbýli</span>
                                       </label>
                           
                                       <label class="flokkar-tree-item layer2">
                                           <input class="flokkar-tree-cb" value="410" name="zip" type="checkbox" onChange="this.form.submit()">
                                           <span class="flokkar-tree-label">410 - Hnífsdalur</span>
                                       </label>
                           
                                       <label class="flokkar-tree-item layer2">
                                           <input class="flokkar-tree-cb" value="415" name="zip"type="checkbox" onChange="this.form.submit()">
                                           <span class="flokkar-tree-label">415 - Bolungarvík</span>
                                       </label>
                           
                                       <label class="flokkar-tree-item layer2">
                                           <input class="flokkar-tree-cb" value="420" name="zip" type="checkbox" onChange="this.form.submit()">
                                           <span class="flokkar-tree-label">420 - Súðavík</span>
                                       </label>
                           
                                       <label class="flokkar-tree-item layer2">
                                           <input class="flokkar-tree-cb" value="425" name="zip" type="checkbox" onChange="this.form.submit()">
                                           <span class="flokkar-tree-label">425 - Flateyri</span>
                                       </label>
                           
                                       <label class="flokkar-tree-item layer2">
                                           <input class="flokkar-tree-cb" value="430" name="zip" type="checkbox" onChange="this.form.submit()">
                                           <span class="flokkar-tree-label">430 - Suðureyri</span>
                                       </label>
                           
                                       <label class="flokkar-tree-item layer2">
                                           <input class="flokkar-tree-cb" value="450" name="zip" type="checkbox" onChange="this.form.submit()">
                                           <span class="flokkar-tree-label">450 - Patreksfjörður</span>
                                       </label>
                           
                                       <label class="flokkar-tree-item layer2">
                                           <input class="flokkar-tree-cb" value="451" name="zip" type="checkbox" onChange="this.form.submit()">
                                           <span class="flokkar-tree-label">451 - Patreksfjörður dreifbýli</span>
                                       </label>
                           
                                       <label class="flokkar-tree-item layer2">
                                           <input class="flokkar-tree-cb" value="460" name="zip" type="checkbox" onChange="this.form.submit()">
                                           <span class="flokkar-tree-label">460 - Tálknafjörður</span>
                                       </label>
                           
                                       <label class="flokkar-tree-item layer2">
                                           <input class="flokkar-tree-cb" value="465" name="zip" type="checkbox" onChange="this.form.submit()">
                                           <span class="flokkar-tree-label">465 - Bíldudalur</span>
                                       </label>
                           
                                       <label class="flokkar-tree-item layer2">
                                           <input class="flokkar-tree-cb" value="470" name="zip" type="checkbox" onChange="this.form.submit()">
                                           <span class="flokkar-tree-label">470 - Þingeyri</span>
                                       </label>
                           
                                       <label class="flokkar-tree-item layer2">
                                           <input class="flokkar-tree-cb" value="471" name="zip" type="checkbox" onChange="this.form.submit()">
                                           <span class="flokkar-tree-label">471 - Þingeyri dreifbýli</span>
                                       </label>
                           
                                       <label class="flokkar-tree-item layer2">
                                           <input class="flokkar-tree-cb" value="510" name="zip" type="checkbox" onChange="this.form.submit()">
                                           <span class="flokkar-tree-label">510 - Hólmavík</span>
                                       </label>
                           
                                       <label class="flokkar-tree-item layer2">
                                           <input class="flokkar-tree-cb" value="520" name="zip" type="checkbox" onChange="this.form.submit()">
                                           <span class="flokkar-tree-label">520 - Drangsnes</span>
                                       </label>
                           
                                       <label class="flokkar-tree-item layer2">
                                           <input class="flokkar-tree-cb" value="524" name="zip" type="checkbox" onChange="this.form.submit()">
                                           <span class="flokkar-tree-label">524 - Árneshreppur</span>
                                       </label>
                                   </div>
                               </label>
                               <label class="flokkar-tree-item layer1">
                                   <input class="flokkar-tree-cb" type="checkbox">
                                   <span class="flokkar-tree-label">Norðurland</span>
                                   <div class="flokkar-tree-branches">
                           
                                       <label class="flokkar-tree-item layer2">
                                           <input class="flokkar-tree-cb" value="500" name="zip" type="checkbox" onChange="this.form.submit()">
                                           <span class="flokkar-tree-label">500 - Staður</span>
                                       </label>
                           
                                       <label class="flokkar-tree-item layer2">
                                           <input class="flokkar-tree-cb" value="530" name="zip" type="checkbox" onChange="this.form.submit()">
                                           <span class="flokkar-tree-label">530 - Hvammstangi</span>
                                       </label>
                           
                                       <label class="flokkar-tree-item layer2">
                                           <input class="flokkar-tree-cb" value="531" name="zip" type="checkbox" onChange="this.form.submit()">
                                           <span class="flokkar-tree-label">531 - Hvammstangi dreifbýli</span>
                                       </label>
                           
                                       <label class="flokkar-tree-item layer2">
                                           <input class="flokkar-tree-cb" value="540" name="zip" type="checkbox" onChange="this.form.submit()">
                                           <span class="flokkar-tree-label">540 - Blönduós</span>
                                       </label>
                           
                                       <label class="flokkar-tree-item layer2">
                                           <input class="flokkar-tree-cb" value="541" name="zip" type="checkbox" onChange="this.form.submit()">
                                           <span class="flokkar-tree-label">541 - Blönduós Dreifbýli</span>
                                       </label>
                           
                                       <label class="flokkar-tree-item layer2">
                                           <input class="flokkar-tree-cb" value="545" name="zip" type="checkbox" onChange="this.form.submit()">
                                           <span class="flokkar-tree-label">545 - Skagaströnd</span>
                                       </label>
                           
                                       <label class="flokkar-tree-item layer2">
                                           <input class="flokkar-tree-cb" value="550" name="zip" type="checkbox" onChange="this.form.submit()">
                                           <span class="flokkar-tree-label">550 - Sauðárkrókur</span>
                                       </label>
                           
                                       <label class="flokkar-tree-item layer2">
                                           <input class="flokkar-tree-cb" value="551" name="zip" type="checkbox" onChange="this.form.submit()">
                                           <span class="flokkar-tree-label">551 - Sauðárkrókur Dreifbýli</span>
                                       </label>
                           
                                       <label class="flokkar-tree-item layer2">
                                           <input class="flokkar-tree-cb" value="560" name="zip" type="checkbox" onChange="this.form.submit()">
                                           <span class="flokkar-tree-label">560 - Varmahlíð</span>
                                       </label>
                           
                                       <label class="flokkar-tree-item layer2">
                                           <input class="flokkar-tree-cb" value="565" name="zip" type="checkbox" onChange="this.form.submit()">
                                           <span class="flokkar-tree-label">565 - Hofsós</span>
                                       </label>
                           
                                       <label class="flokkar-tree-item layer2">
                                           <input class="flokkar-tree-cb" value="566" name="zip" type="checkbox" onChange="this.form.submit()">
                                           <span class="flokkar-tree-label">566 - Hofsós Dreifbýli</span>
                                       </label>
                           
                                       <label class="flokkar-tree-item layer2">
                                           <input class="flokkar-tree-cb" value="570" name="zip" type="checkbox" onChange="this.form.submit()">
                                           <span class="flokkar-tree-label">570 - Fljót</span>
                                       </label>
                           
                                       <label class="flokkar-tree-item layer2">
                                           <input class="flokkar-tree-cb" value="580" name="zip" type="checkbox" onChange="this.form.submit()">
                                           <span class="flokkar-tree-label">580 - Siglufjörður</span>
                                       </label>
                           
                                       <label class="flokkar-tree-item layer2">
                                           <input class="flokkar-tree-cb" value="600" name="zip" type="checkbox" onChange="this.form.submit()">
                                           <span class="flokkar-tree-label">600 - Akureyri</span>
                                       </label>
                           
                                       <label class="flokkar-tree-item layer2">
                                           <input class="flokkar-tree-cb" value="601" name="zip" type="checkbox" onChange="this.form.submit()">
                                           <span class="flokkar-tree-label">601 - Akureyri Dreifbýli</span>
                                       </label>
                           
                                       <label class="flokkar-tree-item layer2">
                                           <input class="flokkar-tree-cb" value="603" name="zip" type="checkbox" onChange="this.form.submit()">
                                           <span class="flokkar-tree-label">603 - Akureyri Dreifbýli</span>
                                       </label>
                           
                                       <label class="flokkar-tree-item layer2">
                                           <input class="flokkar-tree-cb" value="610" name="zip" type="checkbox" onChange="this.form.submit()">
                                           <span class="flokkar-tree-label">610 - Grenivík</span>
                                       </label>
                           
                                       <label class="flokkar-tree-item layer2">
                                           <input class="flokkar-tree-cb" value="611" name="zip" type="checkbox" onChange="this.form.submit()">
                                           <span class="flokkar-tree-label">611 - Grímsey</span>
                                       </label>
                           
                                       <label class="flokkar-tree-item layer2">
                                           <input class="flokkar-tree-cb" value="620" name="zip" type="checkbox" onChange="this.form.submit()">
                                           <span class="flokkar-tree-label">620 - Dalvík</span>
                                       </label>
                                       
                                       <label class="flokkar-tree-item layer2">
                                           <input class="flokkar-tree-cb" value="621" name="zip" type="checkbox" onChange="this.form.submit()">
                                           <span class="flokkar-tree-label">621 - Dalvík Dreifbýli</span>
                                       </label>
                           
                                       <label class="flokkar-tree-item layer2">
                                           <input class="flokkar-tree-cb" value="625" name="zip" type="checkbox" onChange="this.form.submit()">
                                           <span class="flokkar-tree-label">625 - Ólafsfjörður</span>
                                       </label>
                           
                                       <label class="flokkar-tree-item layer2">
                                           <input class="flokkar-tree-cb" value="630" name="zip" type="checkbox" onChange="this.form.submit()">
                                           <span class="flokkar-tree-label">630 - Hrísey</span>
                                       </label>
                           
                                       <label class="flokkar-tree-item layer2">
                                           <input class="flokkar-tree-cb" value="640" name="zip" type="checkbox" onChange="this.form.submit()">
                                           <span class="flokkar-tree-label">640 - Húsavík</span>
                                       </label>
                           
                                       <label class="flokkar-tree-item layer2">
                                           <input class="flokkar-tree-cb" value="641" name="zip" type="checkbox" onChange="this.form.submit()">
                                           <span class="flokkar-tree-label">641 - Húsavík Dreifbýli</span>
                                       </label>
                           
                                       <label class="flokkar-tree-item layer2">
                                           <input class="flokkar-tree-cb" value="645" name="zip" type="checkbox" onChange="this.form.submit()">
                                           <span class="flokkar-tree-label">645 - Fosshóll</span>
                                       </label>
                           
                                       <label class="flokkar-tree-item layer2">
                                           <input class="flokkar-tree-cb" value="650" name="zip" type="checkbox" onChange="this.form.submit()">
                                           <span class="flokkar-tree-label">650 - Laugar</span>
                                       </label>
                           
                                       <label class="flokkar-tree-item layer2">
                                           <input class="flokkar-tree-cb" value="660" name="zip" type="checkbox" onChange="this.form.submit()">
                                           <span class="flokkar-tree-label">660 - Mývatn</span>
                                       </label>
                           
                                       <label class="flokkar-tree-item layer2">
                                           <input class="flokkar-tree-cb" value="670" name="zip" type="checkbox" onChange="this.form.submit()">
                                           <span class="flokkar-tree-label">670 - Kópasker</span>
                                       </label>
                           
                                       <label class="flokkar-tree-item layer2">
                                           <input class="flokkar-tree-cb" value="671" name="zip" type="checkbox" onChange="this.form.submit()">
                                           <span class="flokkar-tree-label">671 - Kópasker Dreifbýli</span>
                                       </label>
                           
                                       <label class="flokkar-tree-item layer2">
                                           <input class="flokkar-tree-cb" value="675" name="zip" type="checkbox" onChange="this.form.submit()">
                                           <span class="flokkar-tree-label">675 - Raufarhöfn</span>
                                       </label>
                           
                                       <label class="flokkar-tree-item layer2">
                                           <input class="flokkar-tree-cb" value="680" name="zip" type="checkbox" onChange="this.form.submit()">
                                           <span class="flokkar-tree-label">680 - Þórshöfn</span>
                                       </label>
                           
                                       <label class="flokkar-tree-item layer2">
                                           <input class="flokkar-tree-cb" value="681" name="zip" type="checkbox" onChange="this.form.submit()">
                                           <span class="flokkar-tree-label">681 - Þórshöfn Dreifbýli</span>
                                       </label>
                                   </div>
                               </label>
                               <label class="flokkar-tree-item layer1">
                                   <input class="flokkar-tree-cb" type="checkbox">
                                   <span class="flokkar-tree-label">Austurland</span>
                                   <div class="flokkar-tree-branches">
                           
                                       <label class="flokkar-tree-item layer2">
                                           <input class="flokkar-tree-cb" value="685" name="zip" type="checkbox" onChange="this.form.submit()">
                                           <span class="flokkar-tree-label">685 - Bakkafjörður</span>
                                       </label>
                           
                                       <label class="flokkar-tree-item layer2">
                                           <input class="flokkar-tree-cb" value="690" name="zip" type="checkbox" onChange="this.form.submit()">
                                           <span class="flokkar-tree-label">690 - Vopnafjörður</span>
                                       </label>
                           
                                       <label class="flokkar-tree-item layer2">
                                           <input class="flokkar-tree-cb" value="700" name="zip" type="checkbox" onChange="this.form.submit()">
                                           <span class="flokkar-tree-label">700 - Egilsstaðir</span>
                                       </label>
                           
                                       <label class="flokkar-tree-item layer2">
                                           <input class="flokkar-tree-cb" value="701" name="zip" type="checkbox" onChange="this.form.submit()">
                                           <span class="flokkar-tree-label">701 - Egilsstaðir Dreifbýli</span>
                                       </label>
                           
                                       <label class="flokkar-tree-item layer2">
                                           <input class="flokkar-tree-cb" value="710" name="zip" type="checkbox" onChange="this.form.submit()">
                                           <span class="flokkar-tree-label">710 - Seyðisfjörður</span>
                                       </label>
                           
                                       <label class="flokkar-tree-item layer2">
                                           <input class="flokkar-tree-cb" value="715" name="zip" type="checkbox" onChange="this.form.submit()">
                                           <span class="flokkar-tree-label">715 - Mjóifjörður</span>
                                       </label>
                           
                                       <label class="flokkar-tree-item layer2">
                                           <input class="flokkar-tree-cb" value="720" name="zip" type="checkbox" onChange="this.form.submit()">
                                           <span class="flokkar-tree-label">720 - Borgarfjörður Eystri</span>
                                       </label>
                           
                                       <label class="flokkar-tree-item layer2">
                                           <input class="flokkar-tree-cb" value="730" name="zip" type="checkbox" onChange="this.form.submit()">
                                           <span class="flokkar-tree-label">730 - Reyðarfjörður</span>
                                       </label>
                           
                                       <label class="flokkar-tree-item layer2">
                                           <input class="flokkar-tree-cb" value="735" name="zip" type="checkbox" onChange="this.form.submit()">
                                           <span class="flokkar-tree-label">735 - Eskifjörður</span>
                                       </label>
                           
                                       <label class="flokkar-tree-item layer2">
                                           <input class="flokkar-tree-cb" value="740" name="zip" type="checkbox" onChange="this.form.submit()">
                                           <span class="flokkar-tree-label">740 - Neskaupstaður</span>
                                       </label>
                           
                                       <label class="flokkar-tree-item layer2">
                                           <input class="flokkar-tree-cb" value="750" name="zip" type="checkbox" onChange="this.form.submit()">
                                           <span class="flokkar-tree-label">750 - Fáskrúðsfjörður</span>
                                       </label>
                           
                                       <label class="flokkar-tree-item layer2">
                                           <input class="flokkar-tree-cb" value="755" name="zip" type="checkbox" onChange="this.form.submit()">
                                           <span class="flokkar-tree-label">755 - Stöðvarfjörður</span>
                                       </label>
                           
                                       <label class="flokkar-tree-item layer2">
                                           <input class="flokkar-tree-cb" value="760" name="zip" type="checkbox" onChange="this.form.submit()">
                                           <span class="flokkar-tree-label">760 - Breiðdalsvík</span>
                                       </label>
                           
                                       <label class="flokkar-tree-item layer2">
                                           <input class="flokkar-tree-cb" value="765" name="zip" type="checkbox" onChange="this.form.submit()">
                                           <span class="flokkar-tree-label">765 - Djúpivogur</span>
                                       </label>
                           
                                       <label class="flokkar-tree-item layer2">
                                           <input class="flokkar-tree-cb" value="780" name="zip" type="checkbox" onChange="this.form.submit()">
                                           <span class="flokkar-tree-label">780 - Höfn í Hornafirði</span>
                                       </label>
                           
                                       <label class="flokkar-tree-item layer2">
                                           <input class="flokkar-tree-cb" value="781" name="zip" type="checkbox" onChange="this.form.submit()">
                                           <span class="flokkar-tree-label">781 - Höfn í Hornafirði Dreifbýli</span>
                                       </label>
                           
                                       <label class="flokkar-tree-item layer2">
                                           <input class="flokkar-tree-cb" value="785" name="zip" type="checkbox" onChange="this.form.submit()">
                                           <span class="flokkar-tree-label">785 - Öræfi</span>
                                       </label>
                                      </div>
                               </label>   
                               <label class="flokkar-tree-item layer1">
                                   <input class="flokkar-tree-cb" type="checkbox">
                                   <span class="flokkar-tree-label">Suðurland</span>
                                   <div class="flokkar-tree-branches">
                           
                                       <label class="flokkar-tree-item layer2">
                                           <input class="flokkar-tree-cb" value="800" name="zip" type="checkbox" onChange="this.form.submit()">
                                           <span class="flokkar-tree-label">800 - Selfoss</span>
                                       </label>
                           
                                       <label class="flokkar-tree-item layer2">
                                           <input class="flokkar-tree-cb" value="801" name="zip" type="checkbox" onChange="this.form.submit()">
                                           <span class="flokkar-tree-label">801 - Selfoss Dreifbýli</span>
                                       </label>
                           
                                       <label class="flokkar-tree-item layer2">
                                           <input class="flokkar-tree-cb" value="810" name="zip" type="checkbox" onChange="this.form.submit()">
                                           <span class="flokkar-tree-label">810 - Hveragerði</span>
                                       </label>
                           
                                       <label class="flokkar-tree-item layer2">
                                           <input class="flokkar-tree-cb" value="815" name="zip" type="checkbox" onChange="this.form.submit()">
                                           <span class="flokkar-tree-label">815 - Þorlákshöfn</span>
                                       </label>
                           
                                       <label class="flokkar-tree-item layer2">
                                           <input class="flokkar-tree-cb" value="816" name="zip" type="checkbox" onChange="this.form.submit()">
                                           <span class="flokkar-tree-label">816 - Ölfus</span>
                                       </label>
                           
                                       <label class="flokkar-tree-item layer2">
                                           <input class="flokkar-tree-cb" value="820" name="zip" type="checkbox" onChange="this.form.submit()">
                                           <span class="flokkar-tree-label">820 - Eyrarbakki</span>
                                       </label>
                           
                                       <label class="flokkar-tree-item layer2">
                                           <input class="flokkar-tree-cb" value="825" name="zip" type="checkbox" onChange="this.form.submit()">
                                           <span class="flokkar-tree-label">825 - Stokkseyri</span>
                                       </label>
                           
                                       <label class="flokkar-tree-item layer2">
                                           <input class="flokkar-tree-cb" value="840" name="zip" type="checkbox" onChange="this.form.submit()">
                                           <span class="flokkar-tree-label">840 - Laugarvatn</span>
                                       </label>
                           
                                       <label class="flokkar-tree-item layer2">
                                           <input class="flokkar-tree-cb" value="845" name="zip" type="checkbox" onChange="this.form.submit()">
                                           <span class="flokkar-tree-label">845 - Flúðir</span>
                                       </label>
                           
                                       <label class="flokkar-tree-item layer2">
                                           <input class="flokkar-tree-cb" value="850" name="zip" type="checkbox" onChange="this.form.submit()">
                                           <span class="flokkar-tree-label">850 - Hella</span>
                                       </label>
                           
                                       <label class="flokkar-tree-item layer2">
                                           <input class="flokkar-tree-cb" value="851" name="zip" type="checkbox" onChange="this.form.submit()">
                                           <span class="flokkar-tree-label">851 - Hella Dreifbýli</span>
                                       </label>
                           
                                       <label class="flokkar-tree-item layer2">
                                           <input class="flokkar-tree-cb" value="860" name="zip" type="checkbox" onChange="this.form.submit()">
                                           <span class="flokkar-tree-label">860 - Hvolsvöllur</span>
                                       </label>
                           
                                       <label class="flokkar-tree-item layer2">
                                           <input class="flokkar-tree-cb" value="861" name="zip" type="checkbox" onChange="this.form.submit()">
                                           <span class="flokkar-tree-label">861 - Hvolsvöllur Dreifbýli</span>
                                       </label>
                           
                                       <label class="flokkar-tree-item layer2">
                                           <input class="flokkar-tree-cb" value="870" name="zip" type="checkbox" onChange="this.form.submit()">
                                           <span class="flokkar-tree-label">870 - Vík</span>
                                       </label>
                           
                                       <label class="flokkar-tree-item layer2">
                                           <input class="flokkar-tree-cb" value="871" name="zip" type="checkbox" onChange="this.form.submit()">
                                           <span class="flokkar-tree-label">871 - Vík Dreifbýli</span>
                                       </label>
                           
                                       <label class="flokkar-tree-item layer2">
                                           <input class="flokkar-tree-cb" value="880" name="zip" type="checkbox" onChange="this.form.submit()">
                                           <span class="flokkar-tree-label">880 - Kirkjubæjarklaustur</span>
                                       </label>
                           
                                       <label class="flokkar-tree-item layer2">
                                           <input class="flokkar-tree-cb" value="900" name="zip" type="checkbox" onChange="this.form.submit()">
                                           <span class="flokkar-tree-label">900 - Vestmanneyjar</span>
                                       </label>
                                      </div>
                               </label> 
                                <label class="flokkar-tree-item layer1">
                                   <input class="flokkar-tree-cb" type="checkbox">
                                   <span class="flokkar-tree-label">Suðurnes</span>
                                   <div class="flokkar-tree-branches">
                           
                                       <label class="flokkar-tree-item layer2">
                                           <input class="flokkar-tree-cb" value="190" name="zip" type="checkbox" onChange="this.form.submit()">
                                           <span class="flokkar-tree-label">190 - Vogar</span>
                                       </label>
                           
                                       <label class="flokkar-tree-item layer2">
                                           <input class="flokkar-tree-cb" value="230" name="zip" type="checkbox" onChange="this.form.submit()">
                                           <span class="flokkar-tree-label">230 - Keflavík</span>
                                       </label>
                           
                                       <label class="flokkar-tree-item layer2">
                                           <input class="flokkar-tree-cb" value="233" name="zip" type="checkbox" onChange="this.form.submit()">
                                           <span class="flokkar-tree-label">233 - Hafnir</span>
                                       </label>
                           
                                       <label class="flokkar-tree-item layer2">
                                           <input class="flokkar-tree-cb" value="235" name="zip" type="checkbox" onChange="this.form.submit()">
                                           <span class="flokkar-tree-label">235 - Ásbrúarhverfi</span>
                                       </label>
                           
                                       <label class="flokkar-tree-item layer2">
                                           <input class="flokkar-tree-cb" value="240" name="zip" type="checkbox" onChange="this.form.submit()">
                                           <span class="flokkar-tree-label">240 - Grindavík</span>
                                       </label>
                           
                                       <label class="flokkar-tree-item layer2">
                                           <input class="flokkar-tree-cb" value="245" name="zip" type="checkbox" onChange="this.form.submit()">
                                           <span class="flokkar-tree-label">245 - Sandgerði</span>
                                       </label>
                           
                                       <label class="flokkar-tree-item layer2">
                                           <input class="flokkar-tree-cb" value="250" name="zip" type="checkbox" onChange="this.form.submit()">
                                           <span class="flokkar-tree-label">250 - Garður</span>
                                       </label>
                           
                                       <label class="flokkar-tree-item layer2">
                                           <input class="flokkar-tree-cb" value="260" name="zip" type="checkbox" onChange="this.form.submit()">
                                           <span class="flokkar-tree-label">260 - Njarðvík</span>
                                       </label>                     
                                      </div>
                               </label> 
                           </div>
                           </form> 

                     <p class="text_fyrirsogn">Flokkar</p>
                     <form id="leitaradio" action="sortflokkar">       					
                           <input type="radio" name="flokkar" value="Húsgögn" onChange="this.form.submit()"> Húsgögn<br>
                            <input type="radio" name="flokkar" value="Fatnaður" onChange="this.form.submit()"> Fatnaður<br>
                            <input type="radio" name="flokkar" value="Barnavörur" onChange="this.form.submit()"> Barnavörur <br>
                            <input type="radio" name="flokkar" value="Raftæki" onChange="this.form.submit()"> Raftæki<br>
                            <input type="radio" name="flokkar" value="Verkfæri" onChange="this.form.submit()"> Verkfæri<br>
                            <input type="radio" name="flokkar" value="Dýr" onChange="this.form.submit()"> Dýr <br> 										  					
                            <input type="radio" name="flokkar" value="Farartæki" onChange="this.form.submit()"> Farartæki <br>
                            <input type="radio" name="flokkar" value="Matur" onChange="this.form.submit()"> Matur<br>
                            <input type="radio" name="flokkar" value="Annað" onChange="this.form.submit()"> Annað <br> 														  
                         </form>

                  </div>
               </div>
               <div class="col col9-right">
                  <div class="listi">
                        <div class="searchfield">
                                <form object="${items}" id="leitalista" action="searchlisti" method="get">
                                    <table class="search">
                                        <tr>
                                            <td class="leiticon">
                                                <i class="fa fa-search"></i>
                                            </td>
                                            <td>
                                                <input type="text" class="leitfield" value="${search}" name="leita" placeholder=" Setjið inn leitarorð.." onChange="this.form.submit()" />
                                            </td>
                                        </tr>
                                    </table>
                                </form>
                                <c:choose>
                                    <c:when test="${not empty items}">
                                        <c:forEach items="${items}" var="leit">
                                            <tr>
                                             
                                            </tr>
                                        </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                        <h3>Leitin skilaði engum niðurstöðum</h3>
                                    </c:otherwise>
                                </c:choose>
                            </div>
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
                                 <th>Mynd</th>
                              </tr>
                              <c:forEach var="skodaitem" items="${items}">
                                 <tr class="rows">
                                    <%--We can reference attributes of the Entity by just entering the name we gave--%>
                                    <%--it in the singular item var, and then just a dot followed by the attribute name--%>
                                    <td><a href="/skodaitem/${skodaitem.id}">${skodaitem.itemName}</a></td>
                                    <td>${skodaitem.description}</td>
                                    <td>${skodaitem.pickupTime}</td>
                                    <td>${skodaitem.tag}</td>
                                    <td>
                                       <div class="img"><img src="${pageContext.request.contextPath}/resources/images/${skodaitem.myndName}"/></div>
                                    </td>
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
      </main>
      <footer class="footer">
         <div class="footer__grid">
            <div class="footer__row">
               <div class="footer__col">
                  <ul class="footer__links">
                     <li class="li"><a class="footer__link" href="/umgefins">Um Gefins</a></li>
                     <li class="li"><a class="footer__link" href="/notkunarskilmalar">Notkunarskilmálar</a></li>
                  </ul>
               </div>
               <div class="footer__col">
                  <ul class="footer__links">
                     <li class="li"><a class="footer__link" href="/samband">Hafa samband</a></li>
                     <li class="li"><a class="footer__link" href="/snidugt">Eitthvað sniðugt</a></li>
                  </ul>
               </div>
               <div class="footer__col">
                  <ul class="footer__links">
                     <li class="li"><a class="footer__link" href="/umgefins">Meira sniðugt</a></li>
                     <li class="li"><a class="footer__link" href="/notkunarskilmalar">Enn þá meira sniðugt</a></li>
                  </ul>
               </div>
               <div class="footer__col">
                  <ul class="footer__links">
                     <li class="li"><a class="footer__link" href="/samband">Eitthvað töff</a></li>
                     <li class="li"><a class="footer__link" href="/snidugt">Meira töff</a></li>
                  </ul>
               </div>
            </div>
         </div>
         <p class="footer__credit">© 2018 GEFINS</p>
      </footer>
   </body>
</html>