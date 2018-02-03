module PrioritiesHelper
  def display_priority(priority)
    return if priority.nil?
    if priority.context.present?
      content_tag :div, priority.name, class: "label label-#{priority.context}"
    else
      priority.name
    end
  end
end
