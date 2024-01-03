Feature: The admin reporting page

#Tests requierment F-10
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
