class Link < ActiveRecord::Base
     before_save :generate_short_url_if_empty
     
     
     private
     
     def generate_short_url_if_empty
        if short_url.nil? || short_url.empty?
            self.short_url=SecureRandom.hex[0...4]
        end
     end
end
