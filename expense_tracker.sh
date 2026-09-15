#!/bin/bash

EXPENSE_FILE="expenses.txt"

echo "===== Student Expense Tracker ====="
echo "Track your daily spending easily!"
echo "1. Add Expense"
echo "2. View Expenses"
echo "3. Calculate Total"
echo "4. Exit"

read -p "Enter your choice: " choice

case $choice in
    1)
        read -p "Enter expense name: " name
        read -p "Enter amount: " amount
        echo "$name - Rs.$amount" >> "$EXPENSE_FILE"
        echo "Expense added successfully."
        ;;
    2)
        echo "===== Your Expenses ====="
        if [ -f "$EXPENSE_FILE" ]; then
            cat "$EXPENSE_FILE"
        else
            echo "No expenses found."
        fi
        ;;
    3)
        if [ -f "$EXPENSE_FILE" ]; then
            total=$(awk -F'Rs\\.' '{sum += $2} END {print sum+0}' "$EXPENSE_FILE")
            echo "Total expenses: Rs.$total"
        else
            echo "Total expenses: Rs.0"
        fi
        ;;
    4)
        echo "Thank you for using Student Expense Tracker!"
        ;;
    *)
        echo "Invalid choice."
        ;;
esac
