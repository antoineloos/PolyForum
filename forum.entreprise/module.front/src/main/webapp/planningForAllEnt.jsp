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
        <link rel="stylesheet" href="alerty/css/alerty.css">


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
        <script src="//code.jquery.com/jquery-1.10.2.js"></script>
        <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
        <script src="dom-to-image/dom-to-image.min.js"></script>
        <script src="alerty/js/alerty.min.js"></script>
        <script src="timetable/scripts/timetable.js"></script>
        <script src="html2canvas/html2canvas.min.js"></script>
        <script src="html2canvas/jquery.plugin.html2canvas.js"></script>
        <script type="text/javascript" src="jsPDF/jspdf.min.js"></script>
        <script type="text/javascript" src="canvas2image/canvas2image.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <c:if test="${sessionScope.type == 'entreprise' || sessionScope.type == 'candidat'}">
            <a class="navbar-brand" href="accueil.cpt">PolyForum</a>

        </c:if>
        <c:if test="${sessionScope.type == 'admin'}">
              <a class="navbar-brand" href="admin.jsp">PolyForum</a>
        </c:if>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <c:if test="${sessionScope.type == 'entreprise' || sessionScope.type == 'candidat'}">
                        <a class="nav-link" href="accueil.cpt">Accueil <span class="sr-only">(current)</span></a>
                    </c:if>
                    <c:if test="${sessionScope.type == 'admin'}">
                        <a class="nav-link" href="admin.jsp">Accueil <span class="sr-only">(current)</span></a>        
                    </c:if>
                </li>
                <li class="nav-item dropdown">
                    <c:if test="${sessionScope.type == 'entreprise' || sessionScope.type == 'candidat'}">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Mes choix
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <c:if test="${sessionScope.type == 'entreprise'}">
                                <a class="dropdown-item" href="initSaisieChoixEnt.chxE">Saisir</a>
                                <a class="dropdown-item" href="consulter.chxE">Consulter</a>
                            </c:if>
                            <c:if test="${sessionScope.type == 'candidat'}">
                                <a class="dropdown-item" href="initSaisieChoixCan.can">Saisir</a>
                                <a class="dropdown-item" href="consulter.can">Consulter</a>
                            </c:if>
                        </div>
                    </c:if>
                    <c:if test="${sessionScope.type == 'admin'}">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Entreprises
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="saisieEntreprise.adm">Saisir</a>
                            <a class="dropdown-item" href="consulterEnt.adm">Consulter</a>
                        </div>
                    </c:if>
                </li>
                <c:if test="${sessionScope.type == 'admin'}">
                    <li class="nav-item"><a class="nav-link" href="gererSalles.adm">Salles</a></li>
                </c:if>
                <c:if test="${sessionScope.type == 'entreprise'}">
                    <li class="nav-item"><a class="nav-link" href="consulterPlanning.chxE">Planning</a></li>
                </c:if>
                <c:if test="${sessionScope.type == 'candidat'}">
                    <li class="nav-item"><a class="nav-link" href="consulterPlanning.can">Planning</a></li>
                </c:if>
                <c:if test="${sessionScope.type == 'admin'}">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Planning
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="genererPlanning.adm">Générer</a>
                            <a class="dropdown-item" href="cconsulterPlanning.adm">Consulter</a>
                        </div>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Candidats
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="saisieCandidat.adm">Saisir</a>
                            <a class="dropdown-item" href="consulterCan.adm">Consulter</a>
                        </div>
                    </li>
                </c:if>

                <c:if test="${sessionScope.type == 'entreprise' || sessionScope.type == 'candidat'}">
                    <li class="nav-item"><a class="nav-link" href="download.file">Documents</a></li>
                </c:if>
                <c:if test="${sessionScope.type == 'admin'}">
                    <li class="nav-item"><a class="nav-link" href="choixTypeDocument.adm">Documents</a></li>
                </c:if>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Liens
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="http://polytech.univ-lyon1.fr/">Polytech</a>
                        <a class="dropdown-item" href="http://www.formasup-arl.fr/">Formasup</a>
                    </div>
                </li>
            </ul>
            
            
            <ul class="nav navbar-nav navbar-right">
                <c:if test="${sessionScope.type == 'entreprise'}">
                    <li class="nav-item"><a class="nav-link" href='modifier_ent.cpt'>Bonjour <strong>${sessionScope.nom_representant}</strong></a></li>
                </c:if>
                <c:if test="${sessionScope.type == 'candidat'}">
                    <li class="nav-item"><a class="nav-link" href='modifier_etu.cpt'>Bonjour <strong>${sessionScope.prenom}</strong></a></li>
                </c:if>
                <c:if test="${sessionScope.type == 'admin'}">
                    <li class="nav-item" ><a class="nav-link" href='consulterMdp.adm'>Consulter comptes</a></li>
                </c:if>
                <li class="nav-item"><a class="nav-link" href='deconnecter.cpt'>Déconnexion</a></li>
            </ul>
            
        </div>
    </nav>

    <section id="logo-section" class="text-center hidden-print">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="logo text-center">
                        <h1>PolyForum</h1>
                        <span>Planning individuel</span>
                    </div>
                </div>
            </div>
        </div>
    </section>
   
    <input type="hidden" id="listeEntretien" name="listeEntretien" value="${sessionScope.entretiens}"></input>
    <input type="hidden" id="listeEntreprise" name="listeEntreprise" value="${sessionScope.entreprise}"></input>
    <input type="hidden" id="max" name="max" value="${sessionScope.max}"></input>
   
      
     
      
            
            <form name="add_name" id="add_name" role="form"
					action="changeEnt.adm" method="POST">
					<table class="table table-bordered grid" id="dynamic_field">
					<thead>
						<tr>
							<th class="bg-primary">Nom</th>
							<th class="bg-primary"></th>
						</tr>
					</thead>
					<tbody>
						<tr id="row1">
							<td><select id="isTitles" name="isTitles" class="form-control" >
									<option value="Sélectionnez une entreprise">Sélectionnez une entreprise</option>
									<c:forEach var="enterprise" items="${entreprises}">
										<option value="${enterprise.idEntreprise}">${enterprise.nom}</option>
									</c:forEach>
							</select></td>
							
						</tr>
					</tbody>
					</table>
					<input type="submit" id="submit" class="btn btn-info"
						form="add_name" value="Valider" />
				</form>
       
  
 <!--   <div class="mainbody-section text-center">
        <div id="timetables" class="timetables">
            
            <c:forEach items="${sessionScope.listeEntreprises}" var="entreprise">
                <div class="contentdiv">
                    <div class="visibleContent" id="visibleContent">
                        <div class="timetable" id="timetable${entreprise.idEntreprise}"></div>
                    </div>
                </div>
            </c:forEach>
        </div>
        <div class="adm-options" style="display: inline-block; width: 32%;">
            <button class="btn btn-action hidden-print" style="margin-top: 2%; margin-right: 0.5%; float: left;" onClick="savePage()">Enregistrer le
                planning</button>
        </div>
    </div> -->
    <script>
        var ent = document.getElementById("listeEntretien");
        if (ent.value != '') {
            var nbEntreprise = (ent.value.match(new RegExp("/", "g")) || []).length;
            var j = 0;
            while (j < nbEntreprise) {
                var timetable = new Timetable();

                timetable.setScope(14, 18)

                var listeEntretien = document.getElementById("listeEntretien");
                var listeEntreprise = document
                        .getElementById("listeEntreprise");
                var entret = listeEntretien.value.split("/");
                var entreprises = listeEntreprise.value.split("_");

                timetable.addLocations([entreprises[j * 3 + 1] + ' '
                            + entreprises[j * 3 + 2]]);

                var i = 0;
                var entretiens = entret[j + 1].split("_");
                while (entretiens[i + 5] != null) {
                    var candidat = entretiens[i + 2] + " " + entretiens[i + 1];
                    //  Olivier Penas
                    var entreprise = entretiens[i + 3];
                    // Worldline (Salle 15)
                    var hd = entretiens[i + 4].split(":");
                    // 14,00
                    var hf = entretiens[i + 5].split(":");
                    // 14,30
                    var argument1 = candidat;
                    argument1 = argument1 + ' ';
                    argument1 = argument1 + hd[0] + ":" + hd[1];
                    argument1 = argument1 + '-';
                    argument1 = argument1 + hf[0] + ":" + hf[1];
                    if ((entreprises[j * 3 + 1] + ' ' + entreprises[j * 3 + 2]) == entreprise) {
                        timetable.addEvent(argument1, entreprise, new Date(
                                2016, 9, 25, hd[0], hd[1]), new Date(2016, 9,
                                25, hf[0], hf[1]), {
                            url: '#'
                        });
                    }
                    i += 5;
                }
                var renderer = new Timetable.Renderer(timetable);
                var name = '#timetable' + entreprises[j * 3];
                renderer.draw(name);
                j++;
            }
        } else {
            alerty.toasts("Aucun entretien n'est prévu pour cette entreprise");
        }
    </script>
    <script>
        function change_size() {
            var visible_width = $("#visibleContent").width();
            var timetable_width = $("#timetable").width();
            if (visible_width <= timetable_width) {
                $("#visibleContent").css({
                    overflowX: "scroll",
                    overflowY: "hidden"
                });
            } else {
                $("#visibleContent").css("overflow-x", "");
                $("#visibleContent").css("overflow-y", "");
            }
        }

        $(document).ready(function () {
            change_size();
        });
        $(window).resize(function () {
            change_size();
        });
    </script>
    <script>
        function changeTimetableStyle(style) {
            var span = document.getElementById("timetables");
            span.style.backgroundColor = style;
        }
        function changeStyle(style) {

            var span = document.getElementsByClassName("time-label");

            var i = 0;
            while (i < span.length) {
                span[i].style.color = style;
                i++;
            }
        }
        function savePage() {
            changeTimetableStyle("white");
            changeStyle("black");
            var ent = document.getElementById("listeEntretien");
            var nbEntreprise = (ent.value.match(new RegExp("/", "g")) || []).length;
            html2canvas($("#timetables"), {
                onrendered: function (canvas) {
                    var imageData = canvas.toDataURL("image/jpeg");
                    var image = new Image();
                    image = Canvas2Image.convertToJPEG(canvas);
                    var doc = new jsPDF('p', 'mm', "a4");
                    doc.addImage(imageData, 'JPEG', 5, 10, 200,
                            nbEntreprise * 40);

                    var hauteur = 1400;
                    var croppingYPosition = hauteur;

                    count = (image.height) / hauteur;

                    for (var i = 1; i < count; i++) {
                        doc.addPage();
                        var sourceX = 0;
                        var sourceY = 1400 + (i - 1) * 1400;
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
                                sourceHeight, destX, destY, 750, 1095);
                        var image2 = new Image();
                        image2 = Canvas2Image.convertToJPEG(canvas1);
                        image2Data = image2.src;
                        doc.addImage(image2Data, 'JPEG', 5, 10);
                        croppingYPosition += destHeight;
                    }
                    var d = new Date().toISOString().slice(0, 19).replace(/-/g,
                            "");
                    filename = 'Planning_candidat.pdf';
                    doc.save(filename);
                    changeTimetableStyle("transparent");
                    changeStyle("white");
                }

            });
        }
    </script>

</body>
</html>