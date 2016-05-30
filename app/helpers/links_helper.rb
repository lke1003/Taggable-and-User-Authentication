module LinksHelper
    def tag_list_with_link(tag_list)
        html =""
        tag_list.each do |tag|
          html += link_to(tag, tag_path(tag))+' '
        end
        return html.html_safe
    end
end
