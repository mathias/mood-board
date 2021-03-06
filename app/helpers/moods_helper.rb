module MoodsHelper
  def title(mood)
    title = mood.user.full_name

    if mood.user == current_user
      title += " #{link_to("Profile", user_path(slug: current_user), class: 'right-justify')}"
    end

    title
  end


  def content(mood)
  return mood.status_text unless mood.user == current_user
  (text_area :mood, :status_text, class: 'form-control', cols: 50, rows: 3, value: mood.status_text).gsub('"', '\'')
  end

end
