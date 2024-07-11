<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="16.ContactUs.aspx.cs" Inherits="YourJob1._16_ContactUs" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta charset="UTF-8">
    <title>Your Job - Contact Us</title>
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/styles.css">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            background: #f0f2f5;
            color: #333;
        }
        header {
            background: #007bff;
            color: #fff;
            padding: 20px;
            text-align: center;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        header h1 {
            margin: 0;
            font-size: 2.5em;
        }
        .login-buttons a {
            background: #0056b3;
            color: #fff;
            padding: 10px 20px;
            border-radius: 50px;
            text-decoration: none;
            transition: background 0.3s, transform 0.3s;
            font-size: 1em;
            margin-left: 10px;
        }
        .login-buttons a:hover {
            background: #004494;
            transform: scale(1.05);
        }
        nav {
            display: flex;
            justify-content: center;
            background: #0056b3;
            padding: 10px 0;
        }
        nav a {
            color: #fff;
            margin: 0 15px;
            text-decoration: none;
            font-size: 1.1em;
            transition: color 0.3s;
        }
        nav a:hover {
            color: #f0f2f5;
        }
        .contact-container {
            flex: 1;
            display: flex;
            flex-direction: column;
            align-items: center;
            text-align: center;
            padding: 40px 20px;
            background: #fff;
        }
        .contact-container h2 {
            font-size: 3em;
            margin-bottom: 20px;
            color: #333;
        }
        .contact-container p {
            font-size: 1.2em;
            margin-bottom: 40px;
            color: #666;
            max-width: 800px;
        }
        .contact-form {
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 600px;
            margin: 0 auto;
        }
        .contact-form input, .contact-form textarea {
            width: 100%;
            padding: 15px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-family: 'Poppins', sans-serif;
        }
        .contact-form button {
            background: #007bff;
            color: #fff;
            padding: 15px 30px;
            border: none;
            border-radius: 50px;
            cursor: pointer;
            transition: background 0.3s, transform 0.3s;
        }
        .contact-form button:hover {
            background: #0056b3;
            transform: scale(1.05);
        }
        footer {
            background: #0056b3;
            color: #fff;
            text-align: center;
            padding: 20px;
        }
        footer p {
            margin: 0;
        }
    </style>
</head>
<body>
    <header>
        <h1>YourJobs</h1>
        <div class="login-buttons">
            <a id="header-login" href="02.company.login.aspx">Company Access</a>
            <a id="header-candidate" href="02.user.login.aspx">Candidate Access</a>
        </div>
    </header>
    <nav>
       <a id="nav-home" href="01.index_dashboard.aspx">Home</a>
<a id="nav-about" href="15.AboutUs.aspx.cs.aspx">About Us</a>
<a id="nav-contact" href="16.ContactUs.aspx">Contact</a>
    </nav>
    <div class="contact-container">
        <h2>Contact Us</h2>
        <p>If you have any questions or need further information, please feel free to contact us. We are here to help!</p>
        <form class="contact-form" method="post" runat="server" onsubmit="SubmitForm">
            <asp:TextBox ID="name" runat="server" placeholder="Your Name" CssClass="form-control" required></asp:TextBox>
            <asp:TextBox ID="email" runat="server" placeholder="Your Email" CssClass="form-control" TextMode="Email" required></asp:TextBox>
            <asp:TextBox ID="subject" runat="server" placeholder="Subject" CssClass="form-control" required></asp:TextBox>
            <asp:TextBox ID="message" runat="server" placeholder="Your Message" CssClass="form-control" TextMode="MultiLine" Rows="6" required></asp:TextBox>
            <asp:Button ID="submitButton" runat="server" Text="Send Message" CssClass="btn btn-primary" OnClick="SubmitForm" />
        </form>
    </div>
    <footer>
        <p>&copy; <script>document.write(new Date().getFullYear());</script> Your Job. All rights reserved.</p>
    </footer>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</body>
</html>
