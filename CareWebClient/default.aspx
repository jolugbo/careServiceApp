﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="CareWebClient.Index" %>

<!DOCTYPE HTML>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title>Care Site</title>
<link href='http://fonts.googleapis.com/css?family=Roboto:400,100,300,500,700,900' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Arvo:400,700' rel='stylesheet' type='text/css'>
<link href="assets/css/style2.css" rel="stylesheet" type="text/css" media="all" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<!--  jquery plguin -->
	<script type="text/javascript" src="assets/js/jquery.min.js"></script>
	<!---strat-slider---->
	    <link rel="stylesheet" type="text/css" href="assets/css/slider.css" />
		<script type="text/javascript" src="assets/js/modernizr.custom.28468.js"></script>
		<script type="text/javascript" src="assets/js/jquery.cslider.js"></script>
			<script type="text/javascript">
				$(function() {
				
					$('#da-slider').cslider({
						autoplay	: true,
						bgincrement	: 450
					});
				
				});
			</script>
		<!---//strat-slider---->
		<!-- scroll -->
		 <script type="text/javascript">
			$(document).ready(function() {
			
				var defaults = {
		  			containerID: 'toTop', // fading element id
					containerHoverID: 'toTopHover', // fading element hover id
					scrollSpeed: 1200,
					easingType: 'linear' 
		 		};
				
				
				$().UItoTop({ easingType: 'easeOutQuart' });
				
			});
		</script>
		 <!-- //scroll -->	
<!-- Add fancyBox light-box -->
		<link rel="stylesheet" type="text/css" href="assets/css/magnific-popup1.css"/>
		<script src="assets/js/jquery.magnific-popup.js" type="text/javascript"></script>
				<script>
					$(document).ready(function() {
						$('.popup-with-zoom-anim').magnificPopup({
							type: 'inline',
							fixedContentPos: false,
							fixedBgPos: true,
							overflowY: 'auto',
							closeBtnInside: true,
							preloader: false,
							midClick: true,
							removalDelay: 300,
							mainClass: 'my-mfp-zoom-in'
					});
				});
		</script>
		<!-- //End fancyBox light-box -->
	<script type="text/javascript" src="assets/js/jquery.lightbox.js"></script>
	<link rel="stylesheet" type="text/css" href="assets/css/lightbox.css" media="screen" />
  	<script type="text/javascript">
    $(function() {
        $('#portfoliolist a').lightBox();
    });
   	</script>
  
</head>
    <body>
<div class="slider_bg">
<!-- start header -->
<div class="wrap">
	<div class="header">
		<div class="logo">
			<h1><a href="index.html"><img src="assets/img/logo.png" alt=""/></a></h1>
		</div>
		<div class="h_right">
			<ul class="menu">		
				<li class="active"><a  href="#home">HOME</a></li>
				<li><a href="#studio" class="scroll">STUDIO</a></li>
				<li><a href="#about" class="scroll">ABOUT ME</a></li>
				<li><a href="#blog" class="scroll">BLOG</a></li>
				<li><a href="#works" class="scroll">Works</a></li>
				<li class="last"><a href="#contact"  class="scroll">Contact</a></li>
				<li ><a href="login.aspx"  class="">Login</a></li>
				<li ><a href="signup.aspx"  class="">Sign Up</a></li>
			</ul>
			<!-- start smart_nav * -->
	        <nav class="nav">
	            <ul class="nav-list">
	                <li class="nav-item"><a  href="#home">Home</a></li>
	                <li class="nav-item"><a href="#studio" class="scroll">Stusio</a></li>
	                <li class="nav-item"><a href="#about" class="scroll">About Me</a></li>
	                <li class="nav-item"><a href="#blog" class="scroll">Blog</a></li>
	                <li class="nav-item"><a href="#works" class="scroll">Works</a></li>
	                <li class="nav-item"><a href="#contact"  class="scroll">Contact</a></li>
				<li ><a href="login.aspx"  class="">Login</a></li>
				<li ><a href="signup.aspx"  class="">Sign Up</a></li>
	                <div class="clear"></div>
	            </ul>
	        </nav>
	        <script type="text/javascript" src="assets/js/responsive.menu.js"></script>
			<!-- end smart_nav * -->
		</div>
		<div class="clear"></div>
	</div>
