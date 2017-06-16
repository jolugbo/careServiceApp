<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="payment.aspx.cs" Inherits="CareWebClient.authentic.payment" %>

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
            <%= this.SessionDetails.CenterName %>
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
                    <img src="../assets/img/user.png" class="img-thumbnail" runat="server" id ="userImg"/>

                    <div class="inner-text">
                        <%= this.SessionDetails.Name %>
                        <br />
                        <small>Last Login : <%= this.SessionDetails.LastLoginDate %> </small>
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
                <h1 class="page-head-line">ward list</h1>
                <h1 class="page-subhead-line">payment details for <%=WardDetails[Value].CarekiddieFirstName + " " + WardDetails[Value].CarekiddieLastName%>. </h1>

            </div>
        </div>
        <!-- /. ROW  -->
        <div class="row">
            <div class="col-md-12">
                <!--    Context Classes  -->
                <div class="panel panel-default">

                    <div class="panel-heading">
                        Context Classes
                    </div>

                    <div class="panel-body">
                        <div class="table-responsive">
                            <table class="table table-striped table-bordered table-hover">
                                <thead>
                                <tr>
                                    <th>#</th>
                                    <th>receipt no</th>
                                    <th>invoice amount</th>
                                    <th>payment description</th>
                                    <th>amount paid</th>
                                    <th>payment date</th>
                                </tr>
                                </thead>
                                <tbody>
                                <%
                                    var current = 0;
                                    for (var x = 0; x < WardDetailsCount; x++)
                                    {
                                        if (x % 2 == 0)
                                        {%>
                                        <tr class="success">
                                            <td><%= x + 1 %></td>
                                            <td><%= KiddiePayDetails[x].ReceiptNo %></td>
                                            <td><%= KiddiePayDetails[x].PaymentInvoiced %></td>
                                            <td><%= KiddiePayDetails[x].PaymentDescription %></td>
                                            <td><%= KiddiePayDetails[x].PaymentMade %></td>
                                            <td><%= KiddiePayDetails[x].PaymentDate %></td>
                                        </tr>
                                    <% }
                                                    else
                                                    {%>
                                        <tr class="info">
                                            <td><%= x + 1 %></td>
                                            <td><%= KiddiePayDetails[x].ReceiptNo %></td>
                                            <td><%= KiddiePayDetails[x].PaymentDescription %></td>
                                            <td><%= KiddiePayDetails[x].PaymentInvoiced %></td>
                                            <td><%= KiddiePayDetails[x].PaymentMade %></td>
                                            <td><%= KiddiePayDetails[x].PaymentDate %></td>
                                            <td>
                                                <a href="#" class="btn btn-success btn-sm" data-toggle="modal" data-target="#myModal"onclick="getRecord(<%=x %>);" ><span class="glyphicon"></span>profile <i class="fa fa-user-circle-o" aria-hidden="true"></i></a>
                                            </td>
                                        </tr>
                                <% }

                                                }
                                %>
                                </tbody>
                            </table>
                        </div>
                        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                        <h4 class="modal-title" id="gridSystemModalLabel">Modal title</h4>
                                    </div>
                                    <div class="modal-body">
                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="">
                                                    <div class="fileupload fileupload-new" data-provides="fileupload">
                                                        <div class="fileupload-new thumbnail" style="width: 200px; height: 150px;">
                                                            <img src="/assets/img/default.jpg" alt="" /></div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-7 col-md-offset-1">
                                                <h3>ward profile <i class="fa fa-user fa-lg" aria-hidden="true"></i></h3>
                                                <i class="fa-li fa-star fa-spin"></i>first name:
                                                <label id="firstName"></label>
                                                <br />
                                                last name:
                                                <label id="lastName"></label>
                                                <br />
                                                other name:
                                                <label id="otherName"></label>
                                                <br />
                                                date of birth:
                                                <label id="dob"></label>
                                                <br />
                                                blood group:
                                                <label id="bloodGroup"></label>
                                                <br />
                                                genotype:
                                                <label id="genotype"></label>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-7 col-md-offset-5">
                                                <h3>guardian profile</h3>
                                                full name:
                                                <label id="guardianName"></label>
                                                <br />
                                                login id:
                                                <label id="loginId"></label>
                                                <br />
                                                phone number:
                                                <label id="phoneNumber"></label>
                                                <br />
                                                email address:
                                                <label id="emailAddress"></label>
                                                <br />
                                                occupation:
                                                <label id="occupation"></label>
                                                <br />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                        <button type="button" class="btn btn-primary">Save changes</button>
                                    </div>
                                </div>
                                <!-- /.modal-content -->
                            </div>
                            <!-- /.modal-dialog -->
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
<!-- METISMENU SCRIPTS -->
<script src="/assets/js/jquery.metisMenu.js"></script>
<!-- CUSTOM SCRIPTS -->
<script src="/assets/js/custom.js"></script>
<!-- CUSTOM SCRIPTS -->
<script src="/assets/js/index.js"></script>
<script type="text/javascript">
  
</script>

</body>
</html>