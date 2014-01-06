module ApplicationHelper

  def nested_categories(categories)
    if categories.present?
      categories.map do |category, sub_categories|
        render(category) + content_tag(:div, nested_categories(category.sub_categories), :class => "nested_categories")
      end.join.html_safe
    end
  end

  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
  end

end
