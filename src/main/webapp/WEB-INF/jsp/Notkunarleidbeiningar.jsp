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
                    <link rel="stylesheet" type="text/css" href="<c:url value=" /css/notkunarleidbeiningar.css "/>"/>
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
                                            <h1><a href="/forsida">GEFINS</a></h1>
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
                                    <h2>Notkunarleiðbeiningar</h2>
                                    <h3>Að gefa hlut:</h3>
                                    <ul>
                                        <li>Gefandi fer í "Nýskrá" uppi í hægri horni síðunnar, setur inn viðeigandi upplýsingar og ýtir á "Nýskrá".</li>
                                        <li>Þegar því er lokið færist gefandi inn á innskrársvæði og þar setur hann inn notendanafnið og lykilorðið sem hann valdi sér þegar hann nýskráði sig.</li>
                                        <li>Gefandi færist þá á forsíðuna og þar ýtir hann á "Setja inn auglýsingu" takkann efst á forsíðumyndinni.</li>
                                        <li>Gefandi fyllir út formið fyrir nýja auglýsingu og setur inn viðeigandi upplýsingar og mynd og ýtir á "Í lagi".</li>
                                        <li>Þá færist gefandi á forsíðuna og auglýsingin hans birtist efst í auglýsingalistanum.</li>
                                        <li>Gefandi getur einnig séð auglýsinguna sína með því að fara með bendilinn á notendanafn sitt efst í hægra horni og ýta á "Mitt svæði".</li>
                                        <li>Þegar gefandi ýtir á auglýsinguna getur hann séð hversu margir eru í röð fyrir hlutinn sem hann er að gefa og þegar aðrir notendur hafa sett sig í röð getur hann séð notendanöfnin þeirra.</li>
                                        <li>Gefandi getur valið að "Samþykkja" eða "Eyða" þeim sem efstur er í röðinni hverju sinni.</li>
                                        <li>Ef gefandi velur að samþykkja annan notanda, þ.e. þiggjanda, þá mun sá aðili fá upplýsingar um gefanda og setja sig í samband við hann símleiðis eða með tölvupósti.</li>
                                        <li>Ef allt gengur upp mun þiggjandinn sækja hlutinn til gefanda.</li>
                                        <li>Eftir að þiggjandi hefur sótt hlutinn getur gefandi gefið þiggjandanum stjörnur eftir því hvernig upplifun hans var af samskiptum sínum við hann og þá hverfur auglýsingin úr "Mitt svæði".</li>
                                        <li>Ef þiggjandi hefur ekki samband eða sækir ekki hlutinn getur gefandi eytt honum úr röðinni og þá fer næstefsti þiggjandi efst í röðina og sama ferli fer í gang og áður.</li>
                                        <li>Samþykktur þiggjandi getur gefið gefanda stjörnur fyrir sína upplifun af samskiptum við hann.</li>
                                        <li>Gefandi getur farið í hægra horn síðunnar yfir notendanafnið sitt og valið "Stillingar" og breytt nýskráningarupplýsingum sínum hvenær sem er eða valið "Eyða aðgangi" og þannig eytt aðgangi sínum inn á síðuna fyrir fullt og allt.</li>
                                    </ul>

                                    <h3>Að fá hlut gefins:</h3>
                                    <ul>
                                        <li>Þiggjandi fer í "Nýskrá" uppi í hægri horni síðunnar, setur inn viðeigandi upplýsingar og ýtir á "Nýskrá".</li>
                                        <li>Þegar því er lokið færist þiggjandi inn á innskrársvæði og þar setur hann inn notendanafnið og lykilorðið sem hann valdi sér þegar hann nýskráði sig.</li>
                                        <li>Þiggjandi getur skoðað auglýsingalistann með því að færa sig niður listann eða notað þrengingarmöguleikana á vinstri hlið síðunnar.</li>
                                        <li>Hægt er að velja að leita í einhverjum af 10 flokkunum sem í boði eru og/eða leita eftir póstnúmeri. Hægt er að ýta á "Allt landið" og "Allir flokkar" til þess að hreinsa leitina og fá aftur listann af öllum auglýsingum.</li>
                                        <li>Einnig er hægt að fara í leitargluggann vinstra megin við auglýsingalistann og skrifa þar inn leitarorð sem við á. Þá birtast auglýsingar sem samræmast því leitarorði/orðum. Hægt er að velja "Hreinsa" við hlið leitargluggans og þá birtist aftur listinn af öllum auglýsingunum.</li>
                                        <li>Þegar þiggjandi hefur fundið það sem hann leitar að ýtir hann á heitið á auglýsingunni og þá opnast ný síða með nánari upplýsingum um hlutinn.
                                        </li>
                                        <li>Ef þiggjanda líst vel á hlutinn og vill fá hann getur hann ýtt á "Fara í röð" og þá fer hann í röð fyrir hlutinn. Hann getur einnig séð hversu margir eru í röðinni. Þiggjandi getur ýtt á "Fara úr röð" ef honum snýst hugur.</li>
                                        <li>Þegar þiggjandi er kominn í röð getur hann séð inni á "Mitt svæði" auglýsinguna sem hann er í röð fyrir.</li>
                                        <li>Þegar þiggjandi hefur verið samþykktur af gefanda hlutarins birtist rauður hringur fyrir framan auglýsinguna inni á "Mitt svæði" þiggjandans.
                                        </li>
                                        <li>Þegar þiggjandi opnar auglýsinguna birtast skilaboð um að hann hafi verið samþykktur sem notandi og hann hefur fengið upplýsingar um gefandann og hann setur sig í samband við hann í gegnum síma eða tölvupóst og þiggjandi og gefandi koma sér saman um afhendingartíma hlutarins.</li>
                                        <li>Þegar þiggjandi hefur fengið hlutinn í sínar hendur getur hann gefið gefanda stjörnur eftir því hvernig upplifun hans var af samskiptum sínum við hann og þá hverfur auglýsingin úr "Mitt svæði."</li>
                                        <li>Gefandi getur farið í hægra horn síðunnar yfir notendanafnið sitt og valið "Stillingar" og breytt nýskráningarupplýsingum sínum hvenær sem er eða valið "Eyða aðgangi" og þannig eytt aðgangi sínum inn á síðuna fyrir fullt og allt.</li>
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