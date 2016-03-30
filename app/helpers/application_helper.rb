module ApplicationHelper

  def nav_link_with_active(link_text, link_path, classes = [])
    classes = [classes] unless classes.is_a?(Array)
    classes << 'active' if controller_name == link_path.gsub(/\//,"")

    content_tag(:li,
      link_to(link_text, link_path),
      role: 'presentation',
      class: classes
    )
  end
end
