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
                    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
                    <title>Forsida</title>
                    <link rel="stylesheet" type="text/css" href="<c:url value=" /css/umgefins.css "/>"/>
                    <!- <link rel="stylesheet" type="text/css" href="<c:url value="/css/grid.css"/> "/>
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
                                <div class="m-title">
                                    <h1><a href="/forsida">GEFINS</a></h1>
                                </div>
                            </div>
                        </div>
                    </header>
                    <main>
                        <div class="grid">
                            <div class="row">
                            <div class="col-extra">
                            </div>
                                <div class="col-main">
                                <h2>Hugmyndafræðin</h2>
                                <p>Við lifum á tímum loftslagsbreytinga og gífurlegrar offramleiðslu og neyslu á veraldlegum hlutum
                                sem er að gera út af við jörðina okkar. Endurnýting á hlutum er ein leið sem Þær leiðir sem til eru 
                                í dag fyrir fólk að losa sig við það sem það hefur ekki þörf fyrir lengur eru að koma því í nytjagám, 
                                henda því eða auglýsa það gefins á samfélagsmiðlum sem getur verið ruglingslegt ferli þegar 
                                fyrirspurnir og athugasemdir hrannast inn. Þeir sem eru að leita sér að einhverju gefins lenda svo 
                                í því að þurfa að leggja gífurlegan tíma í að leita inni á samfélagsmiðlum þar sem hlutir eru settir 
                                fram á óskipulagðan hátt og finna jafnvel að lokum ekki það sem leitað er að. 
                                Lausnin við framangreindu er Gefins, vefsíða þar sem hægt er að gefa og/eða þiggja hluti á einfaldan 
                                og skipulagðan hátt.  </p>
                                   
                                  
                                    
                                </div>
                                  <div class="col-extra">
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
                                    </ul>
                                </div>
                                <div class="footer__col">
                                    <ul class="footer__links">
                                        <li class="li"><a class="footer__link" href="/hafasamband">Hafa samband</a></li>
                                    </ul>
                                </div>
                                <div class="footer__col">
                                    <ul class="footer__links">
                                        <li class="li"><a class="footer__link" href="/notkunarskilmalar">Notkunarskilmálar</a></li>                                    </ul>
                                </div>
                                <div class="footer__col">
                                    <ul class="footer__links">
                                        <li class="li"><a class="footer__link" href="/hofundar">Höfundar</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <p class="footer__credit">© 2018 GEFINS</p>
                    </footer>
                </body>
                </html>