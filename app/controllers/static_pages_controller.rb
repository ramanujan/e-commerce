class StaticPagesController < ApplicationController

  def home
  
  end
      
  def heroku_db_reset
    @output = `rake db:reset`
  end

  def heroku_db_migrate
    @output = `rake db:migrate`
  end
 
   
end
