<!DOCTYPE html>
<html lang="pt">

<head>
	<title>PS4Games-shop</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width-device-width, initial-scale=1">
	<!-- Redirect to Home 5 secs-->
	<meta http-equiv="refresh" content="5;{$site_url}/eshop" />
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet"href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<!--Variavel global base_url() com php-->
	<link rel = "stylesheet" type = "text/css" 
         href = "{$base_url}css/style.css"> 
    <script type = 'text/javascript' src = "{$base_url}js/sample.js"></script>  
	<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<!-- Latest compiled JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<style>
		.carousel-inner > .item > img,
		.carousel-inner > .item > a > img {
			width: 40%;
			margin: auto;
		}
		.active a {

  			background-color: #D2691E !important;

		}
	</style>
</head>
<body>
	<nav class="navbar navbar-inverse" style="background-color: #191970; border-color: white;">
		<div class="conteiner-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#mainNavBar">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<img class="navbar-brand" src="{$base_url}images/ps4logo.png" width="60" height="55"></img>
				<a style="color: white" class="navbar-brand"> PS4Games-shop</a>
			</div>
			<div class="collapse navbar-collapse" id="mainNavBar">
				<ul class="nav navbar-nav">
					<li>{$menu1}</li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li>
						{$menu4}
					</li>
					<li>
						<a href="{$site_url}/eshop/checkout">
							€{$cart.total}
							({$cart.items} items)
							<img src="{$base_url}/images/shopCartW.png" width="25" height="25"></img>
						</a>
					</li>
					<li>
						<a href="{$site_url}/eshop/CartItemInsert/reset" style="font-size: 90%">(Empty cart)
							<span class="glyphicon glyphicon-trash"></span>
						</a>
					</li>
					<li>
						{$menu2}
					</li>
					<li>
						{$menu3}
					</li>
				</ul>
			</div>
		</div>
	</nav>
	<br>
	<div class="conteiner" align="center">
		<div class="conteiner-fluid" align="center" style="background-color: {$cor}; color: white;"><h2>{$message}</h2>
		</div>
		<div align="center" style="padding-top: 5%">
			<a href="{$site_url}/eshop">
				<button class="btn btn-default" style="width: 5%">Ok</button>
			</a>
		</div>
	</div>
	<div class="footer" align="center" style="padding-top: 5%">     
		<p>&copy; 2018 All rights reserved | Design by Samuel Fernandes | contacto: a41674@ualg.pt</p>
	</div>	
</body>
</html>