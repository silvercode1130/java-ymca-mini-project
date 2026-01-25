-- 4. 주문
CREATE TABLE orders_status (
    order_status_idx   NUMBER        PRIMARY KEY,
    order_status_name  VARCHAR2(20)  NOT NULL  -- 결제됨 / 취소됨 / 배송중 ...
);

CREATE TABLE orders (
    order_idx              NUMBER        PRIMARY KEY,
    mem_idx                NUMBER        NOT NULL,
    order_total_price      NUMBER(10)    NOT NULL,
    order_grade_discount   NUMBER(10,2)  DEFAULT 0,  -- 금액 기준으로 잡음
    order_coupon_discount  NUMBER(10,2)  DEFAULT 0,
    order_status_idx       NUMBER        NOT NULL,
    order_regdate          DATE          DEFAULT SYSDATE,
    CONSTRAINT fk_orders_member
        FOREIGN KEY (mem_idx) REFERENCES member(mem_idx)
        ON DELETE CASCADE,
    CONSTRAINT fk_orders_status
        FOREIGN KEY (order_status_idx) REFERENCES orders_status(order_status_idx)
);

CREATE TABLE orders_item (
    order_item_idx       NUMBER     PRIMARY KEY,
    order_idx            NUMBER     NOT NULL,
    item_idx             NUMBER     NOT NULL,
    order_item_quantity  NUMBER     DEFAULT 1,
    order_price_at       NUMBER(10) NOT NULL,
    CONSTRAINT fk_orders_item_orders
        FOREIGN KEY (order_idx) REFERENCES orders(order_idx)
        ON DELETE CASCADE,
    CONSTRAINT fk_orders_item_item
        FOREIGN KEY (item_idx)  REFERENCES item(item_idx)
);
