
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="fr">

<head>
<link rel="icon" type="image/ico" href="images/favicon.ico" />
<!--[if IE]><link rel="shortcut icon" type="image/x-icon" href="favicon.ico" /><![endif]-->
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
<link href='http://fonts.googleapis.com/css?family=Lobster' rel='stylesheet' type='text/css'>

<link rel="stylesheet" href="alerty/css/alerty.css">


<!-- Template js -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
<script src="../../js/jquery-2.1.1.min.js"></script>
<script src="../../bootstrap/js/bootstrap.min.js"></script>
<script src="../../js/jquery.appear.js"></script>
<script src="../../js/contact_me.js"></script>
<script src="../../js/jqBootstrapValidation.js"></script>
<script src="../../js/modernizr.custom.js"></script>
<script src="../../js/script.js"></script>
<script src="alerty/js/alerty.min.js"></script>

    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
<script>
	function alerting() {
		var notif = document.getElementById("notif").value;
		if (notif != '' && notif != null) {
			alerty.toasts(notif);
		}
	}
	$(document).ready(function() {
		alerting();
	});
</script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

</head>
<body>
    
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="accueil.cpt">PolyForum</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="accueil.cpt">Accueil <span class="sr-only">(current)</span></a>
      </li>
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
       <li class="nav-item"><a class="nav-link" href="download.file">Documents</a></li>
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
                <li class="nav-item"><a class="nav-link" href='modifier_etu.cpt'>Bonjour <strong>${sessionScope.prenom}</strong> </a></li>
            </c:if>
            <li class="nav-item"><a class="nav-link" href='deconnecter.cpt'>Déconnexion</a></li>
      </ul>
  </div>
</nav>

	<!-- Start Logo Section -->
	<section id="logo-section" class="text-center">
		<div class="container">
                      <c:if test="${erreurR != null && erreurR != ''}">
						<div class="alert-danger" role="alert" >
								<span class="glyphicon glyphicon-exclamation-sign"  aria-hidden="true"></span>
								<pre style="display:inline"><c:out value="${erreurR}" /></pre>
							
						</div>
						<br>
						<br>
					</c:if>${erreurR}
			<div class="row">
				<div class="col-md-12">
					<div class="logo text-center">
                                            <br/>
                                            <img src="images/polyforum.png" style="
                                                width: 200px;
                                            ">
                                            <br/>
						<span>Outil de plannification</span>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>

</html>