</div>
				<!---start-da-slider----->
			<div id="da-slider" class="da-slider" style="background-position: 6300% 0%;">
				<div class="da-slide da-slide-toleft">
					<div class="left">
						<img src="assets/img/phone.png" alt=""/>
					</div>
					<div class="right">			
					    <h2>Flat & Modern trasparent</h2>
					    <p>flat inspired UI with some modern transparent Element</p>
					 
					    	<label><input type="radio" name="radio" value="radio">16 PSD Files Easy to Edit</label>
					    	<label1><input type="radio" name="radio" value="radio">All Font used Link included</label1>
					    
					    <h3>Get Now Your Copy Just for <span>7$</span></h3>
					</div>
				</div>
				<div class="da-slide da-slide-toleft">
					<div class="left">
						<img src="assets/img/phone.png" alt=""/>
					</div>
					<div class="right">			
					    <h2>Flat & Modern trasparent</h2>
					    <p>flat inspired UI with some modern transparent Element</p>
					 
					    	<label><input type="radio" name="radio" value="radio">16 PSD Files Easy to Edit</label>
					    	<label1><input type="radio" name="radio" value="radio">All Font used Link included</label1>
					    
					    <h3>Get Now Your Copy Just for <span>7$</span></h3>
					</div>

				</div>	
				<div class="da-slide da-slide-toleft">
					<div class="left">
						<img src="assets/img/phone.png" alt=""/>
					</div>
					<div class="right">			
					    <h2>Flat & Modern trasparent</h2>
					    <p>flat inspired UI with some modern transparent Element</p>
					 
					    	<label><input type="radio" name="radio" value="radio">16 PSD Files Easy to Edit</label>
					    	<label1><input type="radio" name="radio" value="radio">All Font used Link included</label1>
					   
					    <h3>Get Now Your Copy Just for <span>7$</span></h3>
					</div>

				</div>	
				<div class="da-slide da-slide-toleft">
					<div class="left">
						<img src="assets/img/phone.png" alt=""/>
					</div>
					<div class="right">			
					    <h2>Flat & Modern trasparent</h2>
					    <p>flat inspired UI with some modern transparent Element</p>
					 
					    	<label><input type="radio" name="radio" value="radio">16 PSD Files Easy to Edit</label>
					    	<label1><input type="radio" name="radio" value="radio">All Font used Link included</label1>
					    
					    <h3>Get Now Your Copy Just for <span>7$</span></h3>
					</div>

				</div>					
				<nav class="da-arrows">
					<span class="da-arrows-prev"></span>
					<span class="da-arrows-next"></span>
				</nav>
			<nav class="da-dots"></nav></div>
 			<!---//End-da-slider----->
 		</div>
 <!---start-studio----->
<div class="studio" id="studio">
	<div class="wrap">
		<div class="para">
			<div class="img">
				<img src="assets/img/studio.png" alt=""/>
			</div>
			<div class="text">
				<h3>Web & Mobile Landing Page</h3>
				<h6><a href="#">Simple & Elegent User Interface</a></h6>
				<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>
			    <p><a href="#">Read More</a></p>
			</div>
			<div class="clear"></div>
		</div>
		<div class="para">
			<div class="img">
				<h3>Video Promotional on vimeo</h3>
				<h6><a href="#">Simple & Elegent User Interface</a></h6>
				<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>
			    <p><a href="#">More details</a></p>				
			</div>
			<div class="text">
				<iframe src="//player.vimeo.com/video/81512787" width="100%" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
			</div>
			<div class="clear"></div>
		</div>
	</div>
	<div class="clear"></div>
</div>
<!---start-about----->
<div class="about" id="about">
	<div class="wrap">
         <img src="assets/img/quote.png" alt=""/>
         <p>"Lorem Ipsum is that it has a more-or-less normal distribution of letters."</p>
     <div class="about-bottom">
	     <div class="about-bottom-img">
	     	<img src="assets/img/about.png" alt=""/>
	     </div>
	     <div class="about-bottom-text">
	     	<h4><a href="#">Distribution Letters</a></h4>
	     	<p>Professional Designer</p>
	     </div>
	     <div class="clear"></div>
     </div>
	</div>
