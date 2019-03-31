<?php
	defined('BASEPATH') OR exit('No direct script access allowed');
	
	class Eshop extends CI_Controller {
		
		public function __construct()
		{
			parent::__construct();
			$this->load->model('eshop_model');
			$this->load->helper('url_helper');
			$this->load->helper('cookie');
			$this->load->library('session');
		}

		public function index($cat_id = FALSE)
		{
			$data['base_url'] = base_url();
			$data['site_url'] = site_url();
			if(null !== $this->input->cookie('rememberMe'))
			{
				$tupple = $this->eshop_model->get_cookie();
				if(isset($tupple))
				{
					foreach ($tupple as $tupple) {
						$id = $tupple['id'];
						$name = $tupple['name'];
						$email = $tupple['email'];
					} 
					$newdata = array(
					    'id' => $id,
					    'name' => $name,
					    'email' => $email
					);
					$this->session->set_userdata($newdata);
				}
			}
			$data['menu1'] = '<a href="'.$data['site_url'].'/eshop">Home</a>';
			if(null !== $this->session->userdata('name')) {
				$data['menu2'] = '<a href="'.$data['site_url'].'/eshop/logout">Logout</a>';
				$data['menu3'] = '<a align="center" style="color: white;">Welcome '.$_SESSION['name'].'</a>';
				$data['session_id'] = $this->session->userdata('id');
				$data['menu4'] = '<a href="'.$data['site_url'].'/eshop/showOrders">View Orders</a>';
			}
			else{
				$data['menu2'] = '<a href="'.$data['site_url'].'/eshop/login">Login</a>';
				$data['menu3'] = '<a href="'.$data['site_url'].'/eshop/register">Register</a>';
			}
			$data['categories'] = $this->eshop_model->get_categories();
			$data['products'] = $this->eshop_model->get_products($cat_id);
			$data['cat_id'] = $cat_id;
			if(null == $this->session->userdata('cart')){
				$cart = array('total' => 0, 'items' => 0);
				$this->session->set_userdata('cart', $cart); 
			}
			$data['cart'] = $this->session->userdata('cart');
			$this->smarty->view('products.tpl', $data);
		}

		public function CartItemInsert()
		{
			if(null != $this->input->post('plus'))
				$button = $this->input->post('plus');
			if(null != $this->input->post('minus'))
				$button = $this->input->post('minus');
			if(null != $this->input->post('remove'))
				$button = $this->input->post('remove');
			$p_id = $this->input->post('id');
			$p_name = $this->input->post('name');
			$p_price = $this->input->post('price');
			$cartitems = $this->session->userdata('cartitems');
			$cart = $this->session->userdata('cart');
			$total_value = $cart['total'];
			$total_items = $cart['items'];
			$exists = FALSE;
			if ($this->uri->segment(3) == "reset") {
				$cartitems = null;
				$total_items = 0;
				$total_value = 0;
			}
			else if($button == "remove"){
				$j = 0;
				foreach ($cartitems as $row => $value) {
					if ($value['id'] != $p_id){
						$tmp[$j] = $cartitems[$row];
						$j++;
					}
					else{
						$total_value -= $value['subtotal'];
						$total_items -= $value['qty'];
					}
				}
				$cartitems = $tmp;
			}
			else{
				foreach ($cartitems as $row => $value) {
					if($value['id'] == $p_id && ($button == null || $button == "plus")){ 
						$cartitems[$row]['qty']++;
						$cartitems[$row]['subtotal'] += $value['price'];
						$total_value += $value['price'];
						$total_items++;
						$exists = TRUE;  
						break;
					}
					elseif($value['id'] == $p_id && $button == "minus" && $value['qty'] > 1){
						$cartitems[$row]['qty']--;
						$cartitems[$row]['subtotal'] -= $value['price'];
						$total_value -= $value['price'];
						$total_items--;
						break;
					}
				}
				if ($exists != TRUE && $button == null) {
					$cartitem = array('id' => $p_id,'name' => $p_name, 'price' => $p_price, 'qty' => 1, 'subtotal' => $p_price);
				 	$cartitems[count($cartitems)+1] = $cartitem; 	
				 	$total_value += $p_price;
					$total_items++;
				}
			}
			$cart = array('total' => $total_value, 'items' => $total_items);
			$this->session->set_userdata('cart', $cart); 
			$this->session->set_userdata('cartitems', $cartitems);
			if ($this->uri->segment(4) == "5")
				redirect('/eshop/showOrders');
			elseif ($this->uri->segment(4) == "4")
				redirect('/eshop/login');
			elseif ($this->uri->segment(4) == "3")
				redirect('/eshop/register');
			elseif ($this->uri->segment(4) == "2")
				redirect('/eshop/message');
			elseif ($button != null || $this->uri->segment(4) == "1") 
				redirect('/eshop/checkout');
			elseif($button == null)
				redirect('/eshop');
		}

		public function checkout()
		{
			$data['base_url'] = base_url();
			$data['site_url'] = site_url();
			$data['cartitems'] = $this->session->userdata('cartitems');
			$data['cart'] = $this->session->userdata('cart');
			$data['menu1'] = '<a href="'.$data['site_url'].'/eshop">Home</a>';
			if(null !== $this->session->userdata('name')) {
				$data['menu2'] = '<a href="'.$data['site_url'].'/eshop/logout">Logout</a>';
				$data['menu3'] = '<a align="center" style="color: white;">Welcome '.$_SESSION['name'].'</a>';
				$data['session_id'] = $this->session->userdata('id');
				$data['menu4'] = '<a href="'.$data['site_url'].'/eshop/showOrders">View Orders</a>';
				if ($data['cart']['items'] > 0) {
					$data['button2'] = '<a href="'.$data['site_url'].'/eshop/createOrder"><button type="button" class="btn btn-primary">Place Order</button></a>';
				}
				else
					$data['button2'] = '<a><button type="button" class="btn btn-primary disabled">Place Order</button></a>';	
			}
			else{
				$data['menu2'] = '<a href="'.$data['site_url'].'/eshop/login">Login</a>';
				$data['menu3'] = '<a href="'.$data['site_url'].'/eshop/register">Register</a>';
				$data['button2'] = '<a href="'.$data['site_url'].'/eshop/login"><button type="button" class="btn btn-primary">Login to Place Order</button></a>';	
			}
			$data['button1'] = '<a href="'.$data['site_url'].'/eshop"><button type="button" class="btn btn-default">Continue shopping</button></a>';
			if(null == $this->session->userdata('cart')){
				$cart = array('total' => 0, 'items' => 0);
				$this->session->set_userdata('cart', $cart); 
			}			
			$this->smarty->view('checkout.tpl', $data);
		}

		public function createOrder()
		{
			$data['base_url'] = base_url();
			$data['site_url'] = site_url();
			$data['menu1'] = '<a href="'.$data['site_url'].'/eshop">Home</a>';
			$data['menu2'] = '<a href="'.$data['site_url'].'/eshop/login">Login</a>';
			$data['menu3'] = '<a href="'.$data['site_url'].'/eshop/register">Register</a>';			
			$data['cart'] = $this->session->userdata('cart');
			if ($data['cart']['items'] > 0) {
				$this->eshop_model->create_order();
				$name = $this->session->userdata('name');
				$data['cor']="#D2691E";
				$data['message'] = "$name: Thank you for your order!";
				$cartitems = $this->session->userdata('cartitems');
				$cartitems = null;
				$cart = array('total' => 0, 'items' => 0);
				$this->session->set_userdata('cart', $cart); 
				$this->session->set_userdata('cartitems', $cartitems);
			}
			else{
				$data['cor']="red";
				$data['message'] = "Your cart is empty!";
			}
			$this->smarty->view('message.tpl', $data);
		}

		public function showOrders()
		{
			if(null == $this->session->userdata('cart')){
				$cart = array('total' => 0, 'items' => 0);
				$this->session->set_userdata('cart', $cart); 
			}
			$data['cart'] = $this->session->userdata('cart'); 
			$data['base_url'] = base_url();
			$data['site_url'] = site_url();
			$data['menu1'] = '<a href="'.$data['site_url'].'/eshop">Home</a>';
			if(null !== $this->session->userdata('name')) {
				$data['menu2'] = '<a href="'.$data['site_url'].'/eshop/logout">Logout</a>';
				$data['menu3'] = '<a align="center" style="color: white;">Welcome '.$_SESSION['name'].'</a>';
				$data['session_id'] = $this->session->userdata('id');
				$data['menu4'] = '<a href="'.$data['site_url'].'/eshop/showOrders">View Orders</a>';
				$user_id = $this->session->userdata('id');
				$data['orders'] = $this->eshop_model->get_orders($user_id);
			}
			else{
				$data['menu2'] = '<a href="'.$data['site_url'].'/eshop/login">Login</a>';
				$data['menu3'] = '<a href="'.$data['site_url'].'/eshop/register">Register</a>';
			}
			$this->smarty->view('orders.tpl', $data);	
		}

		public function showOrder_items($order_id)
		{
			$data['base_url'] = base_url();
			$data['site_url'] = site_url();
			$data['items'] = $this->eshop_model->get_order_items($order_id);
			$this->smarty->view('order_items.tpl', $data);
		}

		public function showInvoice($order_id){
			
		}

		public function register()
		{
			if(null == $this->session->userdata('cart')){
				$cart = array('total' => 0, 'items' => 0);
				$this->session->set_userdata('cart', $cart); 
			}
			$this->load->library('form_validation');
			$this->load->helper('email');
			$data['cart'] = $this->session->userdata('cart');
			$data['base_url'] = base_url();
			$data['site_url'] = site_url();
			$data['menu1'] = '<a href="'.$data['site_url'].'/eshop">Home</a>';
			$data['menu2'] = '<a href="'.$data['site_url'].'/eshop/login">Login</a>';
			$data['menu3'] = '<a href="'.$data['site_url'].'/eshop/register">Register</a>';
			$this->form_validation->set_rules('name', 'Name', 'required', array('required' => 'The "name" field is required'));
			$this->form_validation->set_rules('email', 'Email', 'required|valid_email|is_unique[customers.email]', array('required' => 'The "email" field is required', 'valid_email' => 'The email address must be valid', 'is_unique' => 'That email address is already in use'));
		    $this->form_validation->set_rules('password', 'Password', 'required', array('required' => 'The "password" field is required'));
		    $this->form_validation->set_rules('password_confirm', 'Password confirm', 'required|matches[password]', array('required' => 'The "password_confirm" field is required', 'matches' => 'Password confirmation failed'));    
			if ($this->form_validation->run() === FALSE)
			{
				$data['name'] = $this->input->post('name');
				$data['email'] = $this->input->post('email');
				$data['messages'] = array(form_error('name'), form_error('email'), form_error('password'), form_error('password_confirm'));

				$this->smarty->view('register.tpl', $data);
			}
			else
			{
				$this->eshop_model->register_user();
				$data['cor']="#D2691E";
				$data['message']="Success: New user registered";
				$this->smarty->view('message.tpl', $data);
			}
		}

		public function login()
		{
			if(null == $this->session->userdata('cart')){
				$cart = array('total' => 0, 'items' => 0);
				$this->session->set_userdata('cart', $cart); 
			}
			$this->load->library('form_validation');
			$this->load->helper('email');
			$data['cart'] = $this->session->userdata('cart');
			$data['base_url'] = base_url();
			$data['site_url'] = site_url();
			$data['menu1'] = '<a href="'.$data['site_url'].'/eshop">Home</a>';
			$data['menu2'] = '<a href="'.$data['site_url'].'/eshop/login">Login</a>';
			$data['menu3'] = '<a href="'.$data['site_url'].'/eshop/register">Register</a>';
			$this->form_validation->set_rules('email','Email','required|valid_email', array('required' => 'The "email" field is required', 'valid_email' => 'The email address must be valid'));
			$this->form_validation->set_rules('password', 'Password', 'required', array('required' => 'The "password" field is required'));
			
			if ($this->form_validation->run() === FALSE)
			{
				$data['email'] = $this->input->post('email');
				$data['messages'] = array(form_error('email'), form_error('password'));

				$this->smarty->view('login.tpl', $data);
			}
			else
				$this->login_action();
		}

		public function login_action()
		{
			$data['base_url'] = base_url();
			$data['site_url'] = site_url();
			$data['menu1'] = '<a href="'.$data['site_url'].'/eshop">Home</a>';
			$tupple = $this->eshop_model->validate_user();

			if (isset($tupple))
			{
				foreach ($tupple as $tupple) {
					$id = $tupple['id'];
					$name = $tupple['name'];
					$email = $tupple['email'];
				} 
				$newdata = array(
				    'id' => $id,
				    'name' => $name,
				    'email' => $email
				);
				$this->session->set_userdata($newdata);
				if(null !== $this->input->post('autologin'))
					$this->eshop_model->update_cookie();
				$data['menu4'] = '<a href="'.$data['site_url'].'/eshop/showOrders">View Orders</a>';
				$data['menu2'] = '<a href="'.$data['site_url'].'/eshop/logout">Logout</a>';
				$data['menu3'] = '<a align="center" style="color: white;">Welcome '.$name.'';	
				$data['cor']="#D2691E";
				$data['message'] = "Welcome $name!";
				$data['cart'] = $this->session->userdata('cart');
				$this->smarty->view('message.tpl', $data);
			}
			else
			{
				$data['menu2'] = '<a href="'.$data['site_url'].'/eshop/login">Login</a>';
				$data['menu3'] = '<a href="'.$data['site_url'].'/eshop/register">Register</a>';
				$data['email'] = $this->input->post('email');
				$data['messages'] = 'Login failed' ;
				$data['cart'] = $this->session->userdata('cart');
				$this->smarty->view('login.tpl', $data);
			}
		}
		
		public function logout()
		{
			$data['base_url'] = base_url();
			$data['site_url'] = site_url();
			$data['cart'] = $this->session->userdata('cart');
			$data['menu1'] = '<a href="'.$data['site_url'].'/eshop">Home</a>';
			$data['menu2'] = '<a href="'.$data['site_url'].'/eshop/login">Login</a>';
			$data['menu3'] = '<a href="'.$data['site_url'].'/eshop/register">Register</a>';
			$data['cor']="#D2691E";
			$data['message'] = 'See you back soon!';
			delete_cookie('rememberMe');
			$this->session->sess_destroy();
			$this->smarty->view('message.tpl', $data);
		}
	}
?>