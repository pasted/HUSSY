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
    @consultation.treatments.build
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
    
    @historical_hus_classification = Classification.find_by_name("Haemolytic-Uraemic Syndrome")
    @historical_kidney_classification = Classification.find_by_name("Kidney disease")
    @historical_urinary_classification = Classification.find_by_name("Urinary tract infection")
    
    @historical_hus_condition.classification = @historical_hus_classification
    @historical_kidney_condition.classification = @historical_kidney_classification
    @historical_urinary_condition.classification = @historical_urinary_classification

    
    @consultation.conditions.push(@historical_hus_condition)
    @consultation.conditions.push(@historical_kidney_condition)
    @consultation.conditions.push(@historical_urinary_condition)
    
    #Section D : Clinical features
    #Investigations
    #Pre-build to populate the list with all relevant Assays
    #Could save time by just iterating over Assay.all array but instead exclusively picking the Assays mentioned (in case new Assays added later)
    
    @reduced_heamoglobin_investigation = Investigation.new
    @reduced_platelet_investigation = Investigation.new
    @elevated_creatinine_investigation = Investigation.new
    @rbc_fragmentation_investigation = Investigation.new
    
    @reduced_heamoglobin_assay = Assay.find_by_name("Reduced haemoglobin")
    @reduced_platelet_assay = Assay.find_by_name("Reduced platelet count")
    @elevated_creatinine_assay = Assay.find_by_name("Elevated plasma creatinine")
    @rbc_fragmentation_assay = Assay.find_by_name("Red blood cell fragmentation")
    
    @reduced_heamoglobin_investigation.assay = @reduced_heamoglobin_assay
    @reduced_platelet_investigation.assay = @reduced_platelet_assay
    @elevated_creatinine_investigation.assay = @elevated_creatinine_assay
    @rbc_fragmentation_investigation.assay = @rbc_fragmentation_assay
    
    @consultation.investigations.push(@reduced_heamoglobin_investigation)
    @consultation.investigations.push(@reduced_platelet_investigation)
    @consultation.investigations.push(@elevated_creatinine_investigation)
    @consultation.investigations.push(@rbc_fragmentation_investigation)
    
    #Setup the default Conditions for the present consultation
    @present_hus_condition = Condition.new
    @present_fever_condition = Condition.new 
    @present_oligo_condition = Condition.new
    @present_diarrhoea_condition = Condition.new
    @present_vtec_stool_condition = Condition.new
    @present_haemorrhage_condition = Condition.new
    @present_septicaemia_condition = Condition.new
    @present_hypertension_condition = Condition.new
    @present_vtec_serology_condition = Condition.new
    @present_abdominal_pain_condition = Condition.new
    @present_bloody_diarrhoea_condition = Condition.new
    
    @present_seizures_condition = Condition.new
    @present_cardiomyopathy_condition = Condition.new
    @present_diabetes_condition = Condition.new
    @present_influenza_condition = Condition.new
    @present_pneumo_condition = Condition.new
    
    @present_hus_condition.category = "present"
    @present_fever_condition.category = "present"
    @present_oligo_condition.category = "present"
    @present_diarrhoea_condition.category = "present"
    @present_vtec_stool_condition.category = "present"
    @present_haemorrhage_condition.category = "present"
    @present_septicaemia_condition.category = "present"
    @present_hypertension_condition.category = "present"
    @present_vtec_serology_condition.category = "present"
    @present_abdominal_pain_condition.category = "present"
    @present_bloody_diarrhoea_condition.category = "present"
    
    @present_seizures_condition.category = "present"
    @present_cardiomyopathy_condition.category = "present"
    @present_diabetes_condition.category = "present"
    @present_influenza_condition.category = "present"
    @present_pneumo_condition.category = "present"
    
    @present_hus_classification = Classification.find_by_name('Haemolytic-Uraemic Syndrome')
    @present_fever_classification = Classification.find_by_name('Fever') 
    @present_oligo_classification = Classification.find_by_name('Oligo/anuria') 
    @present_diarrhoea_classification = Classification.find_by_name('Diarrhoea')
    @present_vtec_stool_classification = Classification.find_by_name('Confirmed VTEC infection by stool sample')
    @present_haemorrhage_classification = Classification.find_by_name('Major haemorrhage')
    @present_septicaemia_classification = Classification.find_by_name('Septicaemia')
    @present_hypertension_classification = Classification.find_by_name('Malignant hypertension')
    @present_vtec_serology_classification = Classification.find_by_name('Confirmed VTEC infection by serology')
    @present_abdominal_pain_classification = Classification.find_by_name('Abdominal pain')
    @present_bloody_diarrhoea_classification = Classification.find_by_name('Bloody Diarrhoea')
    
    @present_seizures_classification = Classification.find_by_name('Seizures and other neurological involvement')
    @present_cardiomyopathy_classification = Classification.find_by_name('Cardiomyopathy')
    @present_diabetes_classification = Classification.find_by_name('Diabetes mellitus')
    @present_influenza_classification = Classification.find_by_name('Influenza-like illness')
    @present_pneumo_classification = Classification.find_by_name('Pneumococcus infection')
    
    @present_hus_condition.classification = @present_hus_classification
    @present_fever_condition.classification = @present_fever_classification
    @present_oligo_condition.classification = @present_oligo_classification
    @present_diarrhoea_condition.classification = @present_diarrhoea_classification
    @present_vtec_stool_condition.classification = @present_vtec_stool_classification
    @present_haemorrhage_condition.classification = @present_haemorrhage_classification
    @present_septicaemia_condition.classification = @present_septicaemia_classification
    @present_hypertension_condition.classification = @present_hypertension_classification
    @present_vtec_serology_condition.classification = @present_vtec_serology_classification
    @present_abdominal_pain_condition.classification =  @present_abdominal_pain_classification
    @present_bloody_diarrhoea_condition.classification = @present_bloody_diarrhoea_classification
    
    @present_seizures_condition.classification = @present_seizures_classification
    @present_cardiomyopathy_condition.classification = @present_cardiomyopathy_classification
    @present_diabetes_condition.classification = @present_diabetes_classification
    @present_influenza_condition.classification = @present_influenza_classification
    @present_pneumo_condition.classification = @present_pneumo_classification
    
    @consultation.conditions.push(@present_hus_condition)
    @consultation.conditions.push(@present_fever_condition)
    @consultation.conditions.push(@present_oligo_condition)
    @consultation.conditions.push(@present_diarrhoea_condition)
    @consultation.conditions.push(@present_vtec_stool_condition)
    @consultation.conditions.push(@present_haemorrhage_condition)
    @consultation.conditions.push(@present_septicaemia_condition)
    @consultation.conditions.push(@present_hypertension_condition)
    @consultation.conditions.push(@present_vtec_serology_condition)
    @consultation.conditions.push(@present_abdominal_pain_condition)
    @consultation.conditions.push(@present_bloody_diarrhoea_condition)

    @consultation.conditions.push(@present_seizures_condition)
    @consultation.conditions.push(@present_cardiomyopathy_condition)
    @consultation.conditions.push(@present_diabetes_condition)
    @consultation.conditions.push(@present_influenza_condition)
    @consultation.conditions.push(@present_pneumo_condition)
    
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
    	    this_treatment.therapy = this_therapy
    	    @consultation.treatments.push(this_treatment)
    	    @present_treatments.push(this_treatment)
    end

    #Section G : Outcome by discharge
    @present_full_recovery_outcome = Outcome.new
    @present_dialysis_dependent_outcome = Outcome.new
    @present_renal_impairment_outcome = Outcome.new
    @present_neurological_impairment_outcome = Outcome.new
    @present_hypertension_treatment_outcome = Outcome.new
    @present_other_outcome = Outcome.new
    
    @full_recovery_result = Result.find_by_name("Seemingly full recovery")
    @dialysis_dependent_result = Result.find_by_name("Dialysis dependent")
    @renal_impairment_result = Result.find_by_name("Renal impairment")
    @neurological_impairment_result = Result.find_by_name("Neurological impairment")
    @hypertension_treatment_result = Result.find_by_name("Continued treatment for hypertension")
    @other_result = Result.find_by_name("Any other")
    
    @present_full_recovery_outcome.result = @full_recovery_result
    @present_dialysis_dependent_outcome.result = @dialysis_dependent_result
    @present_renal_impairment_outcome.result = @renal_impairment_result
    @present_neurological_impairment_outcome.result = @neurological_impairment_result
    @present_hypertension_treatment_outcome.result = @hypertension_treatment_result
    @present_other_outcome.result = @other_result
    
    @consultation.outcomes.push(@present_full_recovery_outcome)
    @consultation.outcomes.push(@present_dialysis_dependent_outcome)
    @consultation.outcomes.push(@present_renal_impairment_outcome)
    @consultation.outcomes.push(@present_neurological_impairment_outcome)
    @consultation.outcomes.push(@present_hypertension_treatment_outcome)
    @consultation.outcomes.push(@present_other_outcome)
    
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
    
    #@historical_hus_condition = Condition.search(:name => "Haemolytic-Uraemic Syndrome")
    #@historical_kidney_condition = @consultation.conditions.find_by_name("Kidney disease")
    #@historical_urinary_condition = @consultation.conditions.find_by_name("Urinary tract infection")
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
