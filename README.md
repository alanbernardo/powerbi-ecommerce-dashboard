
<p align="center">
  <img src="images/dashboard.png" width="95%">
</p>

<h1 align="center">
📊 Dashboard Executivo Comercial</h1>

<p align="center">
Projeto desenvolvido utilizando PostgreSQL, SQL, Power BI e DAX para análise de dados de e-commerce.
</p>

---

<p align="center">

<b>PostgreSQL • SQL • Power BI • DAX</b>

</p>

---

<p align="center">

![PostgreSQL](https://img.shields.io/badge/PostgreSQL-4169E1?style=for-the-badge&logo=postgresql&logoColor=white)
![Power BI](https://img.shields.io/badge/Power_BI-F2C811?style=for-the-badge&logo=powerbi&logoColor=black)
![SQL](https://img.shields.io/badge/SQL-005C84?style=for-the-badge)
![DAX](https://img.shields.io/badge/DAX-512BD4?style=for-the-badge)

</p>


# Objetivo

Construir um dashboard executivo capaz de acompanhar os principais indicadores comerciais de um negócio de e-commerce, permitindo a análise de faturamento, pedidos, clientes, categorias e formas de pagamento de forma interativa.

O projeto contempla todas as etapas de um fluxo de Business Intelligence:

- Consulta e exploração dos dados em SQL;
- Modelagem dos relacionamentos;
- Construção das métricas em DAX;
- Desenvolvimento do dashboard no Power BI;
- Documentação técnica do projeto.

---

# Dataset

Foi utilizado o **Brazilian E-Commerce Public Dataset by Olist**, disponibilizado publicamente no Kaggle.

O conjunto de dados reúne informações reais de pedidos realizados entre 2016 e 2018, contendo clientes, pedidos, produtos, pagamentos e itens vendidos.

---

# Tecnologias utilizadas

- PostgreSQL
- SQL
- Power BI
- DAX

---

# Modelagem dos Dados

<p align="center">
  <img src="images/modelagem.png" width="80%">
</p>



Modelo relacional composto pelas tabelas:

- Customers
- Orders
- Order Items
- Order Payments
- Products

Os relacionamentos foram estruturados respeitando as cardinalidades adequadas para permitir análises consistentes entre clientes, pedidos, pagamentos e produtos.

---

# Indicadores (KPIs)

O dashboard apresenta os seguintes indicadores:

- Faturamento Total
- Total de Pedidos
- Clientes Únicos
- Ticket Médio

---

# Visualizações

O dashboard foi desenvolvido para fornecer uma visão executiva do negócio por meio de:

- Evolução do faturamento por mês
- Faturamento por estado
- Pedidos por status
- Faturamento por categoria
- Distribuição por tipo de pagamento
- Segmentações por ano, estado e categoria de produto

---

# Consultas SQL

As consultas utilizadas no projeto encontram-se na pasta:

```text
/sql
```

incluindo:

- consultas_dashboard.sql
- analises_exploratorias.sql

---

# Métricas DAX

Foram desenvolvidas medidas para cálculo de:

- Faturamento Total
- Total de Pedidos
- Clientes Únicos
- Ticket Médio

---

# Principais Insights

Entre os resultados observados durante a análise dos dados destacam-se:

- Forte concentração do faturamento nos estados de São Paulo, Rio de Janeiro e Minas Gerais.
- Cartão de crédito representa a maior parte do faturamento.
- O volume de pedidos entregues é significativamente superior aos demais status.
- Algumas categorias concentram parcela relevante das vendas, permitindo análises de mix de produtos.

---

# Estrutura do Projeto

```text
dashboard-comercial-powerbi
│
├── Projeto Dashboard Comercial.pbix
├── README.md
│
├── images
│   ├── dashboard.png
│   ├── modelagem.png
│   └── logo.png
│
└── sql
    ├── consultas_dashboard.sql
    └── analises_exploratorias.sql
```

---

# Autor

**Alan Bernardo**

Projeto desenvolvido como parte do meu portfólio para a área de Business Intelligence e Análise de Dados.

LinkedIn: https://www.linkedin.com/in/alan-bernardo-silva/

GitHub: https://github.com/alanbernardo