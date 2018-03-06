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


	<!-- Start Main Body Section -->
	<div class="mainbody-section text-center">
		<div class="container">
			<div id="loginModal" class="modal show" tabindex="-1" role="dialog"
				aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h1 class="text-center"> Mon compte</h1>
						</div>
						<div class="fo	rm-group">
							<div class="col-md-12  center-block" style="padding-top: 5px">
								<c:if test="${erreurR != null && erreurR != ''}">
									<div class="alert-danger" role="alert">
										<span class="glyphicon glyphicon-exclamation-sign"
											aria-hidden="true"></span>
										<c:out value="${erreurR}" />
									</div>
								</c:if>
							</div>
						</div>
						<div class="modal-body">
						
							<form class="form col-md-12 center-block" role="form"
								action="modifierCompte_ent.cpt" method="post">
								<div class="form-group">
								<label for="identity">IDENTITE</label>
									<input class="form-control" type="text" readonly value="${sessionScope.nom}"/>
								<br />
									<input class="form-control" type="text" readonly value="${sessionScope.representant}"/>
									<br />
									<input class="form-control" type="text" readonly value="${sessionScope.login}"/>
								</div>
								<br />
								<div class="form-group">
								<label for="mdp_old">MOT DE PASSE</label>
								<input class="form-control" type="password" placeholder="Ancien mot de passe" name="mdp_old">
								<br />
								<div class="form-group">
								<input class="form-control" type="password" placeholder="Nouveau mot de passe" name="mdp_new">
								</div>
								<br />
								<div class="form-group">
								<input class="form-control" type="password" placeholder="Confirmer le nouveau mot de passe" name="mdp_new2">
								</div>
								<br />
								<div class="form-group">
									<button type="submit" class="btn btn-success btn-lg btn-block">Valider</button>
								</div>
							</form>
							</br>
							<form class="form col-md-12 center-block" role="form" action="accueil.cpt" method="post" style="padding-left: 0px;padding-right: 0px;">
								<div class="form-group">
									<button  class="btn btn-danger btn-lg btn-block" href="/index.jsp">Retour</button>
								</div>
								</form>
						</div>
						<div class="modal-footer"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End Main Body Section -->





	<!-- End Testimonial Section -->

</body>

</html>