</div>
<!---start-blog----->
<div class="blog" id="blog">
	<div class="wrap">
	 <div class="blog-left">
	 	<h4>Flat & Modern Transparent</h4>
        <p>Lorem Ipsum is that it has a more-or-less normal distribution of letter as opposed to using 'Content here making it look</p>
        <p class="a">Lorem Ipsum is that it has a more-or-less normal distribution of letters as opposed to using 'Content here content here', making it look like readable English.</p>
        <ul>
        	<li><img src="assets/img/tick.png" alt=""/><a href="#">16 Psd Files Easy to Edit</a></li>
        	<li><img src="assets/img/tick.png" alt=""/><a href="#">All Fonts used Link includ</a></li>
        	<li><img src="assets/img/tick.png" alt=""/><a href="#">16 Psd Files Easy to Edit</a></li>
        	<li><img src="assets/img/tick.png" alt=""/><a href="#">All Fonts used Link includ</a></li>
        </ul>
        <h3>Get Now Your <label>Copy</label> Just for <span>7$</span></h3>
        <p><a href="#">Download Now</a></p>
     </div>    
     <div class="blog-right">
	     <img src="assets/img/blog.png" alt=""/>
     </div>
      <div class="clear"></div>
	</div>
</div>
<div class="clients">
	<h4>Our Clients</h4>
	<p>Content here making</p>
<!---strat-image-cursuals---->
                  <div class="t-clients">
                  	<div class="wrap"> 											 
							<div class="nbs-flexisel-container"><div class="nbs-flexisel-inner"><ul class="flexiselDemo3 nbs-flexisel-ul" style="left: -253.6px; display: block;">					    					    					       
							<li onclick="location.href='#';" class="nbs-flexisel-item" style="width: 253.6px;"><img src="assets/img/c3.png"/></li><li onclick="location.href='#';" class="nbs-flexisel-item" style="width: 253.6px;"><img src="assets/img/c4.png"/></li><li onclick="location.href='#';" class="nbs-flexisel-item" style="width: 253.6px;"><img src="assets/img/c1.png"/></li><li onclick="location.href='#';" class="nbs-flexisel-item" style="width: 253.6px;"><img src="assets/img/c2.png"/></li><li onclick="location.href='#';" class="nbs-flexisel-item" style="width: 253.6px;"><img src="assets/img/c3.png"/></li><li onclick="location.href='#';" class="nbs-flexisel-item" style="width: 253.6px;"><img src="assets/img/c4.png"/></li><li onclick="location.href='#';" class="nbs-flexisel-item" style="width: 253.6px;"><img src="assets/img/c1.png"/></li><li onclick="location.href='#';" class="nbs-flexisel-item" style="width: 253.6px;"><img src="assets/img/c2.png"/></li></ul><div class="nbs-flexisel-nav-left" style="top: 21.5px;"></div><div class="nbs-flexisel-nav-right" style="top: 21.5px;"></div></div></div> 
							<div class="clear"> </div>      
						  <!---strat-image-cursuals---->
								<script type="text/javascript" src="assets/js/jquery.flexisel.js"></script>
								<!---End-image-cursuals---->
								<script type="text/javascript">
								$(window).load(function() {
								    $(".flexiselDemo3").flexisel({
								        visibleItems: 5,
								        animationSpeed: 1000,
								        autoPlay: true,
								        autoPlaySpeed: 3000,            
								        pauseOnHover: true,
								        enableResponsiveBreakpoints: true,
								        responsiveBreakpoints: { 
								            portrait: { 
								                changePoint:480,
								                visibleItems: 1
								            }, 
								            landscape: { 
								                changePoint:640,
								                visibleItems: 2
								            },
								            tablet: { 
								                changePoint:768,
								                visibleItems: 3
								            }
								        }
								    });
								});
								</script>
						<!---->
				  <!---->
				  </div>				
			</div>
