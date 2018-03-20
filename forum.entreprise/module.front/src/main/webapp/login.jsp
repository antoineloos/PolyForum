<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="fr">

    <head>
        <link rel="icon" type="image/ico" href="images/favicon.ico" />
        <!--[if IE]><link rel="shortcut icon" type="image/x-icon" href="favicon.ico" /><![endif]-->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Poly Forum</title>

        <!-- Bootstrap Core CSS -->
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- Font Awesome CSS -->
        <link href="css/font-awesome.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="css/animate.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="css/style.css" rel="stylesheet">

        <!-- Custom Fonts -->
        <link href='http://fonts.googleapis.com/css?family=Lobster'
              rel='stylesheet' type='text/css'>


        <!-- Template js -->
        <script src="../../js/jquery-2.1.1.min.js"></script>
        <script src="../../bootstrap/js/bootstrap.min.js"></script>
        <script src="../../js/jquery.appear.js"></script>
        <script src="../../js/contact_me.js"></script>
        <script src="../../js/jqBootstrapValidation.js"></script>
        <script src="../../js/modernizr.custom.js"></script>
        <script src="../../js/script.js"></script>

        <!--[if lt IE 9]>
                    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
                    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
                <![endif]-->

    </head>

    <body>

        <div class="container py-5">
            <div class="row">
                <div class="col-md-12">
                    <div class="row">
                        <div class="col-md-6 mx-auto">

                            <!-- form card login -->
                            <div class="card rounded-5">
                                <div class="card-header">
                                    <h3 class="mb-0">Connexion</h3>
                                </div>
                                <div class="card-body">
                                    <c:if test="${erreurR != null && erreurR != ''}">
                                        <div class="alert-danger" role="alert" >
                                            <span class="glyphicon glyphicon-exclamation-sign"  aria-hidden="true"></span>
                                            <pre style="display:inline"><c:out value="${erreurR}" /></pre>

                                        </div>
                                        <br>
                                        <br>
                                    </c:if>
                                    <form action="connecter.cpt" class="form" role="form" autocomplete="off" id="formLogin" novalidate="" method="POST">
                                        <div class="form-group">
                                            <label for="uname1">Identifiant</label>
                                            <input type="text" class="form-control form-control-lg rounded-0" name="login" id="uname1" required="">
                                            <div class="invalid-feedback">Indiquez un login</div>
                                        </div>
                                        <div class="form-group">
                                            <label for="pwd1">Mot de passe</label>
                                            <input type="password" class="form-control form-control-lg rounded-0" name="password" id="pwd1" required="" autocomplete="new-password">
                                            <div class="invalid-feedback">Indiquer un Mot de passe</div>
                                        </div>
                                        <button type="submit" class="btn btn-success btn-lg float-right" id="btnLogin">Se connecter</button>
                                    </form>
                                </div>
                                <!--/card-block-->
                            </div>
                            <!-- /form card login -->

                        </div>


                    </div>
                    <!--/row-->

                </div>
                <!--/col-->
            </div>
            <!--/row-->
        </div>
        <!--/container-->
    </body>
    <script>
        function GetIEVersion() {
            var sAgent = window.navigator.userAgent;
            var Idx = sAgent.indexOf("MSIE");

            // If IE, return version number.
            if (Idx > 0)
                return parseInt(sAgent.substring(Idx + 5, sAgent.indexOf(".", Idx)));

            // If IE 11 then look for Updated user agent string.
            else if (!!navigator.userAgent.match(/Trident\/7\./))
                return 11;

            else
                return 0; //It is not IE
        }

        if (GetIEVersion() > 0)
            alert("Vous utilisez une version d'internet explorer qui est obsolète\n ce site n'est pas compatible vous allez être redirigé");
        window.location.replace("http://www.msn.com/");
    </script>
</html>