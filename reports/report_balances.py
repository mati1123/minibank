import psycopg2


conn = psycopg2.connect("dbname=minibank user=minibank_admin password=insertpassword host=127.0.0.1")


cur = conn.cursor()




cur.execute("""
    SELECT c.full_name, SUM(t.amount) AS saldo
    FROM customers c
    JOIN accounts a ON c.id = a.customer_id
    JOIN transactions t ON a.id = t.account_id
    GROUP BY c.full_name;
""")
rows = cur.fetchall()





output_path = "/data/risk/balances.txt"

with open(output_path, "w") as f:
    f.write("Kundnamn\tSaldo\n")
    f.write("------------------------\n")
    for row in rows:
        name, saldo = row
        f.write(f"{name}\t{saldo:.2f}\n")

print(f"Rapport sparad till {output_path}.")
