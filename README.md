# Momo_Project_Planning

## Project Description

This project is a full-stack application built to process and analyze MoMo SMS transaction data in XML format.

## **The system**:

Extracts raw SMS data.

Cleans and normalizes key details such as transaction amounts, dates, and phone numbers.

Categorizes transactions using defined business rules.

Stores cleaned and structured data in a SQLite relational database for reliability and efficient querying.


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
    




1. **Overview**

This document outlines the relational database design and implementation for processing MoMo SMS transaction data. The system extracts, normalizes, categorizes, and stores transaction records in a SQLite database, with full support for auditability, scalability, and API serialization via JSON. 

The design centers around the transaction as the core entity, linked to users (senders/receivers), multiple categories via a junction table, and system logs for traceability. Raw SMS payloads are preserved for compliance and debugging. 
 
2. **Key Design Decisions**

    Junction Table (transaction_category_map):
    Allows one transaction to belong to multiple categories (e.g., “P2P Transfer” and “Promotional Campaign”). This supports flexible business reporting without schema changes. 

    Raw Payload Storage:
    Each transaction includes the original SMS or XML content. This ensures traceability, debugging capability, and regulatory compliance. 

    Telecom-Standard Field Names:
    Uses msisdn (phone number), external_txn_id (unique reference), and transaction_ts (timestamp) — aligning with industry practices. 

    Auditability via System Logs:
    Every processing step, success, or failure is recorded in the system_logs table with timestamp and severity level. 

    Scalable Structure:
    Designed to easily accommodate future features — such as agent networks, transaction fees, location tracking, or fraud detection — without requiring structural changes. 
     

 
3. **Repository Structure** 

The project files are organized as follows: 

    README.md — This documentation file
    Docs/ERD_diagram.pdf — Entity Relationship Diagram
    database/database_setup.sql — Complete SQLite schema with constraints and sample data
    examples/json_schemas.json — Sample JSON responses for API integration
     

 
4. **Sample Query** 

The following SQL query retrieves all transactions for a given user, whether they were the sender or receiver: 

SELECT t.transaction_id, t.amount, t.currency, t.status, t.transaction_ts
FROM transactions t
JOIN users u ON t.sender_user_id = u.user_id OR t.receiver_user_id = u.user_id
WHERE u.msisdn = '+250788123456'
ORDER BY t.transaction_ts DESC; 
 
5. **Data Integrity and Security Rules**

    Amount values are validated to be >= 0
    MSISDN (phone number) and external transaction ID are unique
    Currency codes are validated to be exactly 3 characters
    Indexes are created on frequently queried fields: transaction_ts, status, msisdn
    Foreign key constraints enforce referential integrity
    All system events are logged for audit purposes
     

 
6. **JSON Serialization** 

The file examples/json_schemas.json contains a sample API response that includes: 

    Sender and receiver user details
    An array of categories (supporting multiple tags per transaction)
    An array of system logs
    The original raw SMS payload
    ISO 8601 formatted timestamps
     

This structure is designed for efficient API delivery, minimizing client-side processing and delivering full context in one response. 
 

 
7. **Submission Checklist**

    ERD diagram included at Docs/ERD_diagram.pdf
    SQL script provided at database/database_setup.sql
    JSON examples included at examples/json_schemas.json
    README.md updated and finalized
    Scrum board updated with Week 2 completed tasks
    Team contributions visible through GitHub commit history
     

 
  ## Member List

**Group 12**

1. Honette Marie Ihozo  
2. Vanessa Umwari  
3. Laura Karangwa Kwizera  

