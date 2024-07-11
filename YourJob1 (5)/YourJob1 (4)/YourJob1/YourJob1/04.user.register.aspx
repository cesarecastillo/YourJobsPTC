<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="04.user.register.aspx.cs" Inherits="YourJob1._04_user_register" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>User Registration</title>
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
            border: 2px solid #000; /* Border color to match the dark header bar */
        }
        .close-btn {
            float: right;
            cursor: pointer;
            font-size: 1.5em;
            color: #000; /* Dark color to match the search button */
        }
        .close-btn:hover {
            color: #0056b3; /* Hover color to match the blue search button */
        }
        h2 {
            color: #0056b3; /* Blue color to match the search button */
            margin-top: 0;
        }
        h3 {
            color: #0056b3; /* Blue color for section titles */
        }
        h4 {
            color: #0056b3; /* Blue color for subsection titles */
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
                <h3>Sign up - user</h3>
                <!-- Campo de entrada para el nombre -->
                <div class="form-wrapper">
                    <asp:TextBox ID="TxtName" runat="server" CssClass="form-control" placeholder="First name" onpaste="return false" minlength="4" MaxLength="50"></asp:TextBox>
                    <i class="fas fa-user"></i>
                </div>
                <!-- Campo de entrada para el apellido -->
                <div class="form-wrapper">
                    <asp:TextBox ID="TxtLastname" runat="server" CssClass="form-control" placeholder="Last name" onpaste="return false" minlength="4" MaxLength="50"></asp:TextBox>
                    <i class="fas fa-user"></i>
                </div>
                <!-- Desplegable para seleccionar el género -->
                <div class="form-wrapper">
                    <asp:DropDownList ID="Gender" runat="server" CssClass="form-control">
                        <asp:ListItem Text="Gender" Value="" Disabled="true" Selected="true"></asp:ListItem>
                        <asp:ListItem Text="Male" Value="male"></asp:ListItem>
                        <asp:ListItem Text="Female" Value="female"></asp:ListItem>
                    </asp:DropDownList>
                    <i class="fas fa-venus-mars"></i>
                </div>
                <!-- Campo de entrada para el correo electrónico -->
                <div class="form-wrapper">
                    <asp:TextBox ID="TxtMail" runat="server" CssClass="form-control" placeholder="Mail" onpaste="return false" minlength="4" MaxLength="50"></asp:TextBox>
                    <i class="fas fa-envelope"></i>
                </div>
                <!-- Campo de entrada para la fecha de nacimiento -->
                <div class="form-wrapper">
                    <asp:TextBox ID="TxtAge" runat="server" CssClass="form-control" placeholder="Age" onpaste="return false" MaxLength="2"></asp:TextBox>
                    <i class="fas fa-birthday-cake"></i>
                </div>
                <!-- Campo de entrada para la contraseña -->
                <div class="form-wrapper">
                    <asp:TextBox ID="TxtContra" runat="server" TextMode="Password" CssClass="form-control" placeholder="Password" onpaste="return false" minlength="4" MaxLength="50"></asp:TextBox>
                    <i class="fas fa-lock"></i>
                </div>
                <!-- Campo de confirmación de contraseña -->
                <div class="form-wrapper">
                    <asp:TextBox ID="TxtConfirm" runat="server" TextMode="Password" CssClass="form-control" placeholder="Confirm password" onpaste="return false" minlength="4" MaxLength="50"></asp:TextBox>
                    <i class="fas fa-lock"></i>
                </div>
                <div class="policy-wrapper">
                    <input type="checkbox" id="policyCheck">
                    <label for="policyCheck">I accept the <a href="#" onclick="showPolicy()">Your Job policies</a></label>
                </div>
                <!-- Botón de registro -->
                <asp:Button ID="RegisterButton" runat="server" Text="Register" CssClass="animated-button" OnClick="RegisterButton_Click" OnClientClick="return validatePolicy()" />
                <!-- Mensaje de alerta -->
                <asp:Literal ID="alerta" runat="server" Text=""></asp:Literal>
                <!-- Enlace para iniciar sesión si ya se tiene una cuenta -->
                <div style="text-align: center; margin-top: 10px;">
                    <asp:HyperLink ID="LoginLink" runat="server" CssClass="register-link" NavigateUrl="02.user.login.aspx?type=user">You have an account? Login here</asp:HyperLink>
                </div>
            </asp:Panel>
        </form>
    </div>
    <div id="privacyPopup" class="popup">
        <div class="popup-content">
            <span class="close-btn" onclick="closePopup()">&times;</span>
            <h2>YourJob Privacy Policy</h2>
            <p><strong>Last updated:</strong> 07/10/2024</p>

            <h3>1. Information We Collect</h3>
            <h4>1.1 Personal Information:</h4>
            <p>We collect personal information that you voluntarily provide to us when registering on the Site, creating a profile, uploading your resume, searching for jobs, applying to job offers, and communicating with us. This information may include, but is not limited to, your name, email address, phone number, postal address, employment history, skills, and any other information relevant to job searching.</p>

            <h4>1.2 Usage Information:</h4>
            <p>We collect information about your interaction with the Site, such as the pages you visit, the links you click, the time you spend on the Site, and other actions taken in connection with our services. We also collect technical information, such as your IP address, browser type, operating system, and Internet service provider.</p>

            <h3>2. Use of Information</h3>
            <h4>2.1 Purposes of Use:</h4>
            <p>We use the information we collect to:</p>
            <ul>
                <li>Provide, operate, and maintain our services.</li>
                <li>Facilitate job searching and applications.</li>
                <li>Send notifications related to your account, new job offers, and other relevant communications.</li>
                <li>Improve and personalize your experience on the Site.</li>
                <li>Analyze and understand how our Site is used to improve our services.</li>
                <li>Comply with our legal obligations and protect our rights.</li>
            </ul>

            <h3>3. Sharing Information</h3>
            <h4>3.1 With Companies and Recruiters:</h4>
            <p>We share your personal information with companies and recruiters who post job offers on the Site so they can evaluate your application and contact you regarding job opportunities.</p>

            <h4>3.2 Service Providers:</h4>
            <p>We may share your information with third-party service providers who assist us in operating the Site and providing our services, such as web hosting services, data analysis, payment processing, and email services.</p>

            <h4>3.3 Legal Compliance:</h4>
            <p>We may disclose your personal information if we believe in good faith that it is necessary to comply with a legal obligation, protect our rights, investigate fraud, or respond to a government request.</p>

            <h3>4. Information Security</h3>
            <p>We take reasonable measures to protect the personal information we collect against loss, theft, misuse, and unauthorized access. However, no data transmission over the Internet or storage system can guarantee 100% security. You use the Site at your own risk.</p>

            <h3>5. Your Rights</h3>
            <p>You have the right to:</p>
            <ul>
                <li>Access and update your personal information.</li>
                <li>Request the deletion of your account and personal information.</li>
                <li>Opt out of receiving marketing communications.</li>
            </ul>
            <p>To exercise these rights, you can contact us at [contact email].</p>

            <h3>6. Changes to This Privacy Policy</h3>
            <p>We reserve the right to update this Privacy Policy at any time. We will post any changes on this page and update the last updated date. We encourage you to review this Privacy Policy periodically to stay informed about how we protect your information.</p>

            <h3>7. Contact</h3>
            <p>If you have any questions or concerns about this Privacy Policy, you can contact us at yourjobs2420@gmail.com.</p>

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
                    text: 'You must accept the policies to continue!',
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
