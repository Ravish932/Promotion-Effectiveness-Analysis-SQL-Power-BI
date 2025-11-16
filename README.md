# AtliQ Mart Promotional Campaign Analysis

## 📋 Overview

Analysis of promotional campaigns (Diwali 2023 & Sankranti 2024) for AtliQ Mart's 50+ supermarkets across Southern India. This project helps the Sales Director identify which promotions performed well to optimize future campaigns.

---

## 📊 Dashboard Preview

![Store Performance Analysis](Dashboard%20Image/Store%20Performance%20Analysis.png)

**Key Insights:**
- **Top 10 Stores by IR**: STMYS-1 (Mysuru, ₹4.92M), STCHE-4 (Chennai, ₹4.83M), STBLR-0 (Bengaluru, ₹4.76M)
- **Bottom 10 Stores by IUS**: STCBE-4 (Coimbatore, 5.94K), STVID-0 (Vijayawada, 5.87K), STMLR-2 (Mangalore, 5.88K)
- **City Performance**: Bengaluru leads with ₹71M total revenue, followed by Chennai (₹57M) and Hyderabad (₹45M)
- **Store Distribution**: Bengaluru has 10 stores with highest collective revenue, while Trivandrum has lowest with ₹7M
- **Category Insights**: Combo products perform best in Bengaluru (₹22M), followed by Grocery & Staples in Chennai (₹18M)
- **Key Finding**: Top-performing stores are concentrated in Tier-1 cities (Bengaluru, Chennai, Hyderabad)
---


### Promotion Type Analysis  
![Promotion Type Analysis](Dashboard%20Image/Promotion%20Type%20Analysis.png)

**Key Insights:**
- **Cashback Promo Dominance**: Generated ₹91M IR with 41K units sold, capturing 53.43% of total post-promo revenue (₹157.95M)
- **BOGOF Performance**: Best for volume with 431K units sold (highest IUS) but lower IR (₹69M) compared to Cashback
- **Discount Strategy Failure**: 25% OFF, 33% OFF, and 50% OFF combined generated only ₹28K IR, indicating poor customer response
- **Revenue vs Volume Trade-off**: Cashback Promo maximizes revenue (₹91M) while BOGOF maximizes units (431K)
- **Promotion Mix**: 500 Cashback promotion generated ₹91M IR, proving direct cash incentives outperform percentage-based discounts
- **Post-Promo Revenue Distribution**: Cashback (53.43%), BOGOF (32.22%), Discount Promo (14.35%)
- **Recommendation**: Prioritize Cashback and BOGOF for future campaigns; reconsider heavy discount strategies

---

### Product & Category Analysis
![Product & Category Analysis](Dashboard%20Image/Product%20&%20Category%20Analysis.png)

**Key Insights:**
- **Top Product by IUS**: Atliq High Glo 15W LED Bulb (52K units) - Home Appliances category
- **Top Product by Revenue**: Atliq Home Essential 8 Product Combo (₹91M IR) - combo strategy works best
- **Category Performance**: Grocery & Staples leads with 250K incremental units, followed by Home Appliances (93K) and Home Care (52K)
- **Revenue Leaders**: Home Essential Combo (₹91M), Waterproof Immersion Rod (₹18M), Farm Chakki Atta (₹17M)
- **Volume Leaders**: High Glo LED Bulb (52K), Curtains (28K), Sonamasuri Rice (16K)
- **Pre vs Post Promo**: Quantity surged from 209K to 651K units (211% increase) with revenue jumping from ₹141M to ₹295.61M
- **Combo Strategy Success**: Product bundles generate higher IR (₹91M) compared to individual products
- **Best Performing Combo**: Atliq Home Essential 8 Product Combo consistently tops both revenue and volume metrics
---

## 🎯 Key Findings

| Metric | Value |
|--------|-------|
| **Incremental Revenue (IR)** | ₹154.91M |
| **Incremental Units Sold (IUS)** | 441.68K |
| **Total Revenue** | ₹436.31M |

### Top Performers
- **Best Promotion**: Cashback Promo (₹91M IR, 53.43% revenue share)
- **Best for Volume**: BOGOF (431K units)
- **Top Store**: STMYS-1, Mysuru (₹4.92M IR)
- **Top City**: Bengaluru

### Key Insights
✅ Cashback & BOGOF outperform discount-based promos  
✅ Grocery & Staples category shows highest sales lift  
✅ Geographic performance varies significantly by city  
✅ Product combos generate highest incremental revenue  

---

## 📁 Project Structure

```
├── dashboards/          # Power BI files
├── sql_queries/         # SQL analysis queries
├── data/               # Raw promotional data
└── README.md           # This file
```

---

## 🛠️ Tech Stack

- **Database**: SQL SERVER
- **Query Language**: SQL
- **Visualization**: Power BI
- **Tools**: Workbench, Excel

---

## 💡 Recommendations

1. **Scale Cashback & BOGOF**: Drive both revenue and volume
2. **Review Discount Strategy**: Deep discounts underperforming
3. **Focus on Top Cities**: Replicate Bengaluru/Chennai success
4. **Prioritize Grocery & Staples**: Highest impact category
