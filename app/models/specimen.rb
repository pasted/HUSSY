class Specimen < ActiveRecord::Base
	#setting the table name here incase there is a problem with the config/initializers/inflections.rb
	set_table_name "specimens"
	belongs_to :consultation
end
