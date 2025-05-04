1). -- Assuming a function like 'STRING_SPLIT' exists
SELECT
    OrderID,
    CustomerName,
    TRIM(value) AS Product
FROM
    ProductDetail
CROSS APPLY STRING_SPLIT(Products, ',');

2) -- Create the new OrderDetails table
CREATE TABLE OrderDetails (
    OrderID INT,
    Product VARCHAR(255) NOT NULL,
    Quantity INT NOT NULL,
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (OrderID) REFERENCES Customers(OrderID)
);

-- Populate the new OrderDetails table
INSERT INTO OrderDetails (OrderID, Product, Quantity)
SELECT OrderID, Product, Quantity
FROM OrderDetails_Old;
