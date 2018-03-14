<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
<link rel="stylesheet" href="alerty/css/alerty.css">

<link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css">
<link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.5.1/css/buttons.dataTables.min.css">

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
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script src="dom-to-image/dom-to-image.min.js"></script>
<script src="alerty/js/alerty.min.js"></script>
<script src="timetable/scripts/timetable.js"></script>
<script src="html2canvas/html2canvas.min.js"></script>
<script type="text/javascript" src="canvas2image/canvas2image.js"></script>
<script type="text/javascript" src="jsPDF/jspdf.min.js"></script>
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
	<a id="save" href="none" download="name"></a>
	<section id="logo-section" class="text-center hidden-print">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="logo text-center">
					<h1>PolyForum</h1>
				</div>
			</div>
		</div>
	</div>
	</section>
	<input type="hidden" id="listeEntretien" name="listeEntretien" value="${sessionScope.entretiens}"></input>
	<input type="hidden" id="listeCandidat" name="listeCandidat" value="${sessionScope.candidat}"></input>

	<c:if test="${not empty sessionScope.entretiens}">
		<div class="mainbody-section text-center">
			<div class="contentdiv">
				<div class="visibleContent" id="visibleContent">
					<div class="timetable" id="timetable"></div>
					<div class="adm-options" style="display: inline-block; width: 32%;">
						<button class="btn btn-action hidden-print" style="margin-top: 2%; margin-right: 0.5%; float: left;" onClick="savePage()">Enregistrer
							le planning</button>
					</div>
				</div>
			</div>
		</div>
	</c:if>
        
         <div class="container">
		<br />
		<div class="panel panel-default">
                 
         <table id="sort" >
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
					<c:forEach var="ent" items="${entretiensEnt}" varStatus="loop">
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