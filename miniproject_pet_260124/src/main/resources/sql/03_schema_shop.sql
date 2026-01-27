/*
-- 3. 상품 / 장바구니
CREATE TABLE item (
    item_idx            NUMBER          PRIMARY KEY,
    item_name           VARCHAR2(200)   NOT NULL,
    item_price          NUMBER(10)      NOT NULL,
    item_thumbnail_img  VARCHAR2(255),
    item_detail_img     VARCHAR2(255),
    item_stock          NUMBER          DEFAULT 0,
    item_category       VARCHAR2(50),
    item_regdate        DATE            DEFAULT SYSDATE,
    item_moddate        DATE
);

CREATE TABLE cart (
    cart_idx      NUMBER   PRIMARY KEY,
    mem_idx       NUMBER   NOT NULL,
    cart_regdate  DATE     DEFAULT SYSDATE,
    CONSTRAINT fk_cart_member
        FOREIGN KEY (mem_idx) REFERENCES member(mem_idx)
        ON DELETE CASCADE
);

CREATE TABLE cart_item (
    cart_item_idx       NUMBER   PRIMARY KEY,
    cart_idx            NUMBER   NOT NULL,
    item_idx            NUMBER   NOT NULL,
    cart_item_quantity  NUMBER   DEFAULT 1,
    CONSTRAINT fk_cart_item_cart
        FOREIGN KEY (cart_idx) REFERENCES cart(cart_idx)
        ON DELETE CASCADE,
    CONSTRAINT fk_cart_item_item
        FOREIGN KEY (item_idx) REFERENCES item(item_idx)
);

*/