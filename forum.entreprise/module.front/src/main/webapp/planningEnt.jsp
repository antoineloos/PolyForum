<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">

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

        <!-- Custom timetable -->
        <link rel="stylesheet" href="timetable/styles/timetablejs.css">
        <link rel="stylesheet" href="alerty/css/alerty.css">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css">
        <link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.5.1/css/buttons.dataTables.min.css">


        <!-- Template js -->
        <script src="bootstrap/js/bootstrap.min.js"></script>
        <script src="js/jquery.appear.js"></script>
        <script src="js/contact_me.js"></script>
        <script src="js/jqBootstrapValidation.js"></script>
        <script src="js/modernizr.custom.js"></script>
        <script src="js/script.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
        <script src="//code.jquery.com/jquery-1.10.2.js"></script>
        <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
        <script src="dom-to-image/dom-to-image.min.js"></script>
        <script src="alerty/js/alerty.min.js"></script>
        <script src="timetable/scripts/timetable.js"></script>
        <script src="html2canvas/html2canvas.min.js"></script>
        <script type="text/javascript" src="canvas2image/canvas2image.js"></script>
        <script type="text/javascript" src="jsPDF/jspdf.min.js"></script>
        <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.5.1/js/dataTables.buttons.min.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.flash.min.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.html5.min.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.print.min.js"></script>
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
                                    <a class="dropdown-item" href="gererSalles.adm">G�rer</a>
                                    <a class="dropdown-item" href="saisieSalle.adm">Ajouter</a>
                                </div>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    Planning
                                </a>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <a class="dropdown-item" href="genererPlanning.adm">G�n�rer</a>
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
                    <li class="nav-item"><a class="nav-link" href='deconnecter.cpt'>D�connexion</a></li>
                </ul>

            </div>
        </nav>
    
    <a id="save" href="none" download="name"></a>

    <input type="hidden" id="listeEntretien" name="listeEntretien" value="${sessionScope.entretiens}"></input>
    <input type="hidden" id="listeEntreprise" name="listeEntreprise" value="${sessionScope.entreprise}"></input>


       <div class="well well-lg col-md-8">
	<div class="frame" id="logo-section" class="text-center">
		<div class="contentdiv hidden-print">
			<div class="row">
				<div class="col-md-12">
					<div class="logo text-center">
                                            <span class="text-center"><h2>Consultation du planning ${ent.entreprise.nom}</h2></span>
					</div>
				</div>
			</div>
		</div>
	</div>

	<input type="hidden" id="listeEntretien" name="listeEntretien" value="${sessionScope.entretiens}" />
	<input type="hidden" id="listeEntreprise" name="listeEntreprise" value="${sessionScope.entreprises}" />
	<input type="hidden" id="eventWanted" name="eventWanted" value="false" />
	<div class="mainbody-section text-center">
            <div class="container">
		<br />
		<div class="panel panel-default table-responsive">
                    <table id="sort" >
                        <thead>
                            <tr>
                                <th class="bg-primary index" style="text-align: center;">Nom de l'entreprise</th>
                                <th class="bg-primary index" style="text-align: center;">Nom du candidat</th>
                                <th class="bg-primary index" style="text-align: center;">Salle</th>
                                <th class="bg-primary index" style="text-align: center;">D�but</th>
                                <th class="bg-primary index" style="text-align: center;">Fin</th>


                            </tr>
                        </thead>
                        <tbody class="sort">
                            <c:forEach var="ent" items="${entretiensEnt}" varStatus="loop">
                                <tr>
                                    <td>${ent.entreprise.nom}</td>
                                    <td>${ent.candidat.prenom} ${ent.candidat.nom}</td>
                                    <td>${ent.salle.nom}</td>
                                    <td> <fmt:formatDate type = "time" timeStyle = "short" value = "${ent.heure}"/></td>
                                    <td>  <fmt:formatDate type = "time" timeStyle = "short" value = "${ent.heureFin}"/></td>

                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>

	</div>
    </div>
        
    <script>

        $(document).ready(function () {
            $('#sort').DataTable({
                dom: 'Bfrtip',
                buttons: [
                    'copy', 'csv', 'excel', 'pdf', 'print'
                ]
            });
        });
    </script>
</body>
</html>