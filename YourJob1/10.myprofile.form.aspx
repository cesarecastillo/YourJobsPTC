<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="myprofileform.aspx.cs" Inherits="YourJob1.myprofileform" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Perfil del Usuario</title>
    <link rel="stylesheet" href="assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="assets/css/style.css" />
</head>
<body>
    <div class="container-fluid overcover">
        <div class="container profile-box">
            <div class="cover-image row">
                <img src="assets/images/bloogs-6.jpg" alt="">
            </div>
            <div class="row">
                <div class="col-lg-8 col-md-7 detail-px no-padding">
                    <h3>Perfil</h3>
                    <p id="descripcion" runat="server"></p>
                    
                    <h3 class="mth3">Educación</h3>
                    <div id="educationDetails" runat="server"></div>
                    
                    <h3 class="mth3">Experiencia Laboral</h3>
                    <div id="workExperienceDetails" runat="server"></div>
                    
                    <h3 class="mth3">Habilidades</h3>
                    <ul id="skillsList" class="exrts" runat="server"></ul>
                    
                    <h3 class="mth3">Idiomas Dominados</h3>
                    <p id="masteredLanguages" runat="server"></p>
                </div>
                <div class="col-lg-4 col-md-5 leftgh">
                    <div class="img-box">
                        <img id="profileImage" src="" alt="" runat="server" />   
                    </div>
                    <div class="name-det">
                        <h2 id="fullName" runat="server"></h2>
                        <h3>Contacto</h3>
                        <p id="contactDetails" runat="server"></p>
                        <a href="usuario.index.aspx" class="btn btn-secondary">Regresar</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
