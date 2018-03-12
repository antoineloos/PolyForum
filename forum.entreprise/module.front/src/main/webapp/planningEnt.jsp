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
                                                  <c:if test="${sessionScope.type == 'admin'}">
                                    <strong>${sessionScope.login}</strong>
                                    <div class="pull-right">${sessionScope.type}</div>
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
	<input type="hidden" id="listeEntreprise" name="listeEntreprise" value="${sessionScope.entreprise}"></input>

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
					<c:forEach var="ent" items="${entretiensEnt}" varStatus="loop">
						<tr>
							<td>${ent.entreprise.nom}</td>
							<td>${ent.candidat.prenom} ${ent.candidat.nom}</td>
                                                        <td>${ent.idSalle}</td>
                                                        <td>${ent.heure}</td>
                                                        <td>${ent.heureFin}</td>
							
								</tr>
					</c:forEach>
				</tbody>
			</table>
                </div>
          </div>
	<script>
	var ent = document.getElementById("listeEntretien");
	if (ent.value != ''){
		var timetable = new Timetable();
		timetable.setScope(14, 18)

		var text = document.getElementById("listeEntretien");
		var ents = document.getElementById("listeEntreprise");
		var res = text.value.split("_");
		var tab = ents.value.split("_");
		var temp = 0;
		while (tab[temp + 2] != null) {
			timetable.addLocations([ tab[temp + 1] + ' '
					+ tab[temp + 2] ]);
			temp = temp + 3;
		}

		var i = 1;

		while (res[i + 5] != null) {
			var temp = i + 4;
			if (temp % 5 == 0) {
				var hd = res[i + 3].split(":");
				var hf = res[i + 4].split(":");
				var argument1 = res[i + 1];
				argument1 = argument1 + ' ';
				argument1 = argument1 + res[i]
				argument1 = argument1 + ' ';
				argument1 = argument1 + hd[0];
				argument1 = argument1 + ":";
				argument1 = argument1 + hd[1];
				argument1 = argument1 + "-";
				argument1 = argument1 + hf[0];
				argument1 = argument1 + ":";
				argument1 = argument1 + hf[1];

				var argument2 = res[i + 2];
				timetable.addEvent(argument1, argument2, new Date(2016, 9, 25,
						hd[0], hd[1]), new Date(2016, 9, 25, hf[0], hf[1]), {
					url : '#'
				});
			}
			i = i + 5;
		}
		var renderer = new Timetable.Renderer(timetable);
		renderer.draw('.timetable');
	} else {
		alerty.toasts("Aucun entretien n'est prévu pour le moment");
	}
	</script>
	<script>
		function changeTimetableStyle(style) {
			var span = document.getElementById("timetable");
			span.style.backgroundColor = style;
		}
		function changeStyle(style) {
			var i = 1;
			while (i < 6) {
				var span = document.getElementById(i);
				span.style.color = style;
				i++;
			}
		}

		function savePage() {
			changeTimetableStyle("white");
			changeStyle("black");
			var ents = document.getElementById("listeEntreprise");
			var tab = ents.value.split(" ");
			var nbEntreprise = tab.length / 3;
			html2canvas($("#timetable"), {
				onrendered : function(canvas) {
					var imageData = canvas.toDataURL("image/jpeg");
					var image = new Image();
					image = Canvas2Image.convertToJPEG(canvas);
					var doc = new jsPDF('p', 'mm', "a4");

					doc.addImage(imageData, 'JPEG', 10, 10, 200,
							nbEntreprise * 25);

					var hauteur = 1200;
					var croppingYPosition = hauteur;

					count = (image.height) / hauteur;
					for (var i = 1; i < count; i++) {
						doc.addPage();
						var sourceX = 0;
						var sourceY = hauteur + (i - 1) * 1400;
						var sourceWidth = image.width;
						var sourceHeight = hauteur;
						var destWidth = sourceWidth;
						var destHeight = sourceHeight;
						var destX = 0;
						var destY = 0;
						var canvas1 = document.createElement('canvas');
						canvas1.setAttribute('height', destHeight);
						canvas1.setAttribute('width', destWidth);
						var ctx = canvas1.getContext("2d");
						ctx.fillStyle = "#ffffff";
						ctx.fillRect(0, 0, canvas1.width, canvas1.height);
						ctx.drawImage(image, sourceX, sourceY, sourceWidth,
								sourceHeight, destX, destY, 750, 920);
						var image2 = new Image();
						image2 = Canvas2Image.convertToJPEG(canvas1);
						image2Data = image2.src;
						doc.addImage(image2Data, 'JPEG', 10, 10);
						croppingYPosition += destHeight;
					}
					var d = new Date().toISOString().slice(0, 19).replace(/-/g,
							"");

					var tab = ents.value.split("_");
					filename = 'Planning_' + tab[1] + '.pdf';
					doc.save(filename);
					changeTimetableStyle("transparent");
					changeStyle("white");
				}

			});
		}
		function vider() {

		};
	</script>
</body>
</html>