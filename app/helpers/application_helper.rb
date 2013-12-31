module ApplicationHelper

  def nested_categories(categories)
    if categories.present?
      categories.map do |category, sub_categories|
        render(category) + content_tag(:div, nested_categories(category.sub_categories), :class => "nested_categories")
      end.join.html_safe
    end
  end

end
