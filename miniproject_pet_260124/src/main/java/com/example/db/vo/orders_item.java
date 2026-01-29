package com.example.db.vo;

public class orders_item {
	int				orders_item_idx;			// pk

	int				orders_idx;				// fk: orders(orders_idx)
	int				item_idx;				// fk: item(item_idx)
	int				orders_item_quantity;
	int				orders_price_at; 		// 주문시점 단가
}
