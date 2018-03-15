<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="icon" type="image/ico" href="images/favicon.ico" />
<!--[if IE]><link rel="shortcut icon" type="image/x-icon" href="favicon.ico" /><![endif]-->

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Poly Forum</title>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
<script src="../../bootstrap/js/bootstrap.min.js"></script>
<script src="../../js/jquery.appear.js"></script>
<script src="../../js/contact_me.js"></script>
<script src="../../js/jqBootstrapValidation.js"></script>
<script src="../../js/modernizr.custom.js"></script>
<script src="../../js/script.js"></script>
<script src="alerty/js/alerty.min.js"></script>

<!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
<script>
	function alert() {
		var notif = document.getElementById("notif").value;
		if (notif != '' && notif != null) {
			alerty.toasts(notif);
		}
	}
	$(document).ready(function() {
		alert();
	});
</script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <c:if test="${sessionScope.type == 'entreprise' || sessionScope.type == 'candidat'}">
            <a class="navbar-brand" href="accueil.cpt">PolyForum</a>

        </c:if>
        <c:if test="${sessionScope.type == 'admin'}">
              <a class="navbar-brand" href="admin.jsp">PolyForum</a>
        </c:if>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item dropdown">
                    <c:if test="${sessionScope.type == 'entreprise' || sessionScope.type == 'candidat'}">
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
                    </c:if>
                    <c:if test="${sessionScope.type == 'admin'}">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Entreprises
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="saisieEntreprise.adm">Saisir</a>
                            <a class="dropdown-item" href="consulterEnt.adm">Consulter</a>
                        </div>
                    </c:if>
                </li>
                <c:if test="${sessionScope.type == 'admin'}">
                    <li class="nav-item"><a class="nav-link" href="gererSalles.adm">Salles</a></li>
                </c:if>
                <c:if test="${sessionScope.type == 'entreprise'}">
                    <li class="nav-item"><a class="nav-link" href="consulterPlanning.chxE">Planning</a></li>
                </c:if>
                <c:if test="${sessionScope.type == 'candidat'}">
                    <li class="nav-item"><a class="nav-link" href="consulterPlanning.can">Planning</a></li>
                </c:if>
                <c:if test="${sessionScope.type == 'admin'}">
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
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Candidats
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="saisieCandidat.adm">Saisir</a>
                            <a class="dropdown-item" href="consulterCan.adm">Consulter</a>
                        </div>
                    </li>
                </c:if>

                <c:if test="${sessionScope.type == 'entreprise' || sessionScope.type == 'candidat'}">
                    <li class="nav-item"><a class="nav-link" href="download.file">Documents</a></li>
                </c:if>
                <c:if test="${sessionScope.type == 'admin'}">
                    <li class="nav-item"><a class="nav-link" href="choixTypeDocument.adm">Documents</a></li>
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
                      <c:if test="${erreurR != null && erreurR != ''}">
						<div class="alert-danger" role="alert" >
								<span class="glyphicon glyphicon-exclamation-sign"  aria-hidden="true"></span>
								<pre style="display:inline"><c:out value="${erreurR}" /></pre>
							
						</div>
						<br>
						<br>
					</c:if>${erreurR}
</body>
</html>