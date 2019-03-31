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
	<script>
	function setCookie(cname,cvalue,exdays) {
	  var d = new Date();
	  d.setTime(d.getTime() + (exdays*24*60*60*1000));
	  var expires = "expires=" + d.toGMTString();
	  document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
	}
	function getCookie(cname) {
	  var name = cname + "=";
	  var decodedCookie = decodeURIComponent(document.cookie);
	  var ca = decodedCookie.split(';');
	  for(var i = 0; i < ca.length; i++) {
	    var c = ca[i];
	    while (c.charAt(0) == ' ') {
	      c = c.substring(1);
	    }
	    if (c.indexOf(name) == 0) {
	      return c.substring(name.length, c.length);
	    }
	  }
	  return "";
	}
	function checkCookie() {
		var cookieAgree = getCookie("cookie");
	    if(cookieAgree != "cookieAgree"){
			if (confirm("This website is using cookies.")){
				setCookie("cookie", 'cookieAgree', 30);
			}
		}
	}
	</script>
	<style>
		.carousel-inner > .item > img,
		.carousel-inner > .item > a > img {
			width: 40%;
			margin: auto;
		}
		.active a {
			color: black !important;
  			background-color: white !important;
  			height: 55px;  		
		}

		#categories a:link {
			color: black
		}
		#categories a:visited {
			color: black;
		}
		#categories a:hover {
			text-decoration: none;
			background-color: #ccccff
		}
		#categories a:active {
			background-color: #ccccff
		}
	</style>
</head>
<body onload="checkCookie()">
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
					<li class="active">{$menu1}</li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li>
						{$menu4}
					</li>
					<li>
						<a id="cart" href="{$site_url}/eshop/checkout">
							€{$cart.total}
							({$cart.items} items)
							<img class="image_on" src="{$base_url}/images/shopCartW.png" width="25" height="25"></img>
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
	<div class="container">
		<br>
		<div class="row">
			<div id="myCarousel" class="carousel slide" data-ride="carousel">
				<!-- Indicators -->
				<ol class="carousel-indicators">
					<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
					<li data-target="#myCarousel" data-slide-to="1"></li>
				</ol>
				<!-- Wrapper for slides -->
				<div class="carousel-inner" role="listbox">
					<div class="item active">
						<!--Usando a variável local em Blog.php, $base_url-->
						<img src="{$base_url}images/PS4pro.png" alt="PS4pro" width="613" height="345">
					</div>
					<div class="item">
						<img src="{$base_url}images/daysofplay.jpg" alt="daysofplay" width="613" height="345">
					</div>
				</div>
				<!-- Left and right controls -->
				<a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
					<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
					<span class="sr-only">Previous</span>
				</a>
				<a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
					<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
					<span class="sr-only">Next</span>
				</a>
			</div>
		</div>
	</div>
	<br>
	<div class="container-fluid">
		<div class="row" style="padding-top: 2%; padding-left: 5%; padding-right: 5%">
			<div class="col-md-2" align="left">
				<div id="categories" class="panel-heading">
					<h2><u>Categories</u></h2>
					<p><a href="{$site_url}/eshop">All</a></p>
					{foreach $categories as $category}
						<p><a href="{$site_url}/eshop/index/{$category.id}">{$category.name}</a></p>
					{/foreach}
				</div>
			</div>
			<div class="col-md-10">
				<div>
					{foreach $categories as $category}
						{if $category.id == $cat_id}
							<h3>{$category.name}</h3>
							<p>{$category.description}</p>
						{/if}
					{/foreach}
				</div>
				{foreach $products as $product}
				<div class="col-md-3" align="center">
					<div class="panel-heading">
						<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal{$product.id}" style="border: none; background: none;"><img src="{$base_url}images/{$product.image}" width="200" height="200">		
						</img></button>
						<!-- Modal Begin-->
						<div class="modal fade" id="myModal{$product.id}" role="dialog"> 
					    <div class="modal-dialog">
					      <div class="modal-content">
					        <div class="modal-header">
					          <button type="button" class="close" data-dismiss="modal">&times;</button>
					          <h4 class="modal-title">{$product.name}</h4>
					        </div>
					        <div class="modal-body">
					        	<img src="{$base_url}images/{$product.image}"></img>
					        </div>
					        <div class="modal-body">
					        	<p>{$product.description}</p>
					        </div>
					        <div class="modal-footer">
					        	<div align="center">
					        		<form action="{$site_url}/eshop/CartItemInsert" method="post">
										<input type="hidden" name="name" value="{$product.name}">
										<input type="hidden" name="price" value="{$product.price}">
						          		<button name="id" value="{$product.id}" type="submit" class="btn btn-default">
						          			<img src="{$base_url}images/shopCart.png" width="20" height="20">		
											</img>
											€{$product.price}
						          		</button>
						          	</form>
					          	</div>
					        </div>
					      </div>
					    </div>
					  	</div>
					  	<!-- Modal End-->
						<div style="padding-left: 7%">
							<p>{$product.name}</p>
							<form action="{$site_url}/eshop/CartItemInsert" method="post">
								<input type="hidden" name="name" value="{$product.name}">
								<input type="hidden" name="price" value="{$product.price}">
								<button name="id" value="{$product.id}" type="submit" class="btn btn-default">
									<img src="{$base_url}images/shopCart.png" width="20" height="20">		
									</img>
									€{$product.price}
								</button>
							</form>
						</div>
					</div>
				</div>
				{/foreach}
			</div>
		</div>
	</div>
	<div class="footer" align="center" style="padding-top: 5%">     
		<p>&copy; 2018 All rights reserved | Design by Samuel Fernandes | contacto: a41674@ualg.pt</p>
	</div>
</body>
</html>