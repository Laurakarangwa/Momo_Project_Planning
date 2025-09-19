CREATE TABLE `Customer` (
  `customerId` Int,
  `first_name` VARCHAR(100),
  `last_name` VARCHAR(100),
  `phone_number` INT,
  `status` enum,
  `balance` Decimal,
  PRIMARY KEY (`customerId`)
);

CREATE TABLE `Transaction` (
  `Transaction_id` INT,
  `Amount` DECIMAL(10,2),
  `Sender_Id` INT,
  `receiver_id` INT,
  `Timestamp` DAYTIME,
  `Currency` VARCHAR(25),
  `Status` enum,
  `Category_id` INT,
  PRIMARY KEY (`Transaction_id`),
  FOREIGN KEY (`Sender_Id`)
      REFERENCES `Customer`(`customerId`)
);

CREATE TABLE ` Log` (
  `log_id` INT,
  `Transaction_id` INT,
  `log_message` VARCHAR(100),
  `log_timestamp` (DATATIME),
  `Severity` VARCHAR(100),
  PRIMARY KEY (`log_id`)
);

CREATE TABLE `Transaction_categories` (
  `Category_id` INT,
  `Category_name` VARCHAR(50),
  `Discription` VARCHAR(100),
  PRIMARY KEY (`Category_id`),
  FOREIGN KEY (`Category_name`)
      REFERENCES `Transaction`(`Transaction_id`)
);

