module ApplicationHelper

  def icon(name, title="")
    raw "<i class='icon-#{name}'></i>#{title}"
  end

end
