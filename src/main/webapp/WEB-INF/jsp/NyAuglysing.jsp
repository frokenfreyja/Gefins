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
                    <title>Ny auglysing</title>
                    <link rel="stylesheet" type="text/css" href="<c:url value=" /css/nyauglysing.css "/>"/>
                    <script>
                        var loadFile = function(event) {
                            var image = document.getElementById('output');
                            image.src = URL.createObjectURL(event.target.files[0]);
                        }
                    </script>
                    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
                </head>
                <body>
                    <header>
                        <div class="header-container">
                            <div class="header-bg">
                                <div class="navbar">
                                    <div class="nav">
                                        <div class="dropdown">
                                            <button class="dropbtn">${loggedInUsername}
                                                <i class="fa fa-caret-down"></i>
                                            </button>
                                            <div class="dropdown-content">
                                                <a href="/mittsvaedi">Mitt svæði</a>
                                                <a href="/settings">Stillingar</a>
                                                <a href="/utskra">Útskrá</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="h-wrapper">
                                    <div class="m-title">
                                        <h1><a href="/forsidaloggedin">GEFINS</a></h1>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </header>
                    <main>
                        <div class="grid">
                            <div class="row">
                                <div class="col col-extra">
                                </div>
                                <div class="col col-main">
                                <%-- Form til þess að skrá nýja auglýsingu--%>                               
                                    <p class="newadvert">Ný auglýsing</p>
                                    <sf:form method="POST" modelAttribute="item" action="/nyauglysing" enctype="multipart/form-data">
                                        <table class="newadvertise">
                                            <tr>
                                                <td> Heiti auglýsingar:</td>
                                                <%--the `path` attribute matches the `name` attribute of the Entity that was passed in the model--%>
                                                    <td>
                                                        <sf:textarea path="itemName" class="formbox" type="text" placeholder="" required="required" autofocus="autofocus"/>
                                                    </td>
                                                    <td>Afhendingartími:</td>
                                                    <%--the `path` attribute matches the `note` attribute of the Entity that was passed in the model--%>
                                                        <td>
                                                            <sf:textarea path="pickupTime" class="formbox" type="text" placeholder="" required="required" />
                                                        </td>
                                            </tr>
                                            <tr>
                                                <td>Lýsing:</td>
                                                <%--the `path` attribute matches the `note` attribute of the Entity that was passed in the model--%>
                                                    <td>
                                                        <sf:textarea path="description" class="formbox" type="text" placeholder="" required="required" />
                                                    </td>
                                                    <td>Sími:</td>
                                                    <%--the `path` attribute matches the `note` attribute of the Entity that was passed in the model--%>
                                                        <td>
                                                            <sf:textarea path="phone" class="formbox" type="text" placeholder="" required="required" />
                                                        </td>
                                            </tr>
                                            <tr>
                                                <td>Heimilisfang:</td>
                                                <td>
                                                    <sf:textarea path="location" class="formbox" type="text" placeholder="" required="required" />
                                                </td>
                                                <td>Flokkur:</td>
                                                <%--the `path` attribute matches the `note` attribute of the Entity that was passed in the model--%>
                                                    <td>
                                                        <sf:select path="tag" class="checkcategories">
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
                                            </tr>
                                            <tr>
                                                <td>Póstnúmer:</td>
                                                <%--the `path` attribute matches the `note` attribute of the Entity that was passed in the model--%>
                                                    <td>
                                                        <sf:input path="zipcode" class="formbox" type="text" maxlength="3" placeholder="" required="required" pattern="\b(101|103|104|105|107|108|109|110|111|112|113|114|116|170|200|201|203|210|225|220|221|222|270|271|276|300|301|310|311|320|340|345|350|355|356|360|370|371|380||400|401|410|415|420|425|430|450|451|460|465|470|471|510|512|520|524|500|530|531|540|545|550|551|560|565|566|570|580|600|601|603|610|611|620|621|625|630|640|641|645|650|660|670|671|675|680|681|685|690|700|701|710|715|720|730|735|740|750|755|760|765|780|781|785|800|801|810|815|816|820|825|840|845|850|851|860|861|870|871|880|900|190|230|233|235|240|245|250|260)\b"/>
                                                    </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <p class="imgbutton">
                                                        <sf:label for="mynd" path="mynd" style="cursor: pointer;">Setja inn mynd</sf:label>
                                                    </p>
                                                </td>
                                                <td>
                                                    <p>
                                                        <sf:input path="mynd" type="file" id="mynd" accept="image/*" name="mynd" onchange="loadFile(event)" style="display: none;" multiple="multiple" />
                                                    </p>
                                                    <p><img path="output" id="output" width="200"></p>
                                                </td>
                                            </tr>
                                        </table>
                                        <div class="submit">
                                            <input type="submit" class="formbutton" VALUE="Í lagi" />
                                        </div>
                                    </sf:form>
                                </div>
                                <div class="col col-extra">
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
                                        <li class="li"><a class="footer__link" href="/notkunarskilmalar">Notkunarskilmálar</a></li>                                    </ul>                                        
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <p class="footer__credit">© 2018 GEFINS</p>
                    </footer>
                </body>
                </html>