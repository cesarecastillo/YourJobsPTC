<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="01.index_dashboard.aspx.cs" Inherits="YourJob1._01_index_dashboard" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta charset="UTF-8">
    <title>Your Job - New Homepage</title>
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
            <a href="02.company.login.aspx">Company Access</a>
            <a href="02.user.login.aspx">Candidate Access</a>
        </div>
    </header>
    <nav>
        <a href="01.index_dashboard.aspx">Home</a>
        <a href="15.AboutUs.aspx">About Us</a>
        <a href="16.ContactUs.aspx">Contact</a>
    </nav>
    <div class="container">
        <h2>Find Your Jobs</h2>
        <p>Search for jobs across various categories and locations.</p>
        <form class="search-form" action="search.html">
            <input type="text" placeholder="Enter job title or keyword">
            <select>
                <option value="1">Select area</option>
                <option value="2">Dhaka</option>
                <option value="3">Rajshahi</option>
                <option value="4">Barishal</option>
                <option value="5">Noakhali</option>
            </select>
            <select>
                <option value="1">All Category</option>
                <option value="2">Medical</option>
                <option value="3">Technology</option>
                <option value="4">Government</option>
                <option value="5">Development</option>
            </select>
            <button type="button" onclick="searchAlert()">Search</button>
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
                        <h5>Find your ideal job</h5>
                        <p>Share your information and find the job that best suits you</p>
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="img/gallery03.jpg" class="d-block w-100" alt="...">
                    <div class="carousel-caption d-none d-md-block">
                        <h5>Share with the Interprises</h5>
                        <p>You can share your CV with companies to hire you</p>
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="img/gallery01.jpg" class="d-block w-100" alt="...">
                    <div class="carousel-caption d-none d-md-block">
                        <h5>Find your ideal job!</h5>
                        <p>You can search in the large number of work areas we have where you will find the job that suits you!</p>
                    </div>
                </div>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
    </div>
    <div class="features">
        <div class="feature">
            <h3>Search</h3>
            <p>Find jobs that match your skills and preferences.</p>
        </div>
        <div class="feature">
            <h3>Apply</h3>
            <p>Apply to multiple job opportunities quickly and easily.</p>
        </div>
        <div class="feature">
            <h3>Share</h3>
            <p>Share your skills and experiences with potential employers.</p>
        </div>
        <div class="feature">
            <h3>Opportunities</h3>
            <p>Explore a wide range of job opportunities and find your perfect match.</p>
        </div>
    </div>
    <div class="job-listings">
        <div class="job-listing">
            <img src="img/p1.png" alt="Creative Designer">
            <div class="job-listing-content">
                <h4>Creative Designer</h4>
                <p>San Salvador - We are looking for a talented and experienced Creative Designer to join our dynamic team.</p>
                <a class="btns" href="javascript:void(0);" onclick="showJobAlert('Creative Designer')">View Job</a>
            </div>
        </div>
        <div class="job-listing">
            <img src="img/p2.png" alt="Software Developer">
            <div class="job-listing-content">
                <h4>Software Developer</h4>
                <p>Morazan - We are seeking a skilled and motivated Software Developer to join our innovative team.</p>
                <a class="btns" href="javascript:void(0);" onclick="showJobAlert('Software Developer')">View Job</a>
            </div>
        </div>
        <div class="job-listing">
            <img src="img/p3.png" alt="Mechanic">
            <div class="job-listing-content">
                <h4>Mechanic</h4>
                <p>La Paz - We are seeking a reliable and skilled Mechanic to join our team.</p>
                <a class="btns" href="javascript:void(0);" onclick="showJobAlert('Mechanic')">View Job</a>
            </div>
        </div>
        <div class="job-listing">
            <img src="img/p4.png" alt="Lawyer">
            <div class="job-listing-content">
                <h4>Lawyer</h4>
                <p>Santa Ana - We are seeking a knowledgeable and experienced Lawyer to join our legal team.</p>
                <a class="btns" href="javascript:void(0);" onclick="showJobAlert('Lawyer')">View Job</a>
            </div>
        </div>
        <div class="job-listing">
            <img src="img/p5.png" alt="Driver">
            <div class="job-listing-content">
                <h4>Driver</h4>
                <p>La Libertad - We are seeking a reliable and experienced Driver to join our team.</p>
                <a class="btns" href="javascript:void(0);" onclick="showJobAlert('Driver')">View Job</a>
            </div>
        </div>
        <div class="job-listing">
            <img src="img/p6.png" alt="Cleaner">
            <div class="job-listing-content">
                <h4>Cleaner</h4>
                <p>Cabañas - We are seeking a diligent and detail-oriented Cleaner to join our team.</p>
                <a class="btns" href="javascript:void(0);" onclick="showJobAlert('Cleaner')">View Job</a>
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
    <script>
        function searchAlert() {
            Swal.fire({
                title: 'You need to register',
                text: "To search for jobs, you need to register first. Do you want to go to the login page?",
                icon: 'info',
                showCancelButton: true,
                confirmButtonText: 'Go to Login',
                cancelButtonText: 'Stay on Homepage'
            }).then((result) => {
                if (result.isConfirmed) {
                    window.location.href = '02.user.login.aspx';
                }
            });
        }

        function showJobAlert(jobTitle) {
            Swal.fire({
                title: `View ${jobTitle} Job`,
                text: `To view the ${jobTitle} job details, you need to log in. Do you want to go to the login page?`,
                icon: 'question',
                showCancelButton: true,
                confirmButtonText: 'Go to Login',
                cancelButtonText: 'Stay on Homepage'
            }).then((result) => {
                if (result.isConfirmed) {
                    window.location.href = '02.user.login.aspx';
                }
            });
        }
    </script>
</body>
</html>
