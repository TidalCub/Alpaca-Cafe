Feature: The admin reporting page

@javascript
Scenario: Seing total order
  Given there are products
  And There is an order
  When I go to the admin page
  Then I see how many orders have been made

@javascript
Scenario: Seing total revenue
  Given There is an order
  When I go to the admin page
  Then I see how much have been made
