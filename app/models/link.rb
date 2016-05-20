class Link < ActiveRecord::Base
   # require 'uri'
    
     before_save :generate_short_url_if_empty
     
     def increase_count
         self.Visited_count+=1
     end
     
     def increase_count!
         self.increase_count
         self.save
     end
     
     private
     
     def generate_short_url_if_empty
        if short_url.nil? || short_url.empty?
            self.short_url=SecureRandom.hex[0...4]
        end
     end
end
