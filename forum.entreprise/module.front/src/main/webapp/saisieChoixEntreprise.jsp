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
        <script
        src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
        <script
        src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>



        <!--[if lt IE 9]>
                    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
                    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
                <![endif]-->

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet">
    </head>
    <body>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

        <nav class="navbar navbar-expand-lg navbar-light bg-light navbarpoly">
            <c:if test="${sessionScope.type == 'entreprise' || sessionScope.type == 'candidat'}">
                <a class="navbar-brand" href="accueil.cpt"><h3 class="logo-h3">POLYFORUM</h3></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Mes choix
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <c:if test="${sessionScope.type == 'entreprise'}">
                                    <a class="dropdown-item" href="initSaisieChoixEnt.chxE">Saisir</a>
                                    <a class="dropdown-item" href="consulter.chxE">Consulter</a>
                                </c:if>
                                <c:if test="${sessionScope.type == 'candidat'}">
                                    <a class="dropdown-item" href="initSaisieChoixCan.can">Saisir</a>
                                    <a class="dropdown-item" href="consulter.can">Consulter</a>
                                </c:if>
                            </div>
                        </li>

                        <c:if test="${sessionScope.type == 'entreprise'}">
                            <li class="nav-item"><a class="nav-link" href="consulterPlanning.chxE">Planning</a></li>
                            </c:if>

                        <c:if test="${sessionScope.type == 'candidat'}">
                            <li class="nav-item"><a class="nav-link" href="consulterPlanning.can">Planning</a></li>
                            </c:if>    
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Documents
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="download.file">Ajouter</a>
                                <a class="dropdown-item" href="consulter.file">Consulter</a>
                            </div>
                        </li>                        
                    </c:if>


                    <c:if test="${sessionScope.type == 'admin'}">
                        <a class="navbar-brand" href="admin.jsp"><h3 class="logo-h3">POLYFORUM</h3></a>
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>

                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav mr-auto">
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        Candidats
                                    </a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                        <a class="dropdown-item" href="saisieCandidat.adm">Saisir</a>
                                        <a class="dropdown-item" href="consulterCan.adm">Consulter</a>
                                    </div>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        Entreprises
                                    </a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                        <a class="dropdown-item" href="saisieEntreprise.adm">Saisir</a>
                                        <a class="dropdown-item" href="consulterEnt.adm">Consulter</a>
                                    </div>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        Salles
                                    </a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                        <a class="dropdown-item" href="gererSalles.adm">Gérer</a>
                                        <a class="dropdown-item" href="saisieSalle.adm">Ajouter</a>
                                    </div>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        Planning
                                    </a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                        <a class="dropdown-item" href="genererPlanning.adm">Générer</a>
                                        <a class="dropdown-item" href="consulterPlanning.adm">Consulter</a>
                                    </div>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="choixTypeDocument.adm" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        Documents
                                    </a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                        <a class="dropdown-item" href="download.file">Ajouter</a>
                                        <a class="dropdown-item" href="consulterCV.file">CV</a>
                                        <a class="dropdown-item" href="consulterOffres.file">Offres</a>
                                    </div>
                                </li>                              
                            </c:if>


                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    Liens
                                </a>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <a class="dropdown-item" href="http://polytech.univ-lyon1.fr/">Polytech</a>
                                    <a class="dropdown-item" href="http://www.formasup-arl.fr/">Formasup</a>
                                </div>
                            </li>
                        </ul>


                        <ul class="nav navbar-nav navbar-right">
                            <c:if test="${sessionScope.type == 'entreprise'}">
                                <li class="nav-item"><a class="nav-link" href='modifier_ent.cpt'>Bonjour <strong>${sessionScope.nom_representant}</strong></a></li>
                                </c:if>
                                <c:if test="${sessionScope.type == 'candidat'}">
                                <li class="nav-item"><a class="nav-link" href='modifier_etu.cpt'>Bonjour <strong>${sessionScope.prenom}</strong></a></li>
                                </c:if>
                                <c:if test="${sessionScope.type == 'admin'}">
                                <li class="nav-item" ><a class="nav-link" href='consulterMdp.adm'>Consulter comptes</a></li>
                                </c:if>
                            <li class="nav-item"><a class="nav-link" href='deconnecter.cpt'>Déconnexion</a></li>
                        </ul>

                    </div>
                    </nav>

                    <div class="well well-lg col-md-6">

                        <section id="logo-section" class="text-center ">
                            <div class="container">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="logo text-center">
                                            <span class="text-center"><h2>Ajout des candidats</h2></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>
                        <div class="container">
                            <br />
                            <span><font color="grey" size="2">* Ajoutez vos différents choix puis validez pour enregistrer.</font></span>
                            <div class="fresh-table full-color-blue">
                                <c:if test="${empty listeCandidats}">
                                    <br />
                                    <div class="alert alert-warning">
                                        <strong>Aucun candidat n'est disponible !</strong>
                                    </div>
                                </c:if>
                                <c:if test="${!empty listeCandidats}">
                                    <form name="add_name" id="add_name" role="form"
                                          action="choixEnt.chxE" method="POST">
                                        <div class="table-responsive">
                                        <table class="table table-bordered grid" id="dynamic_field">
                                            <thead>
                                                <tr>
                                                    <th class="bg-primary">Nom</th>
                                                    <th class="bg-primary">Durée</th>
                                                    <th class="bg-primary"></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr id="row1">
                                                    <td><select name=nom1 class="form-control"
                                                                id="listeCandidats">
                                                            <option value="Sélectionnez un candidat">Sélectionnez un candidat</option>
                                                            <c:forEach var="candidat" items="${listeCandidats}">
                                                                <option value="${candidat.idCandidat}">${candidat.prenom}
                                                                    ${candidat.nom}</option>
                                                                </c:forEach>
                                                        </select></td>
                                                    <td>
                                                        <select id=duree1 class="form-control" name="duree1">
                                                            <option value="Sélectionnez une durée">Sélectionnez une durée</option>
                                                            <option value=20>20</option>
                                                            <option value=30>30</option>
                                                            <option value=40>40</option>
                                                        </select>
                                                    <td><button type="button" name="add" id="add"
                                                                class="btn btn-success">Ajouter</button></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        </div>
                                        <input type="submit" id="submit" class="btn btn-info"
                                               form="add_name" value="Valider" />
                                    </form>
                                </c:if>

                            </div>
                        </div>
                    </div>

                    <input type="hidden" id="temp" name="temp" value="" />

                    <!-- End Logo Section -->
                    <script>
                        $(document)
                                .ready(
                                        function () {
                                            var i = 1;
                                            $('#add')
                                                    .click(
                                                            function () {
                                                                var e = document.getElementById("listeCandidats");
                                                                var strUser = e.options[e.selectedIndex].value;
                                                                if ($("#nom1").val() != ""
                                                                        && strUser.indexOf("ez un candidat") == -1
                                                                        && $("#duree1").val() != ""
                                                                        && $("#duree1").val() < 46
                                                                        && checkCandidat(strUser) == "true") {
                                                                    var e = document
                                                                            .getElementById("listeCandidats");
                                                                    i++;
                                                                    $('#dynamic_field')
                                                                            .append(
                                                                                    '<tr id="row' + i + '"><td style="display:none;"><input type="text" id="id' + e.options[e.selectedIndex].value + '" name="id' + i + '" value="' + e.options[e.selectedIndex].value + '" class="form-control name_list" readonly="true"/></td><td><input type="text" name="nom'
                                                                                    + i
                                                                                    + '" placeholder="'
                                                                                    + $(
                                                                                            '#nom1')
                                                                                    .val()
                                                                                    + '" value="'
                                                                                    + e.options[e.selectedIndex].text
                                                                                    + '" class="form-control name_list" readonly="true"/></td><td><input type="number" min="0" max="45" name="duree'
                                                                                    + i
                                                                                    + '" placeholder="'
                                                                                    + $(
                                                                                            '#duree1')
                                                                                    .val()
                                                                                    + '" value="'
                                                                                    + $(
                                                                                            '#duree1')
                                                                                    .val()
                                                                                    + '" class="form-control name_list" readonly="true"/></td><td><button type="button" name="remove" id="' + i + '" class="btn btn-danger btn_remove">X</button></td></tr>');
                                                                    $("#duree1").attr(
                                                                            "placeholder",
                                                                            "Durée");
                                                                    $("#duree1").val("Sélectionnez une durée");
                                                                    $('#listeCandidats')
                                                                            .prop(
                                                                                    'selectedIndex',
                                                                                    0)
                                                                }
                                                            });
                                            $(document).on('click', '.btn_remove', function () {
                                                var button_id = $(this).attr("id");
                                                updateTemp(button_id);
                                                $('#row' + button_id + '').remove();
                                            });
                                        });
                        function checkCandidat(strUser) {
                            var elem = document.getElementById("temp");
                            if (elem.value.indexOf(strUser) == -1) {
                                document.getElementById("temp").value = elem.value + " " + strUser;
                                return "true";
                            } else {
                                var chaine = elem.value.split(" ");
                                var i = 0;
                                while (i < chaine.length) {
                                    if (chaine[i] == strUser) {
                                        return "false";
                                    }
                                    i++;
                                }
                                document.getElementById("temp").value = elem.value + " " + strUser;
                                return "true";
                            }
                        }
                        function updateTemp(button_id) {
                            var name = "id" + button_id;
                            var temp = document.getElementById("temp").value;
                            var elem = document.getElementsByName(name);
                            var tab = temp.split(" ");
                            var i = 0;
                            while (i < tab.length) {
                                if (tab[i] == elem[0].value) {
                                    var replacement = "";
                                    if (i == tab.length - 1) {
                                        replacement = replacement + temp.replace(tab[i], "");
                                    } else {
                                        replacement = replacement + temp.replace(tab[i] + " ", "");
                                    }

                                    document.getElementById("temp").value = replacement;
                                }
                                i++;
                            }

                        }
                    </script>
                 
                    </body>
                    </html>