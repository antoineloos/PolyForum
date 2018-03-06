
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
</head>
<body>

	<!-- Start Logo Section -->
	<section id="logo-section" class="text-right">
		<div class="container">
			<div class="row">
				<div class="col-md-12">

					<div class="logo text-left pull-right">
						<div class="panel panel-success">
							<div class="panel-heading">

								<input type="hidden" id="notif" name="notif" value="${notifR}" />
								<c:if test="${sessionScope.type == 'entreprise'}">
			                           Bonjour <strong>${sessionScope.nom_representant}</strong> (${sessionScope.nom})

							</c:if>
								<c:if test="${sessionScope.type == 'candidat'}">
			                         Bonjour <strong>${sessionScope.prenom} ${sessionScope.nom}</strong>
								</c:if>

							</div>
							<div class="panel-body">


								<c:if test="${sessionScope.type == 'entreprise'}">
									<input type="button" class="btn btn-danger" value="Mon compte" onclick="location.href='modifier_ent.cpt'" />
								</c:if>
								<c:if test="${sessionScope.type == 'candidat'}">
									<input type="button" class="btn btn-danger" value="Mon compte" onclick="location.href='modifier_etu.cpt'" />
								</c:if>
								<input type="button" class="btn btn-danger" value="Déconnexion" onclick="location.href='deconnecter.cpt'" />
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- End Logo Section -->

	<!-- Start Logo Section -->
	<section id="logo-section" class="text-center">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="logo text-center">
						<h1>PolyForum</h1>
						<span>Outil de plannification</span>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- End Logo Section -->

	<!-- Start Main Body Section -->
	<div class="mainbody-section text-center">
		<div class="container">
			<div class="col-md-12  center-block" style="padding-top: 5px">
				<c:if test="${erreurR != null && erreurR != ''}">
					<div class="alert-danger" role="alert">
						<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
						<c:out value="${erreurR}" />
					</div>
					<br>
					<br>
				</c:if>
			</div>
			<div class="row">

				<div class="col-md-3">

					<div class="menu-item blue">
						<c:if test="${sessionScope.type == 'entreprise'}">
							<a href="initSaisieChoixEnt.chxE" data-toggle="modal"> <i class="fa fa-user"></i>
								<p>Saisir mes choix</p>
							</a>
						</c:if>
						<c:if test="${sessionScope.type == 'candidat'}">
							<a href="initSaisieChoixCan.can" data-toggle="modal"> <i class="fa fa-user"></i>
								<p>Saisir mes choix</p>
							</a>
						</c:if>
					</div>

					<div class="menu-item green">
						<c:if test="${sessionScope.type == 'entreprise'}">
							<a href="consulter.chxE" data-toggle="modal"> <i class="fa fa-users"></i>
								<p>Consulter mes choix</p>
							</a>
						</c:if>
						<c:if test="${sessionScope.type == 'candidat'}">
							<a href="consulter.can" data-toggle="modal"> <i class="fa fa-users"></i>
								<p>Consulter mes choix</p>
							</a>
						</c:if>
					</div>

					<div class="menu-item light-red">
						<a href="http://www.formasup-arl.fr/" data-toggle="modal"> <i class="fa fa-user"></i>
							<p>FormaSup</p>
						</a>
					</div>

				</div>

				<div class="col-md-6">

					<!-- Start Carousel Section -->
					<div class="home-slider">
						<div id="carousel-example-generic" class="carousel slide" data-ride="carousel" style="padding-bottom: 30px;">

							<!-- Wrapper for slides -->
							<div class="carousel-inner">
								<div class="item active">
									<img src="images/connexion.jpg" class="img-responsive" alt="">
								</div>

							</div>

						</div>
					</div>
					<!-- Start Carousel Section -->

					<div class="row">
						<div class="col-md-6">
							<div class="menu-item color responsive">
								<a href="download.file" data-toggle="modal"> <i class="fa fa-cloud-upload"></i>
									<p>Ajouter des document</p>
								</a>
							</div>
						</div>

						<div class="col-md-6">
							<div class="menu-item light-orange responsive-2">
								<a href="consulter.file" data-toggle="modal"> <i class="fa fa-file-pdf-o"></i>
									<p>Consulter des documents</p>
								</a>
							</div>
						</div>

					</div>

				</div>

				<div class="col-md-3">

					<div class="menu-item light-red">
						<a href="mailto:polyforum69@gmail.com?subject=[${sessionScope.nom}]:&message=message" data-toggle="modal"> <i class="fa fa-envelope-o"></i>
							<p>Contact</p>
						</a>
					</div>

					<div class="menu-item color">
						<c:if test="${sessionScope.type == 'entreprise'}">
							<a href="consulterPlanning.chxE" data-toggle="modal"> <i class="fa fa-comment-o"></i>
								<p>Consulter mon planning</p>
							</a>
						</c:if>
						<c:if test="${sessionScope.type == 'candidat'}">
							<a href="consulterPlanning.can" data-toggle="modal"> <i class="fa fa-comment-o"></i>
								<p>Consulter mon planning</p>
							</a>
						</c:if>

					</div>

					<div class="menu-item blue">
						<a href="http://polytech.univ-lyon1.fr/" data-toggle="modal"> <i class="fa fa-mortar-board"></i>
							<p>Polytech Lyon</p>
						</a>
					</div>

				</div>
			</div>
		</div>
	</div>
	<!-- End Main Body Section -->





	<!-- End Testimonial Section -->

</body>

</html>