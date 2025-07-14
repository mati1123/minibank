#!/bin/bash

psql -U minibank_admin -d minibank -h 127.0.0.1 -c "SELECT * FROM customers;"

read -p "Enter customer ID: " customer_id
read -p "Enter account type (checking/savings): " account_type
read -p "Enter initial balance: " balance

psql -U minibank_admin -d minibank -h 127.0.0.1 -c "INSERT INTO accounts (customer_id, account_type, balance) VALUES ($customer_id,'$account_type', $balance);"

