<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <link rel="icon" type="image/ico" href="images/favicon.ico" />
        <!--[if IE]><link rel="shortcut icon" type="image/x-icon" href="favicon.ico" /><![endif]-->
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
        <link href='http://fonts.googleapis.com/css?family=Lobster' rel='stylesheet' type='text/css'>

        <link rel="stylesheet" href="alerty/css/alerty.css">

        <!-- Template js -->
        <script src="../../js/jquery-2.1.1.min.js"></script>
        <!-- <script src="../../bootstrap/js/bootstrap.min.js"></script> -->
        <script src="../../js/bootstrap.min.js"></script>
        <script src="../../js/wow.min.js"></script>
        <script src="../../js/jquery.appear.js"></script>
        <script src="../../js/contact_me.js"></script>
        <script src="../../js/jqBootstrapValidation.js"></script>
        <script src="../../js/modernizr.custom.js"></script>
        <script src="../../js/script.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
        <script src="//code.jquery.com/jquery-1.10.2.js"></script>
        <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
        <script src="alerty/js/alerty.min.js"></script>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
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


                <!-- End Logo Section -->
                <div class="well well-lg col-md-8">
                    <section id="logo-section" class="text-center">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="logo text-center">
                                        <span class="text-center"><h2>Consulter mes choix</h2></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>

                    <div class="container">
                        <br /> <font color="grey" size="2"> * Glisser et déposer vos choix pour ordonner selon vos préférences.</font>
                        <form role="form" action="modifierChoixEnt.chxE" method="post">
                            <div class="panel panel-default">
                                <table id="sort" class="table table-bordered table-striped grid">
                                    <thead>
                                        <tr>
                                            <th class="bg-primary index">Prénom</th>
                                            <th class="bg-primary index">Nom</th>
                                            <th class="bg-primary index">Temps</th>
                                            <th class="bg-primary index">Priorité</th>
                                            <th class="bg-primary index"></th>
                                        </tr>
                                    </thead>
                                    <tbody class="sort">
                                        <c:forEach var="varListeChoix" items="${listeChoix}" varStatus="loop">
                                            <tr id='${loop.index+1}' name='${loop.index+1}'>
                                                <td id='prenom${loop.index+1}' name='prenom${loop.index+1}'>${varListeChoix.candidat.prenom}</td>
                                                <td id='nom${loop.index+1}' name='nom${loop.index+1}'>${varListeChoix.candidat.nom}</td>
                                                <td id='tempsVoulu${loop.index+1}' name='tempsVoulu${loop.index+1}'>${varListeChoix.tempsVoulu}</td>
                                                <td id='prio${loop.index+1}' name='prio${loop.index+1}' class="index">${loop.index+1}</td>
                                                <td width="5%"><button type="button" name="remove" id="${sessionScope.idCompte} ${varListeChoix.candidat.idCandidat}"
                                                                       class="btn btn-danger btn_remove">X</button></td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </form>
                        <form method="get" action="initSaisieChoixEnt.chxE">
                            <button type="submit" class="btn btn-primary btn-lg outline">Ajouter un candidat</button>
                        </form>
                    </div>
                </div>

                <script>
                    $('.sort').sortable({
                        cursor: 'move',
                        axis: 'y',
                        update: function (e, ui) {

                            $(this).sortable("refresh");
                            //var field = $("#nom3").text();
                            var dataObj = {
                                'chaine': nom1
                            };
                            $("#sort").each(function (index) {
                                dataObj["chaine"] = $(this).text();
                                console.log(index + ": " + $(this).text());
                            });

                            $.ajax({
                                type: 'POST',
                                url: 'modifierChoixEnt.chxE',
                                data: dataObj,
                                success: function (msg) {
                                }
                            });
                        }
                    });
                </script>
                <script>
                    var fixHelperModified = function (e, tr) {
                        var $originals = tr.children();
                        var $helper = tr.clone();
                        $helper.children().each(function (index) {
                            $(this).width($originals.eq(index).width())
                        });
                        return $helper;
                    }, updateIndex = function (e, ui) {
                        $('td.index', ui.item.parent()).each(function (i) {
                            $(this).html(i + 1);
                        });
                    };

                    $("#sort tbody").sortable({
                        helper: fixHelperModified,
                        stop: updateIndex
                    }).disableSelection();

                    $(document).ready(function () {
                        $(document).on('click', '.btn_remove', function () {
                            var button_id = $(this).closest('tr').attr("id");
                            $('#' + button_id + '').remove();
                            update($(this).attr("id"));
                        });
                        //get it if Status key found
                        if (localStorage.getItem("Status"))
                        {
                            alerty.toasts("Le choix a bien été supprimé !");
                            localStorage.clear();
                        }
                    });
                    function update(id) {
                        var dataObj = {
                            'chaine': id
                        };
                        $.ajax({
                            type: 'POST',
                            url: 'supprimerChoix.chxE',
                            data: dataObj,
                            success: function (msg) {
                                localStorage.setItem("Status", "OK");
                                window.location.reload();
                            }
                        });
                    }
                    ;
                </script>
                </body>
                </html>