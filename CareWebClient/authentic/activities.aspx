<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="activities.aspx.cs" Inherits="CareWebClient.authentic.activities" %>


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
    <link href="~/assets/css/styleA.css" rel="stylesheet" />
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
                    <%--   <% JavaScriptSerializer js = new JavaScriptSerializer(); %>
                    <%= this.SessionDetails.CenterName %>--%>
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
                                <%--   <%= this.SessionDetails.Name %>
                                <br />
                                <small>Last Login : <%= this.SessionDetails.LastLoginDate %> </small>--%>
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
                        <h1 class="page-head-line">ward activities</h1>
                        <h1 class="page-subhead-line">activities for <%=WardDetails[Value].CarekiddieFirstName + " " + WardDetails[Value].CarekiddieLastName%>. </h1>

                    </div>
                </div>
                <!-- /. ROW  -->
                <div class="row">
                    <div class="col-md-6">
                        <!--    Context Classes  -->

                        <%
                            var current = 0;
                            for (var x = 0; x < WardActivitiesCount; x++)
                            {
                                switch (x % 4)
                                {
                                    case 0:%>
                        <div class="panel panel-primary">
                            <div class="panel-body">
                                <div class="well well-lg">
                                    <section class="event">
                                        <span class="thumb-sm avatar pull-left mr-sm">
                                            <img class="img-circle" src="<%=KiddieDetails.CarekiddiePhotoPath %>" alt="..." /></span>
                                        <h4 class="event-heading"><a href="#"><%=KiddieDetails.CarekiddieFirstName +" "+ KiddieDetails.CarekiddieLastName%></a> <small>@jess</small></h4>
                                        <p class="fs-sm text-muted"><%=KiddieDetails.Activities[x].KiddiesActivityDateUpdated %></p>
                                        <img class="img-responsive" src="<%=KiddieDetails.Activities[x].KiddiesActivityImagePath %>" />
                                        <p class="fs-mini"><%=KiddieDetails.Activities[x].KiddiesActivityNotes %></p>
                                        <footer>
                                            <div class="clearfix">
                                                <ul class="post-links mt-sm pull-left">
                                                    <li><a href="#">1 hour</a></li>
                                                    <li><a href="#"><span class="text-danger"><i class="fa fa-heart-o"></i>Like</span></a></li>
                                                    <li><a href="#">Comment</a></li>
                                                </ul>
                                                <span class="thumb thumb-sm pull-right"><a href="#">
                                                    <img class="img-circle" src="../assets/img/port5.jpg" /></a></span> <span class="thumb thumb-sm pull-right"><a href="#">
                                                        <img class="img-circle" src="../assets/img/port5.jpg" /></a></span> <span class="thumb thumb-sm pull-right"><a href="#">
                                                            <img class="img-circle" src="../assets/img/port5.jpg" /></a></span>
                                            </div>
                                            <ul class="post-comments mt-sm">
                                                <li><span class="thumb-xs avatar pull-left mr-sm">
                                                    <img class="img-circle" src="../assets/img/port5.jpg" alt="..." /></span><div class="comment-body">
                                                        <h6 class="author fw-semi-bold">Ignacio Abad <small>6 mins ago</small></h6>
                                                        <p>Hey, have you heard anything about that?</p>
                                                    </div>
                                                </li>
                                                <li><span class="thumb-xs avatar pull-left mr-sm">
                                                    <img class="img-circle" src="../assets/img/port5.jpg" alt="..." /></span><div class="comment-body">
                                                        <input class="form-control input-sm" type="text" placeholder="Write your comment..." />
                                                    </div>
                                                </li>
                                            </ul>
                                        </footer>
                                    </section>
                                </div>
                            </div>
                            <div class="panel-footer">
                            </div>
                        </div>

                        <%
                                break;
                            case 1:%>
                        <div class="panel panel-success">
                            <div class="panel-body">
                                <div class="well well-lg">
                                    <section class="event">
                                        <span class="thumb-sm avatar pull-left mr-sm">
                                            <img class="img-circle" src="<%=KiddieDetails.CarekiddiePhotoPath %>" alt="..." /></span>
                                        <h4 class="event-heading"><a href="#"><%=KiddieDetails.CarekiddieFirstName +" "+ KiddieDetails.CarekiddieLastName%></a> <small>@jess</small></h4>
                                        <p class="fs-sm text-muted"><%=KiddieDetails.Activities[x].KiddiesActivityDateUpdated %></p>
                                        <img class="img-responsive" src="<%=KiddieDetails.Activities[x].KiddiesActivityImagePath %>" />
                                        <p class="fs-mini"><%=KiddieDetails.Activities[x].KiddiesActivityNotes %></p>
                                        <footer>
                                            <div class="clearfix">
                                                <ul class="post-links mt-sm pull-left">
                                                    <li><a href="#">1 hour</a></li>
                                                    <li><a href="#"><span class="text-danger"><i class="fa fa-heart-o"></i>Like</span></a></li>
                                                    <li><a href="#">Comment</a></li>
                                                </ul>
                                                <span class="thumb thumb-sm pull-right"><a href="#">
                                                    <img class="img-circle" src="../assets/img/port5.jpg" /></a></span> <span class="thumb thumb-sm pull-right"><a href="#">
                                                        <img class="img-circle" src="../assets/img/port5.jpg" /></a></span> <span class="thumb thumb-sm pull-right"><a href="#">
                                                            <img class="img-circle" src="../assets/img/port5.jpg" /></a></span>
                                            </div>
                                            <ul class="post-comments mt-sm">
                                                <li><span class="thumb-xs avatar pull-left mr-sm">
                                                    <img class="img-circle" src="../assets/img/port5.jpg" alt="..." /></span><div class="comment-body">
                                                        <h6 class="author fw-semi-bold">Ignacio Abad <small>6 mins ago</small></h6>
                                                        <p>Hey, have you heard anything about that?</p>
                                                    </div>
                                                </li>
                                                <li><span class="thumb-xs avatar pull-left mr-sm">
                                                    <img class="img-circle" src="../assets/img/port5.jpg" alt="..." /></span><div class="comment-body">
                                                        <input class="form-control input-sm" type="text" placeholder="Write your comment..." />
                                                    </div>
                                                </li>
                                            </ul>
                                        </footer>
                                    </section>
                                </div>
                            </div>
                            <div class="panel-footer">Panel footer</div>
                        </div>

                        <%
                                break;
                            case 2:%>

                        <div class="panel panel-warning">
                            <div class="panel-body">
                                 <div class="well well-lg">
                                    <section class="event">
                                        <span class="thumb-sm avatar pull-left mr-sm">
                                            <img class="img-circle" src="<%=KiddieDetails.CarekiddiePhotoPath %>" alt="..." /></span>
                                        <h4 class="event-heading"><a href="#"><%=KiddieDetails.CarekiddieFirstName +" "+ KiddieDetails.CarekiddieLastName%></a> <small>@jess</small></h4>
                                        <p class="fs-sm text-muted"><%=KiddieDetails.Activities[x].KiddiesActivityDateUpdated %></p>
                                        <img class="img-responsive" src="<%=KiddieDetails.Activities[x].KiddiesActivityImagePath %>" />
                                        <p class="fs-mini"><%=KiddieDetails.Activities[x].KiddiesActivityNotes %></p>
                                        <footer>
                                            <div class="clearfix">
                                                <ul class="post-links mt-sm pull-left">
                                                    <li><a href="#">1 hour</a></li>
                                                    <li><a href="#"><span class="text-danger"><i class="fa fa-heart-o"></i>Like</span></a></li>
                                                    <li><a href="#">Comment</a></li>
                                                </ul>
                                                <span class="thumb thumb-sm pull-right"><a href="#">
                                                    <img class="img-circle" src="../assets/img/port5.jpg" /></a></span> <span class="thumb thumb-sm pull-right"><a href="#">
                                                        <img class="img-circle" src="../assets/img/port5.jpg" /></a></span> <span class="thumb thumb-sm pull-right"><a href="#">
                                                            <img class="img-circle" src="../assets/img/port5.jpg" /></a></span>
                                            </div>
                                            <ul class="post-comments mt-sm">
                                                <li><span class="thumb-xs avatar pull-left mr-sm">
                                                    <img class="img-circle" src="../assets/img/port5.jpg" alt="..." /></span><div class="comment-body">
                                                        <h6 class="author fw-semi-bold">Ignacio Abad <small>6 mins ago</small></h6>
                                                        <p>Hey, have you heard anything about that?</p>
                                                    </div>
                                                </li>
                                                <li><span class="thumb-xs avatar pull-left mr-sm">
                                                    <img class="img-circle" src="../assets/img/port5.jpg" alt="..." /></span><div class="comment-body">
                                                        <input class="form-control input-sm" type="text" placeholder="Write your comment..." />
                                                    </div>
                                                </li>
                                            </ul>
                                        </footer>
                                    </section>
                                </div>
                            </div>
                            <div class="panel-footer">Panel footer</div>
                        </div>
                        <%
                                break;
                            default:%>
                        <div class="panel panel-info">
                            <div class="panel-body">
                                <div class="well well-lg">
                                    <section class="event">
                                        <span class="thumb-sm avatar pull-left mr-sm">
                                            <img class="img-circle" src="<%=KiddieDetails.CarekiddiePhotoPath %>" alt="..." /></span>
                                        <h4 class="event-heading"><a href="#"><%=KiddieDetails.CarekiddieFirstName +" "+ KiddieDetails.CarekiddieLastName%></a> <small>@jess</small></h4>
                                        <p class="fs-sm text-muted"><%=KiddieDetails.Activities[x].KiddiesActivityDateUpdated %></p>
                                        <img class="img-responsive" src="<%=KiddieDetails.Activities[x].KiddiesActivityImagePath %>" />
                                        <p class="fs-mini"><%=KiddieDetails.Activities[x].KiddiesActivityNotes %></p>
                                        <footer>
                                            <div class="clearfix">
                                                <ul class="post-links mt-sm pull-left">
                                                    <li><a href="#">1 hour</a></li>
                                                    <li><a href="#"><span class="text-danger"><i class="fa fa-heart-o"></i>Like</span></a></li>
                                                    <li><a href="#">Comment</a></li>
                                                </ul>
                                                <span class="thumb thumb-sm pull-right"><a href="#">
                                                    <img class="img-circle" src="../assets/img/port5.jpg" /></a></span> <span class="thumb thumb-sm pull-right"><a href="#">
                                                        <img class="img-circle" src="../assets/img/port5.jpg" /></a></span> <span class="thumb thumb-sm pull-right"><a href="#">
                                                            <img class="img-circle" src="../assets/img/port5.jpg" /></a></span>
                                            </div>
                                            <ul class="post-comments mt-sm">
                                                <li><span class="thumb-xs avatar pull-left mr-sm">
                                                    <img class="img-circle" src="../assets/img/port5.jpg" alt="..." /></span><div class="comment-body">
                                                        <h6 class="author fw-semi-bold">Ignacio Abad <small>6 mins ago</small></h6>
                                                        <p>Hey, have you heard anything about that?</p>
                                                    </div>
                                                </li>
                                                <li><span class="thumb-xs avatar pull-left mr-sm">
                                                    <img class="img-circle" src="../assets/img/port5.jpg" alt="..." /></span><div class="comment-body">
                                                        <input class="form-control input-sm" type="text" placeholder="Write your comment..." />
                                                    </div>
                                                </li>
                                            </ul>
                                        </footer>
                                    </section>
                                </div>
                            </div>
                            <div class="panel-footer">Panel footer</div>
                        </div>
                        <%
                                    break;

                                }
                            }%>
                        <!--  end  Context Classes  -->
                    </div>
                    <div class="col-md-6">
                        <section class="widget">
                            <div class="widget-body">
                                <div class="widget-top-overflow text-white">
                                    <div class="height-250 overflow-hidden">
                                        <img class="img-responsive" src="../assets/img/contact.jpg" />
                                    </div>
                                    <div class="btn-toolbar"><a href="#" class="btn btn-outline btn-sm pull-right"><i class="fa fa-twitter mr-xs"></i>Follow</a></div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-5 text-center">
                                        <div class="post-user post-user-profile">
                                            <span class="thumb-xlg">
                                                <img class="img-circle" src="../assets/img/sample.jpg" alt="..." /></span><h4 class="fw-normal"><%=WardDetails[Value].CarekiddieFirstName%> <span class="fw-semi-bold"><%=WardDetails[Value].CarekiddieLastName%>.</span></h4>
                                            <p>parent name: <%=WardDetails[Value].Parents.ParentFullName%></p>
                                            <a href="#" class="btn btn-danger btn-sm mt">&nbsp;Send <i class="fa fa-envelope ml-xs"></i>&nbsp;</a><ul class="contacts">
                                                <li><i class="fa fa-phone fa-fw mr-xs"></i><a href="#"><%=WardDetails[Value].Parents.ParentContactNo%></a></li>
                                                <li><i class="fa fa-envelope fa-fw mr-xs"></i><a href="#"><%=WardDetails[Value].Parents.ParentEmail%></a></li>
                                                <li><i class="fa fa-map-marker fa-fw mr-xs"></i><a href="#"><%=WardDetails[Value].Parents.Occupation%></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="col-sm-7">
                                        <div class="stats-row stats-row-profile mt text-right">
                                            <div class="stat-item">
                                                <p class="value">251</p>
                                                <h5 class="name">Posts</h5>
                                            </div>
                                            <div class="stat-item">
                                                <p class="value">9.38%</p>
                                                <h5 class="name">satisfactory rating</h5>
                                            </div>
                                            <div class="stat-item">
                                                <p class="value">842</p>
                                                <h5 class="name">Followers</h5>
                                            </div>
                                        </div>
                                        <%-- <p class="text-right mt-lg"><a href="#" class="label label-warning">UI/UX</a> <a href="#" class="label label-danger ml-xs">Web Design</a> <a href="#" class="label label-default ml-xs">Mobile Apps</a></p>
                                        <p class="lead mt-lg">My name is Adam Johns and here is my new Sing user profile page.</p>
                                        <p>I love reading people's summaries page especially those who are in the same industry as me. Sometimes it's much easier to find your concentration during the night.</p>--%>
                                    </div>
                                </div>
                            </div>
                        </section>
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