</div>
<!-----------start-pricing----------->
<div class="pricing-plans" id="pricing">
					<div class="wrap">
						<h3>Pricing Table</h3>
						<p>Choose From Our Amazing Plans</p>
						<div class="pricing-grids">
						<div class="pricing-grid">							
							<div class="price-value">
								<a href="#">Wesite hosting</a>
							</div>
							<h3><a href="#">$5.01/month</a></h3>
							<ul>
								<li><a href="#">Lorem ipsum</a></li>
								<li><a href="#">Dolor sitamet, Consect</a></li>
								<li><a href="#">Adipiscing elit</a></li>
								<li><a href="#">Proin commodo turips</a></li>
								<li><a href="#">Laws pulvinarvel</a></li>
								<li><a href="#">Prnare nisi pretium</a></li>
							</ul>
							<div class="cart">
								<div class="span3"><a class="popup-with-zoom-anim" href="#small-dialog"><i>Purchase</i></a>
							</div>	
							</div>
						</div>
						<div class="pricing-grid">
							<div class="price-value">
								<a href="#">Reseller cloud</a>
							</div>
							<h3><a href="#">$10.01/month</a></h3>
							<ul>
								<li><a href="#">Lorem ipsum</a></li>
								<li><a href="#">Dolor sitamet, Consect</a></li>
								<li><a href="#">Adipiscing elit</a></li>
								<li><a href="#">Proin commodo turips</a></li>
								<li><a href="#">Laws pulvinarvel</a></li>
								<li><a href="#">Prnare nisi pretium</a></li>
							</ul>
							<div class="cart">
								<div class="span3"><a class="popup-with-zoom-anim" href="#small-dialog"><i>Purchase</i></a>
							</div>	
							</div>
						</div>
						<div class="pricing-grid">							
							<div class="price-value">
								<a href="#">Dedicated hosting</a>
							</div>
							<h3><a href="#">$20.01/month</a></h3>
							<ul>
								<li><a href="#">Lorem ipsum</a></li>
								<li><a href="#">Dolor sitamet, Consect</a></li>
								<li><a href="#">Adipiscing elit</a></li>
								<li><a href="#">Proin commodo turips</a></li>
								<li><a href="#">Laws pulvinarvel</a></li>
								<li><a href="#">Prnare nisi pretium</a></li>
							</ul>
							<div class="cart">
								<div class="span3"><a class="popup-with-zoom-anim" href="#small-dialog"><i>Purchase</i></a>
							</div>	
							</div>
						</div>
							<div class="clear"> </div>																												
							<!-----pop-up-grid---->
								 <div id="small-dialog" class="mfp-hide">
									<div class="pop_up">
									 	<div class="payment-online-form-left">
											<form>
												<h4><span class="shipping"> </span>Shipping</h4>
												<ul>
													<li><input class="text-box-dark" type="text" value="Frist Name" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Frist Name';}"></li>
													<li><input class="text-box-dark" type="text" value="Last Name" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Last Name';}"></li>
												</ul>
												<ul>
													<li><input class="text-box-dark" type="text" value="Email" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Email';}"></li>
													<li><input class="text-box-dark" type="text" value="Company Name" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Company Name';}"></li>
												</ul>
												<ul>
													<li><input class="text-box-dark" type="text" value="Phone" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Phone';}"></li>
													<li><input class="text-box-dark" type="text" value="Address" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Address';}"></li>
													<div class="clear"> </div>
												</ul>
												<div class="clear"> </div>
											<ul class="payment-type">
												<h4><span class="payment"> </span> Payments</h4>
												<li><span class="col_checkbox">
													<input id="3" class="css-checkbox1" type="checkbox">
													<label for="3" name="demo_lbl_1" class="css-label1"> </label>
													<a class="visa" href="#"> </a>
													</span>
													
												</li>
												<li>
													<span class="col_checkbox">
														<input id="4" class="css-checkbox2" type="checkbox">
														<label for="4" name="demo_lbl_2" class="css-label2"> </label>
														<a class="paypal" href="#"> </a>
													</span>
												</li>
												<div class="clear"> </div>
											</ul>
												<ul>
													<li><input class="text-box-dark" type="text" value="Card Number" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Card Number';}"></li>
													<li><input class="text-box-dark" type="text" value="Name on card" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Name on card';}"></li>
													<div class="clear"> </div>
												</ul>
												<ul>
													<li><input class="text-box-light hasDatepicker" type="text" id="datepicker" value="Expiration Date" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Expiration Date';}"><em class="pay-date"> </em></li>
													<li><input class="text-box-dark" type="text" value="Security Code" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Security Code';}"></li>
													<div class="clear"> </div>
												</ul>
												<ul class="payment-sendbtns">
													<li><input type="reset" value="Cancel"></li>
													<li><input type="submit" value="Process order"></li>
												</ul>
												<div class="clear"> </div>
											</form>
										</div>
						  			</div>
								</div>
								<!-----pop-up-grid---->
							</div>
						<div class="clear"> </div>
			</div>
