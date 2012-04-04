module ApplicationHelper
  
  BASE_TITLE=I18n.translate("heading")  
  
  def title
    @title ? (BASE_TITLE+" | "+@title) : BASE_TITLE 
  end

  def brief message,type=nil
    if type.nil?
      message.length >= 180 ? (message[0..179]+"...") : message
    else
      message.length >= 30 ? (message[0..29]+"...") : message
    end
  end 

   
end
