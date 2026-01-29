package com.example.db.vo;

public class cart_item {
	int				cart_item_idx;	// pk

	int				cart_idx;		// fk: cart(cart_idx)
	int				item_idx;		// fk: item(item_idx)
	int				cart_item_quantity;
}
