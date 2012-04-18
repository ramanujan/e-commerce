Feature: Destroying Products
 Al fine di eliminare un prodotto
 Come utente (seller) 
 Devo essere in grado di farlo mediante un pulsande Delete Product

Scenario: Destroy a product
  Given there is a product named "Cucumbers"
  Given I am on the homepage
  And I follow "Go To Store Admin" 
  And I follow "Products"
  And I follow "Cucumbers"
  And I follow "Delete Product"
  Then I should see "Cucumbers was successful deleted!"
  Then I should not see "Cucumbers" within "a"  
