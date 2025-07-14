# Mini Bank – Simulerad bankmiljö med Linux, PostgreSQL, Bash och Python

Detta projekt är en övningsmiljö som simulerar en enkel banklösning. Det omfattar användar- och rättighetshantering i Linux, en PostgreSQL-databas med kundinformation, samt automatisering med Bash och Python.

---

## 🔧 Steg 1 – Linuxmiljö & behörighet

Projektet inleddes med att simulera en säker servermiljö där känslig finansiell data bara får hanteras av specifika användare.

### 👥 Användare & grupper
- Skapade användare: `admin`, `analyst`, `auditor`
- Skapade grupp: `risk`
- Lade alla tre användare i gruppen `risk`

### 📁 Rättigheter
- Skapade mapp: `/data/risk`
- Satt ägare till `root:risk`
- Satt rättigheter: `chmod 2770 /data/risk`
- Aktiverade `setgid` med `chmod g+s /data/risk`

### 🧪 Syfte
Endast medlemmar i gruppen `risk` kan läsa/skriva i mappen. Alla filer som skapas där ärvs automatiskt med gruppen `risk`.

---
## 🧩 Steg 2 – Databas

Databasen består av tre relaterade tabeller med primär- och främmande nycklar för dataintegritet:

customers
Innehåller kundinformation:

id (primärnyckel)

full_name, email

created_at (automatisk tidsstämpel)


accounts
Kopplas till customers:

id (primärnyckel)

customer_id (foreign key → customers.id)

account_type, balance, created_at

transactions
Kopplas till accounts:

id (primärnyckel)

account_id (foreign key → accounts.id)

amount, transaction_type, created_at

Alla datumfält (created_at) sätts automatiskt till aktuell tid.
---

## 🔁 Steg 3 – Automation med Bash

För att enkelt lägga till data skapades tre Bash-skript:

- `add_customer.sh` – lägger till ny kund  
- `add_account.sh` – lägger till konto till kund  
- `add_transaction.sh` – lägger till transaktion till konto

Skripten använder `psql` och `read` för att interaktivt fråga efter information och köra SQL-kommandon.

---

## 📊 Steg 4 – Rapportering med Python

Python-skriptet `report_balances.py` ansluter till databasen och hämtar kundernas totala saldo. Resultatet sparas i:
Resultatet sparas i: `/data/risk/balances.txt`

---




## 🧱 Funktioner

- ✅ Användarhantering med rättigheter via grupper
- ✅ PostgreSQL-databas med kunder, konton och transaktioner
- ✅ Bash-skript för att lägga till data
- ✅ Python-skript som genererar rapport till `/data/risk`

---

## 📁 Mappstruktur
mini-bank/
├── scripts/
│   ├── add_customer.sh
│   ├── add_account.sh
│   └── add_transaction.sh
├── reports/
│   └── report_balances.py
└── README.md
# Obs: /data/risk/ är utanför projektmappen och används för att spara rapporter


