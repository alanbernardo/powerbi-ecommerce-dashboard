/*
=========================================================
PROJETO: DASHBOARD EXECUTIVO COMERCIAL
AUTOR: Alan Bernardo
BANCO DE DADOS: PostgreSQL
DATASET: Olist Brazilian E-commerce Dataset
=========================================================

Objetivo:
Consultas SQL utilizadas para análise exploratória e
construção do Dashboard Executivo Comercial.

Tecnologias:
- PostgreSQL
- SQL
- Power BI
- DAX
*/

/* =====================================================
KPI 1 - FATURAMENTO TOTAL
===================================================== */

SELECT
    SUM(payment_value) AS faturamento_total
FROM order_payments;

/* =====================================================
KPI 2 - TOTAL DE PEDIDOS
===================================================== */

SELECT
    COUNT(order_id) AS total_pedidos
FROM orders;

/* =====================================================
KPI 3 - CLIENTES ÚNICOS
===================================================== */

SELECT
    COUNT(DISTINCT customer_unique_id) AS clientes_unicos
FROM customers;

/* =====================================================
KPI 4 - TICKET MÉDIO
===================================================== */

SELECT
    AVG(payment_value) AS ticket_medio
FROM order_payments;

/* =====================================================
FATURAMENTO MENSAL
===================================================== */

SELECT
    DATE_TRUNC('month', o.order_purchase_timestamp) AS mes,
    SUM(op.payment_value) AS faturamento_total
FROM orders o
INNER JOIN order_payments op
    ON o.order_id = op.order_id
GROUP BY mes
ORDER BY mes;

/* =====================================================
FATURAMENTO POR ESTADO
===================================================== */

SELECT
    c.customer_state,
    SUM(op.payment_value) AS faturamento_total
FROM customers c
INNER JOIN orders o
    ON c.customer_id = o.customer_id
INNER JOIN order_payments op
    ON o.order_id = op.order_id
GROUP BY c.customer_state
ORDER BY faturamento_total DESC;


/* =====================================================
TOTAL DE PEDIDOS POR STATUS
===================================================== */

SELECT
    order_status,
    COUNT(order_id) AS total_pedidos
FROM orders
GROUP BY order_status
ORDER BY total_pedidos DESC;


/* =====================================================
FATURAMENTO POR TIPO DE PAGAMENTO
===================================================== */

SELECT
    payment_type,
    SUM(payment_value) AS faturamento_total
FROM order_payments
GROUP BY payment_type
ORDER BY faturamento_total DESC;

/* =====================================================
FATURAMENTO POR CATEGORIA
===================================================== */

SELECT
    p.product_category_name,
    SUM(op.payment_value) AS faturamento_total
FROM products p
INNER JOIN order_items oi
    ON p.product_id = oi.product_id
INNER JOIN orders o
    ON oi.order_id = o.order_id
INNER JOIN order_payments op
    ON o.order_id = op.order_id
GROUP BY p.product_category_name
ORDER BY faturamento_total DESC;

/* =====================================================
TOP 10 CATEGORIAS POR FATURAMENTO
===================================================== */

SELECT
    p.product_category_name,
    SUM(op.payment_value) AS faturamento_total
FROM products p
INNER JOIN order_items oi
    ON p.product_id = oi.product_id
INNER JOIN orders o
    ON oi.order_id = o.order_id
INNER JOIN order_payments op
    ON o.order_id = op.order_id
GROUP BY p.product_category_name
ORDER BY faturamento_total DESC
LIMIT 10;


/* =====================================================
TOP 10 CIDADES POR FATURAMENTO
===================================================== */

SELECT
    c.customer_city,
    SUM(op.payment_value) AS faturamento_total
FROM customers c
INNER JOIN orders o
    ON c.customer_id = o.customer_id
INNER JOIN order_payments op
    ON o.order_id = op.order_id
GROUP BY c.customer_city
ORDER BY faturamento_total DESC
LIMIT 10;

/* =====================================================
NOVOS CLIENTES POR ANO
===================================================== */

SELECT
    DATE_TRUNC('year', o.order_purchase_timestamp) AS ano,
    COUNT(DISTINCT c.customer_unique_id) AS clientes
FROM customers c
INNER JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY ano
ORDER BY ano;




