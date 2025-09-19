-- database_setup.sql
-- MoMo SMS Database Schema

CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    phone_number VARCHAR(20) UNIQUE NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT chk_phone CHECK (phone_number <> '')
);

CREATE TABLE Transaction_Categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL,
    description VARCHAR(200)
);

CREATE TABLE Transactions (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    sender_id INT NOT NULL,
    receiver_id INT NOT NULL,
    category_id INT NOT NULL,
    amount DECIMAL(10,2) CHECK (amount > 0),
    status VARCHAR(20) CHECK (status IN ('SUCCESS','FAILED','PENDING')),
    transaction_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (sender_id) REFERENCES Users(user_id),
    FOREIGN KEY (receiver_id) REFERENCES Users(user_id),
    FOREIGN KEY (category_id) REFERENCES Transaction_Categories(category_id)
);

CREATE TABLE Transaction_Logs (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    transaction_id INT NOT NULL,
    log_message VARCHAR(255),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (transaction_id) REFERENCES Transactions(transaction_id)
);

-- Insert sample users
INSERT INTO Users (full_name, phone_number) VALUES
('Alice Uwase', '+250788111111'),
('Brian Mugisha', '+250788222222'),
('Claire Umutoni', '+250788333333'),
('David Irakoze', '+250788444444'),
('Eva Kamikazi', '+250788555555');

-- Insert sample categories
INSERT INTO Transaction_Categories (category_name, description) VALUES
('Payment', 'Payments for goods or services'),
('Transfer', 'Peer-to-peer transfers'),
('Deposit', 'Mobile money deposits'),
('Withdrawal', 'Cash withdrawals'),
('Airtime', 'Airtime top-up');

-- Insert sample transactions
INSERT INTO Transactions (sender_id, receiver_id, category_id, amount, status) VALUES
(1, 2, 1, 5000.00, 'SUCCESS'),
(2, 3, 2, 2500.00, 'SUCCESS'),
(3, 4, 3, 10000.00, 'PENDING'),
(4, 5, 4, 2000.00, 'FAILED'),
(5, 1, 5, 1500.00, 'SUCCESS');

-- Insert logs
INSERT INTO Transaction_Logs (transaction_id, log_message) VALUES
(1, 'Transaction parsed successfully'),
(2, 'Transaction inserted into DB'),
(3, 'Transaction pending verification'),
(4, 'Transaction failed due to insufficient funds'),
(5, 'Transaction completed and confirmed');
