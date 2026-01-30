/*
-- 4. 주문
CREATE TABLE orders_status (
    orders_status_idx   NUMBER        PRIMARY KEY,
    orders_status_name  VARCHAR2(20)  NOT NULL  -- 결제됨 / 취소됨 / 배송중 ...
);

CREATE TABLE orders (
    orders_idx              NUMBER        PRIMARY KEY,
    mem_idx                NUMBER        NOT NULL,
    orders_total_price      NUMBER(10)    NOT NULL,
    orders_grade_discount   NUMBER(10,2)  DEFAULT 0,  -- 금액 기준으로 잡음
    orders_coupon_discount  NUMBER(10,2)  DEFAULT 0,
    orders_status_idx       NUMBER        NOT NULL,
    orders_regdate          DATE          DEFAULT SYSDATE,
    CONSTRAINT fk_orders_member
        FOREIGN KEY (mem_idx) REFERENCES member(mem_idx)
        ON DELETE CASCADE,
    CONSTRAINT fk_orders_status
        FOREIGN KEY (orders_status_idx) REFERENCES orders_status(orders_status_idx)
);

CREATE TABLE orders_item (
    orders_item_idx       NUMBER     PRIMARY KEY,
    orders_idx            NUMBER     NOT NULL,
    item_idx             NUMBER     NOT NULL,
    orders_item_quantity  NUMBER     DEFAULT 1,
    orders_price_at       NUMBER(10) NOT NULL,
    CONSTRAINT fk_orders_item_orders
        FOREIGN KEY (orders_idx) REFERENCES orders(orders_idx)
        ON DELETE CASCADE,
    CONSTRAINT fk_orders_item_item
        FOREIGN KEY (item_idx)  REFERENCES item(item_idx)
);

*/