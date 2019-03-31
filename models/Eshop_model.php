<?php
	class Eshop_model extends CI_Model {
	
		public function __construct()
		{
			$this->load->database();
		}

		public function get_products($cat_id)
		{
			if($cat_id == null)
				$sql = "SELECT * FROM products ORDER BY products.name";
			else
				$sql = "SELECT * FROM products WHERE products.cat_id = '$cat_id' ORDER BY products.name";
			$query = $this->db->query($sql);
			return $query->result_array();
		}

		public function get_categories()
		{
			$sql = "SELECT * FROM categories ORDER BY categories.name";
			$query = $this->db->query($sql);
			return $query->result_array();
		}

		public function create_order()
		{
			$id = $this->session->userdata('id');
			$cart = $this->session->userdata('cart');
			$total = $cart['total'];
			$present_date = date("Y-m-d H:i:s");
			$sql = "INSERT INTO orders (customer_id, created_at, total) VALUES ('$id', '$present_date', '$total')";
			$query = $this->db->query($sql);
			$sql = "SELECT id FROM orders WHERE orders.created_at = '$present_date'";
			$query = $this->db->query($sql);
			$row = $query->result_array();
			$order_id = $row[0]['id'];
			$cartitems = $this->session->userdata('cartitems');
			foreach ($cartitems as $row => $value) {
				$product_id = $value['id'];
				$name = $value['name'];
				$price = $value['price'];
				$qty = $value['qty'];
				$sql = "INSERT INTO order_items (order_id, product_id, name, price, quantity) VALUES ('$order_id', '$product_id', '$name','$price', '$qty')";
				$query = $this->db->query($sql);
			}
		}

		public function get_orders($customer_id)
		{
			$sql = "SELECT * FROM orders WHERE orders.customer_id = '$customer_id' ORDER BY orders.created_at DESC";
			$query = $this->db->query($sql);
			return $query->result_array();
		}

		public function get_order_items($order_id)
		{
			$sql = "SELECT * FROM order_items WHERE order_items.order_id = '$order_id'";
			$query = $this->db->query($sql);
			return $query->result_array();	
		}

		public function register_user()
		{
			$name = $this->input->post('name');
			$email = $this->input->post('email');
			$pass1_utilizador = $this->input->post('password');
			/*md5('$pass') -> encripta a password*/
			$passwd = substr(md5($pass1_utilizador),0,32);
			/*Guarda os dados do Cliente*/
			$present_date = date("Y-m-d H:i:s");
			$sql = "INSERT INTO customers (name, email, created_at, updated_at, password_digest) VALUES ('$name', '$email', '$present_date', '$present_date', '$passwd')";
			$query = $this->db->query($sql);
		}

		public function validate_user()
		{
			$email = $this->input->post('email');
			$pass1_utilizador = $this->input->post('password');
			/*md5('$pass') -> encripta a password*/
			$passwd = substr(md5($pass1_utilizador),0,32);
			$sql = "SELECT * FROM customers WHERE email = '$email' AND password_digest = '$passwd'";  
	        $query = $this->db->query($sql);  
	        if ($query->num_rows() == 1) 
	        	return $query->result_array(); 
		}

		public function get_cookie()
		{
			$sql = "SELECT * FROM customers WHERE remember_digest='".$_COOKIE['rememberMe']."'";
			$query = $this->db->query($sql);
			return $query->result_array();
		}

		public function update_cookie()
		{
			$cookie = array(
           		'name'   => 'rememberMe',
           		'value'  => substr(md5(time()),0,32),
           		'expire' => time()+(3600*24*30)
       		);
       		$this->input->set_cookie($cookie);
			$sql = "UPDATE customers SET remember_digest='".$cookie['value']."' WHERE id='".$_SESSION['id']."'";
			$query = $this->db->query($sql);
		}
	}
?>