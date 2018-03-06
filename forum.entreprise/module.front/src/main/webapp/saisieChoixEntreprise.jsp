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
						<span>Ajout des candidats</span>
					</div>
				</div>
			</div>
		</div>
	</section>
	<input type="hidden" id="temp" name="temp" value="" />
	<div class="container">
		<br /> <br /> <font color="grey" size="2">* Ajoutez vos différents choix puis validez pour enregistrer.</font>
		<div class="form-group">
			<c:if test="${empty listeCandidats}">
				<br />
				<div class="alert alert-warning">
					<strong>Aucun candidat n'est disponible!</strong>
				</div>
			</c:if>
			<c:if test="${!empty listeCandidats}">
				<form name="add_name" id="add_name" role="form"
					action="choixEnt.chxE" method="POST">
					<table class="table table-bordered grid" id="dynamic_field">
					<thead>
						<tr>
							<th class="bg-primary">Nom</th>
							<th class="bg-primary">Durée</th>
							<th class="bg-primary"></th>
						</tr>
					</thead>
					<tbody>
						<tr id="row1">
							<!-- 						<td><input type="text" id="nom1" name="nom1" -->
							<!-- 							placeholder="Nom du candidat" class="form-control name_list" /></td> -->
							<!-- 						<td><input type="text" id="prenom1" name="prenom1" -->
							<!-- 							placeholder="Prénom du candidat" class="form-control name_list" /></td> -->
							<td><select name=nom1 class="form-control"
								id="listeCandidats">
								<option value="Sélectionnez un candidat">Sélectionnez un candidat</option>
									<c:forEach var="candidat" items="${listeCandidats}">
										<option value="${candidat.idCandidat}">${candidat.prenom}
											${candidat.nom}</option>
									</c:forEach>
							</select></td>
							<td>
								<select id=duree1 class="form-control" name="duree1">
									<option value="Sélectionnez une durée">Sélectionnez une durée</option>
									<option value=20>20</option>
									<option value=30>30</option>
									<option value=40>40</option>
								</select>
							<td><button type="button" name="add" id="add"
									class="btn btn-success">Ajouter</button></td>
						</tr>
					</tbody>
					</table>
					<input type="submit" id="submit" class="btn btn-info"
						form="add_name" value="Valider" />
				</form>
			</c:if>
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
												var e = document.getElementById("listeCandidats");
												var strUser = e.options[e.selectedIndex].value;
												if ($("#nom1").val() != ""
														&& strUser.indexOf("ez un candidat") == -1 
														&& $("#duree1").val() != ""
														&& $("#duree1").val() < 46
														&& checkCandidat(strUser) == "true") {
													var e = document
															.getElementById("listeCandidats");
													i++;
													$('#dynamic_field')
															.append(
																	'<tr id="row'+i+'"><td style="display:none;"><input type="text" id="id'+e.options[e.selectedIndex].value +'" name="id'+i+'" value="'+ e.options[e.selectedIndex].value + '" class="form-control name_list" readonly="true"/></td><td><input type="text" name="nom'
																			+ i
																			+ '" placeholder="'
																			+ $(
																					'#nom1')
																					.val()
																			+ '" value="'
																			+ e.options[e.selectedIndex].text
																			+ '" class="form-control name_list" readonly="true"/></td><td><input type="number" min="0" max="45" name="duree'
																			+ i
																			+ '" placeholder="'
																			+ $(
																					'#duree1')
																					.val()
																			+ '" value="'
																			+ $(
																					'#duree1')
																					.val()
																			+ '" class="form-control name_list" readonly="true"/></td><td><button type="button" name="remove" id="'+i+'" class="btn btn-danger btn_remove">X</button></td></tr>');
													$("#duree1").attr(
															"placeholder",
															"Durée");
													$("#duree1").val("Sélectionnez une durée");
													$('#listeCandidats')
															.prop(
																	'selectedIndex',
																	0)
												}
											});
							$(document).on('click', '.btn_remove', function() {
								var button_id = $(this).attr("id");
								updateTemp(button_id);
								$('#row' + button_id + '').remove();
							});
						});
		function checkCandidat(strUser){
			var elem = document.getElementById("temp");
			if (elem.value.indexOf(strUser) == -1){
				document.getElementById("temp").value = elem.value + " " + strUser;
				return "true";
			} else {
				var chaine = elem.value.split(" ");
				var i = 0;
				while (i < chaine.length){
					if (chaine[i] == strUser){
						return "false";
					}
					i++;
				}
				document.getElementById("temp").value = elem.value + " " + strUser;
				return "true";
			}
		}
		function updateTemp(button_id){
			var name = "id" + button_id;
			var temp = document.getElementById("temp").value;
			var elem = document.getElementsByName(name);
			var tab = temp.split(" ");
			var i = 0;
			while (i < tab.length){
				if (tab[i] == elem[0].value){
					var replacement = "";
					if (i == tab.length - 1 ){
						replacement = replacement + temp.replace(tab[i], "");
					} else {
						replacement = replacement + temp.replace(tab[i] + " ", "");
					}
					
					document.getElementById("temp").value = replacement;
				}
				i++;
			}
			
		}
	</script>
</body>
</html>