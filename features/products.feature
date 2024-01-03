Feature: Products

#Tests for Requierments F-12 F-13
@javascript
Scenario: Products belong to catagories
  Given There is a Product and Catagory
  When I go to the menu page
  Then I see the product in the right catagory
  
#Tests for Requiement F-14
@javascript
Scenario: Update the price of an product
  Given There is a Product
  When I change the price
  Then The price is saved
  And I can see the new price
