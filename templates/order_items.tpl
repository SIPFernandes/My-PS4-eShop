	<td colspan="5" width="900">
	<table class="table table-hover">
		<thead>
		   	<tr>
		       	<th>Item ID</th>
		       	<th>Name</th>
		       	<th>Price</th>
		       	<th>Qty</th>
		   	</tr>
		</thead>
		{foreach $items as $item}
		<tbody>
		    <tr>
			    <td>{$item.id}</td>
			    <td>{$item.name}</td>
			    <td>€{$item.price}</td>
				<td>{$item.quantity}</td>
			</tr>
		</tbody>
		{/foreach}
	</table>



