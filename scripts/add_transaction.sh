#!/bin/bash

psql -U minibank_admin -d minibank -h 127.0.0.1 -c "SELECT * FROM accounts;"

read -p "Enter account ID: " account_id 
read -p "Enter ammount(use minus for withdrawal or normal for deposit): " amount
read -p "Enter transaction type(deposit/withdrawal): " transaction_type

psql -U minibank_admin -d minibank -h 127.0.0.1 -c "INSERT INTO transactions (account_id, amount, transaction_type) VALUES ($account_id, $amount, '$transaction_type');"

