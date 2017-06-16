<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="CareWebClient.authentic.Profile" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Responsive Bootstrap Advance Admin Template</title>

    <!-- BOOTSTRAP STYLES-->
    <link href="~/assets/css/bootstrap.css" rel="stylesheet" />
    <!-- FONTAWESOME STYLES-->
    <link href="~/assets/css/font-awesome.css" rel="stylesheet" />
    <!--CUSTOM BASIC STYLES-->
    <link href="~/assets/css/basic.css" rel="stylesheet" />
    <!--CUSTOM MAIN STYLES-->
    <link href="~/assets/css/custom.css" rel="stylesheet" />
    <!-- PAGE LEVEL STYLES -->
    <link href="/assets/css/bootstrap-fileupload.min.css" rel="stylesheet" />
    <script src="https://www.google.com/recaptcha/api.js" async defer></script>
    <!-- GOOGLE FONTS-->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
</head>
<body>
<script type="text/javascript">
    var RecaptchaOptions = {
        theme : 'custom',
        custom_theme_widget: 'recaptcha_widget'
    };
</script>
<div id="wrapper">
    <nav class="navbar navbar-default navbar-cls-top " role="navigation" style="margin-bottom: 0">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="index.html"> <%= this.SessionDetails.CenterName %></a>
        </div>

        <div class="header-right">

            <a href="message-task.html" class="btn btn-info" title="New Message"><b>30 </b><i class="fa fa-envelope-o fa-2x"></i></a>
            <a href="message-task.html" class="btn btn-primary" title="New Task"><b>40 </b><i class="fa fa-bars fa-2x"></i></a>
            <a href="~\login.aspx" class="btn btn-danger" title="Logout"><i class="fa fa-exclamation-circle fa-2x"></i></a>


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
                    <h1 class="page-head-line">setup page</h1>
                    <!--  <h1 class="page-subhead-line">This is dummy text , you can replace it with your original text. </h1> -->

                </div>
            </div>
            <!-- /. ROW  -->
            <div class="row">
                <div class="col-md-6 col-sm-6 col-xs-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                             click drop down to select
                        </div>
                        <div class="panel-body">
                            <div class="panel-group" id="accordion">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4 class="panel-title">
                                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" class="collapsed">profile update</a>
                                        </h4>
                                    </div>
                                    <div id="collapseOne" class="panel-collapse collapse in" style="height: auto;">
                                        <div class="panel-body">
                                            <form role="form" runat="server">
                                                
                                                <div class="form-group">
                                                    <div class="row">
                                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <label>business Name</label>
                                                    <asp:TextBox  ID="txtBusinessName" class="form-control" type="text" runat="server"></asp:TextBox>
                                                    </div>
                                                    
                                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <label class="control-label ">change profile image</label>
                                                    <div class="">
                                                        <div class="fileupload fileupload-new" data-provides="fileupload">
                                                            <div class="fileupload-new thumbnail" style="width: 200px; height: 150px;"><img class="img-responsive" src="/assets/img/default.jpg" alt="" id ="currentImg" runat="server"/></div>
                                                            <div class="fileupload-preview fileupload-exists thumbnail" style="max-width: 200px; max-height: 150px; line-height: 20px;"></div>
                                                            <div>
                                                            <asp:FileUpload  ID="FileUpload1" runat="server"  accept="image/*" multiple="false"/>
                                                               <!-- <span class="btn btn-file btn-primary"><span class="fileupload-new">Select image</span><span class="fileupload-exists">Change</span><input type="file"/></span>-->
                                                                <a href="#" class="btn btn-danger fileupload-exists" data-dismiss="fileupload">Remove</a>
                                                            </div>
                                                        </div>
                                                    </div> 

                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label>Staff strength</label>
                                                    <asp:TextBox   ID="txtStaffStrength" class="form-control" type="number" runat="server"></asp:TextBox>
                                                    <p class="help-block">the number of staff employed.</p>
                                                </div>
                                                <div class="form-group">
                                                    <label>phone number</label>
                                                    <asp:TextBox ID="txtPhoneNo" runat="server" class="form-control" type="text"/>
                                                    <p class="help-block">contact number.</p>
                                                </div>
                                                <div class="form-group">
                                                    <label>Enter Email</label>
                                                    <asp:TextBox ID="txtEmailAddress" runat="server" class="form-control" type="text"/>
                                                    <p class="help-block">contact email address.</p>
                                                </div>
                                                <div class="form-group">
                                                    <label>Website</label>
                                                    <asp:TextBox ID="txtWebsite" runat="server" class="form-control" type="text"/>
                                                    <p class="help-block">business location.</p>
                                                </div>
                                                <div class="form-group">
                                                    <label>Address</label>
                                                    <asp:TextBox ID="txtAddress" runat="server" class="form-control" TextMode="multiline" Columns="50" Rows="5"></asp:TextBox>
                                                    <p class="help-block">business location.</p>
                                                </div>
                                                <div class="form-group">
                                                <div class="g-recaptcha" data-sitekey="6Lfr4RUUAAAAAFGtH6epEzkh2-RDbwk8RirLqlAg"></div> 
                                                </div>
                                                <asp:Button ID="btnProfileUpdate" class="btn btn-primary" runat="server" Text="update profile" OnClientClick="return validateLogin();"  OnClick="UpdateProfile" />
                                            </form>
                                        </div>
                                    </div>
                                </div>
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4 class="panel-title">
                                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseThree" class="collapsed">Collapsible Group Item #3</a>
                                        </h4>
                                    </div>
                                    <div id="collapseThree" class="panel-collapse collapse">
                                        <div class="panel-body">
                                            <div class="form-group">
                                                <label class="control-label ">change profile image</label>
                                                <div class="">
                                                    <div class="fileupload fileupload-new" data-provides="fileupload">
                                                        <div class="fileupload-new thumbnail" style="width: 200px; height: 150px;"><img class="img-circle" src="/assets/img/default.jpg" alt="" /></div>
                                                        <div class="fileupload-preview fileupload-exists thumbnail" style="max-width: 200px; max-height: 150px; line-height: 20px;"></div>
                                                        <div>
                                                            <span class="btn btn-file btn-primary"><span class="fileupload-new">Select image</span><span class="fileupload-exists">Change</span><input type="file"/></span>
                                                            <a href="#" class="btn btn-danger fileupload-exists" data-dismiss="fileupload">Remove</a>
                                                        </div>
                                                    </div>
                                                </div> 
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4 class="panel-title">
                                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" class="collapsed">Collapsible Group Item #2</a>
                                        </h4>
                                    </div>
                                    <div id="collapseTwo" class="panel-collapse collapse">
                                        <div class="panel-body">
                                            Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-6 col-sm-6 col-xs-12"></div>
            </div>
        </div>
        <!-- /. PAGE INNER  -->
    </div>
    <!-- /. PAGE WRAPPER  -->
</div>
<!-- /. WRAPPER  -->

<div id="footer-sec">
    &copy; techboss | Design By : <a href="http://www.jolugbo.com/" target="_blank">Jolugbo.com</a>
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
<script src="/assets/js/index.js"></script>
<!-- PAGE LEVEL SCRIPTS -->
<script src="/assets/js/bootstrap-fileupload.js"></script>


</body>
</html>
