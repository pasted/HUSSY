class PatientsController < ApplicationController
  
	
  def search_form
  	  @genders = Patient::AVAILABLE_GENDERS.to_a	
  end
  
  def search
  	  if params[:digit_1].to_i && params[:digit_2].to_i && params[:digit_3].to_i && params[:digit_4].to_i && params[:digit_5].to_i
  	  	  if params[:digit_6].to_i && params[:digit_7].to_i && params[:digit_8].to_i && params[:digit_9].to_i && params[:digit_10].to_i
  	  	  	  nhs_number = ""
  	  	  	  nhs_number << params[:digit_1]
  	  	  	  nhs_number << params[:digit_2]
  	  	  	  nhs_number << params[:digit_3]
  	  	  	  nhs_number << params[:digit_4]
  	  	  	  nhs_number << params[:digit_5]
  	  	  	  nhs_number << params[:digit_6]
  	  	  	  nhs_number << params[:digit_7]
  	  	  	  nhs_number << params[:digit_8]
  	  	  	  nhs_number << params[:digit_9]
  	  	  	  nhs_number << params[:digit_10]
  	  	end
  	  end
  	  initials = params[:initials]
  	  sex = params[:sex]
  	  year_of_birth = params[:year_of_birth]
  	  params_check = false
  	  @empty_params = true
  	  @patients = Array.new
  	  
  	  if nhs_number.length == 10
  	  	  params_check = true
  	  	  @empty_params = false
  	  	  @patients = Patient.find_all_by_nhs_number(nhs_number)
  	  elsif !initials.blank? && !sex.blank? && !year_of_birth.blank?
  	  	  params_check = true
  	  	  @empty_params = false
  	  	  initials_patients = Patient.find_all_by_initials(initials)
  	  	  sex_patients = Patient.find_all_by_sex(sex)
  	  	  year_of_birth_patients = Patient.find_all_by_year_of_birth(year_of_birth)
  	  	  
  	  	  @patients = initials_patients & sex_patients & year_of_birth_patients
  	  elsif (nhs_number.length != 10) || (initials.blank? && sex.blank? && year_of_birth.blank?)
  	  	  @empty_params = true
  	  end
  	  
	  respond_to do |format|
	  	  if (@patients.length == 0) && (params_check == true)
		 	@patient = Patient.new(params)
		 	@patient.make_nhs_number
		 	@patient.split_nhs_number
		 	@ethnicities = Ethnicity.all
		 	@states = Patient::AVAILABLE_STATES
		      	format.html { render :action => "new" } # new.html.erb
		      	format.xml  { render :xml => @patient }
		 else
		 	@genders = Patient::AVAILABLE_GENDERS.to_a
		 	format.html { render :action => "search_form" }
		 end
	  end
			
  end
	
  # GET /patients
  # GET /patients.xml
  def index
    
    if current_user.role?('ADMIN')
      @patients = Patient.all   
    else
      @patients = Patient.where(:user_id => current_user.id)
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @patients }
    end
  end

  # GET /patients/1
  # GET /patients/1.xml
  def show

    @patient = Patient.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @patient }
    end
  end

  # GET /patients/new
  # GET /patients/new.xml
  def new
    @patient = Patient.new
    @ethnicities = Ethnicity.all
    @states = Patient::AVAILABLE_STATES
    @mortality_options = Patient::AVAILABLE_MORTALITY_OPTIONS
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @patient }
    end
  end

  # GET /patients/1/edit
  def edit
    @patient = Patient.find(params[:id])
    @patient.split_nhs_number
    @ethnicities = Ethnicity.all
  end

  # POST /patients
  # POST /patients.xml
  def create
    @user = current_user
    @patient = Patient.new(params[:patient])
    @patient.user = @user

    respond_to do |format|
      if @patient.save
        format.html { redirect_to(@patient, :notice => 'Patient was successfully created.') }
        format.xml  { render :xml => @patient, :status => :created, :location => @patient }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @patient.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /patients/1
  # PUT /patients/1.xml
  def update
    @patient = Patient.find(params[:id])

    respond_to do |format|
      if @patient.update_attributes(params[:patient])
        format.html { redirect_to(@patient, :notice => 'Patient was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @patient.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /patients/1
  # DELETE /patients/1.xml
  def destroy
    @patient = Patient.find(params[:id])
    @patient.destroy

    respond_to do |format|
      format.html { redirect_to(patients_url) }
      format.xml  { head :ok }
    end
  end
end
