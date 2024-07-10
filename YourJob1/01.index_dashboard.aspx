<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="01.index_dashboard.aspx.cs" Inherits="YourJob1._01_index_dashboard" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta charset="UTF-8">
    <title>Your Job - New Homepage</title>
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
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
        }
        header h1 {
            margin: 0;
            font-size: 2em;
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
            color: #ffeb3b;
        }
        .container {
            flex: 1;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            text-align: center;
            padding: 20px;
        }
        .container h2 {
            font-size: 2.5em;
            margin-bottom: 20px;
        }
        .container p {
            font-size: 1.2em;
            margin-bottom: 40px;
        }
        .search-form {
            display: flex;
            flex-direction: column;
            align-items: center;
            width: 100%;
            max-width: 800px;
            background: #fff;
            border-radius: 50px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            padding: 10px;
        }
        .search-form input, .search-form select, .search-form button {
            padding: 15px;
            border: none;
            font-size: 1em;
            margin: 5px 0;
        }
        .search-form input, .search-form select {
            flex: 1;
            border-radius: 50px;
        }
        .search-form input {
            margin-right: 5px;
        }
        .search-form button {
            background: #007bff;
            color: #fff;
            cursor: pointer;
            border-radius: 50px;
            transition: background 0.3s, transform 0.3s;
        }
        .search-form button:hover {
            background: #0056b3;
            transform: scale(1.05);
        }
        .features {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
            gap: 20px;
            width: 100%;
            max-width: 1200px;
            margin: 40px auto;
        }
        .feature {
            background: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            text-align: center;
            transition: transform 0.3s, box-shadow 0.3s;
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
        .job-listings {
            background: #fff;
            padding: 40px 20px;
            width: 100%;
            max-width: 1200px;
            margin: 40px auto;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        .job-listing {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px;
            border-bottom: 1px solid #eee;
        }
        .job-listing:last-child {
            border-bottom: none;
        }
        .job-listing h4 {
            margin: 0;
            font-size: 1.2em;
        }
        .job-listing p {
            margin: 5px 0 0;
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
                padding: 0;
            }
            .search-form input, .search-form select, .search-form button {
                margin: 0;
                border-radius: 0;
            }
            .search-form input, .search-form select {
                border-right: 1px solid #ddd;
            }
        }
    </style>
</head>
<body>
    <header>
        <h1>Your Job</h1>
    </header>
    <nav>
        <a href="01.index_dashboard.aspx">Home</a>
        <a href="about-us.html">About Us</a>
        <a href="contact.html">Contact</a>
        <a href="02.user.login.aspx">Login</a>
    </nav>
    <div class="container">
        <h2>Find Your Dream Job</h2>
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
            <div>
                <h4>Creative Designer</h4>
                <p>San Salvador - We are looking for a talented and experienced Creative Designer to join our dynamic team.</p>
            </div>
            <a class="btns" href="javascript:void(0);" onclick="showJobAlert('Creative Designer')">View Job</a>
        </div>
        <div class="job-listing">
            <div>
                <h4>Software Developer</h4>
                <p>Morazan - We are seeking a skilled and motivated Software Developer to join our innovative team.</p>
            </div>
            <a class="btns" href="javascript:void(0);" onclick="showJobAlert('Software Developer')">View Job</a>
        </div>
        <div class="job-listing">
            <div>
                <h4>Mechanic</h4>
                <p>La Paz - We are seeking a reliable and skilled Mechanic to join our team.</p>
            </div>
            <a class="btns" href="javascript:void(0);" onclick="showJobAlert('Mechanic')">View Job</a>
        </div>
        <div class="job-listing">
            <div>
                <h4>Lawyer</h4>
                <p>Santa Ana - We are seeking a knowledgeable and experienced Lawyer to join our legal team.</p>
            </div>
            <a class="btns" href="javascript:void(0);" onclick="showJobAlert('Lawyer')">View Job</a>
        </div>
        <div class="job-listing">
            <div>
                <h4>Driver</h4>
                <p>La Libertad - We are seeking a reliable and experienced Driver to join our team.</p>
            </div>
            <a class="btns" href="javascript:void(0);" onclick="showJobAlert('Driver')">View Job</a>
        </div>
        <div class="job-listing">
            <div>
                <h4>Cleaner</h4>
                <p>Cabañas - We are seeking a diligent and detail-oriented Cleaner to join our team.</p>
            </div>
            <a class="btns" href="javascript:void(0);" onclick="showJobAlert('Cleaner')">View Job</a>
        </div>
    </div>
    <footer>
        <p>&copy; <script>document.write(new Date().getFullYear());</script> Your Job. All rights reserved.</p>
    </footer>
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
                title: View ${ jobTitle } Job,
                text: To view the ${ jobTitle } job details, you need to log in.Do you want to go to the login page ?,
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