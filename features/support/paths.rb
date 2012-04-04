module NavigationHelpers
  
  def path_to page_name
  
    case page_name
      when /home\s?page/ then '/'
      when /store main page/ then '/store/'
     end
  end

end

World(NavigationHelpers)