</div>
<!-- portfolio -->
 <div class="portfolio" id="works">
		  	<div class="wrap">
		  		<h3>Our Works</h3>
<!----start-img-slider---->
		<div class="img-slider">
			<!-- start slider -->
		    <div id="fwslider">
		        <div class="slider_container">
		            <div class="slide"> 	           		              
		                <div class="slide_content">
		                    <div class="slide_content_wrap">
					            <div id="portfoliolist">		
									<div class="col_1_of_3 img_1_of_3">
											  <div class="view view-fourth">
						                        <img src="assets/img/port1.jpg"/>                   
							                        <div class="mask">	
							                      		<div class="border">                   
									                        <h2>Modern Transparent</h2>
									                        <p class="a">opposed to using Content</p>		                       
															<a href="assets/img/port1.jpg #small-dialog1" class="flipLightBox popup-with-zoom-anim"><img src="assets/img/link.png" alt="Image 5" style="top: 0px;"/> </a>										
														</div>                                                
							                    	</div>		                    	              	                       
						                	</div>		
										</div>
										<div class="col_1_of_3 img_1_of_3">
											 <div class="view view-fourth">
						                        <img src="assets/img/port2.jpg"/>
							                        <div class="mask">	
							                      		<div class="border">                   
									                        <h2>Modern Transparent</h2>
									                        <p class="a">opposed to using Content</p>		                       
															<a href="assets/img/port2.jpg #small-dialog1" class="flipLightBox popup-with-zoom-anim"><img src="assets/img/link.png" alt="Image 5" style="top: 0px;"/> </a>										
														</div>                                                 
							                    	</div>		
						                	</div>				
										</div>
										<div class="col_1_of_3 img_1_of_3 last-grid">
											 <div class="view view-fourth">
						                        <img src="assets/img/port3.jpg"/>
							                      	<div class="mask">	
							                      		<div class="border">                   
									                        <h2>Modern Transparent</h2>
									                        <p class="a">opposed to using Content</p>		                       
															<a href="assets/img/port3.jpg #small-dialog1" class="flipLightBox popup-with-zoom-anim"><img src="assets/img/link.png" alt="Image 5" style="top: 0px;"/> </a>										
														</div>                                               
							                    	</div>		
						                	</div>			
										</div>
									  <div class="col_1_of_3 img_1_of_3">
											 <div class="view view-fourth">
						                        <img src="assets/img/port4.jpg"/>
							                      	<div class="mask">	
							                      		<div class="border">                   
									                        <h2>Modern Transparent</h2>
									                        <p class="a">opposed to using Content</p>		                       
															<a href="assets/img/port4.jpg #small-dialog1" class="flipLightBox popup-with-zoom-anim"><img src="assets/img/link.png" alt="Image 5" style="top: 0px;"/> </a>										
														</div>                                                 
							                    	</div>	
						                	</div>				
										</div>
										<div class="col_1_of_3 img_1_of_3">
											  <div class="view view-fourth">
						                        <img src="assets/img/port5.jpg"/>
							                      	<div class="mask">	
							                      		<div class="border">                   
									                        <h2>Modern Transparent</h2>
									                        <p class="a">opposed to using Content</p>		                       
															<a href="assets/img/port5.jpg #small-dialog1" class="flipLightBox popup-with-zoom-anim"><img src="assets/img/link.png" alt="Image 5" style="top: 0px;"/> </a>										
														</div>                                                
							                    	</div>	
						                	</div>				
										</div>
										<div class="col_1_of_3 img_1_of_3 last-grid">
											 <div class="view view-fourth">
						                        <img src="assets/img/port9.jpg"/>
								                     <div class="mask">	
							                      		<div class="border">                   
									                        <h2>Modern Transparent</h2>
									                        <p class="a">opposed to using Content</p>		                       
															<a href="assets/img/port9.jpg #small-dialog1" class="flipLightBox popup-with-zoom-anim"><img src="assets/img/link.png" alt="Image 5" style="top: 0px;"/> </a>										
														</div>                                                 
							                    	</div>	 
						                	</div>				
										</div>
										<div class="col_1_of_3 img_1_of_3">
											 <div class="view view-fourth">
						                        <img src="assets/img/port7.jpg"/>
							                     	 <div class="mask">	
							                      		<div class="border">                   
									                        <h2>Modern Transparent</h2>
									                        <p class="a">opposed to using Content</p>		                       
															<a href="assets/img/port7.jpg #small-dialog1" class="flipLightBox popup-with-zoom-anim"><img src="assets/img/link.png" alt="Image 5" style="top: 0px;"/> </a>										
														</div>                                              
							                    	</div>		
						                	</div>				
										</div>
										<div class="col_1_of_3 img_1_of_3">
											  <div class="view view-fourth">
						                        <img src="assets/img/port8.jpg"/>
						                       	   <div class="mask">	
							                      		<div class="border">                   
									                        <h2>Modern Transparent</h2>
									                        <p class="a">opposed to using Content</p>		                       
															<a href="assets/img/port8.jpg #small-dialog1" class="flipLightBox popup-with-zoom-anim"><img src="assets/img/link.png" alt="Image 5" style="top: 0px;"/> </a>											
														</div>
													</div>
						                	</div>				
										</div>
										<div class="col_1_of_3 img_1_of_3 last-grid">
											  <div class="view view-fourth">								  
						                        	<img src="assets/img/port9.jpg"/>                    
							                      	<div class="mask">	
							                      		<div class="border">                   
									                        <h2>Modern Transparent</h2>
									                        <p class="a">opposed to using Content</p>		                       
															<a href="assets/img/port9.jpg #small-dialog1" class="flipLightBox popup-with-zoom-anim"><img src="assets/img/link.png" alt="Image 5" style="top: 0px;"/> </a>											
														</div>
													</div>
												</div>	 			                      
								        </div>	                                               	                    
									<div class="clear"></div>								  						
								</div>   		 
		                    </div>		                  	
		                </div>
		                 <!-- /Texts container -->
		            </div>
		            <!-- /Duplicate to create more slides -->
		            <div class="slide">		              
		                <div class="slide_content">
		                     <div class="slide_content_wrap">
					             <div id="portfoliolist">		
									<div class="col_1_of_3 img_1_of_3">
											  <div class="view view-fourth">
						                        <img src="assets/img/port9.jpg"/>                   
							                        <div class="mask">	
							                      		<div class="border">                   
									                        <h2>Modern Transparent</h2>
									                        <p class="a">opposed to using Content</p>		                       
															<a href="assets/img/port9.jpg #small-dialog1" class="flipLightBox popup-with-zoom-anim"><img src="assets/img/link.png" alt="Image 5" style="top: 0px;"/> </a>										
														</div>                                                
							                    	</div>		                    	              	                       
						                	</div>		
										</div>
										<div class="col_1_of_3 img_1_of_3">
											 <div class="view view-fourth">
						                        <img src="assets/img/port8.jpg"/>
							                        <div class="mask">	
							                      		<div class="border">                   
									                        <h2>Modern Transparent</h2>
									                        <p class="a">opposed to using Content</p>		                       
															<a href="assets/img/port8.jpg #small-dialog1" class="flipLightBox popup-with-zoom-anim"><img src="assets/img/link.png" alt="Image 5" style="top: 0px;"/> </a>										
														</div>                                                 
							                    	</div>		
						                	</div>				
										</div>
										<div class="col_1_of_3 img_1_of_3 last-grid">
											 <div class="view view-fourth">
						                        <img src="assets/img/port7.jpg"/>
							                      	<div class="mask">	
							                      		<div class="border">                   
									                        <h2>Modern Transparent</h2>
									                        <p class="a">opposed to using Content</p>		                       
															<a href="assets/img/port7.jpg #small-dialog1" class="flipLightBox popup-with-zoom-anim"><img src="assets/img/link.png" alt="Image 5" style="top: 0px;"/> </a>										
														</div>                                               
							                    	</div>		
						                	</div>			
										</div>
									  <div class="col_1_of_3 img_1_of_3">
											 <div class="view view-fourth">
						                        <img src="assets/img/port9.jpg"/>
							                      	<div class="mask">	
							                      		<div class="border">                   
									                        <h2>Modern Transparent</h2>
									                        <p class="a">opposed to using Content</p>		                       
															<a href="assets/img/port9.jpg #small-dialog1" class="flipLightBox popup-with-zoom-anim"><img src="assets/img/link.png" alt="Image 5" style="top: 0px;"/> </a>										
														</div>                                                 
							                    	</div>	
						                	</div>				
										</div>
										<div class="col_1_of_3 img_1_of_3">
											  <div class="view view-fourth">
						                        <img src="assets/img/port5.jpg"/>
							                      	<div class="mask">	
							                      		<div class="border">                   
									                        <h2>Modern Transparent</h2>
									                        <p class="a">opposed to using Content</p>		                       
															<a href="assets/img/port5.jpg #small-dialog1" class="flipLightBox popup-with-zoom-anim"><img src="assets/img/link.png" alt="Image 5" style="top: 0px;"/> </a>										
														</div>                                                
							                    	</div>	
						                	</div>				
										</div>
										<div class="col_1_of_3 img_1_of_3 last-grid">
											 <div class="view view-fourth">
						                        <img src="assets/img/port4.jpg"/>
								                     <div class="mask">	
							                      		<div class="border">                   
									                        <h2>Modern Transparent</h2>
									                        <p class="a">opposed to using Content</p>		                       
															<a href="assets/img/port4.jpg #small-dialog1" class="flipLightBox popup-with-zoom-anim"><img src="assets/img/link.png" alt="Image 5" style="top: 0px;"/> </a>										
														</div>                                                 
							                    	</div>	 
						                	</div>				
										</div>
										<div class="col_1_of_3 img_1_of_3">
											 <div class="view view-fourth">
						                        <img src="assets/img/port3.jpg"/>
							                     	 <div class="mask">	
							                      		<div class="border">                   
									                        <h2>Modern Transparent</h2>
									                        <p class="a">opposed to using Content</p>		                       
															<a href="assets/img/port3.jpg #small-dialog1" class="flipLightBox popup-with-zoom-anim"><img src="assets/img/link.png" alt="Image 5" style="top: 0px;"/> </a>										
														</div>                                              
							                    	</div>		
						                	</div>				
										</div>
										<div class="col_1_of_3 img_1_of_3">
											  <div class="view view-fourth">
						                        <img src="assets/img/port2.jpg"/>
						                       	   <div class="mask">	
							                      		<div class="border">                   
									                        <h2>Modern Transparent</h2>
									                        <p class="a">opposed to using Content</p>		                       
															<a href="assets/img/port2.jpg #small-dialog1" class="flipLightBox popup-with-zoom-anim"><img src="assets/img/link.png" alt="Image 5" style="top: 0px;"/> </a>											
														</div>
													</div>
						                	</div>				
										</div>
										<div class="col_1_of_3 img_1_of_3 last-grid">
											  <div class="view view-fourth">								  
						                        	<img src="assets/img/port1.jpg"/>                    
							                      	<div class="mask">	
							                      		<div class="border">                   
									                        <h2>Modern Transparent</h2>
									                        <p class="a">opposed to using Content</p>		                       
															<a href="assets/img/port1.jpg #small-dialog1" class="flipLightBox popup-with-zoom-anim"><img src="assets/img/link.png" alt="Image 5" style="top: 0px;"/> </a>											
														</div>
													</div>
												</div>	 			                      
								        </div>	                                               	                    
									<div class="clear"></div>								  						
								</div>   		 
		                    </div>		                   
		                </div>
		            </div>
		            <!--/slide -->
		        </div>
		        <div class="timers"> </div>
		         <div class="slidePrev"><span> </span></div>
		        <div class="slideNext"><span> </span></div>

		    </div>
		    <!--/slider -->
		</div>
		<div class="clear"></div>
  </div>		
