*** Settings ***
Documentation    Master resource file - imports all resources for the SAUCEDEMO project
Library          SeleniumLibrary
Library          Collections
Resource         Resources/Login_variables.robot
Resource         Resources/Login_keywords.robot
Resource         Resources/Inventory_variables.robot
Resource         Resources/Inventory_keywords.robot
Resource         Resources/Checkout_variables.robot
Resource         Resources/Checkout_keywords.robot
Resource         Resources/Common_keywords.robot
