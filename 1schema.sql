use clone;

/*          CREATEING TABLE FOR USER LOGIN           */
CREATE TABLE `clone`.`user`
( 
	`Uid` INT NOT NULL PRIMARY KEY AUTO_INCREMENT ,
	`First_Name` VARCHAR(20) NOT NULL,
    `Last_Name` VARCHAR(20) NOT NULL,
     `Email` VARCHAR(45) NOT NULL,
    `User_Name` VARCHAR(20) NOT NULL,
    `Password` VARCHAR (20) NOT NULL,
	UNIQUE INDEX `Email` (`Email` ASC) VISIBLE,
    UNIQUE INDEX `Uid` (`Uid` ASC) VISIBLE, 
    UNIQUE INDEX `User_Name` (`User_Name` ASC) VISIBLE
);

/*        CREATING MERGE TABLE FOR AUCTION AND SELLER   */
CREATE TABLE `clone`.`Auctions`
(
	`Auction_Num` INT NOT NULL AUTO_INCREMENT,
	`Uid` INT NOT NULL,
    `Start_Date_Time` DATETIME NOT NULL,
    `End_Date_Time` DATETIME NOT NULL,
    `Minimum_Amount` DOUBLE NOT NULL,
    `Increment_Amount` DOUBLE,
    `Lowest_Price` DOUBLE,
    `Initial_Price` DOUBLE NOT NULL,
    `Winner` VARCHAR(20),
    `Winning_Price` DOUBLE NOT NULL,
    `Winning_Bid` VARCHAR(20),
    PRIMARY KEY (Auction_Num),
	FOREIGN KEY (Uid) REFERENCES `clone`.`user`(`Uid`)
);

/*        CREATING TABLE FOR BUYER BIDS           */
CREATE TABLE `clone`.`buyer_Bids`
(
	`Uid` INT NOT NULL,
	`Auction_Num` INT NOT NULL,
	`Bid_Num` INT NOT NULL AUTO_INCREMENT,
    `Bid_Price` DOUBLE NOT NULL,
	`Date_Time` DATETIME NOT NULL,
	`Upper_Limit` VARCHAR(50) NOT NULL,
    PRIMARY KEY (Bid_Num),
	FOREIGN KEY(Uid) REFERENCES `clone`.`user`(`Uid`),
    FOREIGN KEY(Auction_Num) REFERENCES `clone`.`auctions`(`Auction_Num`)
);

/*    CREATING ACUTION AND BUYER_BID TABLE  */
CREATE TABLE `clone`.`buyer_Bid_Auction`
(
	`Auction_Num` INT NOT NULL,
	`Bid_Num` INT NOT NULL,
    `Uid` INT NOT NULL,
    PRIMARY KEY (Auction_Num, Bid_Num),
	FOREIGN KEY (Auction_Num) REFERENCES `clone`.`auctions`(`Auction_Num`),
    FOREIGN KEY(Bid_Num) REFERENCES `clone`.`buyer_Bids`(`Bid_Num`),
    FOREIGN KEY(Uid) REFERENCES `clone`.`user`(`Uid`)
);


/*            CREATING TABLE FOR EMPLOYEE LOGIN  (USED IS REALTIONSHIP MERGE RULE ) 
(Merge Rule for employee, admistrator, and customer Rep)    */
CREATE TABLE `clone`.`employee`
( 
	`Employee_Id` INT NOT NULL AUTO_INCREMENT,
	`Full_Name` VARCHAR(20) NOT NULL,
	`Email` VARCHAR(45) NOT NULL,
    `User_Name` VARCHAR(20) NOT NULL,
    `Password` VARCHAR (20) NOT NULL,
    PRIMARY KEY (Employee_Id),
	UNIQUE INDEX `User_Name` (`User_Name` ASC) VISIBLE,
    UNIQUE INDEX `Email` (`Email` ASC) VISIBLE
);

