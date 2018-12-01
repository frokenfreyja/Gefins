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
                       <c:choose>
                                                    <c:when test="${not empty loggedInUser}">
         <header>
                        <div class="header-containerlogged">
                            <div class="header-bglogged">
                                <div class="navbarlogged">
                                    <div class="navlogged">
                                        <div class="dropdownlogged">
                                            <button class="dropbtnlogged">${loggedInUsername}
                                                <i class="fa fa-caret-down"></i>
                                            </button>
                                            <div class="dropdown-contentlogged">
                                                <a href="/mittsvaedi">Mitt svæði</a>
                                                <a href="/settings">Stillingar</a>
                                                <a href="/utskra">Útskrá</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                    <div class="m-titlelogged">
                                        <h1>GEFINS</h1>
                                    </div>
                                    <div class="undertitlelogged">
                                        Fyrir jörðina okkar
                                    </div>
                                    <div class="newadvertlogged">
                                    <div class="btnlogged header-btnlogged">
                                        <span>Setja inn auglýsingu</span>
                                        <a href="/nyauglysing"></a>
                                    </div>
                                       </div>
                            </div>
                        </div>
                    </header>
                                                    </c:when>
                                                    <c:otherwise>
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
                                                    </c:otherwise>
                                                </c:choose>
                   
                    <main>
                        <div class="grid">
                            <div class="row">
                                <div class="col-extra">
                                </div>
                                <div class="col-main">
                                    <h2>Hugmyndafræðin</h2>
                                    <p>Við lifum á tímum loftslagsbreytinga og gífurlegrar offramleiðslu og ofneyslu á veraldlegum hlutum sem er að gera út af við jörðina okkar. Ein leið til að stuðla að umhverfisvernd er þannig að minnka úrgang og endurnýta hluti sem annars væri hent. Þær leiðir sem til hafa verið fyrir fólk að losa sig við það sem það hefur ekki þörf fyrir lengur eru að koma því í nytjagám, henda því eða auglýsa það gefins á samfélagsmiðlum sem oftast er tímafrekt og óreiðukennt ferli.
                                        <br> Lausnin við framangreindu er Gefins, vefsíða þar sem hægt er að gefa og/eða þiggja hluti á einfaldan og skipulagðan hátt. </p>
                                    <br>
                                    <br>

                                    <h2>Höfundar Gefins eru:</h2>

                                    <ul>
                                        <li>Freyja Sigurgísladóttir</li>
                                        <li>Henrietta Þóra Magnúsdóttir</li>
                                        <li>Jökull Jóhannsson</li>
                                    </ul>

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
                                        <li class="li"><a class="footer__link" href="/notkunarleidbeiningar">Notkunarleiðbeiningar</a></li>
                                    </ul>
                                </div>
                                <div class="footer__col">
                                    <ul class="footer__links">
                                        <li class="li"><a class="footer__link" href="/hafasamband">Hafa samband</a></li>
                                    </ul>
                                </div>
                                <div class="footer__col">
                                    <ul class="footer__links">
                                        <li class="li"><a class="footer__link" href="/umgefins">Um Gefins</a></li>
                                    </ul>
                                </div>
                                <div class="footer__col">
                                    <ul class="footer__links">
                                        <li class="li"><a class="footer__link" href="/notkunarskilmalar">Notkunarskilmálar</a></li>
                                    </ul>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <p class="footer__credit">© 2018 GEFINS</p>
                    </footer>
                </body>

                </html>