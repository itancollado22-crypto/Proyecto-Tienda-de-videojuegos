-- ==========================================
-- Database Schema
-- Tables:
-- Category
-- Brand
-- Product
-- Tag
-- ProductTag
-- ==========================================

CREATE TABLE Category (
    CategoryID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Description TEXT,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Brand (
    BrandID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Description TEXT,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Product (
    ProductID INT PRIMARY KEY AUTO_INCREMENT,
    CategoryID INT NOT NULL,
    BrandID INT NOT NULL,
    Name VARCHAR(150) NOT NULL,
    Description TEXT,
    Price DECIMAL(10,2) NOT NULL,
    Stock INT DEFAULT 0,
    ImageURL VARCHAR(255),
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (CategoryID)
        REFERENCES Category(CategoryID),

    FOREIGN KEY (BrandID)
        REFERENCES Brand(BrandID)
);

CREATE TABLE Tag (
    TagID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL
);

CREATE TABLE ProductTag (
    ProductID INT,
    TagID INT,

    PRIMARY KEY (ProductID, TagID),

    FOREIGN KEY (ProductID)
        REFERENCES Product(ProductID),

    FOREIGN KEY (TagID)
        REFERENCES Tag(TagID)
);

-- ==========================================
-- Performance Indexes
-- ==========================================

-- Search products by name
CREATE INDEX idx_product_name
ON Product(Name);

-- Filter by category
CREATE INDEX idx_product_category
ON Product(CategoryID);

-- Filter by brand
CREATE INDEX idx_product_brand
ON Product(BrandID);

-- Search by price
CREATE INDEX idx_product_price
ON Product(Price);

-- Search by stock
CREATE INDEX idx_product_stock
ON Product(Stock);

-- Combined search
CREATE INDEX idx_product_category_brand
ON Product(CategoryID, BrandID);
