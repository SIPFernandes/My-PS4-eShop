<!DOCTYPE html>
<html lang="pt">

<head>
	<title>DAW-Forum-Register</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width-device-width, initial-scale=1">
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
		form {
			padding-right: 3%; 
			padding-left: 3%;
		}
		.col-centered{
			float:none;
			margin:0 auto;
		}
		.active a {
			color: black !important;
  			background-color: white !important;
  			height: 55px;   			
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
					<li class="active">
						{$menu3}
					</li>
				</ul>
			</div>
		</div>
	</nav>
	<div class="conteiner">
		<div class="row">
			{foreach $messages as $message}
			<div class="conteiner-fluid" align="center" style="background-color: red; color: white">{$message}</div>
			{/foreach}
			<div class="col-md-6 col-centered">
			<h1 align="center">Register</h1>
			<form action="{$site_url}/eshop/register" method="post">
				<div class="form-group">
					<label for="name"> <h4>Name:</h4></label>
					<input type="name" class="form-control" name="name" size="255" placeholder="Enter name" value="{$name}">
				</div>
				<div class="form-group">
					<label for="email"><h4>Email:</h4></label>
					<input type="name" class="form-control" name="email" size="255" placeholder="Enter email" value="{$email}">
					<!--Validar email em php, mudar type="email" para type="name"-->
				</div>
				<div class="form-group">
					<label for="pwd"><h4>Password:</h4></label>
					<input type="password" class="form-control" name="password" placeholder="Enter password" size="255">
				</div>
				<div class="form-group">
					<label for="pwd"><h4>Password confirmation:</h4></label>
					<input type="password" class="form-control" name="password_confirm" placeholder="Password confirmation" size="255">
				</div>
				<div class="checkbox" align="center">
					<label><input type="checkbox">Receive post updates in your mail box!</label>
				</div>
				<div align="center">
					<input type="submit" name="submit" class="btn btn-primary" value="Register">
					<input type="reset" name="reset" class="btn btn-danger" value="Reset">
				</div>
			</form>
			</div>
		</div>
		<br>
	</div>
	<div class="footer" align="center" style="padding-top: 5%">     
		<p>&copy; 2018 All rights reserved | Design by Samuel Fernandes | contacto: a41674@ualg.pt</p>
	</div>	
</body>
</html>