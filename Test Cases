### Test Cases

| # | Request | Method | Test Data | Expected Status | Expected Response |
|---|---------|--------|-----------|-----------------|-------------------|
| 1 | Get all post | GET | - | 200 | Array of posts |
| 2 | Filter post by id | GET | id=1 | 200 | Single post object |
| 3 | Get non-existing post by id | GET | id=101 | 404 | {} empty object |
| 4 | Get comment | GET | id=1 | 200 | Array of comments |
| 5 | Filter comment | GET | postId=2 | 200 | Array of comments |
| 6 | Create posts  | POST |title,body,userId| 201 | Created object with id |
| 7 | Create posts (no title)  | POST | body,userId | 400 | Error message |
| 8 | Delete posts by id | DELETE | - | 200 | Success |


