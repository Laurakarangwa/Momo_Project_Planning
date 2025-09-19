# Momo_Project_Planning

## Project Description

This project is a full-stack application built to process and analyze MoMo SMS transaction data in XML format.

## **The system**:

Extracts raw SMS data.

Cleans and normalizes key details such as transaction amounts, dates, and phone numbers.

Categorizes transactions using defined business rules.

Stores cleaned and structured data in a SQLite relational database for reliability and efficient querying.

## Member List

**Group 12**

1. Honette Marie Ihozo  
2. Vanessa Umwari  
3. Laura Karangwa Kwizera  

## Project Resources

- **Task Management:** We are using [GitHub Projects](https://github.com/users/Laurakarangwa/projects/1/views/1) as our primary tool for managing tasks, tracking progress, and organizing workflows.  
- **System Architecture:** We are designing and maintaining our system architecture diagrams using [SYSTEM ARCHITECTURE](https://drive.google.com/file/d/11LdOXVNF3nScqXePt6HWnHkXc7IO37vN/view?ts=68c07537).

# **Database Design**

**ERD (Entity-Relationship Diagram)**

Diagram stored in /docs/erd_diagram.png.

Core entities: Users, Transactions, Transaction_Categories, and Transaction_Logs.

# **Relationships:**

A User can send/receive many Transactions.

A Transaction belongs to a Category.

A Transaction generates multiple Logs for system monitoring.

**Design Rationale**

Our design focuses on data integrity, normalization, and scalability:

Each entity has a primary key (PK).

Foreign keys (FKs) enforce referential integrity.

Constraints like CHECK (amount > 0) and UNIQUE(phone_number) ensure data accuracy and prevent duplicates.

The schema allows efficient querying and supports both analytical and operational needs.

**Momo_Project_Planning/**
│
├── README.md                # Project documentation
├── docs/
│   └── erd_diagram.png      # ERD for database design
├── database/
│   └── database_setup.sql   # SQL schema and sample data
├── examples/
│   └── json_schemas.json    # JSON representations of entities
└── .github/
    └── project-board        # GitHub Projects task tracking
    
## **Database Schema**

**Core Tables**

Users – stores mobile users (senders/receivers).

Transaction_Categories – defines transaction types (Payments, Transfers, etc.).

Transactions – records details of each SMS transaction.

Transaction_Logs – tracks parsing, validation, and processing steps.

-- Select successful transactions
SELECT * FROM Transactions WHERE status = 'SUCCESS';

-- Update transaction status
UPDATE Transactions SET status = 'SUCCESS' WHERE transaction_id = 5;

-- Delete failed transactions
DELETE FROM Transactions WHERE status = 'FAILED';

-- Join users with their transactions
SELECT u.full_name, t.amount, t.status
FROM Transactions t
JOIN Users u ON t.sender_id = u.user_id;

## **Data Accuracy and Security Rules
**
CHECK constraints enforce valid amounts and status values.

UNIQUE constraints maintain distinct user phone numbers.

Foreign keys ensure relational integrity.

Timestamps provide auditability of user creation, transactions, and logs.

## **Next Steps
**
Implement database queries into the backend application.

Connect XML parsing scripts to database insertion functions.

Test the database with larger sample SMS datasets.

Prepare APIs for external data access and reporting.

