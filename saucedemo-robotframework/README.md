# Saucedemo Test Automation Project
## Overview
###### โปรเจกต์นี้เป็นการฝึกทดสอบระบบ Web Application (Saucedemo) โดยใช้ Robot Framework + SeleniumLibrary

โดยครอบคลุม:
* Functional Testing
* Negative Testing
* Basic Test Automation
---
### Objective
* ฝึกออกแบบ Test Case จาก Requirement
* ฝึกเขียน Automation Test ด้วย Robot Framework
* ฝึกการเลือก Locator ที่เหมาะสม (id, css, data-test)
* เรียนรู้การตรวจสอบพฤติกรรมของระบบ (System Behavior)
---
### Tools & Technologies
* Robot Framework
* SeleniumLibrary
* Python
* Chrome Browser
* Chrome DevTools
---
### Project Structure
```
saucedemo-robotframework/
├── Master_resources.robot
├── Resources/
│   ├── Common_keywords.robot
│   ├── Login_keywords.robot
│   ├── Login_variables.robot
│   ├── Inventory_keywords.robot
│   ├── Inventory_variables.robot
│   ├── Checkout_keywords.robot
│   └── Checkout_variables.robot
├── Testcases/
│   ├── Login_testcase.robot
│   ├── Inventory_testcase.robot
│   └── Checkout_testcase.robot
├── TestArtifacts/
│   ├── Test_Scenario_saucedemo.xlsx
│   └── Test_Case_saucedemo.xlsx
└── results/
```
---
### How to Run
1. ติดตั้ง dependencies
2. pip install robotframework
3. pip install robotframework-seleniumlibrary
4. รัน test ทั้งหมด
5. robot -d results Testcases/
--- 
### เปิดผลลัพธ์
* results/report.html
* results/log.html
---
### Test Coverage
**Login**
* Login สำเร็จ
* Username / Password ไม่ถูกต้อง
* Required field validation
  
**Inventory**
* แสดงรายการสินค้า
* Sorting (A-Z, Z-A, Price)
* Add / Remove สินค้า
  
**Checkout**
* กรอกข้อมูลครบถ้วน
* Required field validation
* Flow การสั่งซื้อ
---    
### Bug Report & Observations
**สิ่งที่พบระหว่างการทดสอบ**
1. ระบบสามารถรับค่า First Name ที่มีอักขระพิเศษได้
2. ไม่มีการตรวจสอบ format ของข้อมูล (เช่น postal code)
3. ไม่มี error message สำหรับข้อมูลที่ไม่เหมาะสม
   
**หมายเหตุ**
ข้อสังเกตเหล่านี้เป็นการมองในมุมของการปรับปรุงระบบ ไม่ได้ส่งผลให้ flow หลักของระบบใช้งานไม่ได้

**สิ่งที่ได้เรียนรู้จากโปรเจกต์นี้**
1. การออกแบบ test case จาก behavior ของระบบจริง
2. ความแตกต่างระหว่าง
* การ block input
* การ validate หลัง submit
3. การเลือก locator ให้เหมาะสมและ stable
4. การจัดโครงสร้าง test automation ให้แยกเป็น module
  
**_Notes_**
โปรเจกต์นี้เป็นการฝึกเพื่อพัฒนาทักษะด้าน QA Automation โครงสร้างและแนวทางอาจยังสามารถปรับปรุงเพิ่มเติมได้ในอนาคต
