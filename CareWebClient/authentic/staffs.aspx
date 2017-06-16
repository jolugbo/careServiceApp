<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="staffs.aspx.cs" Inherits="CareWebClient.authentic.staffs" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Care Admin</title>

    <!-- BOOTSTRAP STYLES-->
    <link href="~/assets/css/bootstrap.css" rel="stylesheet" />
    <!-- FONTAWESOME STYLES-->
    <link href="~/assets/css/font-awesome.css" rel="stylesheet" />
    <!--CUSTOM BASIC STYLES-->
    <link href="~/assets/css/basic.css" rel="stylesheet" />
    <link href="~/assets/css/bootstrap-switch.css" rel="stylesheet" />
    <!--CUSTOM MAIN STYLES-->
    <link href="~/assets/css/custom.css" rel="stylesheet" />
    <!-- GOOGLE FONTS-->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
</head>
<body>
    <div id="wrapper">
        <nav class="navbar navbar-default navbar-cls-top " role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.html">
                    <%= SessionDetails.CenterName %>
                </a>
            </div>

            <div class="header-right">

                <a href="message-task.html" class="btn btn-info" title="New Message"><b>30 </b><i class="fa fa-envelope-o fa-2x"></i></a>
                <a href="message-task.html" class="btn btn-primary" title="New Task"><b>40 </b><i class="fa fa-bars fa-2x"></i></a>
                <a href="../default.aspx" class="btn btn-danger" title="Logout"><i class="fa fa-exclamation-circle fa-2x"></i></a>

            </div>
        </nav>
        <!-- /. NAV TOP  -->
        <nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">
                    <li>
                        <div class="user-img-div">
                            <img src="../assets/img/user.png" class="img-thumbnail" runat="server" id="userImg" />

                            <div class="inner-text">
                                <%= SessionDetails.Name %>
                                <br />
                                <small>Last Login : <%= SessionDetails.LastLoginDate %> </small>
                            </div>
                        </div>

                    </li>

                    <li>
                        <a class="active-menu" href="index.aspx"><i class="fa fa-dashboard "></i>Dashboard</a>
                    </li>
                    <li>
                        <a href="wards.aspx"><i class="fa fa-address-card-o "></i>students </a>
                    </li>
                    <li>
                        <a href="staffs.aspx"><i class="fa fa-users "></i>staff </a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-desktop "></i>Break Down Reports<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="form.html"><i class="fa fa-toggle-on"></i>review reports</a>
                            </li>
                            <li>
                                <a href="#"><i class="fa fa-bell "></i>expense reports</a>
                            </li>
                            <li>
                                <a href="#"><i class="fa fa-circle-o "></i>income reports</a>
                            </li>
                        </ul>
                    </li>

                    <li>
                        <a href="profile.aspx"><i class="fa fa-wrench "></i>setup </a>

                    </li>

                </ul>

            </div>

        </nav>
        <!-- /. NAV SIDE  -->
        <div id="page-wrapper">
            <div id="page-inner">
                <div class="row">
                    <div class="col-md-12">
                        <h1 class="page-head-line">staff list</h1>
                        <h1 class="page-subhead-line">This is dummy text , you can replace it with your original text. </h1>

                    </div>
                </div>
                <!-- /. ROW  -->
                <div class="row">
                    <div class="col-md-12">
                        <!--    Context Classes  -->
                        <div class="panel panel-default">

                            <div class="panel-heading">
                                <a href="#" class="btn btn-success btn-sm" data-toggle="modal" data-target="#myModalNorm"><span class="glyphicon"></span>add new staff<i class="fa fa-user-circle-o" aria-hidden="true"></i></a>
                            </div>

                            <div class="panel-body">
                                <div class="table-responsive">
                                    <table class="table table-striped table-bordered table-hover">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>login id</th>
                                                <th>full name</th>
                                                <th>gender</th>
                                                <th>contact number</th>
                                                <th>staff ratings</th>
                                                <th>actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                for (var x = 0; x < StaffsCount; x++)
                                                {
                                                    if (x % 2 == 0)
                                                    {%>
                                            <tr class="success">
                                                <td><%= x + 1 %></td>
                                                <td><%= StaffsDetails[x].CareStaffLoginName %></td>
                                                <td><%= StaffsDetails[x].CareStaffName %></td>
                                                <td><%= StaffsDetails[x].Gender %></td>
                                                <td><%= StaffsDetails[x].CareStaffContactNumber %></td>
                                                <td><%= StaffsDetails[x].CareStaffRatings %></td>
                                                <td>
                                                    <a href="#" class="btn btn-success btn-sm" data-toggle="modal" data-target="#myModalNorm"><span class="glyphicon"></span>profile<i class="fa fa-user-circle-o" aria-hidden="true"></i></a>
                                                    <a href="activities.aspx?key=<%=x %>" class="btn btn-info btn-sm"><span class="glyphicon"></span>activities <i class="fa fa-star-half-o" aria-hidden="true"></i></a>
                                                </td>
                                            </tr>
                                            <% }
                                                else
                                                {%>
                                            <tr class="warning">
                                                <td><%= x + 1 %></td>
                                                <td><%= StaffsDetails[x].CareStaffLoginName %></td>
                                                <td><%= StaffsDetails[x].CareStaffName %></td>
                                                <td><%= StaffsDetails[x].Gender %></td>
                                                <td><%= StaffsDetails[x].CareStaffContactNumber %></td>
                                                <td><%= StaffsDetails[x].CareStaffRatings %></td>
                                                <td>
                                                    <a href="#" class="btn btn-success btn-sm" data-toggle="modal" data-target="#myModalNorm"><span class="glyphicon"></span>profile <i class="fa fa-user-circle-o" aria-hidden="true"></i></a>
                                                    <a href="activities.aspx?key=<%=x %>" class="btn btn-info btn-sm"><span class="glyphicon"></span>activities <i class="fa fa-star-half-o" aria-hidden="true"></i></a>
                                                </td>
                                            </tr>
                                            <% }

                                                }
                                            %>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="modal fade" id="myModalNorm" tabindex="-1" role="dialog"
                                    aria-labelledby="myModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <!-- Modal Header -->
                                            <div class="modal-header">
                                                <button type="button" class="close"
                                                    data-dismiss="modal">
                                                    <span aria-hidden="true">&times;</span>
                                                    <span class="sr-only">Close</span>
                                                </button>
                                                <h4 class="modal-title" id="myModalLabel">new staff
                                                </h4>
                                            </div>

                                            <!-- Modal Body -->
                                            <div class="modal-body">
                                                <div class="alert alert-success alert-dismissable">
                                                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                                    <p id="message1"></p>
                                                </div>
                                                <div class="alert alert-danger alert-dismissable">
                                                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                                    <p id="message2"></p>
                                                </div>
                                                <div role="form">
                                                    <div class="form-group">
                                                        <label for="loginName">User Name</label>
                                                        <input type="text" class="form-control"
                                                            id="loginName" placeholder="login id" required="true"/>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="staffEmail">User Email</label>
                                                        <input type="email" class="form-control"
                                                            id="staffEmail" placeholder="@email" />
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="staffPassword">Password</label>
                                                        <input type="password" class="form-control"
                                                            id="staffPassword" placeholder="Password" required="true"/>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="confirmPassword">Confirm Password</label>
                                                        <input type="password" class="form-control"
                                                            id="confirmPassword" placeholder="" required="true"/>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="staffGender">Gender</label>
                                                        <div class="make-switch" data-on="success" data-off="warning">
                                                            <input type="checkbox" checked="checked" id="staffGender" />
                                                        </div>
                                                    </div>
                                                    <button type="submit" class="btn btn-default" onclick="addStaff();" data-loading-text="Processing..." class="btn btn-primary" autocomplete="off">Submit</button>
                                                </div>
                                                <div id="loader" class="loader"></div>
                                            </div>

                                            <!-- Modal Footer -->
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-default"
                                                    data-dismiss="modal">
                                                    Close
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- /.modal -->
                            </div>
                        </div>
                        <!--  end  Context Classes  -->
                    </div>
                </div>
                <!-- /. ROW  -->

            </div>
            <!-- /. PAGE INNER  -->
        </div>
        <!-- /. PAGE WRAPPER  -->
    </div>
    <!-- /. WRAPPER  -->
    <div id="footer-sec">
        &copy; 2014 YourCompany | Design By : <a href="http://www.binarytheme.com/" target="_blank">BinaryTheme.com</a>
    </div>
    <!-- /. FOOTER  -->
    <!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
    <!-- JQUERY SCRIPTS -->
    <script src="/assets/js/jquery-1.10.2.js"></script>
    <!-- BOOTSTRAP SCRIPTS -->
    <script src="/assets/js/bootstrap.js"></script>
    <script src="/assets/js/bootstrap-switch.min.js"></script>
    <!-- METISMENU SCRIPTS -->
    <script src="/assets/js/jquery.metisMenu.js"></script>
  <script src="/assets/js/jquery.bsAlerts.js"></script>
    <!-- CUSTOM SCRIPTS -->
    <script src="/assets/js/custom.js"></script>
    <!-- CUSTOM SCRIPTS -->
    <script src="/assets/js/index.js"></script>
    <script type="text/javascript">
  
    </script>

</body>
</html>

