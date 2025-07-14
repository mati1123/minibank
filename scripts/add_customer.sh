#!/bin/bash

read -p "Enter full name: " name

read -p "Enter email: " email


psql -U minibank_admin -d minibank -h 127.0.0.1 -c "INSERT INTO customers (full_name, email) VALUES ('$name', '$email');"

