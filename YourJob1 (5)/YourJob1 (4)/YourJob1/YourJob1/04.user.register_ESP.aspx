<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="04.user.register_ESP.aspx.cs" Inherits="YourJob1._04_user_register_ESP" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Registro de Usuario</title>
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
            max-width: 400px;
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
        h3 {
            text-align: center;
            margin-bottom: 20px;
            font-size: 1.5em;
            color: #333;
        }
        .form-wrapper {
            position: relative;
            margin-bottom: 20px;
        }
        .form-wrapper input, .form-wrapper select {
            width: calc(100% - 30px);
            padding: 10px;
            padding-left: 30px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 1em;
            transition: box-shadow 0.3s, transform 0.3s;
        }
        .form-wrapper input:focus, .form-wrapper select:focus {
            box-shadow: 0 0 10px rgba(52, 152, 219, 0.5);
            transform: scale(1.02);
        }
        .form-wrapper input:focus + i, .form-wrapper select:focus + i {
            color: #3498DB;
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
        }
        .animated-button:hover {
            background-color: #2980B9;
            transform: scale(1.05);
        }
        .register-link, .forgot-password-link {
            display: block;
            text-align: center;
            margin-top: 10px;
            font-size: 1em;
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
        <div class="title" onmouseover="animateTitle()" onclick="animateTitle()">Your Job</div>
        <form runat="server">
            <asp:Panel runat="server">
                <h3>Regístrate - Usuario</h3>
                <!-- Campo de entrada para el nombre -->
                <div class="form-wrapper">
                    <asp:TextBox ID="TxtName" runat="server" CssClass="form-control" placeholder="Nombre" onpaste="return false" minlength="4" MaxLength="50"></asp:TextBox>
                    <i class="fas fa-user"></i>
                </div>
                <!-- Campo de entrada para el apellido -->
                <div class="form-wrapper">
                    <asp:TextBox ID="TxtLastname" runat="server" CssClass="form-control" placeholder="Apellido" onpaste="return false" minlength="4" MaxLength="50"></asp:TextBox>
                    <i class="fas fa-user"></i>
                </div>
                <!-- Desplegable para seleccionar el género -->
                <div class="form-wrapper">
                    <asp:DropDownList ID="Gender" runat="server" CssClass="form-control">
                        <asp:ListItem Text="Género" Value="" Disabled="true" Selected="true"></asp:ListItem>
                        <asp:ListItem Text="Masculino" Value="male"></asp:ListItem>
                        <asp:ListItem Text="Femenino" Value="female"></asp:ListItem>
                    </asp:DropDownList>
                    <i class="fas fa-venus-mars"></i>
                </div>
                <!-- Campo de entrada para el correo electrónico -->
                <div class="form-wrapper">
                    <asp:TextBox ID="TxtMail" runat="server" CssClass="form-control" placeholder="Correo" onpaste="return false" minlength="4" MaxLength="50"></asp:TextBox>
                    <i class="fas fa-envelope"></i>
                </div>
                <!-- Campo de entrada para la fecha de nacimiento -->
                <div class="form-wrapper">
                    <asp:TextBox ID="TxtAge" runat="server" CssClass="form-control" placeholder="Edad" onpaste="return false" MaxLength="2"></asp:TextBox>
                    <i class="fas fa-birthday-cake"></i>
                </div>
                <!-- Campo de entrada para la contraseña -->
                <div class="form-wrapper">
                    <asp:TextBox ID="TxtContra" runat="server" TextMode="Password" CssClass="form-control" placeholder="Contraseña" onpaste="return false" minlength="4" MaxLength="50"></asp:TextBox>
                    <i class="fas fa-lock"></i>
                </div>
                <!-- Campo de confirmación de contraseña -->
                <div class="form-wrapper">
                    <asp:TextBox ID="TxtConfirm" runat="server" TextMode="Password" CssClass="form-control" placeholder="Confirmar Contraseña" onpaste="return false" minlength="4" MaxLength="50"></asp:TextBox>
                    <i class="fas fa-lock"></i>
                </div>
                <div class="policy-wrapper">
                    <input type="checkbox" id="policyCheck">
                    <label for="policyCheck">Acepto las <a href="#" onclick="showPolicy()">políticas de Your Job</a></label>
                </div>
                <!-- Botón de registro -->
                <asp:Button ID="RegisterButton" runat="server" Text="Registrarse" CssClass="animated-button" OnClick="RegisterButton_Click" OnClientClick="return validatePolicy()" />
                <!-- Mensaje de alerta -->
                <asp:Literal ID="alerta" runat="server" Text=""></asp:Literal>
                <!-- Enlace para iniciar sesión si ya se tiene una cuenta -->
                <div style="text-align: center; margin-top: 10px;">
                    <asp:HyperLink ID="LoginLink" runat="server" CssClass="register-link" NavigateUrl="02.user.login.aspx?type=user">¿Tienes una cuenta? Inicia sesión aquí</asp:HyperLink>
                </div>
            </asp:Panel>
        </form>
    </div>
    <div id="privacyPopup" class="popup">
        <div class="popup-content">
            <span class="close-btn" onclick="closePopup()">&times;</span>
            <h2>Política de Privacidad de YourJob</h2>
            <p><strong>Última actualización:</strong> 07/10/2024</p>

            <h3>1. Información que recopilamos</h3>
            <h4>1.1 Información personal:</h4>
            <p>Recopilamos información personal que usted nos proporciona voluntariamente al registrarse en el sitio, crear un perfil, cargar su currículum, buscar empleos, postularse a ofertas de empleo y comunicarse con nosotros. Esta información puede incluir, pero no se limita a, su nombre, dirección de correo electrónico, número de teléfono, dirección postal, historial de empleo, habilidades y cualquier otra información relevante para la búsqueda de empleo.</p>

            <h4>1.2 Información de uso:</h4>
            <p>Recopilamos información sobre su interacción con el sitio, como las páginas que visita, los enlaces en los que hace clic, el tiempo que pasa en el sitio y otras acciones realizadas en relación con nuestros servicios. También recopilamos información técnica, como su dirección IP, tipo de navegador, sistema operativo y proveedor de servicios de Internet.</p>

            <h3>2. Uso de la información</h3>
            <h4>2.1 Propósitos de uso:</h4>
            <p>Utilizamos la información que recopilamos para:</p>
            <ul>
                <li>Proporcionar, operar y mantener nuestros servicios.</li>
                <li>Facilitar la búsqueda de empleo y las aplicaciones.</li>
                <li>Enviar notificaciones relacionadas con su cuenta, nuevas ofertas de trabajo y otras comunicaciones relevantes.</li>
                <li>Mejorar y personalizar su experiencia en el sitio.</li>
                <li>Analizar y comprender cómo se utiliza nuestro sitio para mejorar nuestros servicios.</li>
                <li>Cumplir con nuestras obligaciones legales y proteger nuestros derechos.</li>
            </ul>

            <h3>3. Compartir información</h3>
            <h4>3.1 Con empresas y reclutadores:</h4>
            <p>Compartimos su información personal con empresas y reclutadores que publican ofertas de trabajo en el sitio para que puedan evaluar su solicitud y contactarlo en relación con oportunidades de empleo.</p>

            <h4>3.2 Proveedores de servicios:</h4>
            <p>Podemos compartir su información con proveedores de servicios externos que nos ayudan a operar el sitio y proporcionar nuestros servicios, como servicios de alojamiento web, análisis de datos, procesamiento de pagos y servicios de correo electrónico.</p>

            <h4>3.3 Cumplimiento legal:</h4>
            <p>Podemos divulgar su información personal si creemos de buena fe que es necesario para cumplir con una obligación legal, proteger nuestros derechos, investigar fraudes o responder a una solicitud gubernamental.</p>

            <h3>4. Seguridad de la información</h3>
            <p>Tomamos medidas razonables para proteger la información personal que recopilamos contra pérdida, robo, uso indebido y acceso no autorizado. Sin embargo, ninguna transmisión de datos por Internet o sistema de almacenamiento puede garantizar una seguridad del 100%. Utiliza el sitio bajo su propio riesgo.</p>

            <h3>5. Sus derechos</h3>
            <p>Usted tiene el derecho de:</p>
            <ul>
                <li>Acceder y actualizar su información personal.</li>
                <li>Solicitar la eliminación de su cuenta e información personal.</li>
                <li>Optar por no recibir comunicaciones de marketing.</li>
            </ul>
            <p>Para ejercer estos derechos, puede contactarnos en [correo electrónico de contacto].</p>

            <h3>6. Cambios a esta política de privacidad</h3>
            <p>Nos reservamos el derecho de actualizar esta Política de Privacidad en cualquier momento. Publicaremos cualquier cambio en esta página y actualizaremos la fecha de última actualización. Le recomendamos revisar esta Política de Privacidad periódicamente para mantenerse informado sobre cómo protegemos su información.</p>

            <h3>7. Contacto</h3>
            <p>Si tiene alguna pregunta o inquietud sobre esta Política de Privacidad, puede contactarnos en yourjobs2420@gmail.com.</p>

            <p><strong>YourJob</strong><br>
            
        </div>
    </div>
    <script>
        function animateTitle() {
            const title = document.querySelector('.title');
            title.classList.add('animate__animated', 'animate__pulse');
            setTimeout(() => {
                title.classList.remove('animate__animated', 'animate__pulse');
            }, 1000);
        }

        function validatePolicy() {
            const policyCheck = document.getElementById('policyCheck');
            if (!policyCheck.checked) {
                Swal.fire({
                    icon: 'error',
                    title: 'Oops...',
                    text: '¡Debes aceptar las políticas para continuar!',
                });
                return false;
            }
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