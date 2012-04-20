###
  
  --- UNOBTRUSIVE JAVASCRIPT---
  
  In HTML5 possiamo utilizzare CUSTOM DATA ATTRIBUTES per memorizzare i dati correlati ad un elemento
  nella pagina. Ad esempio per memorizzare un messaggio che deve essere visualizzato quando verrà cliccato
  un ben determinato link, possiamo riscrivere il link in questo modo: 
    
    <a href="#" id="alert" data-message="Hello from UJS">Click Here</a>
  
  E quindi in javascript possiamo facilmente eseguire: 
  
    $(function () {
      $('#alert').click(function () {
        alert(this.attr('data-message'));
        return false; // ===>  ovvero prevent default  
      })
    });
    
   --- RAILS 3 UTILIZZA UNOBTRUSIVE JAVASCRIPT---
   
   Rails 3 utilizza HTML5 CUSTOM DATA ATTRIBUTES nel suo approccio al concetto di unobtrusive javascript
   come modo di PASSARE I DATI GENERATI LATO SERVER AL CLIENT CODE JAVASCRIPT. Si pensi a questa applicazione
   e-commerce. Essa ha una lista di prodotti, su cui possiamo effettuare delle ricerche. Ci sono anche dei 
   link per editare ed eventualmente per distruggere dei prodotti in vendita. 
   
   Vediamo ad esempio un semplice link che esegue la distruzione di un prodotto: 
   
   <a href="/admin/products/1" 
      class="btn btn-danger" 
      data-confirm="Are you sure you want to delete Domenico Cyborg D'Egidio  ?" 
      data-method="delete" 
      rel="nofollow">
      
      <i class="icon-trash icon-white"></i>
      Delete Product
   /a>   
  
  Come si vede fa un uso massiccio di HTML-CUSTOM-DATA-ATTRIBUTE! Infatti quando andiamo a cliccare 
  sul link, viene eseguito tramite XHR immagino, una POST com passando un parametro _method=delete
  e prima viene aperta una alert con i dati salvati in data-confirm
  
  --- COME COSTRUIRE UNA SEARCH FORM AJAX ---
  
  
  Ci proponiamo adesso di modificare la search form nella navigation bar, affinchè utilizzi
  AJAX invece di eseguire una normale get request. Vogliamo anche che la soluzioni degradi in
  maniera gracefully, e cioè che funzioni senza problemi anche senza AJAX.  
  
  
  
  
  
  
  
     
  ________________________________________________________________________________________________________
  
  Nell' esempio quantityWidget ci siamo limitati a prelevare il link puntato dall'attrbuto action della form. 
  Si noti che questa soluzione non è progettata per il degrade-gracefully. Infatti l'attributo 
  action della form, punta ad un'azione pensata per AJAX. Comunque si può facilmente eseguire
  un cambiamento per il degrade-gracefully... 
      
###

quantityWidget = {}

quantityWidget.handleResponse = (data)->
  $('#flash_message_zone').html(data)
   
quantityWidget.start= ()->
  _widget = this      
  $('#qty_update_button').click((event)->
    event.preventDefault()
    qtyValue=$('input#quantity').val()
    action = $('form#qty_form').attr('action') 
    
    $.ajax({
      type: 'PUT',
      url:action,
      data: $("#qty_form").serialize(),
      #dataType: 'html', # <=== Lo puoi fare solo se imposti content_type dal metodo render:
      success: (data)->  $('#flash_message_zone').html(data)
      });
   )
   
   # $.post(action,{quantity:qtyValue, _method:'put'},_widget.handleResponse,"html")
   
   # Attenzione: Rimangono dei misteri misteriosi: 
   
   # 1) Perchè non posso impostare come handler un metodo dell'oggetto quantityWidget ?
   # 2) PUT lavora con tutti i browser? se no con quali non lavora bene ?

    
# Questa funzione controlla la search form nella top-fixed navigation bar. 
# Non esegue AJAX, infatti abbiamo sfruttato l'opzione unobtrusive :remote
# delle form di Rails. Lo script serve solo a captare la pressione di enter
# e quindi a eseguire submit(). 

search = ->
  $('form#search_product input').keypress((event)->
    if event.which == 13  
      $(this).blur();
      event.preventDefault()
      if  window.searchActionResponseFormat
        action = $('form#search_product').attr('action')
        $( "<input name='format' type='hidden' value='"+window.searchActionResponseFormat+"'/>").
          appendTo('form#search_product') 
          
          $.ajax({
          type: 'GET',
          url:action,
          data: $("form#search_product").serialize(),
          dataType: 'html', # <=== Lo puoi fare solo se imposti content_type dal metodo render:
          success: (data)->  $('#products_list').html(data)
          });
      else
        $('form#search_product').submit() 
      
      #$('form#search_product').submit()
      )  

$( ()-> 
  quantityWidget.start();
  search()
 ) 