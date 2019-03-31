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
</head>
<body>

	<div class="container">
		<div class="row">
			<div class="col-md-1" align="left" style="background-color: #191970; height: 75px; padding-top: 1%">
				<img src="{$base_url}images/ps4logo.png" width="60" height="55"></img>
			</div>
			<div class="col-md-3" align="left" style="background-color: #191970; height: 75px">
				<h2 style="color: white">PS4Games-shop</h2>				
			</div>
			<div class="col-md-8" align="right">
				<a href=""><h1>INVOICE #{$order.id}</h2></a>
				<br>
				<h4>Date: {$order.created_at}</h4>	
			</div>
		</div>
		<hr style="border-width: 1px; border-color: gray">
		<div class="row">
			<div class="col-md-4" align="left">
				<table class="table table-bordered">
					<thead style="background-color: #f2f2f2">
						<tr>
							<th><h4>To: {$name}</h4></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td height="100"><p>Address: </p>Contact: </td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<table class="table table-bordered">
					<thead>
						<tr>
							<th><h4>ID</h4></th>
							<th><h4>Description</h4></th>
							<th><h4>Price</h4></th>
							<th><h4>Quantity</h4></th>
							<th><h4>Sub Total</h4></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>{$product.id}</td>
							<td>{$product.name}</td>
							<td>{$product.price}</td>
							<td>{$product.qty}</td>
							<td>{$product.subtotal}</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div class="row">
			<div class="col-md-10" align="right">
				<strong><p>Sub Total:</p></strong>
				<strong><p>TAX:</p></strong>
				<strong><p>Total:</p></strong>
			</div>
			<div class="col-md-2" align="right">
				<strong><p>{$subtotal}</p></strong>
				<strong><p>N/A</p></strong>
				<strong><p>{$Total}</p></strong>
			</div>
		</div>
		<br>
		<div class="row">
			<div class="col-md-6" align="left">
				<table class="table table-bordered">
					<thead style="background-color: #f2f2f2">
						<tr>
							<th><h4>Contact Details</h4></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td height="100">
								<p>Contacto: a41674@ualg.pt</p>
								<p>Facebook: </p>
								<p>Twitter: </p>
								<p>Head Office: </p>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="col-md-6" align="left">
				<table class="table table-bordered">
					<thead style="background-color: #f2f2f2">
						<tr>
							<th><h4>Bank Details</h4></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td height="100">
								<p>Bank Name: </p>
								<p>SWIFT: </p>
								<p>Account Number: </p>
								<p>IBAN: </p>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>