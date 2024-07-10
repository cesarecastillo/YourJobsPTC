<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="02.company.login.aspx.cs" Inherits="YourJob1._02_company_login" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Your Job - Login</title>
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
    </style>
</head>
<body>
    <a href="01.index_dashboard.aspx" class="back-button"><i class="fas fa-arrow-left"></i></a>
    <div class="inner">
        <div class="title" onmouseover="animateTitle()" onclick="animateTitle()">Your Job</div>
        <form runat="server">
            <asp:Panel runat="server">
                <h3>Sign In</h3>
                <div class="form-wrapper">
                    <i class="fas fa-envelope"></i>
                    <asp:TextBox ID="TxtUsuario" runat="server" CssClass="form-control" placeholder="Email Address"></asp:TextBox>
                </div>
                <div class="form-wrapper">
                    <i class="fas fa-lock"></i>
                    <asp:TextBox ID="TxtContra1" runat="server" TextMode="Password" CssClass="form-control" placeholder="Password"></asp:TextBox>
                </div>
                <div class="policy-wrapper">
                    <input type="checkbox" id="policyCheck">
                    <label for="policyCheck">I accept the <a href="#" onclick="showPolicy()">Your Jobs policies</a></label>
                </div>

                <asp:Button ID="RegisterLogin" runat="server" Text="Login" CssClass="animated-button" OnClick="RegisterLogin_Click" OnClientClick="return validatePolicy()" />
                <asp:Literal ID="alerta1" runat="server" Text=""></asp:Literal>
                <asp:HyperLink ID="RegisterLink" runat="server" CssClass="register-link" NavigateUrl="05.company.register.aspx" OnClientClick="return showLinkAlert('05.company.register.aspx')">You don't have an account? Register here</asp:HyperLink>
                <asp:HyperLink ID="ForgotPasswordLink" runat="server" CssClass="forgot-password-link" NavigateUrl="06.forget.password.aspx" OnClientClick="return showLinkAlert('06.forget.password.aspx')">Forgot your password?</asp:HyperLink>
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
                title: 'Are you sure?',
                text: "You will be redirected to another page.",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3498DB',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes, go there!',
                cancelButtonText: 'Stay here'
            }).then((result) => {
                if (result.isConfirmed) {
                    window.location.href = url;
                }
            });
            return false;
        }

        function showLoading() {
            Swal.fire({
                title: 'Loading...',
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
            Swal.fire({
                title: 'Your Jobs Policies',
                text: 'Here are the policies of Your Jobs...',
                icon: 'info',
                confirmButtonText: 'Close'
            });
            return false;
        }
    </script>
</body>
</html>
