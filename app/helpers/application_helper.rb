module ApplicationHelper
	
	def top_nav_formatter
	
		if controller.controller_name == "pages" && controller.action_name == "show"
			
			@home_klass = "class='active'"
			@admin_klass = ""
			@account_klass = "" 
			@signout_klass = "class='last'"
		elsif controller.controller_name == "pages" && controller.action_name == "admin_section"
			
			@home_klass = "class='preactive'"
			@admin_klass = "class='active'"
			@account_klass = ""
			@signout_klass = "class='last'"

	 	else
			@home_klass = "class='active'" 
			@admin_klass = ""
		        @account_klass = "" 
		 	@signout_klass = "class='last'"
		end
			
	end
	
	# generates add fields on a dynamic form
	def link_to_add_fields(name, f, association, locals={})  
	  new_object = f.object.class.reflect_on_association(association).klass.new  
	  fields = f.fields_for(association, new_object, 
			      :child_index => "new_#{association}") do |builder|  
	    render(association.to_s.singularize + "_fields", locals.merge!(:f => builder))  
	  end  
	
	  link_to(name, "#", :class => "dynamic_add", 'data-association' => "#{association}",
						    'data-content' => "#{fields}")
	end
	
end