/*			CREATING TABLE FOR MANAGES		*/
CREATE TABLE `clone`.`Manages`
( 
	`Employee_Id` INT NOT NULL,
	`Uid` INT NOT NULL,
    `Bid_Num` INT NOT NULL,
    `Auction_Num` INT NOT NULL,
    PRIMARY KEY (Auction_Num, Bid_Num, Uid, Employee_Id),
    FOREIGN KEY (Auction_Num) REFERENCES `clone`.`auctions`(`Auction_Num`),
    FOREIGN KEY(Bid_Num) REFERENCES `clone`.`buyer_Bids`(`Bid_Num`),
    FOREIGN KEY(Uid) REFERENCES `clone`.`user`(`Uid`),
    FOREIGN KEY(Employee_Id) REFERENCES `clone`.`Employee`(`Employee_Id`)
);

/*              CREATING TABLE FOR QUESTIONS  */

CREATE TABLE `clone`.`questions`
( 
	`Q_Id` INT NOT NULL AUTO_INCREMENT,
	`Question` VARCHAR(5000) NOT NULL,
    `Answer` VARCHAR(5000),
    PRIMARY KEY (Q_Id)
);

/*           	CREATING TABLE FOR USER_QUESTION (ASK)     */

CREATE TABLE `clone`.`Asks`
( 
	`Uid` INT NOT NULL,
	`Q_Id` INT,
    PRIMARY KEY (Uid, Q_Id),
	FOREIGN KEY(Uid) REFERENCES `clone`.`user`(`Uid`),
    FOREIGN KEY(Q_Id) REFERENCES `clone`.`questions`(`Q_Id`)
);

/*           	CREATING TABLE FOR Employee_QUESTION (Reviews)      */

CREATE TABLE `clone`.`Reviews`
( 
	`Employee_Id` INT NOT NULL,
	`Q_Id` INT,
    PRIMARY KEY (Employee_Id, Q_Id),
	FOREIGN KEY(Employee_Id) REFERENCES `clone`.`employee`(`Employee_Id`),
    FOREIGN KEY(Q_Id) REFERENCES `clone`.`questions`(`Q_Id`)
	
);

/*           CREATING TABLE FOR PRODUCTS          */
CREATE TABLE `clone`.`product`
(
	`Name` VARCHAR(50) NOT NULL,
	`Serial_Num` VARCHAR(20) NOT NULL,
    `Description` VARCHAR(2000) NOT NULL,
	`Price` DOUBLE NOT NULL,
    `Quantity` INT NOT NULL,
    `Type` VARCHAR (10) NOT NULL,
    PRIMARY KEY (Serial_Num),
	UNIQUE INDEX `Serial_Num`(`Serial_Num` ASC)VISIBLE
);

/*  	 CREATING PRODUCT AND AUCTION TABLE (FOR)    */
CREATE TABLE `clone`.`Product_For_Acution`
(
	`Auction_Num` INT NOT NULL,
    `Serial_Num` VARCHAR(20) NOT NULL,
    PRIMARY KEY (Serial_Num, Auction_Num),
	FOREIGN KEY (Auction_Num) REFERENCES `clone`.`auctions`(`Auction_Num`),
    FOREIGN KEY(Serial_Num) REFERENCES `clone`.`product`(`Serial_Num`)
);

/*		CREATING TABLE FOR ALERTS		*/
CREATE TABLE `clone`.`Alerts`
(
	`AlertMessage` VARCHAR(20) NOT NULL,
    `AlertsID` INT NOT NULL AUTO_INCREMENT,
    `AlertProduct` VARCHAR(50) NOT NULL,
    `Bid_Num` INT NOT NULL,
    `Auction_Num` INT NOT NULL,
    `Uid` INT NOT NULL,
    `Serial_Num` VARCHAR(20) NOT NULL,
    PRIMARY KEY (AlertsID),
    FOREIGN KEY (Auction_Num) REFERENCES `clone`.`auctions`(`Auction_Num`),
    FOREIGN KEY(Serial_Num) REFERENCES `clone`.`product`(`Serial_Num`),
    FOREIGN KEY(Uid) REFERENCES `clone`.`user`(`Uid`),
    FOREIGN KEY(Bid_Num) REFERENCES `clone`.`buyer_Bids`(`Bid_Num`)
);