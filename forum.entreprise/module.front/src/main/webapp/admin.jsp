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
							<div>
								<strong>${sessionScope.login}</strong>
								<div class="pull-right">${sessionScope.type}</div>
							</div>
						</div>
						<div class="panel-body">
							<div class="form-group">
								<input type="button" class="btn btn-danger" value="Consulter comptes" onclick="location.href='consulterMdp.adm'" />
								<input type="button" class="btn btn-danger" value="Déconnexion" onclick="location.href='deconnecter.cpt'" />
							</div>
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
					<span>Outil de planification</span>
				</div>
			</div>
		</div>
	</div>
	</section>
	<!-- End Logo Section -->

	<input type="hidden" id="notif" name="notif" value="${notifR}" />

	<!-- Start Main Body Section -->
	<div class="mainbody-section text-center">
		<div class="container">
			<div class="form-group">
				<div class="col-md-12  center-block" style="padding-top: 5px">
					<c:if test="${erreurR != null && erreurR != ''}">
						<div class="alert-danger" role="alert" >
								<span class="glyphicon glyphicon-exclamation-sign"  aria-hidden="true"></span>
								<pre style="display:inline"><c:out value="${erreurR}" /></pre>
							
						</div>
						<br>
						<br>
					</c:if>
				</div>
				<div class="row">

					<div class="col-md-3">
						<div class="menu-item blue">
							<a href="saisieEntreprise.adm" data-toggle="modal"> <i class="fa fa-user"></i>
								<p>Saisir des entreprises</p>
							</a>
						</div>

						<div class="menu-item green">
							<a href="consulterEnt.adm" data-toggle="modal"> <i class="fa fa-envelope-o"></i>
								<p>Consulter les entreprises</p>
							</a>
						</div>

						<div class="menu-item light-red">
							<a href="gererSalles.adm" data-toggle="modal"> <i class="fa fa-area-chart"></i>
								<p>Gérer les salles</p>
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
										<img src="images/connexion.jpg" class="img-responsive img-rounded" alt="">
									</div>

								</div>

							</div>
						</div>
						<!-- Start Carousel Section -->

						<div class="row">
							<div class="col-md-6">
								<div class="menu-item color responsive">
									<a href="genererPlanning.adm" data-toggle="modal"> <i class="fa fa-area-chart"></i>
										<p>Générer un planning</p>
									</a>
								</div>
							</div>

							<div class="col-md-6">
								<div class="menu-item light-orange responsive-2">
									<a href="consulterPlanning.adm" data-toggle="modal"> <i class="fa fa-users"></i>
										<p>Consulter le planning</p>
									</a>
								</div>
							</div>

						</div>

					</div>

					<div class="col-md-3">

						<div class="menu-item light-red">
							<a href="saisieCandidat.adm" data-toggle="modal"> <i class="fa fa-file-photo-o"></i>
								<p>Saisir des candidats</p>
							</a>
						</div>

						<div class="menu-item color">
							<a href="consulterCan.adm" data-toggle="modal"> <i class="fa fa-comment-o"></i>
								<p>Consulter les candidats</p>
							</a>
						</div>

						<div class="menu-item blue">
							<!-- <a href="consulterCV.file" data-toggle="modal"> <i class="fa fa-mortar-board"></i> -->
							<a href="choixTypeDocument.adm" data-toggle="modal"> <i class="fa fa-mortar-board"></i>
								<p>Consulter les documents</p>
							</a>
						</div>

					</div>
				</div>
			</div>
		</div>
		<!-- End Main Body Section -->
</body>
</html>