<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="05.company.register_ESP.aspx.cs" Inherits="YourJob1._05_company_register_ESP" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Registro de Empresa</title>
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
        .register-link {
            display: block;
            text-align: center;
            margin-top: 10px;
            font-size: 1em;
            color: #3498DB;
            text-decoration: none;
        }
        .register-link:hover {
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
            color: #0056b3; /* Color azul para los títulos de las secciones */
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
        <div class="title" onmouseover="animateTitle()" onclick="animateTitle()">YourJobs</div>
        <form runat="server">
            <asp:Panel runat="server">
                <h3>Regístrate - empresa</h3>
                <div class="form-wrapper">
                    <asp:TextBox ID="TxtName2" runat="server" CssClass="form-control" placeholder="Nombre de la empresa" onpaste="return false" minlength="4" MaxLength="50"></asp:TextBox>
                    <i class="fas fa-building"></i>
                </div>
                <div class="form-wrapper">
                    <asp:TextBox ID="TxtEmail2" runat="server" CssClass="form-control" placeholder="Correo electrónico de la empresa" onpaste="return false" minlength="4" MaxLength="50"></asp:TextBox>
                    <i class="fas fa-envelope"></i>
                </div>
                <div class="form-wrapper">
                    <asp:TextBox ID="TxtPhoneNumber" runat="server" CssClass="form-control" placeholder="Número de teléfono de la empresa" onpaste="return false" minlength="9" MaxLength="50"></asp:TextBox>
                    <i class="fas fa-phone"></i>
                </div>
                <div class="form-wrapper">
                    <asp:TextBox ID="TxtContra2" runat="server" TextMode="Password" CssClass="form-control" placeholder="Contraseña" onpaste="return false" minlength="4" MaxLength="50"></asp:TextBox>
                    <i class="fas fa-lock"></i>
                </div>
                <div class="form-wrapper">
                    <asp:TextBox ID="TxtConfirm2" runat="server" TextMode="Password" CssClass="form-control" placeholder="Confirmar contraseña" onpaste="return false" minlength="4" MaxLength="50"></asp:TextBox>
                    <i class="fas fa-lock"></i>
                </div>
                <div class="form-wrapper">
                    <asp:DropDownList ID="economic_act" runat="server" CssClass="form-control">
                        <asp:ListItem Text="Actividad" Value="" Disabled="true" Selected="true"></asp:ListItem>
                        <asp:ListItem Text="Agroindustria" Value="Agroindustria"></asp:ListItem>
                        <asp:ListItem Text="Arquitectura" Value="Arquitectura"></asp:ListItem>
                        <asp:ListItem Text="CallCenter" Value="CallCenter"></asp:ListItem>
                        <asp:ListItem Text="Comercial" Value="Comercial"></asp:ListItem>
                        <asp:ListItem Text="Construcción" Value="Construcción"></asp:ListItem>
                        <asp:ListItem Text="Entretenimiento" Value="Entretenimiento"></asp:ListItem>
                        <asp:ListItem Text="Internet" Value="Internet"></asp:ListItem>
                        <asp:ListItem Text="Logística" Value="Logística"></asp:ListItem>
                    </asp:DropDownList>
                    <i class="fas fa-industry"></i>
                </div>
                <div class="form-wrapper">
                    <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control">
                        <asp:ListItem Text="Departamento" Value="" Disabled="true" Selected="true"></asp:ListItem>
                        <asp:ListItem Text="Ahuachapán" Value="Ahuachapán"></asp:ListItem>
                        <asp:ListItem Text="Cabañas" Value="Cabañas"></asp:ListItem>
                        <asp:ListItem Text="Chalatenango" Value="Chalatenango"></asp:ListItem>
                        <asp:ListItem Text="Cuscatlán" Value="Cuscatlán"></asp:ListItem>
                        <asp:ListItem Text="La Libertad" Value="La Libertad"></asp:ListItem>
                        <asp:ListItem Text="Morazán" Value="Morazán"></asp:ListItem>
                        <asp:ListItem Text="La Paz" Value="La Paz"></asp:ListItem>
                        <asp:ListItem Text="Santa Ana" Value="Santa Ana"></asp:ListItem>
                        <asp:ListItem Text="San Miguel" Value="San Miguel"></asp:ListItem>
                        <asp:ListItem Text="San Salvador" Value="San Salvador"></asp:ListItem>
                        <asp:ListItem Text="San Vicente" Value="San Vicente"></asp:ListItem>
                        <asp:ListItem Text="Sonsonate" Value="Sonsonate"></asp:ListItem>
                        <asp:ListItem Text="La Unión" Value="La Unión"></asp:ListItem>
                        <asp:ListItem Text="Usulután" Value="Usulután"></asp:ListItem>
                    </asp:DropDownList>
                    <i class="fas fa-map-marker-alt"></i>
                </div>
                <div class="policy-wrapper">
                    <input type="checkbox" id="policyCheck">
                    <label for="policyCheck">Acepto las <a href="#" onclick="showPolicy()">políticas de YourJobs</a></label>
                </div>
                <asp:Button ID="Button1" runat="server" Text="Registrar" CssClass="animated-button" OnClick="Button1_Click" OnClientClick="return validatePolicy()" />
                <asp:Literal ID="alerta" runat="server" Text=""></asp:Literal>
                <div style="text-align: center; margin-top: 10px;">
                    <asp:HyperLink ID="HyperLink" runat="server" CssClass="register-link" NavigateUrl="02.company.login.aspx?type=company">¿Tienes una cuenta? Inicia sesión aquí</asp:HyperLink>
                </div>
            </asp:Panel>
        </form>
    </div>
    <div id="privacyPopup" class="popup">
        <div class="popup-content">
            <span class="close-btn" onclick="closePopup()">&times;</span>
            <h2>Política de Privacidad de YourJob</h2>
            <p><strong>Última actualización:</strong> 10/07/2024</p>

            <h3>1. Información que Recopilamos</h3>
            <h4>1.1 Información Personal:</h4>
            <p>Recopilamos información personal que usted nos proporciona voluntariamente al registrarse en el sitio, crear un perfil, cargar su currículum, buscar empleos, postularse a ofertas de trabajo y comunicarse con nosotros. Esta información puede incluir, pero no se limita a, su nombre, dirección de correo electrónico, número de teléfono, dirección postal, historial de empleo, habilidades y cualquier otra información relevante para la búsqueda de empleo.</p>

            <h4>1.2 Información de Uso:</h4>
            <p>Recopilamos información sobre su interacción con el sitio, como las páginas que visita, los enlaces en los que hace clic, el tiempo que pasa en el sitio y otras acciones realizadas en relación con nuestros servicios. También recopilamos información técnica, como su dirección IP, tipo de navegador, sistema operativo y proveedor de servicios de Internet.</p>

            <h3>2. Uso de la Información</h3>
            <h4>2.1 Fines de Uso:</h4>
            <p>Utilizamos la información que recopilamos para:</p>
            <ul>
                <li>Proveer, operar y mantener nuestros servicios.</li>
                <li>Facilitar la búsqueda de empleo y las aplicaciones.</li>
                <li>Enviar notificaciones relacionadas con su cuenta, nuevas ofertas de trabajo y otras comunicaciones relevantes.</li>
                <li>Mejorar y personalizar su experiencia en el sitio.</li>
                <li>Analizar y comprender cómo se usa nuestro sitio para mejorar nuestros servicios.</li>
                <li>Cumplir con nuestras obligaciones legales y proteger nuestros derechos.</li>
            </ul>

            <h3>3. Compartir Información</h3>
            <h4>3.1 Con Empresas y Reclutadores:</h4>
            <p>Compartimos su información personal con empresas y reclutadores que publican ofertas de trabajo en el sitio para que puedan evaluar su solicitud y contactarlo en relación con oportunidades de empleo.</p>

            <h4>3.2 Proveedores de Servicios:</h4>
            <p>Podemos compartir su información con proveedores de servicios externos que nos ayudan a operar el sitio y proporcionar nuestros servicios, como servicios de alojamiento web, análisis de datos, procesamiento de pagos y servicios de correo electrónico.</p>

            <h4>3.3 Cumplimiento Legal:</h4>
            <p>Podemos divulgar su información personal si creemos de buena fe que es necesario para cumplir con una obligación legal, proteger nuestros derechos, investigar fraudes o responder a una solicitud del gobierno.</p>

            <h3>4. Seguridad de la Información</h3>
            <p>Tomamos medidas razonables para proteger la información personal que recopilamos contra pérdida, robo, uso indebido y acceso no autorizado. Sin embargo, ninguna transmisión de datos a través de Internet o sistema de almacenamiento puede garantizar una seguridad del 100%. Usted usa el sitio bajo su propio riesgo.</p>

            <h3>5. Sus Derechos</h3>
            <p>Usted tiene derecho a:</p>
            <ul>
                <li>Acceder y actualizar su información personal.</li>
                <li>Solicitar la eliminación de su cuenta e información personal.</li>
                <li>Darse de baja de recibir comunicaciones de marketing.</li>
            </ul>
            <p>Para ejercer estos derechos, puede contactarnos en yourjobs2420@gmail.com</p>

            <h3>6. Cambios a Esta Política de Privacidad</h3>
            <p>Nos reservamos el derecho de actualizar esta Política de Privacidad en cualquier momento. Publicaremos cualquier cambio en esta página y actualizaremos la fecha de la última actualización. Le recomendamos que revise esta Política de Privacidad periódicamente para mantenerse informado sobre cómo protegemos su información.</p>

            <h3>7. Contacto</h3>
            <p>Si tiene alguna pregunta o inquietud sobre esta Política de Privacidad, puede contactarnos en yourjobs2420@gmail.com.</p>

            <p><strong>YourJobs</strong><br>
            
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
                    text: '¡Debe aceptar las políticas para continuar!',
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