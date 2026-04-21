*** Settings ***
Documentation    Variables for Inventory (Product) module

*** Variables ***
# Menu Locators
${BTN_MENU}                     id=react-burger-menu-btn
${BTN_CLOSE_MENU}               id=react-burger-cross-btn
${MENU_ALL_ITEMS}               id=inventory_sidebar_link
${MENU_ABOUT}                   id=about_sidebar_link
${MENU_LOGOUT}                  id=logout_sidebar_link
${MENU_RESET}                   id=reset_sidebar_link
${MENU_SIDEBAR}                 css=.bm-menu-wrap

# Sort Dropdown Locators
${DROPDOWN_SORT}                css=.product_sort_container

# Product List Locators
${PRODUCT_LIST}                 id=inventory_container
${PRODUCT_ITEM}                 css=.inventory_item
${PRODUCT_NAME}                 css=.inventory_item_name
${PRODUCT_PRICE}                css=.inventory_item_price
${PRODUCT_IMAGE_BACKPACK}       css=[alt="Sauce Labs Backpack"]
${PRODUCT_LINK_BACKPACK}        css=#item_4_title_link .inventory_item_name

# Product Detail Locators
${BTN_BACK_TO_PRODUCTS}         id=back-to-products
${DETAIL_IMAGE}                 css=.inventory_details_img
${DETAIL_NAME}                  css=.inventory_details_name
${DETAIL_PRICE}                 css=.inventory_details_price
${BTN_ADD_TO_CART_DETAIL}       css=.inventory_details_desc_container button

# Cart Locators
${BTN_ADD_TO_CART_BACKPACK}     css=[data-test="add-to-cart-sauce-labs-backpack"]
${BTN_REMOVE_BACKPACK}          css=[data-test="remove-sauce-labs-backpack"]
${CART_BADGE}                   css=.shopping_cart_badge

# Expected URLs
${URL_ABOUT}                    https://saucelabs.com/

# Sort Options
${SORT_AZ}                      az
${SORT_ZA}                      za
${SORT_LOW_HIGH}                lohi
${SORT_HIGH_LOW}                hilo
