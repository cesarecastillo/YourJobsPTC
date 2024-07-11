<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="14.logout_ESP.aspx.cs" Inherits="YourJob1._14_logout_ESP" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cerrar Sesión</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
            background: url('img/job-login.jpeg') no-repeat center center fixed;
            background-size: cover;
            position: relative;
            overflow-x: hidden;
            overflow-y: auto;
        }
        body::before {
            content: "";
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(52, 152, 219, 0.8);
            z-index: -1;
        }
        .container {
            max-width: 600px;
            margin: 50px auto;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            padding: 20px;
            text-align: center;
            animation: fadeIn 1s ease-in-out;
        }
        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }
        .banner {
            background: linear-gradient(270deg, #3498db, #2980b9, #3498db);
            background-size: 600% 600%;
            animation: gradient 8s ease infinite;
            height: 150px;
            width: 100%;
            position: absolute;
            top: 0;
            left: 0;
            z-index: 0;
            border-radius: 10px 10px 0 0;
            overflow: hidden;
        }
        @keyframes gradient {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }
        .particle {
            position: absolute;
            width: 5px;
            height: 5px;
            background-color: rgba(255, 255, 255, 0.4);
            border-radius: 50%;
            animation: particle 8s ease-in-out infinite;
        }
        @keyframes particle {
            0% { transform: translateY(0); }
            50% { transform: translateY(-10px); }
            100% { transform: translateY(0); }
        }
        .particle:nth-child(1) { top: 20px; left: 10%; animation-delay: 0s; }
        .particle:nth-child(2) { top: 50px; left: 20%; animation-delay: 1s; }
        .particle:nth-child(3) { top: 100px; left: 30%; animation-delay: 2s; }
        .particle:nth-child(4) { top: 150px; left: 40%; animation-delay: 3s; }
        .particle:nth-child(5) { top: 200px; left: 50%; animation-delay: 4s; }
        .particle:nth-child(6) { top: 250px; left: 60%; animation-delay: 5s; }
        .particle:nth-child(7) { top: 300px; left: 70%; animation-delay: 6s; }
        .particle:nth-child(8) { top: 350px; left: 80%; animation-delay: 7s; }
        .particle:nth-child(9) { top: 400px; left: 90%; animation-delay: 8s; }
        .particle:nth-child(10) { top: 450px; left: 100%; animation-delay: 9s; }
        .particle:nth-child(11) { top: 500px; left: 110%; animation-delay: 10s; }
        .particle:nth-child(12) { top: 550px; left: 120%; animation-delay: 11s; }
        .particle:nth-child(13) { top: 600px; left: 130%; animation-delay: 12s; }
        .particle:nth-child(14) { top: 650px; left: 140%; animation-delay: 13s; }
        .particle:nth-child(15) { top: 700px; left: 150%; animation-delay: 14s; }
        .logout-message {
            margin-top: 180px;
        }
        .logout-message h1 {
            font-size: 2.5em;
            color: #3498db;
            margin-bottom: 20px;
        }
        .logout-message p {
            font-size: 1.2em;
            color: #555;
            margin-bottom: 30px;
        }
        .logout-message .btn {
            background-color: #3498db;
            color: #fff;
            padding: 10px 20px;
            border-radius: 5px;
            font-size: 1.2em;
            transition: background-color 0.3s, transform 0.3s;
        }
        .logout-message .btn:hover {
            background-color: #2980b9;
            transform: scale(1.05);
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="banner">
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
        </div>
        <div class="logout-message">
            <h1>¡Has cerrado sesión!</h1>
            <p>Gracias por usar nuestro servicio. Esperamos verte pronto.</p>
            <a href="02.user.login.aspx" class="btn">Ir a la página de inicio de sesión</a>
        </div>
    </div>
</body>
</html>
