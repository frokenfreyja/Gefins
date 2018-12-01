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
                    <link rel="stylesheet" type="text/css" href="<c:url value=" /css/notkunarskilmalar.css "/>"/>
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
                                    <h2>Notkunarskilmálar</h2>

                                    <ul>
                                        <li>Gefins.is tekur enga ábyrgð á hugsanlegum skaða sem notendur geta orðið fyrir við notkun vefsins, líkamlegum, andlegum eða fjárhagslegum.</li>
                                        <li>Notandi Gefins.is má ekki með neinum hætti hafa áhrif á stjörnugjöf sínum utan eðlilegrar notkunar á vefnum eins og getið er í notkunarleiðbeiningum síðunnar..</li>
                                        <li>Notendum ber að fylgja leiðbeiningum síðunnar og standa við orð sín þegar búið er að samþykkja notanda sem þiggjanda vöru.
                                        </li>
                                        <li>Notendum er skylt að vera heiðarlegir í lýsingu sinni á þeim hlutum sem þeir eru að gefa.</li>
                                        <li>Gefins.is áskilur sér rétt til þess að loka aðgangi þeirra sem hafa ítrekað brotið gegn reglum síðunnar..</li>
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