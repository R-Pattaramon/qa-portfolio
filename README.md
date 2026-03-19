# qa-portfolio

#Project 2

#Test plan

- Objective: ทดสอบการเรียกดูบทความ เจ้าของบทความ และคอมเม้นท์
- Scope: ครอบคลุมการโพส และการเรียกดูข้อมูล
- Out of scope: ไม่ทดสอบเกี่ยวกับความปลอดภัย
- Tools: Postman
- Test types: Functional, Error handling

#Test Scenario
- ผู้ใช้ดูรายการบทความทั้งหมด
- ผู้ใช้ดูบทความจากไอดีผู้เขียน
- ผู้ใช้เปิดบทความที่ไม่มีอยู่จริง
- ผู้ใช้ดู comment ของบทความ
- ผู้ใช้หาคอมเม้นท์บทความ
- ผู้ใช้สร้างบทความใหม่ด้วยข้อมูลครบถ้วน
- ผู้ใช้สร้างบทความโดยไม่ใส่ title
- ผู้ใช้แก้ไขบทความ
- ผู้ใช้ลบบทความ

### Test Cases

| # | Request | Method | Expected Status |
|---|---------|--------|----------------|
| 1 | Get all post | GET | 200 |
| 2 | Filter post by id | GET | 200 |
| 3 | Get non-existing post by id | GET | 404 |
| 4 | Get comment | GET | 200 |
| 5 | Filter comment | GET | 200 |
| 6 | Create posts  | POST | 400 |
| 7 | Create posts by title null  | POST | 201 |
| 8 | Delete posts by id | DELETE | 201 |


#Bug ID: BUG-001
- **Title: POST /posts ไม่ validate required field**
- Severity: Medium
- Steps to reproduce:
  1. ส่ง POST /posts โดยไม่ใส่ title
  2. ดู response
- Expected: ได้ 400 Bad Request
- Actual: ได้ 201 Created (ไม่มีการ validate)
