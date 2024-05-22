CREATE TABLE `Order` (
  `OrderID` varchar(255) PRIMARY KEY,
  `OrderDate` datetime,
  `CustomerID` varchar(255),
  `ProductID` varchar(255),
  `Quantity` integer
);

CREATE TABLE `Customer` (
  `CustomerID` varchar(255) PRIMARY KEY,
  `CustomerName` varchar(255),
  `Segment` varchar(255)
);

CREATE TABLE `Product` (
  `ProductID` varchar(255) PRIMARY KEY,
  `ProductName` varchar(255),
  `CataloguePrice` int,
  `SupplierPrice` int,
  `Category` varchar(255),
  `SubCategory` varchar(255)
);

CREATE TABLE `Billing` (
  `BillingID` varchar(255) PRIMARY KEY,
  `OrderID` varchar(255),
  `Sales` int,
  `Discount` float,
  `Profit` int
);

CREATE TABLE `Shipment` (
  `ShipmentID` varchar(255) PRIMARY KEY,
  `AddressID` varchar(255),
  `OrderID` varchar(255),
  `ShipDate` datetime,
  `ShipMode` varchar(255)
);

CREATE TABLE `Address` (
  `AddressID` varchar(255) PRIMARY KEY,
  `CustomerID` varchar(255),
  `Country` varchar(255),
  `City` varchar(255),
  `State` varchar(255),
  `PostalCode` integer,
  `Region` varchar(255)
);

ALTER TABLE `Order` ADD FOREIGN KEY (`CustomerID`) REFERENCES `Customer` (`CustomerID`);

ALTER TABLE `Order` ADD FOREIGN KEY (`ProductID`) REFERENCES `Product` (`ProductID`);

ALTER TABLE `Shipment` ADD FOREIGN KEY (`OrderID`) REFERENCES `Order` (`OrderID`);

ALTER TABLE `Billing` ADD FOREIGN KEY (`OrderID`) REFERENCES `Order` (`OrderID`);

ALTER TABLE `Address` ADD FOREIGN KEY (`CustomerID`) REFERENCES `Customer` (`CustomerID`);

ALTER TABLE `Shipment` ADD FOREIGN KEY (`AddressID`) REFERENCES `Address` (`AddressID`);
