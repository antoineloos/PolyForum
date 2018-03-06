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


<!-- Template js -->
<script src="../../js/jquery-2.1.1.min.js"></script>
<!-- <script src="../../bootstrap/js/bootstrap.min.js"></script> -->
<script src="../../js/bootstrap.min.js"></script>
<script src="../../js/wow.min.js"></script>
<script src="../../js/jquery.appear.js"></script>
<script src="../../js/contact_me.js"></script>
<script src="../../js/jqBootstrapValidation.js"></script>
<script src="../../js/modernizr.custom.js"></script>
<script src="../../js/script.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>

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
					<span>Consulter mes choix</span>
				</div>
			</div>
		</div>
	</div>
	</section>

	<div class="container">
		<br /> <font color="grey" size="2"> * Glisser et déposer vos choix pour ordonner selon vos préférences. </font>
		<form role="form" action="modifierChoixCan.can" method="post">
			<div class="panel panel-default">
				<table id="sort" class="table table-bordered table-striped grid">
					<thead>
						<tr>
							<th class="bg-primary index">Nom</th>
							<th class="bg-primary index">Priorité</th>
							<th class="bg-primary index"></th>
						</tr>
					</thead>
					<tbody class="sort">
						<c:forEach var="varListeChoix" items="${listeChoix}" varStatus="loop">
							<tr id='${loop.index+1}' name='${loop.index+1}'>
								<td id='nom${loop.index+1}' name='nom${loop.index+1}'>${varListeChoix.getChoixCandidatPK().entreprise.nom}</td>
								<td id='prio${loop.index+1}' name='prio${loop.index+1}' class="index">${loop.index+1}</td>
								<td width="5%"><button type="button" name="remove" id="${sessionScope.idCompte} ${varListeChoix.getChoixCandidatPK().idEntreprise}"
										class="btn btn-danger btn_remove">X</button></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</form>
		<form method="get" action="initSaisieChoixCan.can">
			<button type="submit" class="btn btn-action">Ajouter une entreprise</button>
		</form>
	</div>

	<script>
		$('.sort').sortable({
			cursor : 'move',
			axis : 'y',
			update : function(e, ui) {

				$(this).sortable("refresh");
				//var field = $("#nom3").text();
				var dataObj = {
					'chaine' : nom1
				};
				$("#sort").each(function(index) {
					dataObj["chaine"] = $(this).text();
					console.log(index + ": " + $(this).text());
				});

				$.ajax({
					type : 'POST',
					url : 'modifierChoixCan.can',
					data : dataObj,
					success : function(msg) {
					}
				});
			}
		});
	</script>
	<script>
		var fixHelperModified = function(e, tr) {
			var $originals = tr.children();
			var $helper = tr.clone();
			$helper.children().each(function(index) {
				$(this).width($originals.eq(index).width())
			});
			return $helper;
		}, updateIndex = function(e, ui) {
			$('td.index', ui.item.parent()).each(function(i) {
				$(this).html(i + 1);
			});
		};

		$("#sort tbody").sortable({
			helper : fixHelperModified,
			stop : updateIndex
		}).disableSelection();
	</script>
	<script>
		$(document).ready(function() {
			$(document).on('click', '.btn_remove', function() {
				var button_id = $(this).closest('tr').attr("id");
				$('#' + button_id + '').remove();
				update($(this).attr("id"));
			});
		});
		function update(id) {
			var dataObj = {
				'chaine' : id
			};
			$.ajax({
				type : 'POST',
				url : 'supprimerChoix.can',
				data : dataObj,
				success : function(msg) {
					alerty.toasts("Le choix a bien été supprimé !")
				}
			});
		};
	</script>
</body>
</html>