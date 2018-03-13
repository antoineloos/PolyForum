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

<!-- Resizable -->
<link rel="stylesheet" type="text/css" href="http://code.jquery.com/ui/1.9.2/themes/base/jquery-ui.css">

<!-- Popup -->
<link rel="stylesheet" href="magnific-popup/magnific-popup.css">
<link rel="stylesheet" href="alerty/css/alerty.css">

<link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css">
<link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.5.1/css/buttons.dataTables.min.css">



<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script src="magnific-popup/jquery.magnific-popup.js"></script>
<script src="timetable/scripts/timetable.js"></script>
<script type="text/javascript" src="jsPDF/jspdf.min.js"></script>

<script src="alerty/js/alerty.min.js"></script>
<script src="html2canvas/html2canvas.min.js"></script>
<script type="text/javascript" src="canvas2image/canvas2image.js"></script>
<script src="html2canvas/jquery.plugin.html2canvas.js"></script>
<script src="dom-to-image/dom-to-image.min.js"></script>

<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/buttons/1.5.1/js/dataTables.buttons.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.flash.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.html5.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.print.min.js"></script>

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
	
	<div id="test-popup" class="white-popup mfp-hide"
		style="position: relative; background: #FFF; padding: 20px; width: auto; max-width: 500px; margin: 20px auto;">
		<div id="add_entretien" name="add_entretien" class="white-popup-block">
			<h1>Création d'un entretien</h1>
			<fieldset style="border: 0;">
				<ol>
					<li><label for="entreprise">Entreprise</label> <input id="entreprise" class="form-control name_list" name="entreprise" type="text"
						placeholder="Nom de l'entreprise" required="true" readonly="true"></li>
					<li><label for="candidat">Candidat</label> <select name=candidats class="form-control" id="listeCandidats">
							<c:forEach var="candidat" items="${sessionScope.listeCandidats}">
								<option value="${candidat.idCandidat}">${candidat.prenom} ${candidat.nom}</option>
							</c:forEach>
					</select></li>
					<li><label for="heureD">Heure de début</label> <input id="heureD" class="form-control name_list" name="heureD" type="text"
						placeholder="Heure de début" required="true" readonly="true"></li>
					<li><label for="heureF">Heure de fin</label> <input id="heureF" class="form-control name_list" name="heureF" type="text"
						placeholder="Heure de fin" required="true" readonly="true"></li>
				</ol>
			</fieldset>
			<input id="added" name="added" type="hidden" value="false" /> <input type="submit" id="submit" class="btn btn-info" onclick="addEntretien()"
				value="Valider" style="margin-top: 2%;">
			<button title="Close (Esc)" type="button" class="mfp-close" onClick="window.location.reload()">×</button>
		</div>
	</div>


	<div class="frame" id="logo-section" class="text-center">
		<div class="contentdiv hidden-print">
			<div class="row">
				<div class="col-md-12">
					<div class="logo text-center">
						<h1>PolyForum</h1>
						<span>Consultation du planning</span>
					</div>
				</div>
			</div>
		</div>
	</div>

	<input type="hidden" id="listeEntretien" name="listeEntretien" value="${sessionScope.entretiens}" />
	<input type="hidden" id="listeEntreprise" name="listeEntreprise" value="${sessionScope.entreprises}" />
	<input type="hidden" id="eventWanted" name="eventWanted" value="false" />
	<div class="mainbody-section text-center">
            <div class="container">
		<br />
		<div class="panel panel-default">
            <table id="sort" class="table table-bordered table-striped grid">
				<thead>
					<tr>
						<th class="bg-primary index" style="text-align: center;">Nom de l'entreprise</th>
						<th class="bg-primary index" style="text-align: center;">Nom du candidat</th>
                                                <th class="bg-primary index" style="text-align: center;">Salle</th>
                                                <th class="bg-primary index" style="text-align: center;">Debut</th>
                                                <th class="bg-primary index" style="text-align: center;">Fin</th>
						
						
					</tr>
				</thead>
				<tbody class="sort">
					<c:forEach var="ent" items="${entretiens}" varStatus="loop">
						<tr>
							<td>${ent.entreprise.nom}</td>
							<td>${ent.candidat.prenom} ${ent.candidat.nom}</td>
                                                        <td>${ent.idSalle}</td>
                                                        <td> <fmt:formatDate type = "time" timeStyle = "short" value = "${ent.heure}"/></td>
                                                        <td>  <fmt:formatDate type = "time" timeStyle = "short" value = "${ent.heureFin}"/></td>
							
								</tr>
					</c:forEach>
				</tbody>
			</table>
                </div>
            </div>
		<div class="contentdiv">
			<div class="timetable" id="timetable"></div>
			<div class="adm-options" style="display: inline-block; width: 32%;">
				<button class="btn btn-action hidden-print" style="margin-top: 2%; margin-right: 0.5%; float: left;" onClick="savePage()">Enregistrer le
					planning</button>
				<form class="hidden-print btn-planning" method="get" action="choixTypePlanning.jsp" style="float: left; margin-top: 2%;">
					<button type="submit" class="btn btn-action btn-planning" style="min-width: 160px;">Plannings individuels</button>
				</form>
				<form class="hidden-print btn-planning" method="get" action="vider.adm" style="float: left; margin-top: 2%;; margin-left: 0.5%;">
					<button type="submit" class="btn btn-action btn-planning" style="min-width: 160px;">Vider le planning</button>
				</form>
			</div>
		</div>

	</div>

       
              <script>
            
            $(document).ready(function() {
    $('#sort').DataTable( {
        dom: 'Bfrtip',
        buttons: [
            'copy', 'csv', 'excel', 'pdf', 'print'
        ]
    } );
} );
       
            
        </script>
            
</body>
</html>