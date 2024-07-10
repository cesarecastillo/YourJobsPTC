<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="05.company.register.aspx.cs" Inherits="YourJob1._05_company_register" %>

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
    </style>
</head>
<body>
    <a href="01.index_dashboard.aspx" class="back-button"><i class="fas fa-arrow-left"></i></a>
    <div class="inner">
        <div class="title" onmouseover="animateTitle()" onclick="animateTitle()">Your Job</div>
        <form runat="server">
            <asp:Panel runat="server">
                <h3>Sign up - company</h3>
                <div class="form-wrapper">
                    <asp:TextBox ID="TxtName2" runat="server" CssClass="form-control" placeholder="Company's name" onpaste="return false" minlength="4" MaxLength="50"></asp:TextBox>
                    <i class="fas fa-building"></i>
                </div>
                <div class="form-wrapper">
                    <asp:TextBox ID="TxtEmail2" runat="server" CssClass="form-control" placeholder="Company's email" onpaste="return false" minlength="4" MaxLength="50"></asp:TextBox>
                    <i class="fas fa-envelope"></i>
                </div>
                <div class="form-wrapper">
                    <asp:TextBox ID="TxtPhoneNumber" runat="server" CssClass="form-control" placeholder="Company's phone number" onpaste="return false" minlength="9" MaxLength="50"></asp:TextBox>
                    <i class="fas fa-phone"></i>
                </div>
                <div class="form-wrapper">
                    <asp:TextBox ID="TxtContra2" runat="server" TextMode="Password" CssClass="form-control" placeholder="Password" onpaste="return false" minlength="4" MaxLength="50"></asp:TextBox>
                    <i class="fas fa-lock"></i>
                </div>
                <div class="form-wrapper">
                    <asp:TextBox ID="TxtConfirm2" runat="server" TextMode="Password" CssClass="form-control" placeholder="Confirm password" onpaste="return false" minlength="4" MaxLength="50"></asp:TextBox>
                    <i class="fas fa-lock"></i>
                </div>
                <div class="form-wrapper">
                    <asp:DropDownList ID="economic_act" runat="server" CssClass="form-control">
                        <asp:ListItem Text="Activity" Value="" Disabled="true" Selected="true"></asp:ListItem>
                        <asp:ListItem Text="Agroindustry" Value="Agroindustry"></asp:ListItem>
                        <asp:ListItem Text="Architecture" Value="Architecture"></asp:ListItem>
                        <asp:ListItem Text="CallCenter" Value="CallCenter"></asp:ListItem>
                        <asp:ListItem Text="Commercial" Value="Commercial"></asp:ListItem>
                        <asp:ListItem Text="Construction" Value="Construction"></asp:ListItem>
                        <asp:ListItem Text="Entertainment" Value="Entertainment"></asp:ListItem>
                        <asp:ListItem Text="Internet" Value="Internet"></asp:ListItem>
                        <asp:ListItem Text="Logistics" Value="Logistics"></asp:ListItem>
                    </asp:DropDownList>
                    <i class="fas fa-industry"></i>
                </div>
                <div class="form-wrapper">
                    <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control">
                        <asp:ListItem Text="Departament" Value="" Disabled="true" Selected="true"></asp:ListItem>
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
                        <asp:ListItem Text="Usulútan" Value="Usulútan"></asp:ListItem>
                    </asp:DropDownList>
                    <i class="fas fa-map-marker-alt"></i>
                </div>
                <asp:Button ID="Button1" runat="server" Text="Register" CssClass="animated-button" OnClick="Button1_Click"  />
                <asp:Literal ID="alerta" runat="server" Text=""></asp:Literal>
                <div style="text-align: center; margin-top: 10px;">
                    <asp:HyperLink ID="HyperLink" runat="server" CssClass="register-link" NavigateUrl="02.company.login.aspx?type=company">You have an account? Login here</asp:HyperLink>
                </div>
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
    </script>
</body>
</html>
