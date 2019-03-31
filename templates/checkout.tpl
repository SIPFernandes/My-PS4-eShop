<!DOCTYPE html>
<html lang="pt">

<head>
	<title>PS4Games-shop</title>
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
		.active a {
			color: black !important;
  			background-color: white !important;
  			height: 55px;  		
		}
		#empty a {
			background-color: white !important;
  			height: 55px;	
		}
		#empty a:hover {
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
					<li class="active">
						<a href="{$site_url}/eshop/checkout">
							€{$cart.total}
							({$cart.items} items)
							<img src="{$base_url}/images/shopCartB.png" width="25" height="25"></img>
						</a>
					</li>
					<li id="empty">
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
	<div class="container-fluid">
		<div class="row" style="padding-top: 2%; padding-left: 5%; padding-right: 5%">
			<h2>My Shopping Cart</h2>
			<hr style="border-width: 2px; border-color: black">
			 {if $cartitems != null}
			 <table class="table table-hover">
			    <thead>
			    	<tr>
			        	<th>Name</th>
			        	<th>Code</th>
			        	<th>Price</th>
			        	<th></th>
			        	<th>Qty</th>
			        	<th></th>
			        	<th>SubTotal</th>
			        	<th></th>
			      	</tr>
			    </thead>
			    <tbody>
				    {foreach $cartitems as $cartitem}
				    <tr>
					    <form action="{$site_url}/eshop/CartItemInsert" method="post">
					   		<input type="hidden" name="id" value="{$cartitem.id}">
					   		<td>{$cartitem.name}</td>
					    	<td>{$cartitem.id}</td>
					    	<td>€{$cartitem.price}</td>
					    	<td>{if $cartitem.qty > 1}
						    	<button type="submit" name="minus" value="minus">-</button>
						    	{else}
						    	<button type="button" class="btn disabled">-</button>
						    	{/if}
						    </td>
							<td>{$cartitem.qty}</td>
						    <td>
						    	<button type="submit" name="plus" value="plus">+</button>
						    </td>
							<td>€{$cartitem.subtotal}</td>
							<td>
								<button type="submit" name="remove" value="remove">Remove</button>
							</td>
						</form>
					</tr>
					{/foreach}
			    </tbody>
			</table>
			{else}
				<h4>Your cart is empty</h4>
				<br>
			{/if}
			<hr style="border-width: 2px; border-color: black">
			<div align="right">
				<h3>Total: €{$cart['total']}</h3>
				{$button1}
				{$button2}
			</div>
		</div>
	</div>
	<div class="footer" align="center" style="padding-top: 5%">     
		<p>&copy; 2018 All rights reserved | Design by Samuel Fernandes | contacto: a41674@ualg.pt</p>
	</div>
</body>
</html>