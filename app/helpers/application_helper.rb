module ApplicationHelper
	
	def top_nav_formatter
		page = request.path_parameters[:controller] + ":" + request.path_parameters[:action]
		if page == "pages:show"
			@home_klass = "class='active'"
			@admin_klass = ""
			@account_klass = "" 
			@signout_klass = "class='last'"
		elsif page == "pages:admin_section"
			@home_klass = "class='preactive'"
			@admin_klass = "class='active'"
			@account_klass = ""
			@signout_klass = "class='last'"
		elsif page == "users:account"
			if current_user.role?("admin")
			 	@home_klass = ""
				@admin_klass = "class='preactive'"
			else 
				@home_klass = "class='preactive'" 
				@admin_klass = "" 
			end 
			@account_klass = "class='active'"
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
