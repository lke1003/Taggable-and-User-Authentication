module LinksHelper
  def tag_list_with_link(tag_list)
    tag_list
      .map { |tag| link_to(tag, tag_path(tag)) }
      .join(', ')
      .html_safe
  end
end
