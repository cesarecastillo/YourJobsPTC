<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Resume Form</title>
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,400,300,500,600,700" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            background: url('img/job-login.jpeg') no-repeat center center fixed;
            background-size: cover;
            overflow: hidden;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        body::before {
            content: "";
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(to bottom right, rgba(119, 119, 119, 0.7), rgba(119, 119, 119, 0.7));
            z-index: -1;
        }
        .back-button {
            position: fixed;
            top: 20px;
            left: 20px;
            background-color: #3498DB;
            border: none;
            color: white;
            padding: 10px 15px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 1.2em;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.3s;
            border-radius: 50%;
            z-index: 2;
        }
        .back-button:hover {
            background-color: #2980B9;
            transform: scale(1.1);
        }
        .inner {
            background: rgba(255, 255, 255, 0.9);
            padding: 40px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            border-radius: 15px;
            max-width: 800px;
            width: 90%;
            transition: transform 0.3s;
            position: relative;
            z-index: 1;
            overflow: hidden;
        }
        .title {
            text-align: center;
            font-size: 2em;
            margin-bottom: 20px;
            color: #333;
            cursor: pointer;
            transition: transform 0.3s, color 0.3s;
        }
        .title:hover {
            color: #3498DB;
            transform: scale(1.1);
        }
        .title:active {
            color: #2980B9;
            transform: scale(1.1);
        }
        .tabs {
            margin-bottom: 20px;
        }
        .form-wrapper {
            position: relative;
            margin-bottom: 20px;
        }
        .form-wrapper input, .form-wrapper select, .form-wrapper textarea {
            width: calc(100% - 30px);
            padding: 10px;
            padding-left: 30px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 1em;
            transition: box-shadow 0.3s, transform 0.3s;
            font-family: 'Poppins', sans-serif;
        }
        .form-wrapper input:focus, .form-wrapper select:focus, .form-wrapper textarea:focus {
            box-shadow: 0 0 10px rgba(52, 152, 219, 0.5);
            transform: scale(1.02);
        }
        .form-wrapper i {
            position: absolute;
            top: 50%;
            left: 10px;
            transform: translateY(-50%);
            color: #999;
            font-size: 1em;
            transition: color 0.3s;
            pointer-events: none;
        }
        .animated-button {
            width: 100%;
            background-color: #3498DB;
            border: none;
            color: white;
            padding: 15px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 1.2em;
            margin-top: 10px;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.3s;
            border-radius: 5px;
            font-family: 'Poppins', sans-serif;
        }
        .animated-button:hover {
            background-color: #2980B9;
            transform: scale(1.05);
        }
        .register-link {
            display: block;
            text-align: center;
            margin-top: 10px;
            font-size: 1em;
            color: #3498DB;
            text-decoration: none;
            font-family: 'Poppins', sans-serif;
        }
        .register-link:hover {
            text-decoration: underline;
        }
        .telefono-wrapper {
            display: flex;
            align-items: center;
        }
        .telefono-wrapper input {
            width: calc(100% - 30px);
            padding-left: 40px;
        }
    </style>
    <script>
        $(function () {
            $("#tabs").tabs();
        });

        function validateForm() {
            var phone = document.getElementById("txtelfono").value;
            var experience = document.getElementById("txtexperiencia").value;
            var education = document.getElementById("txteducacion").value;
            var fieldOfStudy = document.getElementById("campoEstudio").value;
            var sector = document.getElementById("sector").value;
            var skills = document.getElementById("txthabilidades").value;
            var languages = document.getElementById("txtidiomas").value;
            var image = document.getElementById("txtimagen").value;

            if (phone == "" || experience == "" || education == "" || fieldOfStudy == "" || sector == "" || skills == "" || languages == "" || image == "") {
                Swal.fire({
                    icon: 'error',
                    title: 'Oops...',
                    text: 'Please complete all required fields.',
                });
                return false;
            }

            if (!/^\d{8}$/.test(phone)) {
                Swal.fire({
                    icon: 'error',
                    title: 'Oops...',
                    text: 'Please enter a valid 8-digit phone number.',
                });
                return false;
            }

            var allowedExtensions = /(\.jpg|\.jpeg)$/i;
            if (!allowedExtensions.exec(image)) {
                Swal.fire({
                    icon: 'error',
                    title: 'Oops...',
                    text: 'Only files with .jpg or .jpeg extensions are allowed.',
                });
                return false;
            }

            return true;
        }
    </script>
