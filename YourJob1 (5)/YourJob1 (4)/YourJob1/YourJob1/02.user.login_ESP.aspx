<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="02.user.login_ESP.aspx.cs" Inherits="YourJob1._02_user_login_ESP" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Your Job - Iniciar Sesión</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,400,300,500,600,700" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free/css/all.min.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
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
            max-width: 500px;
            width: 90%;
            transition: transform 0.3s;
            position: relative;
            z-index: 1;
        }
        .title {
            text-align: center;
            font-size: 2.5em;
            margin-bottom: 30px;
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
        h3 {
            text-align: center;
            margin-bottom: 25px;
            font-size: 1.8em;
            color: #333;
        }
        .form-wrapper {
            position: relative;
            margin-bottom: 30px;
        }
        .form-wrapper input {
            width: calc(100% - 50px);
            padding: 15px;
            padding-left: 50px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 1.1em;
            transition: box-shadow 0.3s, transform 0.3s;
        }
        .form-wrapper input:focus {
            box-shadow: 0 0 10px rgba(52, 152, 219, 0.5);
            transform: scale(1.02);
        }
        .form-wrapper input:focus + i {
            color: #3498DB;
        }
        .form-wrapper i {
            position: absolute;
            top: 50%;
            left: 15px;
            transform: translateY(-50%);
            color: #999;
            font-size: 1.2em;
            transition: color 0.3s;
            pointer-events: none;
        }
        .animated-button {
            width: 100%;
            background-color: #3498DB;
            border: none;
            color: white;
            padding: 18px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 1.3em;
            margin-top: 10px;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.3s;
            border-radius: 5px;
        }
        .animated-button:hover {
            background-color: #2980B9;
            transform: scale(1.05);
        }
        .register-link, .forgot-password-link {
            display: block;
            text-align: center;
            margin-top: 15px;
            font-size: 1.1em;
            color: #3498DB;
            text-decoration: none;
        }
        .register-link:hover, .forgot-password-link:hover {
            text-decoration: underline;
        }
        .policy-wrapper {
            display: flex;
            align-items: center;
            margin-top: 20px;
            transition: transform 0.3s;
        }
        .policy-wrapper input {
            margin-right: 10px;
            transform: scale(1);
            transition: transform 0.3s, box-shadow 0.3s;
        }
        .policy-wrapper input:checked {
            transform: scale(1.2);
            box-shadow: 0 0 10px rgba(52, 152, 219, 0.5);
        }

        .popup {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.7);
            justify-content: center;
            align-items: center;
            z-index: 1000;
        }
        .popup-content {
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            width: 80%;
            max-width: 600px;
            max-height: 80%;
            overflow-y: auto;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            animation: fadeIn 0.3s;
            border: 2px solid #000; /* Color del borde para que coincida con la barra de encabezado oscura */
        }
        .close-btn {
            float: right;
            cursor: pointer;
            font-size: 1.5em;
            color: #000; /* Color oscuro para que coincida con el botón de búsqueda */
        }
        .close-btn:hover {
            color: #0056b3; /* Color de desplazamiento para que coincida con el botón de búsqueda azul */
        }
        h2 {
            color: #0056b3; /* Color azul para que coincida con el botón de búsqueda */
            margin-top: 0;
        }
        h3 {
            color: #0056b3; /* Color azul para los títulos de sección */
        }
        h4 {
            color: #0056b3; /* Color azul para los subtítulos */
        }
        p {
            color: #666;
            line-height: 1.6;
        }
        ul {
            color: #666;
            padding-left: 20px;
        }
        ul li {
            margin-bottom: 10px;
        }
        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }
    </style>
</head>
<body>
    <a href="01.index_dashboard.aspx" class="back-button"><i class="fas fa-arrow-left"></i></a>
    <div class="inner">
        <div class="title" onmouseover="animateTitle()" onclick="animateTitle()">Your Jobs</div>
        <form runat="server">
            <asp:Panel runat="server">
                <h3>Iniciar Sesión</h3>
                <div class="form-wrapper">
                    <i class="fas fa-envelope"></i>
                    <asp:TextBox ID="TxtUsuario" runat="server" CssClass="form-control" placeholder="Correo Electrónico"></asp:TextBox>
                </div>
                <div class="form-wrapper">
                    <i class="fas fa-lock"></i>
                    <asp:TextBox ID="TxtContra1" runat="server" TextMode="Password" CssClass="form-control" placeholder="Contraseña"></asp:TextBox>
                </div>
               
                <asp:Button ID="RegisterLogin" runat="server" Text="Iniciar Sesión" CssClass="animated-button" OnClick="RegisterLogin_Click" OnClientClick="return validatePolicy()" />
                <asp:Literal ID="alerta1" runat="server" Text=""></asp:Literal>
                <asp:HyperLink ID="RegisterLink" runat="server" CssClass="register-link" NavigateUrl="04.user.register.aspx" OnClientClick="return showLinkAlert('04.user.register.aspx')">¿No tienes una cuenta? Regístrate aquí</asp:HyperLink>
                <asp:HyperLink ID="ForgotPasswordLink" runat="server" CssClass="forgot-password-link" NavigateUrl="06.forget.password.aspx" OnClientClick="return showLinkAlert('06.forget.password.aspx')">¿Olvidaste tu contraseña?</asp:HyperLink>
            </asp:Panel>
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

        function showLinkAlert(url) {
            Swal.fire({
                title: '¿Estás seguro?',
                text: "Serás redirigido a otra página.",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3498DB',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Sí, ir allí',
                cancelButtonText: 'Permanecer aquí'
            }).then((result) => {
                if (result.isConfirmed) {
                    window.location.href = url;
                }
            });
            return false;
        }

        function showLoading() {
            Swal.fire({
                title: 'Cargando...',
                timer: 2000,
                didOpen: () => {
                    Swal.showLoading()
                },
                willClose: () => {
                    clearInterval(timerInterval)
                }
            });
            return true;
        }

        function showPolicy() {
            document.getElementById("privacyPopup").style.display = "flex";
            return false;
        }

        function closePopup() {
            document.getElementById("privacyPopup").style.display = "none";
        }
    </script>
</body>
</html>