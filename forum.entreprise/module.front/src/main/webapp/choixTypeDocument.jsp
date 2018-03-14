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

<!-- Custom timetable -->
<link rel="stylesheet" href="timetable/styles/timetablejs.css">


<!-- Template js -->
<script src="../../js/jquery-2.1.1.min.js"></script>
<script src="../../bootstrap/js/bootstrap.min.js"></script>
<script src="../../js/jquery.appear.js"></script>
<script src="../../js/contact_me.js"></script>
<script src="../../js/jqBootstrapValidation.js"></script>
<script src="../../js/modernizr.custom.js"></script>
<script src="../../js/script.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
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
                <li class="nav-item active">
                    <c:if test="${sessionScope.type == 'entreprise' || sessionScope.type == 'candidat'}">
                        <a class="nav-link" href="accueil.cpt">Accueil <span class="sr-only">(current)</span></a>
                    </c:if>
                    <c:if test="${sessionScope.type == 'admin'}">
                        <a class="nav-link" href="admin.jsp">Accueil <span class="sr-only">(current)</span></a>        
                    </c:if>
                </li>
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
                            <a class="dropdown-item" href="genererPlanning.adm">Générer</a>
                            <a class="dropdown-item" href="cconsulterPlanning.adm">Consulter</a>
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
                <li class="nav-item"><a class="nav-link" href='deconnecter.cpt'>Déconnexion</a></li>
            </ul>
            
        </div>
    </nav>
	<!-- End Logo Section -->

	<section id="logo-section" class="text-center">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="logo text-center">
					<h1>PolyForum</h1>
					<span>Choisissez le type de document que vous souhaitez consulter.</span>
				</div>
			</div>
		</div>
	</div>
	</section>
	<input type="hidden" id="listeEntretien" name="listeEntretien" value="${sessionScope.entretiensEnt}"></input>
	<input type="hidden" id="listeEntreprise" name="listeEntreprise" value="${sessionScope.entreprisesEnt}"></input>

	<div class="container">
		<div class="row">
			<div class="mainbody-section text-center">
				<div class="container" style="width: 50%;">
					<div class="logo text-left pull-right" style="width: 100%;">
						<div class="panel panel-success">
							<div class="panel-heading">
								<div>
									<div align="center">Quel type de document souhaitez-vous consulter ?</div>
								</div>
							</div>
							<div class="panel-body">
								<a href="consulterCV.file">
								<input type="submit" class="btn btn-danger" style="width: 100%; height: 50px; font-size: 120%;" name="boutton_cv" value="CV">
								</a> 
								<a href="consulterOffres.file">
								<input type="submit" class="btn btn-danger"
									style="width: 100%; height: 50px; font-size: 120%; margin-top: 2%;" name="boutton_offre" value="Offre"></a>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
	<script>
		var entrepr = document.getElementById("entreprises");
		if (entrepr != null) {
			entrepr.options[0].selected = true;
		}
		var candid = document.getElementById("candidats");
		if (candid != null) {
			candid.options[0].selected = true;
		}
	</script>
</body>
</html>