<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="10.myprofile.form.aspx.cs" Inherits="YourJob1.myprofileform" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Perfil del Usuario</title>
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
            max-width: 900px;
            margin: 50px auto;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            padding: 0 30px 30px 30px;
            position: relative;
            overflow: hidden;
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
            height: 200px;
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
        .profile-header {
            display: flex;
            align-items: center;
            padding: 30px;
            position: relative;
            z-index: 1;
            animation: fadeIn 1s ease-in-out;
        }
        .profile-header img {
            border-radius: 50%;
            width: 150px;
            height: 150px;
            object-fit: cover;
            border: 3px solid #fff;
            margin-right: 20px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
            animation: fadeIn 2s ease-in-out;
        }
        .profile-info {
            flex-grow: 1;
            color: #fff;
            animation: fadeIn 2s ease-in-out;
        }
        .profile-info h2 {
            margin: 0;
            font-weight: 600;
            font-size: 2.5em;
        }
        .social-links {
            margin-top: 10px;
        }
        .social-links a {
            color: #fff;
            margin-right: 15px;
            font-size: 1.5em;
            transition: color 0.3s, transform 0.3s;
        }
        .social-links a:hover {
            color: #2980b9;
            transform: scale(1.2);
        }
        .profile-info .btn {
            margin-top: 10px;
            background-color: #fff;
            color: #3498db;
            border: none;
            padding: 10px 20px;
            font-size: 1.2em;
            border-radius: 5px;
            transition: background-color 0.3s, transform 0.3s;
        }
        .profile-info .btn:hover {
            background-color: #ecf0f1;
            transform: scale(1.05);
        }
        .profile-content {
            padding-top: 20px;
        }
        .profile-section {
            margin-bottom: 30px;
            animation: fadeIn 1.5s ease-in-out;
        }
        .profile-section h3 {
            border-bottom: 2px solid #3498db;
            padding-bottom: 10px;
            margin-bottom: 20px;
            font-size: 1.8em;
            color: #3498db;
        }
        .profile-section p, .profile-section ul {
            margin: 0;
            color: #555;
        }
        .profile-section ul {
            list-style: none;
            padding: 0;
        }
        .profile-section ul li {
            background: #f9f9f9;
            margin-bottom: 10px;
            padding: 10px;
            border-radius: 5px;
            color: #333;
            border-left: 4px solid #3498db;
            animation: fadeIn 2s ease-in-out;
        }
        .profile-section .card {
            border: none;
            margin-bottom: 20px;
            transition: transform 0.3s;
        }
        .profile-section .card:hover {
            transform: scale(1.02);
        }
        .profile-section .card-body {
            padding: 15px;
        }
        .profile-section .card-title {
            margin-bottom: 10px;
            color: #333;
        }
        .profile-section .card-text {
            color: #555;
        }
        .tooltip {
            position: relative;
            display: inline-block;
            cursor: pointer;
        }
        .tooltip .tooltiptext {
            visibility: hidden;
            width: 120px;
            background-color: #555;
            color: #fff;
            text-align: center;
            border-radius: 5px;
            padding: 5px;
            position: absolute;
            z-index: 1;
            bottom: 125%;
            left: 50%;
            margin-left: -60px;
            opacity: 0;
            transition: opacity 0.3s;
        }
        .tooltip:hover .tooltiptext {
            visibility: visible;
            opacity: 1;
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
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
        </div>
        <div class="profile-header">
            <img id="profileImage" src="img/profile-placeholder.png" alt="Foto de Perfil" runat="server" />
            <div class="profile-info">
                <h2 id="fullName" runat="server">Nombre Usuario</h2>
                <div class="social-links">
                    <a href="#" id="linkedin" runat="server" class="tooltip"><i class="fab fa-linkedin"></i>
                        <span class="tooltiptext">LinkedIn</span>
                    </a>
                    <a href="#" id="twitter" runat="server" class="tooltip"><i class="fab fa-twitter"></i>
                        <span class="tooltiptext">Twitter</span>
                    </a>
                    <a href="#" id="github" runat="server" class="tooltip"><i class="fab fa-github"></i>
                        <span class="tooltiptext">GitHub</span>
                    </a>
                </div>
                <a href="editprofile.aspx" class="btn"><i class="fas fa-edit"></i> Editar Perfil</a>
            </div>
        </div>
        <div class="profile-content">
            <div class="profile-section">
                <h3><i class="fas fa-user"></i> Información Personal</h3>
                <p id="email" runat="server">correo@ejemplo.com</p>
                <p id="age" runat="server">Edad: 25</p>
                <p id="gender" runat="server">Género: Masculino</p>
                <p id="nationality" runat="server">Nacionalidad: El Salvador</p>
                <p id="civilStatus" runat="server">Estado Civil: Soltero</p>
                <p id="phone" runat="server">Teléfono: 12345678</p>
                <p id="errorMessage" runat="server" style="color: red;"></p> <!-- Contenedor para mensajes de error -->
            </div>
            <!-- Comentado por ahora
            <div class="profile-section">
                <h3><i class="fas fa-user"></i> Biografía Personal</h3>
                <p id="biography" runat="server">Una breve biografía del usuario.</p>
            </div>
            -->
            <div class="profile-section">
                <h3><i class="fas fa-user-graduate"></i> Educación</h3>
                <ul id="educationDetails" runat="server">
                    <li>Universidad de Ejemplo - Ingeniería en Sistemas</li>
                </ul>
            </div>
            <div class="profile-section">
                <h3><i class="fas fa-briefcase"></i> Experiencia Laboral</h3>
                <ul id="workExperienceDetails" runat="server">
                    <li>Desarrollador de Software en Compañía Ejemplo (2015-2020)</li>
                </ul>
            </div>
            <div class="profile-section">
                <h3><i class="fas fa-cogs"></i> Habilidades</h3>
                <ul id="skillsList" runat="server">
                    <li>Programación en C#</li>
                    <li>Desarrollo Web</li>
                </ul>
            </div>
            <div class="profile-section">
                <h3><i class="fas fa-language"></i> Idiomas Dominados</h3>
                <p id="masteredLanguages" runat="server">Español, Inglés</p>
            </div>
        </div>
    </div>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const sections = document.querySelectorAll('.profile-section');
            const options = {
                root: null,
                rootMargin: '0px',
                threshold: 0.1
            };
            const observer = new IntersectionObserver((entries, observer) => {
                entries.forEach(entry => {
                    if (entry.isIntersecting) {
                        entry.target.classList.add('fade-in');
                        observer.unobserve(entry.target);
                    }
                });
            }, options);

            sections.forEach(section => {
                observer.observe(section);
            });
        });

        const profileImage = document.getElementById('profileImage');
        profileImage.addEventListener('click', () => {
            profileImage.classList.add('spin');
        });

        const tooltipElements = document.querySelectorAll('.tooltip');
        tooltipElements.forEach(el => {
            el.addEventListener('mouseover', () => {
                const tooltipText = el.querySelector('.tooltiptext');
                tooltipText.style.visibility = 'visible';
                tooltipText.style.opacity = '1';
            });
            el.addEventListener('mouseout', () => {
                const tooltipText = el.querySelector('.tooltiptext');
                tooltipText.style.visibility = 'hidden';
                tooltipText.style.opacity = '0';
            });
        });
    </script>
    <style>
        @keyframes spin {
             0% { transform: rotate(0deg); }
             100% { transform: rotate(360deg); }
         }
         #profileImage.spin {
             animation: spin 2s linear infinite;
         }
         .fade-in {
             opacity: 0;
             animation: fadeInSection 1.5s forwards;
         }
         @keyframes fadeInSection {
             to {
                 opacity: 1;
             }
         }
     </style>
 </body>
 </html>
