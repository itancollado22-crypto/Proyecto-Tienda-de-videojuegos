# Product Database Schema

## Tables

### Category
Stores product categories.

### Brand
Stores manufacturer or brand information.

### Product
Stores all product information.

### Tag
Stores searchable product tags.

### ProductTag
Many-to-many relationship between Product and Tag.

---

## Performance Indexes

idx_product_name
Allows fast product searches by name.

idx_product_category
Improves filtering by category.

idx_product_brand
Improves filtering by brand.

idx_product_price
Speeds up searches ordered or filtered by price.

idx_product_stock
Improves inventory queries.

idx_product_category_brand
Optimizes searches combining category and brand.