</head>
<body>
    <a href="07.index.profile.aspx" class="back-button"><i class="fas fa-arrow-left"></i></a>
    <div class="inner">
        <div class="title" onmouseover="animateTitle()" onclick="animateTitle()">Resume</div>
        <form runat="server" onsubmit="return validateForm()">
            <div id="tabs" class="tabs">
                <ul>
                    <li><a href="#tabs-1">Personal Information</a></li>
                    <li><a href="#tabs-2">Education</a></li>
                    <li><a href="#tabs-3">Experience</a></li>
                    <li><a href="#tabs-4">Skills</a></li>
                    <li><a href="#tabs-5">Languages</a></li>
                    <li><a href="#tabs-6">Image</a></li>
                </ul>
                <div id="tabs-1">
                    <div class="form-wrapper">
                        <i class="fas fa-phone"></i>
                        <asp:TextBox ID="txtelfono" runat="server" placeholder="Phone" MaxLength="8" onkeypress="return NumCheck(event, this)"></asp:TextBox>
                    </div>
                    <div class="form-wrapper">
                        <i class="fas fa-globe-americas"></i>
                        <asp:DropDownList ID="txtnacionalidad" runat="server" CssClass="form-control">
                            <asp:ListItem Value="" Disabled="True" Selected="True">Nationality</asp:ListItem>
                            <asp:ListItem Value="Guatemala">Guatemala</asp:ListItem>
                            <asp:ListItem Value="Belice">Belize</asp:ListItem>
                            <asp:ListItem Value="El Salvador">El Salvador</asp:ListItem>
                            <asp:ListItem Value="Honduras">Honduras</asp:ListItem>
                            <asp:ListItem Value="Nicaragua">Nicaragua</asp:ListItem>
                            <asp:ListItem Value="Costa Rica">Costa Rica</asp:ListItem>
                            <asp:ListItem Value="Panamá">Panama</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="form-wrapper">
                        <i class="fas fa-heart"></i>
                        <asp:DropDownList ID="txtestadocivil" runat="server" CssClass="form-control">
                            <asp:ListItem Value="" Disabled="True" Selected="True">Marital Status</asp:ListItem>
                            <asp:ListItem Value="Soltero/a">Single</asp:ListItem>
                            <asp:ListItem Value="Casado/a">Married</asp:ListItem>
                            <asp:ListItem Value="Divorciado/a">Divorced</asp:ListItem>
                            <asp:ListItem Value="Viudo/a">Widowed</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <div id="tabs-2">
                    <div class="form-wrapper">
                        <i class="fas fa-graduation-cap"></i>
                        <asp:DropDownList ID="txteducacion" runat="server" CssClass="form-control">
                            <asp:ListItem Value="Educacion Basica">Basic Education</asp:ListItem>
                            <asp:ListItem Value="Bachiller">High School</asp:ListItem>
                            <asp:ListItem Value="Universitario">University</asp:ListItem>
                            <asp:ListItem Value="Egresado">Graduate</asp:ListItem>
                            <asp:ListItem Value="Técnico Superior">Higher Technician</asp:ListItem>
                            <asp:ListItem Value="Máster">Master's</asp:ListItem>
                            <asp:ListItem Value="Doctorado">Doctorate</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="form-wrapper">
                        <i class="fas fa-book"></i>
                        <asp:DropDownList ID="txtcampoEstudio" runat="server" CssClass="form-control">
                            <asp:ListItem Value="" Disabled="True" Selected="True">Field of Study</asp:ListItem>
                            <asp:ListItem Value="Ciencias">Science</asp:ListItem>
                            <asp:ListItem Value="Ingeniería">Engineering</asp:ListItem>
                            <asp:ListItem Value="Humanidades">Humanities</asp:ListItem>
                            <asp:ListItem Value="Ciencias Sociales">Social Sciences</asp:ListItem>
                            <asp:ListItem Value="Artes">Arts</asp:ListItem>
                            <asp:ListItem Value="Medicina y Salud">Medicine and Health</asp:ListItem>
                            <asp:ListItem Value="Derecho">Law</asp:ListItem>
                            <asp:ListItem Value="Administración de Empresas">Business Administration</asp:ListItem>
                            <asp:ListItem Value="Tecnología de la Información">Information Technology</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="form-wrapper">
                        <i class="fas fa-industry"></i>
                        <asp:DropDownList ID="txtsector" runat="server" CssClass="form-control">
                            <asp:ListItem Value="" Disabled="True" Selected="True">Sector</asp:ListItem>
                            <asp:ListItem Value="Tecnología">Technology</asp:ListItem>
                            <asp:ListItem Value="Educación">Education</asp:ListItem>
                            <asp:ListItem Value="Salud">Health</asp:ListItem>
                            <asp:ListItem Value="Finanzas">Finance</asp:ListItem>
                            <asp:ListItem Value="Marketing y Ventas">Marketing and Sales</asp:ListItem>
                            <asp:ListItem Value="Construcción">Construction</asp:ListItem>
                            <asp:ListItem Value="Transporte y Logística">Transportation and Logistics</asp:ListItem>
                            <asp:ListItem Value="Manufactura">Manufacturing</asp:ListItem>
                            <asp:ListItem Value="Servicios">Services</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <div id="tabs-3">
                    <div class="form-wrapper">
                        <i class="fas fa-briefcase"></i>
                        <asp:TextBox ID="txtexperiencia" runat="server" TextMode="MultiLine" Rows="4" placeholder="Work Experience" CssClass="form-control" Required="True"></asp:TextBox>
                    </div>
                </div>
                <div id="tabs-4">
                    <div class="form-wrapper">
                        <i class="fas fa-cogs"></i>
                        <asp:TextBox ID="txthabilidades" runat="server" TextMode="MultiLine" Rows="4" placeholder="Skills" CssClass="form-control" Required="True"></asp:TextBox>
                    </div>
                </div>
                <div id="tabs-5">
                    <div class="form-wrapper">
                        <i class="fas fa-language"></i>
                        <asp:TextBox ID="txtidiomas" runat="server" TextMode="MultiLine" Rows="4" placeholder="Languages" CssClass="form-control" Required="True"></asp:TextBox>
                    </div>
                </div>
                <div id="tabs-6">
                    <div class="form-wrapper">
                        <i class="fas fa-image"></i>
                        <asp:FileUpload ID="txtimagen" runat="server" CssClass="form-control" name="File" />
                    </div>
                </div>
            </div>
            <asp:Button ID="btnEnviar" runat="server" Text="Submit" CssClass="animated-button" OnClick="btnEnviar_Click1" />
            <asp:Literal ID="alerta" runat="server" Text=""></asp:Literal>
        </form>
    </div>
    <script>
        function animateTitle() {
            const title = document.querySelector('.title');
            title.classList.add('animate__animated', 'animate__pulse');
            setTimeout(() => {
                title.classList.remove('animate__animated', 'animate__pulse');
            }, 1000);
        }
    </script>
</body>
</html>