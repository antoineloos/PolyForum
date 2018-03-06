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
		function change_size() {
			var visible_width = $("#visibleContent").width();
			var timetable_width = $("#timetable").width();
			if (visible_width <= timetable_width) {
				$("#visibleContent").css({
					overflowX : "scroll",
					overflowY : "hidden"
				});
			} else {
				$("#visibleContent").css("overflow-x", "");
				$("#visibleContent").css("overflow-y", "");
			}
		}

		$(document).ready(function() {
			change_size();
		});
		$(window).resize(function() {
			change_size();
		});
	</script>
	<script>
		var timetable = new Timetable();

		timetable.setScope(14, 18)

		var text = document.getElementById("listeEntretien");
		var ents = document.getElementById("listeEntreprise");
		var res = text.value.split(" ");
		var tab = ents.value.split(" ");
		var temp = 0;
		while (tab[temp + 2] != null) {
			timetable.addLocations([ tab[temp] + ' ' + tab[temp + 1] + ' '
					+ tab[temp + 2] ]);
			temp = temp + 3;
		}

		var i = 0;

		while (res[i + 7] != null) {
			var temp = i + 8;
			if (temp % 8 == 0) {
				var hd = res[i + 6].split(":");
				var hf = res[i + 7].split(":");
				var argument1 = res[i];
				argument1 = argument1 + ' ';
				argument1 = argument1 + res[i + 1];
				argument1 = argument1 + ' ';
				argument1 = argument1 + hd[0];
				argument1 = argument1 + ":";
				argument1 = argument1 + hd[1];
				argument1 = argument1 + "-";
				argument1 = argument1 + hf[0];
				argument1 = argument1 + ":";
				argument1 = argument1 + hf[1];

				var argument2 = res[i + 2];
				argument2 = argument2 + ' ';
				argument2 = argument2 + res[i + 3];
				argument2 = argument2 + ' ';
				argument2 = argument2 + res[i + 4];
				timetable.addEvent(argument1, argument2, new Date(2016, 9, 25,
						hd[0], hd[1]), new Date(2016, 9, 25, hf[0], hf[1]), {
					url : '#'
				});
			}
			i = i + 8;
		}
		var renderer = new Timetable.Renderer(timetable);
		renderer.draw('.timetable');
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

					doc.addImage(imageData, 'JPEG', 5, 10, 200,
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
						doc.addImage(image2Data, 'JPEG', 5, 10);
						croppingYPosition += destHeight;
					}
					var d = new Date().toISOString().slice(0, 19).replace(/-/g,
							"");
					filename = 'Planning_global.pdf';
					doc.save(filename);
					changeTimetableStyle("transparent");
					changeStyle("white");
				}

			});
		}
		function vider() {

		};
	</script>
	<script>
		function addEntretien() {
			var param = "";
			param = param + document.getElementById("entreprise").value + "_";
			param = param + document.getElementById("heureD").value + "_";
			param = param + document.getElementById("heureF").value + "_";
			param = param + document.getElementById("listeCandidats").value;
			var dataObj = {
				'chaine' : param
			};
			$.ajax({
				type : 'POST',
				url : 'creerEntretien.adm',
				data : dataObj,
				success : function(msg) {
					location.reload();
				}
			});
		}
		function ajouteEntretien(entity) {
		    var bool = document.getElementById("eventWanted").value;
		    if (bool == "false") {
		        if (entity.attr('class').indexOf("droppable") != -1) {
		            var $selection = $('<a>').addClass(
		                'added-div time-entry draggable');
		            entity
		                .on(
		                    'mousedown',
		                    function(e) {
		                        var click_x = e.pageX -
		                            entity.offset().left;
		                        $selection.css({
		                            'width': '1px',
		                            'height': '99px',
		                            'left': click_x,
		                            'position': 'absolute'
		                        });
		                        $selection.appendTo(entity);

		                        entity
		                            .on(
		                                'mousemove',
		                                function(e) {
		                                    var move_x = e.pageX -
		                                        entity
		                                        .offset().left,
		                                        width = Math
		                                        .abs(move_x -
		                                            click_x),
		                                        new_x;

		                                    new_x = (move_x < click_x) ? (click_x - width) :
		                                        click_x;
		                                    var select = document
		                                        .getElementsByClassName("added-div time-entry draggable");
		                                    var value = "";
		                                    if (width <= 240) {
		                                        if (click_x < move_x) {
		                                            value = getTimeWithPosition(click_x) +
		                                                "-" +
		                                                getTimeWithPosition(move_x);
		                                        } else {
		                                            value = getTimeWithPosition(move_x) +
		                                                "-" +
		                                                getTimeWithPosition(click_x);
		                                        }
		                                    } else {
		                                        if (click_x < move_x) {
		                                            value = getTimeWithPosition(click_x) +
		                                                "-" +
		                                                getTimeWithPosition(click_x + 240);
		                                        } else {
		                                            value = getTimeWithPosition(click_x - 240) +
		                                                "-" +
		                                                getTimeWithPosition(click_x);
		                                        };
		                                    }
		                                    select[0].innerHTML = value;
		                                    $selection
		                                        .css({
		                                            'width': width,
		                                            'left': new_x,
		                                            'height': '99px',
		                                            'position': 'absolute'
		                                        });

		                                })
		                            .on(
		                                'mouseup',
		                                function(e) {
		                                    entity
		                                        .off('mousemove');
		                                    var select = document
		                                        .getElementsByClassName("added-div time-entry draggable");
		                                    var value = select[0].innerHTML;
											//alert(document.getElementById("heureD").value);
		                                    $.magnificPopup
		                                        .open({
		                                            items: {
		                                                src: '#test-popup',
		                                                type: 'inline',
		                                                data: value,
		                                                midClick: true
		                                            },
		                                            callbacks: {
		                                                beforeOpen: function() {
		                                                    var magnificPopup = $.magnificPopup.instance;
		                                                    var cur = magnificPopup.st.items.data;
		                                                    var heures = cur.split("-");
		                                                    var heureD = document.getElementById("heureD");
		                                                    var heureF = document.getElementById("heureF");
		                                                    heureD.value = heures[0];
		                                                    heureF.value = heures[1];
		                                                    var ident = entity[0].id; // CGI_Salle_15
		                                                    var params = ident.split("_");
		                                                    var entreprise = params[0];
		                                                    var ent = document.getElementById("entreprise");
		                                                    ent.value = entreprise;
		                                                },
		                                                open: function() {
		                                                	if (document.getElementById("heureF").value == "undefined"){
		                                                		$.magnificPopup.proto.close.call(this);
		                                                		location.reload();
		                                                	}
		                                                    $.magnificPopup.instance.close = function() {
		                                                        return;
		                                                        $.magnificPopup.proto.close
		                                                            .call(this);
		                                                    };
		                                                },
		                                            }
		                                        });
		                                });
		                    });
		        }
		    } else {
		        document.getElementById("eventWanted").value = "false";
		    }
		}
		function getTimeWithPosition(pos) {
			return convertHour(heureDec(pos));
		}

		function convertHour(heureDecimal) {
			var hours = parseInt(heureDecimal);
			var minuteDecimal = ((heureDecimal - hours) * 60)
			var minutes = parseInt(minuteDecimal);
			if (minutes < 10) {
				minutes = "0" + minutes;
			}
			var res = hours + ":" + minutes;
			return res;
		}
		function heureDec(offsetXPos) {
			var oneHour = 320; // 320px
			var offset = header.offsetLeft;
			var heureDebut = offsetXPos / oneHour;
			//var relPos = offsetXPos-offset;
			var heureDebut = heureDebut + 14;
			return heureDebut;
		}
		function supprimeEntretien(title) {
			document.getElementById("eventWanted").value = "true";
			alerty.confirm("Voulez-vous vraiment supprimer l'entretien ?", {
				title : "Supprimer l'entretien",
				cancelLabel : 'Non',
				okLabel : 'Oui'
			}, function() {
				var dataObj = {
					'chaine' : title
				};
				$.ajax({
					type : 'POST',
					url : 'supprEntretien.adm',
					data : dataObj,
					success : function(msg) {
						document.getElementById("eventWanted").value = "false";
						location.reload();
					}
				});
			}, function() {
				alerty.toasts("L'entretien n'a pas été supprimé");
			})
		}
		$(document).ready(function() {

			var events = document.getElementsByClassName("time-entry");
			for (var i = 0; i < events.length; i++) {
				$(events[i]).draggable();
				$(events[i]).on("click", function() {
					supprimeEntretien($(this).attr('id'));
				});
			}
			var timeLines = document.getElementsByClassName("time-line");
			for (var i = 0; i < timeLines.length; i++) {
				var draggables = "";
				// on doit parcourir les fils
				var liElem = document.getElementById(timeLines[i].id);
				var children = liElem.children;
				$(timeLines[i]).on("click", function() {
					ajouteEntretien($(this));
				});
			}
			$(".droppable").droppable({
				accept : function(elm) {
					var $this = $(this);
					if ($this.data("question-id") == elm.data("question-id")) {
						return true;
					}
					return false;
				},
				drop : function(e, ui) {
					console.log(e, ui);
				}
			});

			$(".draggable").draggable({
				revert : "invalid",
				stop : handleDragStop
			}).resizable({
				handles : 'e, w',
				stop : handleResizeStop
			});
			function handleResizeStop(event, ui) {
				var param = event.target.text;
				param = param + "_" + event.target.id
				var dataObj = {
					'chaine' : param
				};
				$.ajax({
					type : 'POST',
					url : 'modifDureeEntretien.adm',
					data : dataObj,
					success : function(msg) {
						location.reload();
					}
				});
			}
			$(".draggable").bind("resize", function(event, ui) {
				var width = event.target.offsetWidth;
				var dureeDecimal = width / 320;
				var duree = convertHour(dureeDecimal);
				var previousText = event.target.text;
				var tab = previousText.split("-");
				var begin = tab[0].split(" ");
				var heureDebut = begin[2];
				var valToReturn = addHours(heureDebut, duree);
				event.target.text = String(tab[0]) + "-" + valToReturn;
			});
			function addHours(debut, duree) {
				var heure = debut.split(":");
				var dur = duree.split(":");
				var hours = parseInt(heure[0]) + parseInt(dur[0]);
				var minutes = parseInt(heure[1]) + parseInt(dur[1]);
				if (minutes >= 60) {
					minutes = minutes - 60;
					hours = hours + 1;
					if (minutes < 10) {
						minutes = "0" + minutes;
					}
				}
				return String(hours) + ":" + String(minutes);
			}
			function handleDragStop(event, ui) {
				var idElem = $(this).attr("id");
				// On calcule l'heure de début de l'entretien
				var event = document.getElementById(idElem);
				var heureDecimal = heureDec($(this).offset().left);
				var convertedHour = convertHour(heureDecimal);

				var param = idElem;
				param = param + "_" + convertedHour;
				var dataObj = {
					'chaine' : param
				};
				$.ajax({
					type : 'POST',
					url : 'modifEntretien.adm',
					data : dataObj,
					success : function(msg) {
						location.reload();
					}
				});
			}
			function convertHour(heureDecimal) {
				var hours = parseInt(heureDecimal);
				var minuteDecimal = ((heureDecimal - hours) * 60)
				var minutes = parseInt(minuteDecimal);
				if (minutes < 10) {
					minutes = "0" + minutes;
				}
				var res = hours + ":" + minutes;
				return res;
			}
			function heureDec(offsetXPos) {
				var oneHour = 320; // 320px
				var offset = header.offsetLeft;
				var heureDebut = offsetXPos / oneHour;
				var relPos = offsetXPos - offset;
				var heureDebut = (relPos / oneHour) + 14;
				return heureDebut;
			}
		});
	</script>
</body>
</html>