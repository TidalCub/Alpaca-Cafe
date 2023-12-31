Feature: Ordering an Item

@javascript
Scenario: Ordering an item
  Given There is a user
  And I am loged in
  And There is a product
  Then There is one product
  When I go to the menu page
  And I can see it
  When I order it
  And I go to my cart
  Then I have one product
  And I click "Checkout"
  And I click "Pay"
  Then I should see "Your Order Number is:"

@javascript
Scenario: Ordering an modifyed Item
  Given There is a user
  And I am loged in
  And There is a product
  Then There is one product
  When I go to the menu page
  And I can see it
  When I click "view & Customise"
  And Chose "Oat Milk"
  And I click "Save and Add to Basket"
  And I go to my cart
  Then I have one product with "Oat Milk"
  And I click "Checkout"
  And I click "Pay"
  Then I should see "Your Order Number is:"
