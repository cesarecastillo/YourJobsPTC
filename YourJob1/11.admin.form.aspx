<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="11.admin.form.aspx.cs" Inherits="YourJob1._11_admin_form" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Panel - Job Search</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .sidebar {
            height: 100vh;
            width: 250px;
            position: fixed;
            top: 0;
            left: 0;
            background-color: #343a40;
            padding-top: 20px;
        }
        .sidebar a {
            padding: 10px 15px;
            text-decoration: none;
            font-size: 18px;
            color: #fff;
            display: block;
        }
        .sidebar a:hover {
            background-color: #575d63;
        }
        .main-content {
            margin-left: 260px;
            padding: 20px;
        }
    </style>
</head>
<body>
    <div class="sidebar">
        <h3 class="text-center text-white">Admin</h3>
        <a href="#dashboard">Dashboard</a>
        <a href="#jobs">Jobs</a>
        <a href="#users">Users</a>
        <a href="02.user.login.aspx">Logout</a>
    </div>

    <div class="main-content">
        <h2 id="dashboard">Dashboard</h2>
        <p>Welcome to the admin panel. Here you can manage the job search application.</p>

        <form runat="server">
            <!-- Jobs Section -->
            <h3 id="jobs" class="mt-5">Job Management</h3>
            <div class="form-group">
                <label for="txtJobTitle">Job Title</label>
                <asp:TextBox ID="txtJobTitle" runat="server" CssClass="form-control" placeholder="Enter job title"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtJobVacancies">Vacancies</label>
                <asp:TextBox ID="txtJobVacancies" runat="server" CssClass="form-control" placeholder="Enter number of vacancies"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtJobExperience">Experience Level</label>
                <asp:TextBox ID="txtJobExperience" runat="server" CssClass="form-control" placeholder="Enter experience level"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtJobSalary">Salary</label>
                <asp:TextBox ID="txtJobSalary" runat="server" CssClass="form-control" placeholder="Enter salary"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtJobLocation">Location</label>
                <asp:TextBox ID="txtJobLocation" runat="server" CssClass="form-control" placeholder="Enter location"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtJobDetails">Details</label>
                <asp:TextBox ID="txtJobDetails" runat="server" CssClass="form-control" placeholder="Enter job details"></asp:TextBox>
            </div>
            <asp:Button ID="SaveJobButton" runat="server" OnClick="SaveJobButton_Click" style="display:none;" />
            <button type="button" class="btn btn-primary" onclick="confirmCreateJob()">Create Job</button>

            <!-- Jobs Table -->
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

            <!-- Users Section -->
            <h3 id="users" class="mt-5">User Management</h3>
            <div class="form-group">
                <label for="txtUserName">First Name</label>
                <asp:TextBox ID="txtUserName" runat="server" CssClass="form-control" placeholder="Enter first name"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtUserLastName">Last Name</label>
                <asp:TextBox ID="txtUserLastName" runat="server" CssClass="form-control" placeholder="Enter last name"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="ddlUserGender">Gender</label>
                <asp:DropDownList ID="ddlUserGender" runat="server" CssClass="form-control">
                    <asp:ListItem Value="">Select Gender</asp:ListItem>
                    <asp:ListItem Value="male">Male</asp:ListItem>
                    <asp:ListItem Value="female">Female</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="form-group">
                <label for="txtUserEmail">Email</label>
                <asp:TextBox ID="txtUserEmail" runat="server" CssClass="form-control" placeholder="Enter email"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtUserPassword">Password</label>
                <asp:TextBox ID="txtUserPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Enter password"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtUserConfirmPassword">Confirm Password</label>
                <asp:TextBox ID="txtUserConfirmPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Confirm password"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtUserAge">Age</label>
                <asp:TextBox ID="txtUserAge" runat="server" CssClass="form-control" placeholder="Enter age"></asp:TextBox>
            </div>
            <asp:Button ID="SaveUserButton" runat="server" OnClick="SaveUserButton_Click" style="display:none;" />
            <button type="button" class="btn btn-primary" onclick="confirmCreateUser()">Create User</button>

            <!-- Users Table -->
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
        </form>
    </div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <script>
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
</body>
</html>
