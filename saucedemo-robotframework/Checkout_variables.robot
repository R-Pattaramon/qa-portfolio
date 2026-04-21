*** Settings ***
Documentation    Variables for Checkout module

*** Variables ***
# Cart Page Locators
${BTN_SHOPPING_CART}            css=.shopping_cart_link
${CART_TITLE}                   css=.title
${CART_ITEM}                    css=.cart_item
${CART_ITEM_NAME}               css=.inventory_item_name
${CART_ITEM_DESC}               css=.inventory_item_desc
${CART_ITEM_PRICE}              css=.inventory_item_price
${CART_QUANTITY}                css=.cart_quantity
${BTN_REMOVE_CART}              css=[data-test="remove-sauce-labs-backpack"]
${BTN_CONTINUE_SHOPPING}        id=continue-shopping
${BTN_CHECKOUT}                 id=checkout

# Checkout Your Information Locators
${INPUT_FIRST_NAME}             id=first-name
${INPUT_LAST_NAME}              id=last-name
${INPUT_POSTAL_CODE}            id=postal-code
${BTN_CANCEL_INFO}              id=cancel
${BTN_CONTINUE}                 id=continue
${ERROR_MESSAGE_CHECKOUT}       css=[data-test="error"]

# Checkout Overview Locators
${OVERVIEW_TITLE}               css=.title
${OVERVIEW_ITEM_NAME}           css=.inventory_item_name
${OVERVIEW_QUANTITY}            css=.cart_quantity
${OVERVIEW_ITEM_PRICE}          css=.inventory_item_price
${PAYMENT_INFO}                 css=[data-test="payment-info-value"]
${SHIPPING_INFO}                css=[data-test="shipping-info-value"]
${PRICE_TOTAL}                  css=.summary_total_label
${BTN_CANCEL_OVERVIEW}          id=cancel
${BTN_FINISH}                   id=finish

# Checkout Complete Locators
${COMPLETE_ICON}                css=.pony_express
${COMPLETE_HEADER}              css=.complete-header
${BTN_BACK_HOME}                id=back-to-products

# Test Data
${FIRST_NAME}                   Jack
${LAST_NAME}                    Kailyn
${POSTAL_CODE}                  1002555
${INVALID_FIRST_NAME}           @ชื่อ
${INVALID_LAST_NAME}            @นามสกุล
${INVALID_POSTAL_CODE}          ab@1235

# Expected Values
${TITLE_YOUR_CART}              Your Cart
${TITLE_CHECKOUT_INFO}          Checkout: Your Information
${TITLE_CHECKOUT_OVERVIEW}      Checkout: Overview
${TITLE_CHECKOUT_COMPLETE}      Checkout: Complete!
${COMPLETE_HEADER_TEXT}         Thank you for your order!
${ERR_FIRST_NAME_REQUIRED}      Error: First Name is required
${ERR_LAST_NAME_REQUIRED}       Error: Last Name is required
${ERR_POSTAL_CODE_REQUIRED}     Error: Postal Code is required
