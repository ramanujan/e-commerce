Feature: Viewing Products
  Al fine di ottenere dei dettagli riguardo un prodotto nel negozio,  
  Come utente (seller), 
  Voglio poter scegliere un particolare prodotto da una lista di prodotti disponibili 
  
Scenario: Show a product
  Given there is a product named "Cucumbers"
  Given I am on the homepage
  And I follow "Go To Store Admin" 
  And I follow "Products"
  And I follow "Cucumbers"
  Then I should see "Cucumbers's details" within "h1"
  And I should see "Selling Price"
  And I should see "1.50"
  