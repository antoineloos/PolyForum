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
<link href='http://fonts.googleapis.com/css?family=Lobster' rel='stylesheet' type='text/css'>


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
						<span>Ajout des candidats</span>
					</div>
				</div>
			</div>
		</div>
	</section>
	<div class="container">
		<div class="form-group">
			<form name="add_name" id="add_name" role="form" action="saisieCan.adm" method="POST">
				<table class="table" id="dynamic_field">
					<tr id="row1">
						<td><input type="text" id="nom1" name="nom1" placeholder="Nom du candidat" class="form-control name_list" /></td>
						<td><input type="text" id="prenom1" name="prenom1" placeholder="Prenom du candidat" class="form-control name_list" /></td>
						<td><input type="text" id="mail1" name="mail1" placeholder="Adresse mail" class="form-control name_list" /></td>
						<td><button type="button" name="add" id="add" class="btn btn-success">Ajouter</button></td>
					</tr>
				</table>
				<input type="submit" id="submit" class="btn btn-info" form="add_name" value="Valider" />
			</form>
		</div>
	</div>

	<br><br>

	<section id="logo-section" class="text-center">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="logo text-center">
						<span>Ajout de candidats à partir d'un fichier Excel</span>
					</div>
				</div>
			</div>
		</div>
	</section>
	<div class="container">
		<div class="form-group">
							<form role="form" action="templateExcelCandidat.adm" method="POST" enctype="multipart/form-data">
					<input type="submit" id="submitExcel" class="btn btn-success pull-right" value="Télécharger le template" />
					</form>
					<form role="form" action="excelCandidat.adm" method="POST" enctype="multipart/form-data">
					<table class="table" id="dynamic_field">
						<tr id="row">
							<td><input type="file" id="document" name="document" class="form-control name_list" accept=".xls,.xlsx"/></td>
						</tr>
					</table>

					<input type="submit" id="submitExcel" class="btn btn-info" value="Valider" />
					</form>

		</div>
	</div>

	<!-- End Logo Section -->
	<script>
		$(document)
				.ready(
						function() {
							var i = 1;
							$('#add')
									.click(
											function() {
												if ($("#nom1").val() != ""
														&& $("#prenom1").val() != "") {
													i++;
													$('#dynamic_field')
															.append(
																	'<tr id="row'+i+'"><td><input type="text" name="nom'
																			+ i
																			+ '" placeholder="'
																			+ $(
																					'#nom1')
																					.val()
																			+ '" value="'
																			+ $(
																					'#nom1')
																					.val()
																			+ '" class="form-control name_list" readonly="true"/></td><td><input type="text" name="prenom'
																			+ i
																			+ '" placeholder="'
																			+ $(
																					'#prenom1')
																					.val()
																			+ '" value="'
																			+ $(
																					'#prenom1')
																					.val()
																			+ '" class="form-control name_list" readonly="true"/></td><td><input type="text" name="mail'
																			+ i
																			+ '" placeholder="'
																			+ $(
																					'#mail1')
																					.val()
																			+ '" value="'
																			+ $(
																					'#mail1')
																					.val()
																			+ '" class="form-control name_list" readonly="true"/></td><td><button type="button" name="remove" id="'+i+'" class="btn btn-danger btn_remove">X</button></td></tr>');
													$("#nom1").val("");
													$("#prenom1").val("");
													$("#mail1").val("");
													$("#nom1").attr(
															"placeholder",
															"Nom du candidat")
															.placeholder();
													$("#prenom1")
															.attr(
																	"placeholder",
																	"Prenom du candidat")
															.placeholder();
													$("#mail1").attr(
															"placeholder",
															"Adresse mail")
															.placeholder();
												}
											});
							$(document).on('click', '.btn_remove', function() {
								var button_id = $(this).attr("id");
								$('#row' + button_id + '').remove();
							});
							$("input").bind("keydown", function(event) {
							      // track enter key
							      var keycode = (event.keyCode ? event.keyCode : (event.which ? event.which : event.charCode));
							      if (keycode == 13) { // keycode for enter key
							         // force the 'Enter Key' to implicitly click the Update button
							         document.getElementById('add').click();
							         return false;
							      } else  {
							         return true;
							      }
							   }); // end of function
						});
	</script>
	<script>
		var elem = document.getElementById('mail1');
		elem.onkeydown = function (e) {
			if (e.keyCode == 13) {
		    	document.getElementById("add").click();
		    	return false;
			}
		};
	</script>

</body>
</html>