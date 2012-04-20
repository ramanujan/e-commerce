Feature: Editing Products
  
  Al fine di poter aggiornare i dettagli riguardo un prodotto nel negozio
  Come utente seller
  Voglio poterlo fare tramite una comoda interfaccia
  
Background:
  Given there is a product named "Cucumbers"
  Given I am on the homepage
  And I follow "Go To Store Admin" 
  And I follow "Products"
 
 
Scenario: Update a product
  And I follow "Cucumbers"
  And I follow "Edit Product"
  And I fill in "Product title" with "Sweet Cucumbers"
  When I press "Update Product"
  Then I should see "Sweet Cucumbers was successful updated! View it in your store"  

@javascript
Scenario: Update inventory on the fly
  And I fill in "quantity" with "4"
  And I press "Update inventory"
  Then I should see "Inventory successful updated!"
  