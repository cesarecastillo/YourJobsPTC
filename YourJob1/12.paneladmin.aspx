<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="12.paneladmin.aspx.cs" Inherits="YourJob1._12_paneladmin" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Panel de Administración</title>
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,400,300,500,600,700" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            background: url('img/job-login.jpeg') no-repeat center center fixed;
            background-size: cover;
            overflow: hidden;
            height: 100vh;
            display: flex;
            flex-direction: column;
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
        .navbar {
            background: #3498DB;
            color: white;
            padding: 15px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: sticky;
            top: 0;
            width: 100%;
            z-index: 1000;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        .navbar .brand {
            font-size: 1.5em;
            display: flex;
            align-items: center;
        }
        .navbar .brand i {
            margin-right: 10px;
        }
        .navbar .menu {
            display: flex;
            align-items: center;
        }
        .navbar .menu a {
            color: white;
            text-decoration: none;
            padding: 10px 15px;
            transition: background 0.3s, transform 0.3s;
            border-radius: 5px;
            display: flex;
            align-items: center;
        }
        .navbar .menu a:hover {
            background: #2980B9;
            transform: scale(1.05);
        }
        .navbar .menu a i {
            margin-right: 5px;
        }
        .inner {
            background: rgba(255, 255, 255, 0.9);
            padding: 40px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            border-radius: 15px;
            max-width: 90%;
            width: 1000px;
            margin: 20px auto;
            overflow: hidden;
        }
        .tabs {
            margin-bottom: 20px;
        }
        .form-wrapper {
            position: relative;
            margin-bottom: 20px;
        }
        .form-wrapper input, .form-wrapper select, .form-wrapper textarea {
            width: calc(100% - 30px);
            padding: 10px;
            padding-left: 30px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 1em;
            transition: box-shadow 0.3s, transform 0.3s;
        }
        .form-wrapper input:focus, .form-wrapper select:focus, .form-wrapper textarea:focus {
            box-shadow: 0 0 10px rgba(52, 152, 219, 0.5);
            transform: scale(1.02);
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
        .section-content {
            display: none;
        }
        .section-content.active {
            display: block;
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
    </style>
</head>
<body>
    <div class="navbar">
        <div class="brand"><i class="fas fa-cogs"></i> Admin Panel</div>
        <div class="menu">
            <a href="#" onclick="showSection('users')"><i class="fas fa-users"></i> Usuarios</a>
            <a href="#" onclick="showSection('jobs')"><i class="fas fa-briefcase"></i> Trabajos</a>
            <a href="#" onclick="showSection('companies')"><i class="fas fa-building"></i> Empresas</a>
            <a href="#" onclick="showSection('images')"><i class="fas fa-images"></i> Imágenes</a>
            <a href="#" onclick="showSection('statistics')"><i class="fas fa-chart-line"></i> Estadísticas</a>
        </div>
    </div>
    <div class="inner">
        <form runat="server">
            <div id="users" class="section-content active">
                <h2>Usuarios</h2>
                <div class="form-wrapper">
                    <i class="fas fa-user"></i>
                    <asp:TextBox ID="txtUserName" runat="server" CssClass="form-control" placeholder="First Name"></asp:TextBox>
                </div>
                <div class="form-wrapper">
                    <i class="fas fa-user"></i>
                    <asp:TextBox ID="txtUserLastName" runat="server" CssClass="form-control" placeholder="Last Name"></asp:TextBox>
                </div>
                <div class="form-wrapper">
                    <i class="fas fa-venus-mars"></i>
                    <asp:DropDownList ID="ddlUserGender" runat="server" CssClass="form-control">
                        <asp:ListItem Value="">Select Gender</asp:ListItem>
                        <asp:ListItem Value="male">Male</asp:ListItem>
                        <asp:ListItem Value="female">Female</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="form-wrapper">
                    <i class="fas fa-envelope"></i>
                    <asp:TextBox ID="txtUserEmail" runat="server" CssClass="form-control" placeholder="Email"></asp:TextBox>
                </div>
                <div class="form-wrapper">
                    <i class="fas fa-lock"></i>
                    <asp:TextBox ID="txtUserPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Password"></asp:TextBox>
                </div>
                <div class="form-wrapper">
                    <i class="fas fa-lock"></i>
                    <asp:TextBox ID="txtUserConfirmPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Confirm Password"></asp:TextBox>
                </div>
                <div class="form-wrapper">
                    <i class="fas fa-calendar"></i>
                    <asp:TextBox ID="txtUserAge" runat="server" CssClass="form-control" placeholder="Age"></asp:TextBox>
                </div>
                <asp:Button ID="SaveUserButton" runat="server" OnClick="SaveUserButton_Click" style="display:none;" />
                <button type="button" class="btn btn-primary" onclick="confirmCreateUser()">Create User</button>

                <h4 class="mt-4">User List</h4>
                <asp:GridView ID="UserGridView" runat="server" AutoGenerateColumns="False" DataKeyNames="Id_Usuario" CssClass="table table-striped" OnRowEditing="UserGridView_RowEditing" OnRowUpdating="UserGridView_RowUpdating" OnRowCancelingEdit="UserGridView_RowCancelingEdit" OnRowDeleting="UserGridView_RowDeleting">
                    <Columns>
                        <asp:BoundField DataField="Id_Usuario" HeaderText="ID" ReadOnly="True" />
                        <asp:TemplateField HeaderText="First Name">
                            <ItemTemplate>
                                <asp:Label ID="lblNombre" runat="server" Text='<%# Eval("Nombre_Usuario") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtNombre" runat="server" Text='<%# Eval("Nombre_Usuario") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Last Name">
                            <ItemTemplate>
                                <asp:Label ID="lblApellido" runat="server" Text='<%# Eval("Apellido_Usuario") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtApellido" runat="server" Text='<%# Eval("Apellido_Usuario") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Gender">
                            <ItemTemplate>
                                <asp:Label ID="lblGenero" runat="server" Text='<%# Eval("Genero") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlGenero" runat="server" SelectedValue='<%# Eval("Genero") %>'>
                                    <asp:ListItem Value="male">Male</asp:ListItem>
                                    <asp:ListItem Value="female">Female</asp:ListItem>
                                </asp:DropDownList>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Email">
                            <ItemTemplate>
                                <asp:Label ID="lblCorreo" runat="server" Text='<%# Eval("Correo") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtCorreo" runat="server" Text='<%# Eval("Correo") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Age">
                            <ItemTemplate>
                                <asp:Label ID="lblEdad" runat="server" Text='<%# Eval("Edad") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtEdad" runat="server" Text='<%# Eval("Edad") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ShowEditButton="True" />
                        <asp:CommandField ShowDeleteButton="True" />
                    </Columns>
                </asp:GridView>
            </div>

            <div id="jobs" class="section-content">
                <h2>Trabajos</h2>
                <div class="form-wrapper">
                    <i class="fas fa-briefcase"></i>
                    <asp:TextBox ID="txtJobTitle" runat="server" CssClass="form-control" placeholder="Job Title"></asp:TextBox>
                </div>
                <div class="form-wrapper">
                    <i class="fas fa-users"></i>
                    <asp:TextBox ID="txtJobVacancies" runat="server" CssClass="form-control" placeholder="Vacancies"></asp:TextBox>
                </div>
                <div class="form-wrapper">
                    <i class="fas fa-level-up-alt"></i>
                    <asp:TextBox ID="txtJobExperience" runat="server" CssClass="form-control" placeholder="Experience Level"></asp:TextBox>
                </div>
                <div class="form-wrapper">
                    <i class="fas fa-dollar-sign"></i>
                    <asp:TextBox ID="txtJobSalary" runat="server" CssClass="form-control" placeholder="Salary"></asp:TextBox>
                </div>
                <div class="form-wrapper">
                    <i class="fas fa-map-marker-alt"></i>
                    <asp:TextBox ID="txtJobLocation" runat="server" CssClass="form-control" placeholder="Location"></asp:TextBox>
                </div>
                <div class="form-wrapper">
                    <i class="fas fa-info-circle"></i>
                    <asp:TextBox ID="txtJobDetails" runat="server" CssClass="form-control" placeholder="Details"></asp:TextBox>
                </div>
                <asp:Button ID="SaveJobButton" runat="server" OnClick="SaveJobButton_Click" style="display:none;" />
                <button type="button" class="btn btn-primary" onclick="confirmCreateJob()">Create Job</button>

                <h4 class="mt-4">Job List</h4>
                <asp:GridView ID="JobGridView" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" CssClass="table table-striped" OnRowEditing="JobGridView_RowEditing" OnRowUpdating="JobGridView_RowUpdating" OnRowCancelingEdit="JobGridView_RowCancelingEdit" OnRowDeleting="JobGridView_RowDeleting">
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="ID" ReadOnly="True" />
                        <asp:TemplateField HeaderText="Job Title">
                            <ItemTemplate>
                                <asp:Label ID="lblPosition" runat="server" Text='<%# Eval("PositionAppliedFor") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtPosition" runat="server" Text='<%# Eval("PositionAppliedFor") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Vacancies">
                            <ItemTemplate>
                                <asp:Label ID="lblVacancies" runat="server" Text='<%# Eval("PositionsVacancies") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtVacancies" runat="server" Text='<%# Eval("PositionsVacancies") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Experience Level">
                            <ItemTemplate>
                                <asp:Label ID="lblExperience" runat="server" Text='<%# Eval("ExperienceLevel") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtExperience" runat="server" Text='<%# Eval("ExperienceLevel") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Salary">
                            <ItemTemplate>
                                <asp:Label ID="lblSalary" runat="server" Text='<%# Eval("Salary") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtSalary" runat="server" Text='<%# Eval("Salary") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Location">
                            <ItemTemplate>
                                <asp:Label ID="lblLocation" runat="server" Text='<%# Eval("Location") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtLocation" runat="server" Text='<%# Eval("Location") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Details">
                            <ItemTemplate>
                                <asp:Label ID="lblDetails" runat="server" Text='<%# Eval("OfferDetails") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtDetails" runat="server" Text='<%# Eval("OfferDetails") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ShowEditButton="True" />
                        <asp:CommandField ShowDeleteButton="True" />
                    </Columns>
                </asp:GridView>
            </div>

            <div id="companies" class="section-content">
                <h2>Empresas</h2>
                <!-- Contenido relacionado con empresas -->
            </div>

            <div id="images" class="section-content">
                <h2>Imágenes</h2>
                <!-- Contenido relacionado con imágenes -->
            </div>

            <div id="statistics" class="section-content">
                <h2>Estadísticas</h2>
                <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                    <ol class="carousel-indicators">
                        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                    </ol>
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <canvas id="userChart"></canvas>
                        </div>
                        <div class="carousel-item">
                            <canvas id="companyChart"></canvas>
                        </div>
                        <div class="carousel-item">
                            <canvas id="jobChart"></canvas>
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
        </form>
    </div>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>
        function showSection(sectionId) {
            document.querySelectorAll('.section-content').forEach(section => {
                section.classList.remove('active');
            });
            document.getElementById(sectionId).classList.add('active');
        }

        document.addEventListener('DOMContentLoaded', function () {
            const sections = document.querySelectorAll('.section-content');
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

            const ctxUser = document.getElementById('userChart').getContext('2d');
            const ctxCompany = document.getElementById('companyChart').getContext('2d');
            const ctxJob = document.getElementById('jobChart').getContext('2d');

            new Chart(ctxUser, {
                type: 'bar',
                data: {
                    labels: ['Usuarios'],
                    datasets: [{
                        label: '# de Usuarios',
                        data: [10],
                        backgroundColor: 'rgba(75, 192, 192, 0.2)',
                        borderColor: 'rgba(75, 192, 192, 1)',
                        borderWidth: 1
                    }]
                },
                options: {
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                }
            });

            new Chart(ctxCompany, {
                type: 'bar',
                data: {
                    labels: ['Empresas'],
                    datasets: [{
                        label: '# de Empresas',
                        data: [5],
                        backgroundColor: 'rgba(153, 102, 255, 0.2)',
                        borderColor: 'rgba(153, 102, 255, 1)',
                        borderWidth: 1
                    }]
                },
                options: {
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                }
            });

            new Chart(ctxJob, {
                type: 'bar',
                data: {
                    labels: ['Trabajos'],
                    datasets: [{
                        label: '# de Trabajos',
                        data: [15],
                        backgroundColor: 'rgba(255, 159, 64, 0.2)',
                        borderColor: 'rgba(255, 159, 64, 1)',
                        borderWidth: 1
                    }]
                },
                options: {
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                }
            });
        });

        function confirmCreateUser() {
            Swal.fire({
                title: 'Are you sure?',
                text: "You are about to create a new user.",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes, create it!'
            }).then((result) => {
                if (result.isConfirmed) {
                    document.getElementById('<%= SaveUserButton.ClientID %>').click();
                }
            })
        }

        function confirmEditUser(index) {
            Swal.fire({
                title: 'Are you sure?',
                text: "You are about to edit this user.",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes, edit it!'
            }).then((result) => {
                if (result.isConfirmed) {
                    __doPostBack('UserGridView', 'Edit$' + index);
                }
            })
        }

        function confirmDeleteUser(index) {
            Swal.fire({
                title: 'Are you sure?',
                text: "You are about to delete this user.",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes, delete it!'
            }).then((result) => {
                if (result.isConfirmed) {
                    __doPostBack('UserGridView', 'Delete$' + index);
                }
            })
        }

        function confirmCreateJob() {
            Swal.fire({
                title: 'Are you sure?',
                text: "You are about to create a new job.",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes, create it!'
            }).then((result) => {
                if (result.isConfirmed) {
                    document.getElementById('<%= SaveJobButton.ClientID %>').click();
                }
            })
        }

        function confirmEditJob(index) {
            Swal.fire({
                title: 'Are you sure?',
                text: "You are about to edit this job.",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes, edit it!'
            }).then((result) => {
                if (result.isConfirmed) {
                    __doPostBack('JobGridView', 'Edit$' + index);
                }
            })
        }

        function confirmDeleteJob(index) {
            Swal.fire({
                title: 'Are you sure?',
                text: "You are about to delete this job.",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes, delete it!'
            }).then((result) => {
                if (result.isConfirmed) {
                    __doPostBack('JobGridView', 'Delete$' + index);
                }
            })
        }
    </script>
    <style>
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
