class StaticPagesController < ApplicationController

  def home
  
  end
      
  def heroku_db_reset
    @output = `rake db:reset`
  end

  def heroku_db_migrate
    @output = `rake db:migrate`
  end
 
 
=begin 
  
---  Parte di esercizi AJAX ---

  Si noti che in ajax_lezione_1 ho utilizzato l'helper
  
  <%= form_tag do %> . 
  
  <%end%>
  
  Che genera: 
  
  <form accept-charset="UTF-8" 
        action="/static_pages/ajax_lezione_1" 
        method="post">
  
    <div style="margin:0;padding:0;display:inline">
      <input name="utf8" type="hidden" value="&#x2713;" />
      <input name="authenticity_token" 
             type="hidden" 
             value="CxfGI4wh842q88CU4jvXlltPWzDFWNRejIqZYOyjnl8=" />
    </div>

 </form>

 Per i nostri scopi non va bene. Infatti anche se stiamo utilizzando 
 ajax, per i browser che non supportano javascript dobbiamo poter invocare
 un'azione di un controller non ajax. Allora possiamo fare così:
 
 <%=form_tag :controller=>"static_pages", :action=>"hello_stranger", :method=>"get" do%>
  <%=label_tag :name, "Who are you?"%>
  <%=text_field(:name)%>
<%end%>
  
 Che genera: 
 
 
 <form accept-charset="UTF-8" 
       action="/assets?action=hello_stranger&amp;controller=static_pages&amp;method=get" 
       method="post">
  <div style="margin:0;padding:0;display:inline">
    <input name="utf8" type="hidden" value="&#x2713;" />
    <input name="authenticity_token" type="hidden" value="CxfGI4wh842q88CU4jvXlltPWzDFWNRejIqZYOyjnl8=" />
  </div>
  
  <label for="name">Who are you?</label>
  <input id="name" name="name" type="text" />

</form>

 

=end  



  def ajax_lazione_1
    
  end 
  
  def hello_stranger 
  
    @name = params[:name] 
  
  end
  
  def hello_stranger_ajax 
    @name = params[:name] 
    render :partial=>'ajax_lezione_1'
  end 
   
end
