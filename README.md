# qa-portfolio

## Project 1: JSONPlaceholder API Testing

**Tools:** Postman  
**API:** jsonplaceholder.typicode.com  

### What I tested
- Happy path: GET users, filter by ID
- Error handling: Non-existing resource (404)
- Create resource: POST with dynamic data

### Test Cases
| # | Request | Method | Expected Status |
|---|---------|--------|----------------|
| 1 | Get all users | GET | 200 |
| 2 | Get user by ID | GET | 200 |
| 3 | Get non-existing user | GET | 404 |
| 4 | Create new post | POST | 201 |
| 5 | Filter posts by userId | GET | 200 |
