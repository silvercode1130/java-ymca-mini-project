package com.example.db.vo;

import java.time.LocalDateTime;

public class CartVo {
	int				cart_idx;		// pk

	int				mem_idx;		// fk: member(mem_idx)
	LocalDateTime	cart_regdate;
}
