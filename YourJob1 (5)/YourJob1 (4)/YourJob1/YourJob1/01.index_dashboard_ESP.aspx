<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="01.index_dashboard_ESP.aspx.cs" Inherits="YourJob1._01_index_dashboard_ESP" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta charset="UTF-8">
    <title>Your Job - Nueva Página de Inicio</title>
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
        .container {
            flex: 1;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            text-align: center;
            padding: 40px 20px;
            margin-top: 20px;
            background: url('img/job-login.jpeg') no-repeat center center;
            background-size: cover;
            position: relative;
            filter: grayscale(100%);
        }
        .container::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
            z-index: -1;
        }
        .container h2 {
            font-size: 3em;
            margin-bottom: 20px;
            color: #fff;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
        }
        .container p {
            font-size: 1.5em;
            margin-bottom: 40px;
            color: #fff;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
        }
        .search-form {
            display: flex;
            flex-direction: column;
            align-items: center;
            width: 100%;
            max-width: 800px;
            background: rgba(255, 255, 255, 0.9);
            border-radius: 25px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            overflow: hidden;
            padding: 20px;
            z-index: 1;
        }
        .search-form input, .search-form select, .search-form button {
            padding: 15px;
            border: none;
            font-size: 1em;
            margin: 5px 0;
            width: 90%;
            font-family: 'Poppins', sans-serif;
        }
        .search-form input, .search-form select {
            flex: 1;
            border-radius: 25px;
            margin-right: 10px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        .search-form button {
            background: #007bff;
            color: #fff;
            cursor: pointer;
            border-radius: 25px;
            transition: background 0.3s, transform 0.3s;
            padding: 15px 30px;
            margin-left: 10px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        .search-form button:hover {
            background: #0056b3;
            transform: scale(1.05);
        }
        .features {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            gap: 20px;
            width: 100%;
            max-width: 1200px;
            margin: 40px auto;
        }
        .feature {
            background: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            text-align: center;
            transition: transform 0.3s, box-shadow 0.3s;
            flex: 1 1 250px;
            max-width: 250px;
        }
        .feature:hover {
            transform: translateY(-10px);
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        }
        .feature h3 {
            margin-top: 0;
            font-size: 1.5em;
        }
        .feature p {
            font-size: 1em;
        }
        .carousel-container {
            width: 100%;
            max-width: 1200px;
            margin: 40px auto;
        }
        .carousel-item {
            height: 300px;
            background: #4a4a4a;
            color: #fff;
            border-radius: 10px;
            overflow: hidden;
            text-align: center;
            position: relative;
        }
        .carousel-item img {
            width: 100%;
            height: 300px;
            object-fit: cover;
            border-radius: 10px;
        }
        .carousel-caption {
            background: rgba(0, 0, 0, 0.5);
            bottom: 0;
            left: 0;
            right: 0;
            padding: 10px;
            text-align: center;
            position: absolute;
        }
        .job-listings {
            background: #fff;
            padding: 40px 20px;
            width: 100%;
            max-width: 1200px;
            margin: 40px auto;
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            gap: 20px;
        }
        .job-listing {
            background: #fff;
            padding: 0;
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s, box-shadow 0.3s;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            align-items: center;
            text-align: center;
        }
        .job-listing:hover {
            transform: translateY(-10px);
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        }
        .job-listing img {
            width: 100%;
            height: 150px;
            object-fit: cover;
            border-radius: 10px 10px 0 0;
        }
        .job-listing-content {
            padding: 20px;
        }
        .job-listing h4 {
            margin-top: 0;
            font-size: 1.2em;
        }
        .job-listing p {
            margin: 10px 0 20px;
            font-size: 0.9em;
            color: #666;
        }
        .job-listing .btns {
            background: #007bff;
            color: #fff;
            padding: 10px 20px;
            border-radius: 5px;
            text-decoration: none;
            font-size: 0.9em;
            transition: background 0.3s, transform 0.3s;
            align-self: center;
            margin: 0 20px 20px;
        }
        .job-listing .btns:hover {
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
        @media (min-width: 768px) {
            .search-form {
                flex-direction: row;
                padding: 10px;
            }
            .search-form input, .search-form select, .search-form button {
                margin: 0;
                border-radius: 25px;
            }
            .search-form input, .search-form select {
                border-right: 1px solid #ddd;
                width: auto;
            }
        }
    </style>
</head>
<body>
    <header>
        <h1>YourJobs</h1>
        <div class="login-buttons">
            <a href="02.company.login.aspx">Acceso para Empresas</a>
            <a href="02.user.login.aspx">Acceso para Candidatos</a>
        </div>
    </header>
    <nav>
        <a href="01.index_dashboard.aspx">Inicio</a>
        <a href="15.AboutUs.aspx">Sobre Nosotros</a>
        <a href="16.ContactUs.aspx">Contacto</a>
    </nav>
    <div class="container">
        <h2>Encuentra tu Trabajo</h2>
        <p>Busca trabajos en varias categorías y ubicaciones.</p>
        <form class="search-form" action="search.html">
            <input type="text" placeholder="Ingrese el título del trabajo o palabra clave">
            <select>
                <option value="1">Seleccionar área</option>
                <option value="2">Dhaka</option>
                <option value="3">Rajshahi</option>
                <option value="4">Barishal</option>
                <option value="5">Noakhali</option>
            </select>
            <select>
                <option value="1">Todas las Categorías</option>
                <option value="2">Medicina</option>
                <option value="3">Tecnología</option>
                <option value="4">Gobierno</option>
                <option value="5">Desarrollo</option>
            </select>
            <button type="button" onclick="searchAlert()">Buscar</button>
        </form>
    </div>
    <div class="carousel-container">
        <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="img/gallery02.jpg" class="d-block w-100" alt="...">
                    <div class="carousel-caption d-none d-md-block">
                        <h5>Encuentra tu trabajo ideal</h5>
                        <p>Comparte tu información y encuentra el trabajo que mejor se adapte a ti</p>
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="img/gallery03.jpg" class="d-block w-100" alt="...">
                    <div class="carousel-caption d-none d-md-block">
                        <h5>Comparte con las Empresas</h5>
                        <p>Puedes compartir tu CV con empresas para que te contraten</p>
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="img/gallery01.jpg" class="d-block w-100" alt="...">
                    <div class="carousel-caption d-none d-md-block">
                        <h5>¡Encuentra tu trabajo ideal!</h5>
                        <p>¡Puedes buscar en la gran cantidad de áreas de trabajo que tenemos y encontrar el trabajo que se adapte a ti!</p>
                    </div>
                </div>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Anterior</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Siguiente</span>
            </a>
        </div>
    </div>
    <div class="features">
        <div class="feature">
            <h3>Buscar</h3>
            <p>Encuentra trabajos que coincidan con tus habilidades y preferencias.</p>
        </div>
        <div class="feature">
            <h3>Postular</h3>
            <p>Aplica a múltiples oportunidades de trabajo rápida y fácilmente.</p>
        </div>
        <div class="feature">
            <h3>Compartir</h3>
            <p>Comparte tus habilidades y experiencias con posibles empleadores.</p>
        </div>
        <div class="feature">
            <h3>Oportunidades</h3>
            <p>Explora una amplia gama de oportunidades de trabajo y encuentra tu pareja perfecta.</p>
        </div>
    </div>
    <div class="job-listings">
        <div class="job-listing">
            <img src="img/p1.png" alt="Diseñador Creativo">
            <div class="job-listing-content">
                <h4>Diseñador Creativo</h4>
                <p>San Salvador - Estamos buscando un Diseñador Creativo talentoso y con experiencia para unirse a nuestro equipo dinámico.</p>
                <a class="btns" href="javascript:void(0);" onclick="showJobAlert('Diseñador Creativo')">Ver Trabajo</a>
            </div>
        </div>
        <div class="job-listing">
            <img src="img/p2.png" alt="Desarrollador de Software">
            <div class="job-listing-content">
                <h4>Desarrollador de Software</h4>
                <p>Morazan - Estamos buscando un Desarrollador de Software habilidoso y motivado para unirse a nuestro equipo innovador.</p>
                <a class="btns" href="javascript:void(0);" onclick="showJobAlert('Desarrollador de Software')">Ver Trabajo</a>
            </div>
        </div>
        <div class="job-listing">
            <img src="img/p3.png" alt="Mecánico">
            <div class="job-listing-content">
                <h4>Mecánico</h4>
                <p>La Paz - Estamos buscando un Mecánico confiable y hábil para unirse a nuestro equipo.</p>
                <a class="btns" href="javascript:void(0);" onclick="showJobAlert('Mecánico')">Ver Trabajo</a>
            </div>
        </div>
        <div class="job-listing">
            <img src="img/p4.png" alt="Abogado">
            <div class="job-listing-content">
                <h4>Abogado</h4>
                <p>Santa Ana - Estamos buscando un Abogado con conocimiento y experiencia para unirse a nuestro equipo legal.</p>
                <a class="btns" href="javascript:void(0);" onclick="showJobAlert('Abogado')">Ver Trabajo</a>
            </div>
        </div>
        <div class="job-listing">
            <img src="img/p5.png" alt="Conductor">
            <div class="job-listing-content">
                <h4>Conductor</h4>
                <p>La Libertad - Estamos buscando un Conductor confiable y con experiencia para unirse a nuestro equipo.</p>
                <a class="btns" href="javascript:void(0);" onclick="showJobAlert('Conductor')">Ver Trabajo</a>
            </div>
        </div>
        <div class="job-listing">
            <img src="img/p6.png" alt="Limpiador">
            <div class="job-listing-content">
                <h4>Limpiador</h4>
                <p>Cabañas - Estamos buscando un Limpiador diligente y orientado a los detalles para unirse a nuestro equipo.</p>
                <a class="btns" href="javascript:void(0);" onclick="showJobAlert('Limpiador')">Ver Trabajo</a>
            </div>
        </div>
    </div>
    <footer>
        <p>&copy; <script>document.write(new Date().getFullYear());</script> Your Job. Todos los derechos reservados.</p>
    </footer>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script>
        function searchAlert() {
            Swal.fire({
                title: 'Necesitas registrarte',
                text: "Para buscar trabajos, primero necesitas registrarte. ¿Quieres ir a la página de inicio de sesión?",
                icon: 'info',
                showCancelButton: true,
                confirmButtonText: 'Ir a Iniciar Sesión',
                cancelButtonText: 'Permanecer en la Página de Inicio'
            }).then((result) => {
                if (result.isConfirmed) {
                    window.location.href = '02.user.login.aspx';
                }
            });
        }

        function showJobAlert(jobTitle) {
            Swal.fire({
                title: `Ver trabajo de ${jobTitle}`,
                text: `Para ver los detalles del trabajo de ${jobTitle}, necesitas iniciar sesión. ¿Quieres ir a la página de inicio de sesión?`,
                icon: 'question',
                showCancelButton: true,
                confirmButtonText: 'Ir a Iniciar Sesión',
                cancelButtonText: 'Permanecer en la Página de Inicio'
            }).then((result) => {
                if (result.isConfirmed) {
                    window.location.href = '02.user.login.aspx';
                }
            });
        }
    </script>
</body>
</html>
