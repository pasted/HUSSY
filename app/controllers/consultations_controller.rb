class ConsultationsController < ApplicationController
  # GET /consultations
  # GET /consultations.xml
  def index
    @consultations = Consultation.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @consultations }
    end
  end

  # GET /consultations/1
  # GET /consultations/1.xml
  def show
    @consultation = Consultation.find(params[:id])
    @patient = @consultation.patient
    @medic = @consultation.medic
    
    @present_hus_condition = @consultation.conditions.where(:category => :present, :classification_id => "1").first ? @consultation.conditions.where(:category => :present, :classification_id => "1").first : nil

    @present_conditions = Array.new
    @developed_conditions = Array.new
   
    @classifications = Classification.all
    @classifications.each do |this_classification|
    	    case this_classification.id
    	    when 1..7
    	    	    this_condition = @consultation.conditions.where(:category => :present, :classification_id => this_classification.id).first
    	    	    if this_condition
    	    	    	    @present_conditions.push(this_condition)
    	            end
    	    when 8..18
    	    	    this_condition = @consultation.conditions.where(:category => :present, :classification_id => this_classification.id).first
    	    	    if this_condition
    	    	    	    @developed_conditions.push(this_condition)
    	            end
    	    end
    end
    
    @drugs = Drug.all
    @present_prescriptions = Array.new
    @historical_prescriptions = Array.new
    @drugs.each do |this_drug|
    	    present_prescription = @consultation.prescriptions.where(:category => :present, :drug_id => this_drug.id).first
    	    historical_prescription = @consultation.prescriptions.where(:category => :historical, :drug_id => this_drug.id).first
    	    if present_prescription != nil
    	      @present_prescriptions.push(present_prescription)
            end
            if historical_prescription != nil
    	      @historical_prescriptions.push(historical_prescription)
            end
    end
    
    @therapies = Therapy.all
    @present_treatments = Array.new
    @therapies.each do |this_therapy|
    	    this_treatment = @consultation.treatments.where(:therapy_id => this_therapy.id).first
    	    if this_treatment != nil
    	      @present_treatments.push(this_treatment)
            end
    end
    
    @results = Result.all
    @present_outcomes = Array.new
    @results.each do |this_result|
    	    this_outcome = @consultation.outcomes.where(:result_id => this_result.id).first 
    	    if this_outcome != nil
    	     @present_outcomes.push(this_outcome)
            end
    end
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @consultation }
    end
  end

  # GET /consultations/new
  # GET /consultations/new.xml
  def new
    @user = current_user
    
    @patient = Patient.find(params[:patient_id])
    @patient.split_nhs_number
    
    @consultation = Consultation.new
    @consultation.user = @user
    
    @consultation.investigations.build
   
    @consultation.admissions.build
    @consultation.build_medic
    
    @consultation.travels.build
    @consultation.relationships.build.build_contact
    @consultation.outcomes.build
    @consultation.referrals.build
    @consultation.specimens.build
    

    @consultation.patient = @patient
    
    @hospitals = Hospital.all
    @ethnicities = Ethnicity.all
    @states = Patient::AVAILABLE_STATES
    
    #Section C : Patient history
    @height = Characteristic.find_by_name("Height")
    @weight = Characteristic.find_by_name("Weight")
    
    @physical_weight = Physical.new
    @physical_height = Physical.new
    
    @physical_weight.characteristic = @weight
    @physical_height.characteristic = @height
    
    @consultation.physicals.push(@physical_weight)
    @consultation.physicals.push(@physical_height)

    @options = Array["UNKNOWN", "YES", "NO"]
    @options_present_absent = Array["Present", "Absent"]
    
    #Drugs - take all drugs and build a prescription for each one
    #Could chnage this to set an active list of Drugs for the form via the properties
    @drugs = Drug.all
    @historical_prescriptions = Array.new
    @drugs.each do |this_drug|
    	    this_prescription = Prescription.new
    	    this_prescription.category = "historical"
    	    this_prescription.drug = this_drug
    	    @consultation.prescriptions.push(this_prescription)
    	    @historical_prescriptions.push(this_prescription)
    end
    
    #Conditions for section 3.5, 3.6 and 3.7
    #Every Consulation will have these 3 historical conditions
    
    
    
    @historical_hus_condition = Condition.new
    @historical_kidney_condition = Condition.new
    @historical_urinary_condition = Condition.new
    
    @historical_hus_condition.category = "historical"
    @historical_kidney_condition.category = "historical"
    @historical_urinary_condition.category = "historical"
    
    @historical_hus_classification = Classification.find_by_name("Heamolytic Ureamic Syndrome")
    @historical_kidney_classification = Classification.find_by_name("Pre-existing kidney disease")
    @historical_urinary_classification = Classification.find_by_name("Pre-existing urinary tract infection")
    
    @historical_hus_condition.classification = @historical_hus_classification
    @historical_kidney_condition.classification = @historical_kidney_classification
    @historical_urinary_condition.classification = @historical_urinary_classification

    
    @consultation.conditions.push(@historical_hus_condition)
    @consultation.conditions.push(@historical_kidney_condition)
    @consultation.conditions.push(@historical_urinary_condition)
      
    
    #Section D : Clinical features
    #Investigations
    #Pre-build to populate the list with all relevant Assays
    #Needs to be refactored - move into the models
    
    assay_list = ["Reduced haemoglobin", "Reduced platelet count", "Elevated plasma creatinine", "Red blood cell fragmentation"]
    @investigation_list = Array.new
    
    assay_list.each do |assay_name|
    	    this_assay = Assay.find_by_name(assay_name)   
    	    if this_assay
    	    	    this_investigation = Investigation.new    
    	    	    this_investigation.assay = this_assay
    	    	    @consultation.investigations.push(this_investigation)
    	    	    @investigation_list.push(this_investigation)
    	    end
    end
    
    #Setup the default Conditions for the present consultation
    
    klassification_list_a = ['Diarrhoea','Bloody diarrhoea', 'Fever', 'Abdominal pain']
    klassification_list_b = ['Oligo/anuria', 'Septicaemia', 'Malignant hypertension', 'Major haemorrhage', 'Seizures and other neurological involvement', 'Cardiomopathy', 'Diabetes mellitus', 'Influenza-like illness', 'Pneumococcus infection']
    
    @condition_list_a = Array.new
    @condition_list_b = Array.new
    
    klassification_list_a.each do |klassification_name|
    	    this_klassification = Classification.find_by_name(klassification_name)   
    	    if this_klassification
    	    	    this_condition = Condition.new    
    	    	    this_condition.category = "present"
    	    	    this_condition.classification = this_klassification
    	    	    @consultation.conditions.push(this_condition)
    	    	    @condition_list_a.push(this_condition)
    	    end
    end
   
    klassification_list_b.each do |klassification_name|
    	    this_klassification = Classification.find_by_name(klassification_name)   
    	    if this_klassification
    	    	    this_condition = Condition.new    
    	    	    this_condition.category = "present"
    	    	    this_condition.classification = this_klassification
    	    	    @consultation.conditions.push(this_condition)
    	    	    @condition_list_b.push(this_condition)
    	    end
    end
    
    @present_hus_condition = Condition.new    
    @present_hus_condition.category = "present"    
    @present_hus_classification = Classification.find_by_name('Heamolytic Ureamic Syndrome')    
    @present_hus_condition.classification = @present_hus_classification    
    @consultation.conditions.push(@present_hus_condition)
    
    #Section F : Management
    #List of drugs prescribed in the management section
    #Kept seperate from the drugs prescribed in the two weeks prior by the category field ("historical", "present")
    @present_prescriptions = Array.new
    @drugs.each do |this_drug|
    	    this_prescription = Prescription.new
    	    this_prescription.category = "present"
    	    this_prescription.drug = this_drug
    	    @consultation.prescriptions.push(this_prescription)
    	    @present_prescriptions.push(this_prescription)
    end
    
    @therapies = Therapy.all
    @present_treatments = Array.new
    @therapies.each do |this_therapy|
    	    this_treatment = Treatment.new
    	    this_treatment.therapy_id = this_therapy.id
    	    this_treatment.therapy = this_therapy
    	    if this_treatment.therapy.name
    	    	    @consultation.treatments.push(this_treatment)
    	    	    @present_treatments.push(this_treatment)
    	    end
    	    
    end
    
    #Section G : Outcome by discharge
    result_list = ["Seemingly full recovery", "Dialysis dependent", "Renal impairment", "Neurological impairment", "Continued treatment for hypertension", "Any other"]
    @outcome_list = Array.new
    
    result_list.each do |outcome_name|
    	    this_result = Result.find_by_name(outcome_name)   
    	    if this_result
    	    	    this_outcome = Outcome.new    
    	    	    this_outcome.result = this_result
    	    	    @consultation.outcomes.push(this_outcome)
    	    	    @outcome_list.push(this_outcome)
    	    end
    end
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @consultation }
    end
  end

  # GET /consultations/1/edit
  def edit
    @consultation = Consultation.find(params[:id])
    @user = current_user

    @patient = @consultation.patient
    @patient.split_nhs_number
    @hospitals = Hospital.all
    @ethnicities = Ethnicity.all
    @states = Patient::AVAILABLE_STATES
    
    @height = Characteristic.find_by_name("Height")
    @weight = Characteristic.find_by_name("Weight")
    @options = Array["UNKNOWN", "YES", "NO"]
    @options_present_absent = Array["Present", "Absent"]
    
    #Alot of refactoring required here - move into models
    hus_classification = Classification.find_by_name("Haemolytic-Uraemic Syndrome")
    kidney_classification = Classification.find_by_name("Kidney disease")
    urinary_classification = Classification.find_by_name("Urinary tract infection")

    fever_classification = Classification.find_by_name('Fever') 
    oligo_classification = Classification.find_by_name('Oligo/anuria') 
    diarrhoea_classification = Classification.find_by_name('Diarrhoea')
    vtec_stool_classification = Classification.find_by_name('Confirmed VTEC infection by stool sample')
    haemorrhage_classification = Classification.find_by_name('Major haemorrhage')
    septicaemia_classification = Classification.find_by_name('Septicaemia')
    hypertension_classification = Classification.find_by_name('Malignant hypertension')
    vtec_serology_classification = Classification.find_by_name('Confirmed VTEC infection by serology')
    abdominal_pain_classification = Classification.find_by_name('Abdominal pain')
    bloody_diarrhoea_classification = Classification.find_by_name('Bloody Diarrhoea')   
    seizures_classification = Classification.find_by_name('Seizures and other neurological involvement')
    cardiomyopathy_classification = Classification.find_by_name('Cardiomyopathy')
    diabetes_classification = Classification.find_by_name('Diabetes mellitus')
    influenza_classification = Classification.find_by_name('Influenza-like illness')
    pneumo_classification = Classification.find_by_name('Pneumococcus infection')
    
    @historical_hus_condition = Condition.where({:classification_id => hus_classification.id, :category => "historical", :conditionable_type => "Consultation", :conditionable_id => @consultation.id})
    @historical_kidney_condition = Condition.where({:classification_id => kidney_classification.id, :category => "historical", :conditionable_type => "Consultation", :conditionable_id => @consultation.id})
    @historical_urinary_condition = Condition.where({:classification_id => urinary_classification.id, :category => "historical", :conditionable_type => "Consultation", :conditionable_id => @consultation.id})
    
    reduced_heamoglobin_assay = Assay.find_by_name("Reduced haemoglobin")
    reduced_platelet_assay = Assay.find_by_name("Reduced platelet count")
    elevated_creatinine_assay = Assay.find_by_name("Elevated plasma creatinine")
    rbc_fragmentation_assay = Assay.find_by_name("Red blood cell fragmentation")
    
    
    
    @reduced_heamoglobin_investigation = Investigation.where({:assay_id => reduced_heamoglobin_assay.id, :consultation_id => @consultation.id})
    @reduced_platelet_investigation = Investigation.where({:assay_id => reduced_platelet_assay.id, :consultation_id => @consultation.id})
    @elevated_creatinine_investigation = Investigation.where({:assay_id => elevated_creatinine_assay.id, :consultation_id => @consultation.id})
    @rbc_fragmentation_investigation = Investigation.where({:assay_id => rbc_fragmentation_assay.id, :consultation_id => @consultation.id})
    
    @present_hus_condition = Condition.where({:classification_id => hus_classification.id, :category => "present", :conditionable_type => "Consultation", :conditionable_id => @consultation.id})
    @present_fever_condition = Condition.where({:classification_id => fever_classification.id, :category => "present", :conditionable_type => "Consultation", :conditionable_id => @consultation.id})
    @present_oligo_condition = Condition.where({:classification_id => oligo_classification.id, :category => "present", :conditionable_type => "Consultation", :conditionable_id => @consultation.id})
    @present_diarrhoea_condition = Condition.where({:classification_id => diarrhoea_classification.id, :category => "present", :conditionable_type => "Consultation", :conditionable_id => @consultation.id})
    @present_vtec_stool_condition = Condition.where({:classification_id => vtec_stool_classification.id, :category => "present", :conditionable_type => "Consultation", :conditionable_id => @consultation.id})
    @present_haemorrhage_condition = Condition.where({:classification_id => haemorrhage_classification.id, :category => "present", :conditionable_type => "Consultation", :conditionable_id => @consultation.id})
    @present_septicaemia_condition = Condition.where({:classification_id => septicaemia_classification.id, :category => "present", :conditionable_type => "Consultation", :conditionable_id => @consultation.id})
    @present_hypertension_condition = Condition.where({:classification_id => hypertension_classification.id, :category => "present", :conditionable_type => "Consultation", :conditionable_id => @consultation.id})
    @present_vtec_serology_condition = Condition.where({:classification_id => vtec_serology_classification.id, :category => "present", :conditionable_type => "Consultation", :conditionable_id => @consultation.id})
    @present_abdominal_pain_condition = Condition.where({:classification_id => abdominal_pain_classification.id, :category => "present", :conditionable_type => "Consultation", :conditionable_id => @consultation.id})
    @present_bloody_diarrhoea_condition = Condition.where({:classification_id => bloody_diarrhoea_classification.id, :category => "present", :conditionable_type => "Consultation", :conditionable_id => @consultation.id})
    
    @present_seizures_condition = Condition.where({:classification_id => seizures_classification.id, :category => "present", :conditionable_type => "Consultation", :conditionable_id => @consultation.id})
    @present_cardiomyopathy_condition = Condition.where({:classification_id => cardiomyopathy_classification.id, :category => "present", :conditionable_type => "Consultation", :conditionable_id => @consultation.id})
    @present_diabetes_condition = Condition.where({:classification_id => diabetes_classification.id, :category => "present", :conditionable_type => "Consultation", :conditionable_id => @consultation.id})
    @present_influenza_condition = Condition.where({:classification_id => influenza_classification.id, :category => "present", :conditionable_type => "Consultation", :conditionable_id => @consultation.id})
    @present_pneumo_condition = Condition.where({:classification_id => pneumo_classification.id, :category => "present", :conditionable_type => "Consultation", :conditionable_id => @consultation.id})
    
  end

  # POST /consultations
  # POST /consultations.xml
  def create
    @user = current_user

    @patient = Patient.find(params[:consultation][:patient_attributes][:id]) 

    @patient.update_attributes(params[:consultation][:patient_attributes])
   
    @consultation = Consultation.new
    @consultation.user = @user
    @consultation.patient = @patient
    @consultation.update_attributes(params[:consultation])
    
    
    respond_to do |format|
      if @consultation.save
        format.html { redirect_to(@consultation, :notice => 'Consultation was successfully created.') }
        format.xml  { render :xml => @consultation, :status => :created, :location => @consultation }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @consultation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /consultations/1
  # PUT /consultations/1.xml
  def update
    @consultation = Consultation.find(params[:id])

    respond_to do |format|
      if @consultation.update_attributes(params[:consultation])
        format.html { redirect_to(@consultation, :notice => 'Consultation was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @consultation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /consultations/1
  # DELETE /consultations/1.xml
  def destroy
    @consultation = Consultation.find(params[:id])
    @consultation.destroy

    respond_to do |format|
      format.html { redirect_to(consultations_url) }
      format.xml  { head :ok }
    end
  end
end
