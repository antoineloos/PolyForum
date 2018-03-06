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

<link rel="stylesheet" href="bootstrapToggle/bootstrap-toggle.min.css">

<link rel="stylesheet" href="alerty/css/alerty.css">



<!-- Template js -->
<script src="js/jquery-2.1.1.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script src="js/jquery.appear.js"></script>
<script src="js/contact_me.js"></script>
<script src="js/jqBootstrapValidation.js"></script>
<script src="js/modernizr.custom.js"></script>
<script src="js/script.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="alerty/js/alerty.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script src="bootstrapToggle/bootstrap-toggle.min.js"></script>

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
					<span>Consulter les candidats</span>
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
						<th class="bg-primary index" style="text-align: center;">Nom du candidat</th>
						<th class="bg-primary index" style="text-align: center;">Prenom du candidat</th>
						<c:if test="${sessionScope.type == 'admin'}">
							<th class="bg-primary index" style="text-align: center;">Présent</th>
						</c:if>
						<th class="bg-primary index" style="text-align: center;"></th>
					</tr>
				</thead>
				<tbody class="sort">
					<c:forEach var="varListeCandidat" items="${listeCandidat}" varStatus="loop">
						<tr id="${varListeCandidat.idCandidat}">
							<td>${varListeCandidat.nom}</td>
							<td>${varListeCandidat.prenom}</td>
							<c:if test="${sessionScope.type == 'admin'}">
								<td width="10%"  style="text-align: center;">
									<c:if test="${varListeCandidat.present == 'true'}">
										<input type="checkbox" data-toggle="toggle" name="presence" class="presence" checked="checked" id="${varListeCandidat.idCandidat}">
									</c:if>
									<c:if test="${varListeCandidat.present == 'false'}">
										<input type="checkbox" data-toggle="toggle" name="presence" class="presence" id="${varListeCandidat.idCandidat}">
									</c:if>
								</td>
							</c:if>
							<td width="5%"><button type="button" name="remove" id="${varListeCandidat.idCandidat}" class="btn btn-danger btn_remove">X</button></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<form method="get" action="saisieCandidat.jsp">
			<button type="submit" class="btn btn-action">Ajouter un candidat</button>
		</form>
	</div>
	<script>
		$(document).ready(function() {
			$(document).on('click', '.btn_remove', function() {
				var button_id = $(this).attr("id");
				$('#' + button_id + '').remove();
				update(button_id);
			});
			$(document).on('change', '.presence', function() {
				var button_id = $(this).attr("id");
				presence(button_id);
			});
		});
		function update(id) {
			var dataObj = {
				'chaine' : id
			};
			$.ajax({
				type : 'POST',
				url : 'modifierListeCan.adm',
				data : dataObj,
				success : function(msg) {
					alerty.toasts("Le candidat a bien été supprimé !")
				}
			});
		};
		function presence(id) {
			var dataObj = {
				'chaine' : id
			};
			$.ajax({
				type : 'POST',
				url : 'presenceCan.adm',
				data : dataObj,
				success : function(msg) {
					alerty.toasts("Présence modifiée ! Générez le planning pour tenir compte de ce changement");
				}
			});
		};
	</script>
</body>
</html>