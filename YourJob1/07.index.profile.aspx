<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="07.index.profile.aspx.cs" Inherits="YourJob1._07_index_profile" %>

<!DOCTYPE html>
<html lang="zxx" class="no-js">
<head>
    <!-- Mobile Specific Meta -->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Favicon-->
    <link rel="shortcut icon" href="img/fav.png">
    <!-- Author Meta -->
    <meta name="author" content="codepixer">
    <!-- Meta Description -->
    <meta name="description" content="">
    <!-- Meta Keyword -->
    <meta name="keywords" content="">
    <!-- meta character set -->
    <meta charset="UTF-8">
    <!-- Site Title -->
    <title>Job Listing</title>

    <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,400,300,500,600,700" rel="stylesheet"> 
    <!-- CSS -->
    <link rel="stylesheet" href="css/linearicons.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/magnific-popup.css">
    <link rel="stylesheet" href="css/nice-select.css">					
    <link rel="stylesheet" href="css/animate.min.css">
    <link rel="stylesheet" href="css/owl.carousel.css">
    <link rel="stylesheet" href="css/main.css">
    <!-- SweetAlert CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">

    <script src="js/vendor/jquery-2.2.4.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9QbY1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="js/vendor/bootstrap.min.js"></script>			
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBhOdIF3Y9382fqJYt5I_sswSrEw5eihAA"></script>
    <script src="js/easing.min.js"></script>			
    <script src="js/hoverIntent.js"></script>
    <script src="js/superfish.min.js"></script>	
    <script src="js/jquery.ajaxchimp.min.js"></script>
    <script src="js/jquery.magnific-popup.min.js"></script>	
    <script src="js/owl.carousel.min.js"></script>			
    <script src="js/jquery.sticky.js"></script>
    <script src="js/jquery.nice-select.min.js"></script>			
    <script src="js/parallax.min.js"></script>		
    <script src="js/mail-script.js"></script>	
    <script src="js/main.js"></script>	
    <!-- SweetAlert JS -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script>
        function searchAlert() {
            Swal.fire({
                title: 'You need to register',
                text: "To search for jobs, you need to register first. Do you want to go to the login page?",
                icon: 'info',
                showCancelButton: true,
                confirmButtonText: 'Go to Login',
                cancelButtonText: 'Stay on Dashboard'
            }).then((result) => {
                if (result.isConfirmed) {
                    window.location.href = '02.user.login.aspx';
                }
            })
        }
        |
        function showAlert() {
            Swal.fire({
                title: 'Do you want to continue?',
                text: "Choose your action",
                icon: 'question',
                showCancelButton: true,
                confirmButtonText: 'Go to Login',
                cancelButtonText: 'Stay on Dashboard'
            }).then((result) => {
                if (result.isConfirmed) {
                    window.location.href = '02.user.login.aspx';
                }
            })
        }
    </script>
</head>
<body>

<header id="header" id="home">
    <div class="container">
        <div class="row align-items-center justify-content-between d-flex">
            <div id="logo">
                <a href="index.html"><img src="img/logo.png" style="height: 60px" alt="" title="" /></a>
            </div>
            <nav id="nav-menu-container">
                <ul class="nav-menu">
                    <li class="menu-active"><a href="index.html">Home</a></li>
                    <li><a href="about-us.html">About Us</a></li>
                    <li><a href="contact.html">Contact</a></li>
                    <li class="menu-has-children">
                        <a href="10.myprofile.form.aspx">
                            <%: Session["userName"] %> <%: Session["userLastName"] %>
                        </a>
                        <ul>
                            <li><a href="10.myprofile.form.aspx">My Profile</a></li>
                            <li><a href="08.resume.form.aspx">My Curriculum</a></li>
                        </ul>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</header>

