/*
	-- 1번: 사료 카테고리 (키워드: 사료)
		INSERT INTO item (
											item_idx, 
											item_name, 
											item_price, 
											item_thumbnail_img, 
											item_stock, 
											item_category, 
											item_regdate
											)
		VALUES (
						1, 
						'유기농 건강 연어 사료', 
						35000, 
						'https://cdn.pixabay.com/photo/2017/04/04/17/22/dog-food-2202301_1280.jpg', 
						50, 
						'food', 
						SYSDATE
						);
		
	-- 2번: 간식 카테고리 (키워드: 간식)
		INSERT INTO item (
											item_idx, 
											item_name, 
											item_price, 
											item_thumbnail_img, 
											item_stock, 
											item_category, 
											item_regdate
											)
		VALUES (
						2, 
						'말랑말랑 치즈 닭가슴살 간식', 
						12000, 
						'https://cdn.pixabay.com/photo/2016/03/05/20/02/dog-1238655_1280.jpg', 
						100, 
						'snack', 
						SYSDATE
						);
		
	-- 3번: 장난감 카테고리 (키워드: 장난감)
		INSERT INTO item (
											item_idx, 
											item_name, 
											item_price, 
											item_thumbnail_img, 
											item_stock, 
											item_category, 
											item_regdate
											)
		VALUES (
						3, 
						'스트레스 해소용 삑삑이 장난감', 
						8500, 
						'https://cdn.pixabay.com/photo/2015/03/26/09/54/dog-690523_1280.jpg', 
						30, 
						'toy', 
						SYSDATE
						);
		
	-- 4번: 의류 카테고리 (키워드: 옷)
		INSERT INTO item (
											item_idx, 
											item_name, 
											item_price, 
											item_thumbnail_img, 
											item_stock, 
											item_category, 
											item_regdate
											)
		VALUES (
						4, 
						'겨울 한정판 곰돌이 강아지 옷', 
						25000, 
						'https://cdn.pixabay.com/photo/2016/11/29/05/09/child-1867463_1280.jpg', 
						20, 
						'clothes', 
						SYSDATE
						);
		
	-- 5번: 위생용품 카테고리 (키워드: 샴푸)
		INSERT INTO item (
											item_idx, 
											item_name, 
											item_price, 
											item_thumbnail_img, 
											item_stock, 
											item_category, 
											item_regdate
											)
		VALUES (
						5, 
						'눈물 자국 없는 저자극 애견 샴푸', 
						18000, 
						'https://cdn.pixabay.com/photo/2018/05/07/10/48/dog-3380544_1280.jpg', 
						45, 
						'grooming', 
						SYSDATE
						);
		
		
	select * from item;
	SELECT * FROM item WHERE item_category = 'food';
	COMMIT
	
-- 1번 회원을 위한 장바구니 생성 (시퀀스 이름: seq_cart_idx)
	INSERT INTO cart (cart_idx, mem_idx, cart_regdate) 
	VALUES (seq_cart_idx.NEXTVAL, 1, SYSDATE);
	
	COMMIT
	
SELECT * FROM item where item_idx=#{item_idx}

 */