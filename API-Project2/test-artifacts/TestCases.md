### Test Cases

| Test Case | Request | Method | Test Data | Expected Status | Expected Response |
|-----------|---------|--------|-----------|-----------------|-------------------|
| TC-01 | Get all products | GET | - | 200 | Array of products |
| TC-02 | Get single product by id | GET | id=3 | 200 | Single product object |
| TC-03 | Get single product by invalid id | GET | id=999 | 404 | id not found |
| TC-04 | Get product by keyword | GET | q=lipstick | 200 | Array of products |
| TC-05 | Get products with limit and selected fields | GET | limit=10<br>skip=10<br>select=title,price  | 200 | Array of product<br>(title,price only) |
| TC-06 | Get product sortBy title | GET | sortBy=title<br>order=asc | 200 | Array of products |
| TC-07 | Get all categories | GET | - | 200 | Array of categories |
| TC-08 | Get category lists | GET | - | 200 | List of category names |
| TC-09 | Get product by category | GET | category=beauty | 200 | Array of products |
| TC-10 | Get product by invalid category   | GET | category=motor | 200 | empty result |
| TC-11 | Add product | POST | title=BMW Pencil | 201 | Single product object with new ID |
| TC-12 | Update product | PUT | id=1 | 200 | Updates success |
| TC-13 | Update product with invalid id | PUT | id=999 | 404 | id not found |
| TC-14 | Add product with empty title  | POST | title=" " | 400 | Validation error |
| TC-15 | Delete product | DELETE | id=1 | 200 | Deleted Successfully |