<section class="banner-area relative" id="home">	
    <div class="overlay overlay-bg"></div>
    <div class="container">
        <div class="row fullscreen d-flex align-items-center justify-content-center">
            <div class="banner-content col-lg-12">
                <h1 class="text-white">
                    <span>Find</span> Your Job			
                </h1>	
                <form action="search.html" class="serach-form-area">
                    <div class="row justify-content-center form-wrap">
                        <div class="col-lg-5 form-cols">
                            <div class="default-select" id="default-selects">
                                <select>
                                    <option value="1">Select area</option>
                                    <option value="2">Dhaka</option>
                                    <option value="3">Rajshahi</option>
                                    <option value="4">Barishal</option>
                                    <option value="5">Noakhali</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-lg-5 form-cols">
                            <div class="default-select" id="default-selects2">
                                <select>
                                    <option value="1">All Category</option>
                                    <option value="2">Medical</option>
                                    <option value="3">Technology</option>
                                    <option value="4">Government</option>
                                    <option value="5">Development</option>
                                </select>
                            </div>										
                        </div>
                        <div class="col-lg-2 form-cols">
                            <button type="button" class="btn btn-info" onclick="searchAlert()">
                                <span class="lnr lnr-magnifier"></span> Search
                            </button>
                        </div>								
                    </div>
                </form>	
                <p class="text-white"> <span>Search by tags:</span> Technology, Business, Consulting, IT Company, Design, Development</p>
            </div>											
        </div>
    </div>
</section>

<section class="popular-post-area pt-100">
    <div class="container">
        <div class="row align-items-center">
            <div class="active-popular-post-carusel owl-carousel">
                <asp:Literal ID="JobOffersLiteral" runat="server" />
            </div>
        </div>
    </div>
</section>

<!-- Start callto-action Area -->
<section class="callto-action-area section-gap" id="join">
    <div class="container">
        <div class="row d-flex justify-content-center">
            <div class="menu-content col-lg-9">
                <div class="title text-center">
                    <h1 class="mb-10 text-white">Join us today without any hesitation</h1>
                    <p class="text-white">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore  et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation.</p>
                    <a class="primary-btn" href="02.user.login.aspx">I am a Candidate</a>
                    <a class="primary-btn" href="02.company.login.aspx">I am a Company</a>
                </div>
            </div>
        </div>	
    </div>	
</section>

<footer class="footer-area section-gap">
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-12">
                <div class="single-footer-widget"></div>
            </div>
            <div class="col-lg-6 col-md-12">
                <div class="single-footer-widget newsletter">
                    <h6>Newsletter</h6>
                    <p>You have some recommendations, let us know!.</p>
                    <div id="mc_embed_signup">
                        <form target="_blank" novalidate="true" action="https://spondonit.us12.list-manage.com/subscribe/post?u=1462626880ade1ac87bd9c93a&amp;id=92a4423d01" method="get" class="form-inline">
                            <div class="form-group row" style="width: 100%">
                                <div class="col-lg-8 col-md-12">
                                    <input name="EMAIL" placeholder="Enter Email" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Email '" required="" type="email">
                                    <div style="position: absolute; left: -5000px;">
                                        <input name="b_36c4fd991d266f23781ded980_aefe40901a" tabindex="-1" value="" type="text">
                                    </div>
                                </div> 
                                <div class="col-lg-4 col-md-12">
                                    <button class="nw-btn primary-btn">Subscribe<span class="lnr lnr-arrow-right"></span></button>
                                </div> 
                            </div>		
                            <div class="info"></div>
                        </form>
                    </div>		
                </div>
            </div>
            <div class="col-lg-3 col-md-12"></div>
        </div>
        <div class="row footer-bottom d-flex justify-content-between">
            <p class="col-lg-8 col-sm-12 footer-text m-0 text-white">
                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://www.instagram.com/yourjob_latam/" target="_blank">YourJobs</a>
                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
            </p>
            <div class="col-lg-4 col-sm-12 footer-social">
                <a href="https://www.instagram.com/yourjob_latam/"><i class="fa fa-instagram"></i></a>
            </div>
        </div>
    </div>
</footer>

</body>
</html>
