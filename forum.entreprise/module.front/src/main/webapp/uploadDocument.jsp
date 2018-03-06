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
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>

<!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
</head>
<body>
	<!-- Start Logo Section -->
	<section id="logo-section" class="text-right">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="pull-left">
					<br /> <br />
					<div class="form-group">
						<c:if test="${sessionScope.type == 'entreprise' || sessionScope.type == 'candidat'}">
							<a href="index.jsp"><button class="btn btn-danger">Accueil</button></a>
						</c:if>
						<c:if test="${sessionScope.type == 'admin'}">
							<a href="admin.jsp"><button class="btn btn-danger">Accueil</button></a>
						</c:if>
					</div>
				</div>
				<div class="logo text-left pull-right">
						<div class="panel panel-success">
							<div class="panel-heading">

								<input type="hidden" id="notif" name="notif" value="${notifR}" />
								<c:if test="${sessionScope.type == 'entreprise'}">
			                           Bonjour <strong>${sessionScope.nom_representant}</strong> (${sessionScope.nom})

								</c:if>
								<c:if test="${sessionScope.type == 'candidat'}">
			                         Bonjour <strong>${sessionScope.prenom}
										${sessionScope.nom}</strong>
								</c:if>
								<c:if test="${sessionScope.type == 'admin'}">
									<strong>${sessionScope.login}</strong>
									<div class="pull-right">${sessionScope.type}</div>
								</c:if>

							</div>
							<div class="panel-body">


								<c:if test="${sessionScope.type == 'entreprise'}">
									<input type="button" class="btn btn-danger" value="Mon compte"
										onclick="location.href='modifier_ent.cpt'" />
								</c:if>
								<c:if test="${sessionScope.type == 'candidat'}">
									<input type="button" class="btn btn-danger" value="Mon compte" onclick="location.href='modifier_etu.cpt'" />
								</c:if>
								<c:if test="${sessionScope.type == 'admin'}">
									<input type="button" class="btn btn-danger" value="Consulter comptes" onclick="location.href='consulterMdp.adm'" />
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
	
	<section id="logo-section" class="text-center">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="logo text-center">
						<h1>PolyForum</h1>
						<span>Ajouter un documents</span>
					</div>
				</div>
			</div>
		</div>
	</section>
	<div class="container">
		<div class="form-group">
			<form role="form" action="upload.file" method="POST" enctype="multipart/form-data">
				<table class="table" id="dynamic_field">
					<tr id="row">
						<td><input type="file" id="document" name="document" class="form-control name_list" accept=".pdf"/></td>
					</tr>
				</table>
				<input type="submit" id="submit" class="btn btn-info pull-right" value="Valider" />
			</form>
		</div>
	</div>
	<br />
	<br />
	<section id="logo-section" class="text-center">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="logo text-center">
						<span>Documents ajoutés</span>
					</div>
				</div>
			</div>
		</div>
	</section>
	<div class="container">
		<br />
		<div class="panel panel-default">
			<table id="sort" class="table table-bordered table-striped grid">
				<thead>
					<tr>
						<th class="bg-primary index" style="text-align: center;">Nom du fichier</th>
						<th class="bg-primary index" style="text-align: center;"></th>
						<th class="bg-primary index" style="text-align: center;"></th>
					</tr>
				</thead>
				<tbody class="sort">
					<c:forEach var="varListeFichiers" items="${listeFichiers}"
						varStatus="loop">
						<tr id="${varListeFichiers.file.name}">
							<td class="text-center">${varListeFichiers.nomSansExtension}</td>
							<td width="5%">
								<form class="form col-md-12 center-block" role="form" action="recupererFichier.file" method="post">
									<button name="bouton" type="submit" class="btn btn-success btn_remove btn-lg" value="${varListeFichiers.file.name}">
										<span class="glyphicon glyphicon-save" aria-hidden="true"></span>
									</button>
								</form>
							</td>
							<td width="5%">
								<form class="form col-md-12 center-block" role="form" action="supprimerFichier.file" method="post">
									<button type="submit" name="remove" value="${varListeFichiers.file.name}" class="btn btn-danger btn_remove btn-lg">
										X
									</button>
								</form>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>