</div>
<div class="clear"></div>
<!--start slider -->
	    <link rel="stylesheet" href="assets/css/fwslider.css" media="all"/>
		<script src="assets/js/jquery-ui.min.js"></script>
		<script src="assets/js/fwslider.js"></script>
<!--end slider -->
			<!--start contact -->
			<div class="contact" id="contact">
			    <div class="wrap">      
			   <div class="flexslider">
			   	<div class="flex-viewport" style="overflow: hidden; position: relative;">
			   		<ul class="slides" style="width: 100%; -webkit-transition: 0.6s; transition: 0.6s; -webkit-transform: translate3d(-5032px, 0, 0);">
			   			<li class="clone" style="width: 100%; float: left; display: block;" height: 600px;>
			        		 <a href="#"><img src="assets/img/twitter.png"/></a>
							 <h6><a href="#"><img src="assets/img/logo.png"/></a><a href="#"><span>On Twitter @Uihero</span></a></h6>
							 <p>"Lorem Ipsum is that it has a more-or-less normal distribution of letters as opposed to using Content here."</p>
							 <p class="a">Lorem Ipsum is less normal </p>
			    		</li>
			       		<li style="width: 100%; float: left; display: block;" class="" height: 600px;>
			    	    	<a href="#"><img src="assets/img/twitter.png"/></a>
							 <h6><a href="#"><img src="assets/img/logo.png"/></a><a href="#"><span>On Twitter @Uihero</span></a></h6>
							 <p>"Lorem Ipsum is that it has a more-or-less normal distribution of letters as opposed to using Content here."</p>
							 <p class="a">Lorem Ipsum is less normal </p>
			    		</li>
			    		<li class="" style="width:100%; float: left; display: block;height: 600px;">
			    	    	<a href="#"><img src="assets/img/twitter.png"/></a>
							 <h6><a href="#"><img src="assets/img/logo.png"/></a><a href="#"><span>On Twitter @Uihero</span></a></h6>
							 <p>"Lorem Ipsum is that it has a more-or-less normal distribution of letters as opposed to using Content here."</p>
							 <p class="a">Lorem Ipsum is less normal </p>
			    		</li>
					</ul>
				</div>
			</div>
			<!-- flexy slider -->
