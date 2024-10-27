CREATE TABLE Dimension_City (
    CityID INT PRIMARY KEY,
    CityName NVARCHAR(100),
    StateProvince NVARCHAR(100),
    Country NVARCHAR(100),
    Continent NVARCHAR(100)
);

CREATE TABLE Dimension_Customer (
    CustomerID INT PRIMARY KEY,
    CustomerName NVARCHAR(100),
    CityID INT FOREIGN KEY REFERENCES Dimension_City(CityID),
    Category NVARCHAR(50),
    CreditRating INT
);

CREATE TABLE Dimension_Date (
    DateID INT PRIMARY KEY,
    Date DATE,
    Day INT,
    Month INT,
    Quarter INT,
    Year INT
);

CREATE TABLE Dimension_Employee (
    EmployeeID INT PRIMARY KEY,
    EmployeeName NVARCHAR(100),
    JobTitle NVARCHAR(50),
    Department NVARCHAR(50)
);

CREATE TABLE Dimension_Supplier (
    SupplierID INT PRIMARY KEY,
    SupplierName NVARCHAR(100),
    CityID INT FOREIGN KEY REFERENCES Dimension_City(CityID),
    CreditRating INT
);

CREATE TABLE Dimension_Product (
    ProductID INT PRIMARY KEY,
    ProductName NVARCHAR(100),
    Category NVARCHAR(50),
    UnitPrice DECIMAL(18, 2),
    SupplierID INT FOREIGN KEY REFERENCES Dimension_Supplier(SupplierID)
);

CREATE TABLE Fact_Sales (
    SaleID INT PRIMARY KEY,
    DateID INT FOREIGN KEY REFERENCES Dimension_Date(DateID),
    CustomerID INT FOREIGN KEY REFERENCES Dimension_Customer(CustomerID),
    ProductID INT FOREIGN KEY REFERENCES Dimension_Product(ProductID),
    Quantity INT,
    TotalSaleAmount DECIMAL(18, 2)
);

CREATE TABLE Fact_Orders (
    OrderID INT PRIMARY KEY,
    DateID INT FOREIGN KEY REFERENCES Dimension_Date(DateID),
    CustomerID INT FOREIGN KEY REFERENCES Dimension_Customer(CustomerID),
    EmployeeID INT FOREIGN KEY REFERENCES Dimension_Employee(EmployeeID),
    TotalOrderAmount DECIMAL(18, 2)
);

CREATE TABLE Fact_StockHolding (
    StockHoldingID INT PRIMARY KEY,
    ProductID INT FOREIGN KEY REFERENCES Dimension_Product(ProductID),
    QuantityOnHand INT,
    WarehouseLocation NVARCHAR(100)
);

CREATE TABLE Fact_PurchaseOrders (
    PurchaseOrderID INT PRIMARY KEY,
    DateID INT FOREIGN KEY REFERENCES Dimension_Date(DateID),
    SupplierID INT FOREIGN KEY REFERENCES Dimension_Supplier(SupplierID),
    ProductID INT FOREIGN KEY REFERENCES Dimension_Product(ProductID),
    Quantity INT,
    TotalPurchaseAmount DECIMAL(18, 2)
);
