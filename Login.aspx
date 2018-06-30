<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="RestorantOtomasyonu.Admin.Login.Login1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Yönetim Girişi</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="UTF-8">
    <meta name="keywords" content="Restorant Sistemi" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
    function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!-- Meta tag Keywords -->
    <link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
    <link href="../../Content/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="css/font-awesome.css" type="text/css" media="all" />

    <script>
        function ysYonlendir(ID, adres, saniye) {
          if (saniye == 0) {
            window.location.href = adres;
            return;
          }
          document.getElementById(ID).innerHTML = "<br>" + saniye + " saniye sonra yönlendiriliyorsunuz.";
          saniye--;
          setTimeout(function() {
            ysYonlendir(ID, adres, saniye);
          }, 1000);
        }
    </script>
    <link rel="stylesheet" href="css/normalize.css">
	<link rel="stylesheet" href="css/main.css">
	<script src="js/vendor/modernizr-2.6.2.min.js"></script>
	<style type="text/css">
	.back-link a {
		color: #4ca340;
		text-decoration: none; 
		border-bottom: 1px #4ca340 solid;
	}
	.back-link a:hover,
	.back-link a:focus {
		color: #408536; 
		text-decoration: none;
		border-bottom: 1px #408536 solid;
	}
	h1 {
		height: 100%;
		/* The html and body elements cannot have any padding or margin. */
		margin: 0;
		font-size: 14px;
		font-family: 'Open Sans', sans-serif;
		font-size: 32px;
		margin-bottom: 3px;
	}
	.entry-header {
		text-align: left;
		margin: 0 auto 50px auto;
		width: 80%;
        max-width: 978px;
		position: relative;
		z-index: 10001;
	}
	#demo-content {
		padding-top: 100px;
	}

    #bgOpa{
        opacity: 0.5;
        filter: alpha(opacity=50);
        height:100%;
        width:100%;
        position:absolute;
        background-color:gray;
        z-index:8;
        }
	</style>
</head>
<body style="background-image: url('Images/BackgroundImages.jpg')">
    <form id="form1" runat="server">
       

        <asp:Literal ID="ltrBgOpa" runat="server"></asp:Literal>

        <section class="login-maintop">
            <div class="login-main">
                <header>
                    <h1></h1>
                </header>
                <div class="login-form">
                    <h2>Oturum Açın</h2>
                    <%--<form action="#" method="get"   >--%>
                        <span><i class="fa fa-user-o" aria-hidden="true"></i></span>
                         <asp:TextBox ID="txtUserName" name="username" placeholder="Kullanıcı Adı"  required="" runat="server"></asp:TextBox>
                        <span><i class="fa fa-unlock-alt" aria-hidden="true"></i></span>
                        <asp:TextBox ID="txtPassword" name="password" placeholder="Parola" required="" runat="server" TextMode="Password"></asp:TextBox>
                    
                    <div style="clear:both;"></div>
                    
                    <div>
                        <asp:Literal ID="ltrMessage" runat="server"></asp:Literal>
                    </div>

                    <br />

                   
                  <div id="loader-wrapper" style="visibility:hidden;z-index:9">
			        <div id="loader"></div>
		          </div>

                    <div style="clear:both;"></div>
                    <asp:Button ID="BtnGonder" runat="server" Text="Oturum Aç" Width="250px" Height="70px" OnClick="BtnGonder_Click"/>
                    <%--</form>--%>
                    <div class="login-password">
                        <span><a href="#">Şifremi Unuttum</a></span>
                    </div>
                    <div class="login-input">
                    </div>
                    <div class="social-icons">
                        <ul>
                            <li><a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                            <li><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                            <li><a href="#"><i class="fa fa-google-plus" aria-hidden="true"></i></a></li>
                        </ul>

                    </div>
                        <div class="footer">
                    <p>&copy; All rights reserved | Design by Aykut Gürsel</p>
                </div>
                </div>
                <!--footer-->
            
                <!--//footer-->
            </div>
        </section>
        <script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
	<script>window.jQuery || document.write('<script src="js/vendor/jquery-1.9.1.min.js"><\/script>')</script>
	<script src="js/main.js"></script>
    </form>
</body>
</html>
