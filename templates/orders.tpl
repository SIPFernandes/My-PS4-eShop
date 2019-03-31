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

	{literal}
	<script>
		function myToggle(id) 
		{
			if(document.getElementById("b" + id).innerHTML == "Show")
			{
				document.getElementById("d" + id).style.display ="block";
				document.getElementById("b" + id).innerHTML = "Hide";
				var xhttp = new XMLHttpRequest();
	  			xhttp.onreadystatechange = function() {
	    			if (this.readyState == 4 && this.status == 200) 
	    			{
	      				document.getElementById("d" + id).innerHTML = this.responseText;
	    			}
	  			};
	  			xhttp.open("GET", "{/literal}{$site_url}{literal}/eshop/showOrder_items/" + id, true);
  				xhttp.send();
			}	
			else
			{
				document.getElementById("d" + id).style.display ="none";
				document.getElementById("b" + id).innerHTML = "Show";
			}
		}
	</script>
	{/literal}

	<style>
		.active a {
			color: black !important;
  			background-color: white !important;
  			height: 55px;  		
		}
		.popup {
            /* structural css */
            display: none;
            z-index: 1;
            position: absolute;
            overflow: hidden;
			background: white;
			border: 1px solid;
			left: 10%;
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
					<li class="active">
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
	<div class="container-fluid">
		<div class="row" style="padding-top: 2%; padding-left: 5%; padding-right: 5%">
			<h2>My Orders</h2>
			<hr style="border-width: 2px; border-color: black">
			 {if $orders != null}
			 <table class="table table-hover">
			    <thead>
			    	<tr>
			        	<th>Order ID</th>
			        	<th>Date</th>
			        	<th>Total</th>
			        	<th>Status</th>
			        	<th>Items</th>
			      	</tr>
			    </thead>
			   <tbody>
				    {foreach $orders as $order}
				    <tr>
					    <td><a href="{$site_url}/eshop/">{$order.id}</a></td>
					    <td>{$order.created_at}</td>
					    <td>€{$order.total}</td>
						<td>{$order.status}</td>
						<td>
							<button id="b{$order.id}" onclick="myToggle('{$order.id}')">Show</button>
						</td>
					</tr>
					<tr class="popup" id="d{$order.id}" style="display: none; width: 60%;">
					</tr>
					{/foreach}
			    </tbody>
			</table>
			{else}
				<h4>You have no orders</h4>
				<br>
			{/if}
			<hr style="border-width: 2px; border-color: black">
		</div>
	</div>
	<div class="footer" align="center" style="padding-top: 5%">     
		<p>&copy; 2018 All rights reserved | Design by Samuel Fernandes | contacto: a41674@ualg.pt</p>
	</div>
</body>
</html>