<script defer src="assets/js/jquery.flexslider.js"></script>
<script type="text/javascript">
    $(window).load(function(){
      $('.flexslider').flexslider({
        animation: "slide",
        start: function(slider){
         
        }
      });
    });
</script>
	</div>
</div>
<div class="resume-top">	
 		<div class="wrap">					
 		     <h3>So What You Think?</h3>
 		     <p>"Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod tempor incididunt."</p>
             <h6><a href="index.html">Contact Me</a></h6>
        </div>     	
</div>
<div class="footer">
	<div class="wrap">
		<div class="copy-right">
			<p>©Copyright 2014 All Rights Reserved  Template <a href="http://w3layouts.com/">  w3layouts.com</a></p>	
		</div>	
		 <div class="social-icons-set">
								<ul>
									<li><a class="facebook" href="#"> </a></li>
									<li><a class="twitter" href="#"> </a></li>
									<li><a class="vimeo" href="#"> </a></li>
									<li><a class="rss" href="#"> </a></li>
									<li><a class="gplus" href="#"> </a></li>
									<li><a class="pin" href="#"> </a></li>
									<div class="clear"> </div>
								</ul>
							</div>
							<div class="clear"> </div>
	</div>
</div>
  <!-- scroll_top_btn -->
		<script type="text/javascript" src="assets/js/move-top.js"></script>
		<script type="text/javascript" src="assets/js/easing.js"></script>
		<script type="text/javascript">
		jQuery(document).ready(function($) {
			$(".scroll").click(function(event){		
				event.preventDefault();
				$('html,body').animate({scrollTop:$(this.hash).offset().top},1200);
			});
		});
	</script>
 
		 <a href="#" id="toTop" style="display: block;"><span id="toTopHover" style="opacity: 1;"></span></a>
</body>
</html>
