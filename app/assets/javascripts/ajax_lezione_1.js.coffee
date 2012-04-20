###

  ____________________________________________________________________________________________________________
  
  Si noti che $(document).ready() equivale a $() ! 

  Si noti poi che:  
  
  function(x){ 
    # do something
  }
  
  Equivale a (x)->
               #do something  
   
  Ovviamente occhio all'indentazione è importante
  ____________________________________________________________________________________________________________
  
  
  
  Per eseguire una semplice GET ajax, possiamo utilizzare $.get di JQuery. 
  
    jQuery.get( url [, data] [, success(data, textStatus, jqXHR)] [, dataType] )
  
  url     ==> Una stringa contenente l'azione da invocare nel server
  
  data    ==> Si tratta di una struttura dati come un oggetto JavaScript, oppure un array JavaScript,
              che contiene i nostri parametri da codificare in maniera appropriata per un URI
  
  success ==> Si tratta di un metodo callback che viene eseguito se la richiesta termina con successo (4) !
              A questo metodo viene passato il response in vari formati a seconda del mime ritornato dal
              server: ( text string, XML root element, JavascriptFile oppure un oggetto JSON) 
              e inoltre lo status della response (200 OK o altro)
   
  Esempio: $.get("test.php", { name: "John", time: "2pm" } ); 
  Esempio: $.get("test.php", { 'choices[]': ["Jon", "Susan"]} );

  ___________________________________________________________________________________________________________
  
                
###

strangerWidget = {}

strangerWidget.handleResponse = (data)->
  $('#display_result').css('display','block')
  $('#display_result').html(data)
  $('#display_result h1').addClass('hero-cico')

strangerWidget.doPippo = ()->
  "pippo"
    
strangerWidget.start= ()->
  $("<div class='row-fluid' id='display_result' style='display:none;'></div>")
  .appendTo("#ajax_main")
  _widget = this      
  $('#answer_button').click((event)->
    event.preventDefault()
    nameValue=$('input#name').val()
    $.get('/static_pages/hello_stranger_ajax',{name:nameValue},_widget.handleResponse,"html")
    )
$(strangerWidget.start) 