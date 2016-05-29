class Link < ActiveRecord::Base
    require 'uri'
   
    validates_format_of :original_url, :with => URI.regexp
    
     before_save :generate_short_url_if_empty
     belongs_to :user
     
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
            begin
              self.short_url=SecureRandom.hex[0...4]
              @link = Link.find_by short_url: short_url
            end until @link.blank?
        end
     end
     
     def check_short_url
        
     end
end
