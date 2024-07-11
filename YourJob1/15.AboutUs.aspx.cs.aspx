<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="15.AboutUs.aspx.cs.aspx.cs" Inherits="YourJob1._15_AboutUs_aspx_cs" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta charset="UTF-8">
    <title>Your Job - About Us</title>
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
        .about-container {
            flex: 1;
            display: flex;
            flex-direction: column;
            align-items: center;
            text-align: center;
            padding: 40px 20px;
            background: #fff;
        }
        .about-container h2 {
            font-size: 3em;
            margin-bottom: 20px;
            color: #333;
        }
        .about-container p {
            font-size: 1.2em;
            margin-bottom: 20px;
            color: #666;
            max-width: 800px;
        }
        .team {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
            max-width: 1200px;
            margin: 40px auto;
        }
        .team-member {
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            text-align: center;
            transition: transform 0.3s, box-shadow 0.3s;
            flex: 1 1 250px;
            max-width: 250px;
        }
        .team-member:hover {
            transform: translateY(-10px);
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        }
        .team-member img {
            width: 100%;
            border-radius: 50%;
            margin-bottom: 20px;
            transition: transform 0.3s, box-shadow 0.3s;
        }
        .team-member img:hover {
            transform: scale(1.1);
        }
        .team-member h3 {
            margin-top: 0;
            font-size: 1.5em;
            color: #333;
        }
        .team-member p {
            font-size: 1em;
            color: #666;
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
    <div class="about-container">
        <h2>About Us</h2>
        <p>Welcome to YourJobs! We are dedicated to helping people find their ideal job and employers find the perfect candidates. Our mission is to create a seamless and efficient job search experience for everyone.</p>
        <p>Our team is composed of experienced professionals who are passionate about connecting talent with opportunities. We believe in providing a platform that is user-friendly, comprehensive, and reliable.</p>
        <div class="team">
            <div class="team-member">
                <img src="img/member1.jpg" alt="Team Member 1">
                <h3>Cesar Castillo</h3>
                <p>Developer</p>
            </div>
            <div class="team-member">
                <img src="img/member2.jpg" alt="Team Member 2">
                <h3>Brandon Zelaya</h3>
                <p>Developer</p>
            </div>
            <div class="team-member">
                <img src="img/member3.jpg" alt="Team Member 3">
                <h3>Jeffrey Martinez</h3>
                <p>Developer</p>
            </div>
            <div class="team-member">
                <img src="img/member4.jpg" alt="Team Member 4">
                <h3>Raul Reyes</h3>
                <p>Developer</p>
            </div>
            <div class="team-member">
                <img src="img/member5.jpg" alt="Team Member 5">
                <h3>Cesar Jared</h3>
                <p>Developer</p>
            </div>
        </div>
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
