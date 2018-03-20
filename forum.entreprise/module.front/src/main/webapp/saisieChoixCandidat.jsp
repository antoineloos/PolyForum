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
    <link href="css/fresh-bootstrap-table.css" rel="stylesheet" />
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
        <script
        src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
        <script
        src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>



        <!--[if lt IE 9]>
                    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
                    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
                <![endif]-->

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

        <div class="well well-lg col-md-6 offset-3 topoffset4">
            <section id="logo-section" class="text-center">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="logo">
                                <span><h2>Choix des entreprises</h2></span>
                                    <c:if test="${empty listeEntreprises}">
                                        <br />
                                        <div class="alert alert-warning">
                                            <strong>Aucune entreprise n'est disponible!</strong>
                                        </div>
                                    </c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <div class="container topoffset4">
                <div class="form-group ">
                    <form name="add_name" id="add_name" role="form"
                          action="choixCan.can" method="POST">
                        <div class="fresh-table">

                            <table id="fresh-table" class="table" >
                                <thead>
                                    <tr>
                                        <th class="bg-primary index">Nom</th>
                                        <th class="bg-primary index"></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr id="row1">
                                        <td><select name=nom1 class="form-control" id="listeEntreprises">
                                                <option value="Sélectionnez une entreprise">Sélectionnez une entreprise</option>
                                                <c:forEach var="enterprise" items="${listeEntreprises}">
                                                    <option value="${enterprise.idEntreprise}">${enterprise.nom}</option>
                                                </c:forEach>
                                            </select></td>
                                        <td><button type="button" name="add" id="add"
                                                    class="btn btn-success">Ajouter</button> </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <input type="submit" id="submit" class="btn btn-info"
                               form="add_name" value="Valider" />
                    </form>
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
                                                    //alert('boutonCliquer');
                                                    var e = document.getElementById("listeEntreprises");
                                                    var strUser = e.options[e.selectedIndex].value;
                                                    if ($("#nom1").val() != ""
                                                            && strUser.indexOf("ez une entreprise") == -1
                                                            && checkEntreprise(strUser) == "true") {
                                                        var e = document
                                                                .getElementById("listeEntreprises");
                                                        i++;
                                                        $('#fresh-table')
                                                                .append(
                                                                        '<tr id="row' + i + '"><td style="display:none;"><input type="text" id="id' + e.options[e.selectedIndex].value + '" name="id' + i + '" value="' + e.options[e.selectedIndex].value + '" class="form-control name_list" readonly="true"/></td><td><input type="text" name="nom'
                                                                        + i
                                                                        + '" placeholder="'
                                                                        + $(
                                                                                '#nom1')
                                                                        .val()
                                                                        + '" value="'
                                                                        + e.options[e.selectedIndex].text
                                                                        + '" class="form-control name_list" readonly="true"/></td><td><button type="button" name="remove" id="' + i + '" class="btn btn-danger btn_remove">X</button></td></tr>');
                                                        //e.remove(e.options[e.selectedIndex]);

                                                        $('#listeEntreprises').prop('selectedIndex', 0)
                                                    }
                                                });
                                $(document).on('click', '.btn_remove', function () {
                                    var button_id = $(this).attr("id");
                                    updateTemp(button_id);
                                    $('#row' + button_id + '').remove();
                                });
                            });
            function checkEntreprise(strUser) {
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
        <script type="text/javascript">
            var $table = $('#fresh-table'),
                    $alertBtn = $('#alertBtn'),
                    full_screen = false;

            $().ready(function () {
                $table.bootstrapTable({
                    toolbar: ".toolbar",
                    showRefresh: true,
                    search: true,
                    showToggle: true,
                    showColumns: true,
                    pagination: true,
                    striped: true,
                    sortable: true,
                    pageSize: 8,
                    pageList: [8, 10, 25, 50, 100],
                    formatShowingRows: function (pageFrom, pageTo, totalRows) {
                        //do nothing here, we don't want to show the text "showing x of y from..."
                    },
                    formatRecordsPerPage: function (pageNumber) {
                        return pageNumber + " rows visible";
                    },
                    icons: {
                        refresh: 'fa fa-refresh',
                        toggle: 'fa fa-th-list',
                        columns: 'fa fa-columns',
                        detailOpen: 'fa fa-plus-circle',
                        detailClose: 'fa fa-minus-circle'
                    }
                });
            });

            $(function () {
                $alertBtn.click(function () {
                    alert("You pressed on Alert");
                });
            });


            function operateFormatter(value, row, index) {
                return [
                    '<a rel="tooltip" title="Like" class="table-action like" href="javascript:void(0)" title="Like">',
                    '<i class="fa fa-heart"></i>',
                    '</a>',
                    '<a rel="tooltip" title="Edit" class="table-action edit" href="javascript:void(0)" title="Edit">',
                    '<i class="fa fa-edit"></i>',
                    '</a>',
                    '<a rel="tooltip" title="Remove" class="table-action remove" href="javascript:void(0)" title="Remove">',
                    '<i class="fa fa-remove"></i>',
                    '</a>'
                ].join('');
            }

            window.operateEvents = {
                'click .like': function (e, value, row, index) {
                    alert('You click like icon, row: ' + JSON.stringify(row));
                    console.log(value, row, index);
                },
                'click .edit': function (e, value, row, index) {
                    console.log(value, row, index);
                },
                'click .remove': function (e, value, row, index) {
                    alert('You click remove icon, row: ' + JSON.stringify(row));
                    console.log(value, row, index);
                }
            };

        </script>
    </body>
</html>