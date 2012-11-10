module ApplicationHelper
  
  #Helper that returns the current user
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  
  #Helper that adds fields to the object that calls it (used to add question fields to the personal_test view)
  def link_to_add_fields(name, f, association)
  new_object = f.object.class.reflect_on_association(association).klass.new
  fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
    render(association.to_s.singularize + "_fields", :f => builder)
    end
  link_to_function(name, h("add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")"))
  end
end
