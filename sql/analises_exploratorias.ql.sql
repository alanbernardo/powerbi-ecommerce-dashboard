/* =====================================================
TOP 10 CLIENTES POR FATURAMENTO
===================================================== */

SELECT
    c.customer_unique_id,
    SUM(op.payment_value) AS faturamento_total
FROM customers c
INNER JOIN orders o
    ON c.customer_id = o.customer_id
INNER JOIN order_payments op
    ON o.order_id = op.order_id
GROUP BY c.customer_unique_id
ORDER BY faturamento_total DESC
LIMIT 10;

/* =====================================================
TICKET MÉDIO POR ESTADO
===================================================== */

SELECT
    c.customer_state,
    ROUND(AVG(op.payment_value),2) AS ticket_medio
FROM customers c
INNER JOIN orders o
    ON c.customer_id = o.customer_id
INNER JOIN order_payments op
    ON o.order_id = op.order_id
GROUP BY c.customer_state
ORDER BY ticket_medio DESC;

/* =====================================================
PEDIDOS POR MÊS
===================================================== */

SELECT
    DATE_TRUNC('month', order_purchase_timestamp) AS mes,
    COUNT(order_id) AS pedidos
FROM orders
GROUP BY mes
ORDER BY mes;

/* =====================================================
PARTICIPAÇÃO DAS FORMAS DE PAGAMENTO
===================================================== */

SELECT
    payment_type,
    ROUND(
        SUM(payment_value) /
        (SELECT SUM(payment_value) FROM order_payments) * 100,
        2
    ) AS percentual
FROM order_payments
GROUP BY payment_type
ORDER BY percentual DESC;

/* =====================================================
CLIENTES POR ESTADO
===================================================== */

SELECT
    customer_state,
    COUNT(DISTINCT customer_unique_id) AS clientes
FROM customers
GROUP BY customer_state
ORDER BY clientes DESC;

/* =====================================================
TOP CATEGORIAS POR QUANTIDADE VENDIDA
===================================================== */

SELECT
    p.product_category_name,
    COUNT(*) AS quantidade_vendida
FROM products p
INNER JOIN order_items oi
    ON p.product_id = oi.product_id
GROUP BY p.product_category_name
ORDER BY quantidade_vendida DESC
LIMIT 10;

/* =====================================================
TEMPO MÉDIO DE ENTREGA
===================================================== */

/* =====================================================
TEMPO MÉDIO DE ENTREGA EM DIAS
===================================================== */

SELECT
    ROUND(
        (
            AVG(
                EXTRACT(
                    EPOCH FROM (
                        order_delivered_customer_date
                        - order_purchase_timestamp
                    )
                )
            ) / 86400
        )::numeric,
        2
    ) AS dias_entrega
FROM public.orders
WHERE order_delivered_customer_date IS NOT NULL;

/* =====================================================
RANKING DOS ESTADOS POR TICKET MÉDIO
===================================================== */

SELECT
    c.customer_state,
    ROUND(AVG(op.payment_value),2) AS ticket_medio,
    RANK() OVER (
        ORDER BY AVG(op.payment_value) DESC
    ) AS ranking
FROM customers c
INNER JOIN orders o
    ON c.customer_id = o.customer_id
INNER JOIN order_payments op
    ON o.order_id = op.order_id
GROUP BY c.customer_state;