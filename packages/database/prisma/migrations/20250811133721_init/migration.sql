-- CreateTable
CREATE TABLE "public"."organization" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "short_name" TEXT NOT NULL,
    "prefecture_code" INTEGER NOT NULL,
    "medical_institution_code" TEXT NOT NULL,
    "facility_standard_notification_code" TEXT NOT NULL,
    "phone_number" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "organization_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."organization_user" (
    "id" TEXT NOT NULL,
    "user_id" TEXT NOT NULL,
    "password_hash" TEXT NOT NULL,
    "organization_id" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "organization_user_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."patient" (
    "id" TEXT NOT NULL,
    "organization_id" TEXT NOT NULL,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "kana_first_name" TEXT NOT NULL,
    "kana_last_name" TEXT NOT NULL,
    "gender" INTEGER NOT NULL,
    "date_of_birth" DATE NOT NULL,
    "phone_number" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "deleted_at" TIMESTAMP(3),

    CONSTRAINT "patient_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."disease_name_master" (
    "id" BIGSERIAL NOT NULL,
    "change_division" INTEGER NOT NULL,
    "master_type" TEXT NOT NULL,
    "code" TEXT NOT NULL,
    "transition_destination_code" TEXT,
    "basic_name_length" INTEGER NOT NULL,
    "basic_name" TEXT NOT NULL,
    "abbreviated_name_length" INTEGER NOT NULL,
    "abbreviated_name" TEXT,
    "kana_name_length" INTEGER NOT NULL,
    "kana_name" TEXT NOT NULL,
    "disease_management_number" TEXT NOT NULL,
    "adoption_division" INTEGER NOT NULL,
    "exchange_code" TEXT NOT NULL,
    "icd10_1_2013" TEXT,
    "icd10_2_2013" TEXT,
    "single_use_prohibition_division" TEXT NOT NULL,
    "not_for_insurance_claim_division" INTEGER NOT NULL,
    "specific_disease_target_division" TEXT,
    "recorded_date" DATE,
    "changed_date" DATE,
    "abolished_date" DATE,
    "basic_name_change_info" INTEGER NOT NULL,
    "abbreviated_name_change_info" INTEGER NOT NULL,
    "kana_name_change_info" INTEGER NOT NULL,
    "adoption_division_change_info" INTEGER NOT NULL,
    "exchange_code_change_info" INTEGER NOT NULL,
    "dental_abbreviated_name_change_info" INTEGER NOT NULL,
    "intractable_disease_outpatient_target_division_change_info" INTEGER NOT NULL,
    "dental_specific_disease_target_division_change_info" INTEGER NOT NULL,
    "single_use_prohibition_division_change_info" INTEGER NOT NULL,
    "not_for_insurance_claim_division_change_info" INTEGER NOT NULL,
    "specific_disease_target_division_change_info" INTEGER NOT NULL,
    "transition_destination_disease_management_number" TEXT,
    "dental_abbreviated_name" TEXT,
    "dental_abbreviated_name_length" INTEGER NOT NULL,
    "intractable_disease_outpatient_target_division" TEXT,
    "dental_specific_disease_target_division" TEXT,
    "icd10_1_2013_change_info" INTEGER NOT NULL,
    "icd10_2_2013_change_info" INTEGER NOT NULL,

    CONSTRAINT "disease_name_master_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."modifier_master" (
    "id" BIGSERIAL NOT NULL,
    "change_division" INTEGER NOT NULL,
    "master_type" TEXT NOT NULL,
    "code" TEXT NOT NULL,
    "modifier_name_length" INTEGER NOT NULL,
    "modifier_name" TEXT NOT NULL,
    "kana_name_length" INTEGER NOT NULL,
    "kana_name" TEXT NOT NULL,
    "modifier_name_change_info" INTEGER NOT NULL,
    "kana_name_change_info" INTEGER NOT NULL,
    "recorded_date" DATE,
    "changed_date" DATE,
    "abolished_date" DATE,
    "modifier_management_number" TEXT NOT NULL,
    "modifier_exchange_code" TEXT,
    "modifier_division" TEXT,

    CONSTRAINT "modifier_master_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."dental_formula_master" (
    "id" BIGSERIAL NOT NULL,
    "change_division" INTEGER NOT NULL,
    "master_type" TEXT NOT NULL,
    "code" TEXT NOT NULL,
    "dental_formula_name" TEXT NOT NULL,
    "changed_date" DATE,
    "abolished_date" DATE,

    CONSTRAINT "dental_formula_master_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."medicine_master" (
    "id" BIGSERIAL NOT NULL,
    "change_division" INTEGER NOT NULL,
    "master_type" TEXT NOT NULL,
    "code" TEXT NOT NULL,
    "kanji_effective_digits" INTEGER NOT NULL,
    "kanji_name" TEXT NOT NULL,
    "kana_effective_digits" INTEGER NOT NULL,
    "kana_name" TEXT NOT NULL,
    "unit_code" TEXT NOT NULL,
    "unit_kanji_effective_digits" INTEGER NOT NULL,
    "unit_kanji_name" TEXT NOT NULL,
    "amount_type" INTEGER NOT NULL,
    "new_or_current_amount" DECIMAL(13,2) NOT NULL,
    "narcotic_poison_stimulant_psychotropic" INTEGER NOT NULL,
    "nerve_destroying_agent" INTEGER NOT NULL,
    "biological_preparation" INTEGER NOT NULL,
    "generic_drug" INTEGER NOT NULL,
    "dental_specific_drug" INTEGER NOT NULL,
    "contrast_agent" INTEGER NOT NULL,
    "injection_volume" DECIMAL(5,0),
    "listing_method_identifier" INTEGER NOT NULL,
    "product_name_related" TEXT,
    "old_amount_type" INTEGER NOT NULL,
    "old_amount" DECIMAL(13,2) NOT NULL,
    "kanji_name_change_division" INTEGER NOT NULL,
    "kana_name_change_division" INTEGER NOT NULL,
    "dosage_form" INTEGER NOT NULL,
    "changed_date" DATE NOT NULL,
    "abolished_date" DATE NOT NULL,
    "drug_price_standard_listing_code" TEXT,
    "publication_order_number" TEXT,
    "transitional_measure_date_or_product_code_expiration_date" DATE,
    "basic_kanji_name" TEXT,
    "drug_price_standard_listing_date" DATE,
    "generic_name_code" TEXT,
    "standard_description_of_generic_prescription" TEXT,
    "generic_prescription_addition_target_division" INTEGER NOT NULL,
    "anti_hiv_drug_division" INTEGER NOT NULL,
    "long_term_listed_product_related" TEXT,
    "selective_medical_treatment_division" INTEGER NOT NULL,

    CONSTRAINT "medicine_master_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."specific_equipment_master" (
    "id" BIGSERIAL NOT NULL,
    "change_division" INTEGER NOT NULL,
    "master_type" TEXT NOT NULL,
    "code" TEXT NOT NULL,
    "kanji_effective_digits" INTEGER NOT NULL,
    "kanji_name" TEXT NOT NULL,
    "kana_effective_digits" INTEGER NOT NULL,
    "kana_name" TEXT NOT NULL,
    "unit_code" TEXT NOT NULL,
    "unit_kanji_effective_digits" INTEGER NOT NULL,
    "unit_kanji_name" TEXT NOT NULL,
    "amount_type" INTEGER NOT NULL,
    "new_or_current_amount" DECIMAL(13,2) NOT NULL,
    "age_addition_division" INTEGER NOT NULL,
    "lower_age_limit" TEXT NOT NULL,
    "upper_age_limit" TEXT NOT NULL,
    "old_amount_type" INTEGER NOT NULL,
    "old_amount" DECIMAL(13,2) NOT NULL,
    "kanji_name_change_division" INTEGER NOT NULL,
    "kana_name_change_division" INTEGER NOT NULL,
    "oxygen_etc_division" INTEGER NOT NULL,
    "specific_equipment_type" INTEGER NOT NULL,
    "upper_limit_price" INTEGER NOT NULL,
    "upper_limit_points" TEXT NOT NULL,
    "publication_order_number" TEXT,
    "abolition_new_establishment_related" TEXT,
    "changed_date" DATE NOT NULL,
    "transitional_measure_date" DATE NOT NULL,
    "abolished_date" DATE NOT NULL,
    "separate_table_number" TEXT,
    "division_number" TEXT,
    "dpc_application_division" INTEGER NOT NULL,
    "basic_kanji_name" TEXT,
    "remanufactured_single_use_medical_device" TEXT NOT NULL,

    CONSTRAINT "specific_equipment_master_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."comment_master" (
    "id" BIGSERIAL NOT NULL,
    "change_division" INTEGER NOT NULL,
    "master_type" TEXT NOT NULL,
    "division" INTEGER NOT NULL,
    "pattern" TEXT NOT NULL,
    "serial_number" TEXT NOT NULL,
    "kanji_effective_digits" INTEGER NOT NULL,
    "kanji_name" TEXT NOT NULL,
    "kana_effective_digits" INTEGER NOT NULL,
    "kana_name" TEXT NOT NULL,
    "receipt_edit_info_column_position_1" TEXT,
    "receipt_edit_info_digits_1" TEXT,
    "receipt_edit_info_column_position_2" TEXT,
    "receipt_edit_info_digits_2" TEXT,
    "receipt_edit_info_column_position_3" TEXT,
    "receipt_edit_info_digits_3" TEXT,
    "receipt_edit_info_column_position_4" TEXT,
    "receipt_edit_info_digits_4" TEXT,
    "selectable_comment_identifier" INTEGER NOT NULL,
    "changed_date" DATE NOT NULL,
    "abolished_date" DATE NOT NULL,
    "code" TEXT NOT NULL,
    "publication_order_number" TEXT,

    CONSTRAINT "comment_master_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."medical_treatment_master" (
    "id" BIGSERIAL NOT NULL,
    "change_division" INTEGER NOT NULL,
    "master_type" TEXT NOT NULL,
    "code" TEXT NOT NULL,
    "abbreviated_kanji_effective_digits" INTEGER NOT NULL,
    "abbreviated_kanji_name" TEXT NOT NULL,
    "abbreviated_kana_effective_digits" INTEGER NOT NULL,
    "abbreviated_kana_name" TEXT NOT NULL,
    "data_standard_code" TEXT NOT NULL,
    "kanji_effective_digits" INTEGER NOT NULL,
    "kanji_name" TEXT NOT NULL,
    "point_identifier" INTEGER NOT NULL,
    "new_or_current_points" DECIMAL(10,2) NOT NULL,
    "inpatient_outpatient_application_division" INTEGER NOT NULL,
    "late_elderly_medical_care_application_division" INTEGER NOT NULL,
    "point_column_aggregation_destination_identifier_outpatient" TEXT,
    "inclusive_target_inspection" TEXT,
    "dpc_application_division" INTEGER NOT NULL,
    "hospital_clinic_division" INTEGER NOT NULL,
    "image_surgery_support_addition" INTEGER NOT NULL,
    "medical_observation_law_target_division" INTEGER NOT NULL,
    "nursing_addition" TEXT,
    "anesthesia_identifier_division" INTEGER NOT NULL,
    "disease_name_related_division" TEXT,
    "actual_days" INTEGER NOT NULL,
    "days_times" INTEGER NOT NULL,
    "medicine_related_division" INTEGER NOT NULL,
    "notch_value_calculation_identifier" INTEGER NOT NULL,
    "lower_limit" TEXT,
    "upper_limit" TEXT,
    "notch_value" TEXT,
    "notch_points" DECIMAL(10,2),
    "upper_lower_error_processing" INTEGER NOT NULL,
    "upper_limit_count" TEXT,
    "upper_limit_count_error_processing" INTEGER NOT NULL,
    "note_addition_code" TEXT,
    "note_addition_serial_number" TEXT NOT NULL,
    "general_rule_age" INTEGER NOT NULL,
    "lower_age_limit" TEXT NOT NULL,
    "upper_age_limit" TEXT NOT NULL,
    "time_addition_division" INTEGER NOT NULL,
    "conformity_division" INTEGER NOT NULL,
    "target_facility_standard" TEXT,
    "treatment_infant_addition_division" INTEGER NOT NULL,
    "extremely_low_birth_weight_infant_addition_division" INTEGER NOT NULL,
    "inpatient_basic_fee_etc_deduction_target_identifier" INTEGER NOT NULL,
    "donor_aggregation_division" INTEGER NOT NULL,
    "inspection_etc_implementation_judgment_division" INTEGER NOT NULL,
    "inspection_etc_implementation_judgment_group_division" TEXT,
    "reduction_target_division" INTEGER NOT NULL,
    "spinal_evoked_potential_measurement_etc_addition_division" INTEGER NOT NULL,
    "cervical_lymph_node_dissection_addition_division" INTEGER NOT NULL,
    "automatic_suture_device_addition_division" INTEGER NOT NULL,
    "outpatient_management_addition_division" INTEGER NOT NULL,
    "old_point_identifier" INTEGER NOT NULL,
    "old_points" DECIMAL(10,2) NOT NULL,
    "kanji_name_change_division" INTEGER NOT NULL,
    "kana_name_change_division" INTEGER NOT NULL,
    "specimen_inspection_comment" INTEGER NOT NULL,
    "general_rule_addition_fixed_points_target_division" INTEGER NOT NULL,
    "inclusive_reduction_division" TEXT,
    "ultrasound_endoscopy_inspection_addition_division" INTEGER NOT NULL,
    "point_column_aggregation_destination_identifier_inpatient" TEXT,
    "automatic_anastomosis_device_addition_division" INTEGER NOT NULL,
    "notification_etc_identifier_division_1" INTEGER NOT NULL,
    "notification_etc_identifier_division_2" INTEGER NOT NULL,
    "region_addition" INTEGER NOT NULL,
    "number_of_beds_division" INTEGER NOT NULL,
    "facility_standard_1" TEXT,
    "facility_standard_2" TEXT,
    "facility_standard_3" TEXT,
    "facility_standard_4" TEXT,
    "facility_standard_5" TEXT,
    "facility_standard_6" TEXT,
    "facility_standard_7" TEXT,
    "facility_standard_8" TEXT,
    "facility_standard_9" TEXT,
    "facility_standard_10" TEXT,
    "ultrasound_coagulation_cutting_device_etc_addition_division" INTEGER NOT NULL,
    "short_stay_surgery" INTEGER NOT NULL,
    "dental_application_division" INTEGER NOT NULL,
    "code_table_number_alphabet_part" TEXT,
    "notification_related_number_alphabet_part" TEXT,
    "changed_date" DATE NOT NULL,
    "abolished_date" DATE NOT NULL,
    "publication_order_number" TEXT,
    "code_table_number_chapter" INTEGER NOT NULL,
    "code_table_number_part" INTEGER NOT NULL,
    "code_table_number_division_number" INTEGER NOT NULL,
    "code_table_number_branch_number" INTEGER NOT NULL,
    "code_table_number_item_number" INTEGER NOT NULL,
    "notification_related_number_chapter" INTEGER NOT NULL,
    "notification_related_number_part" INTEGER NOT NULL,
    "notification_related_number_division_number" INTEGER NOT NULL,
    "notification_related_number_branch_number" INTEGER NOT NULL,
    "notification_related_number_item_number" INTEGER NOT NULL,
    "age_addition_1_lower_age" TEXT,
    "age_addition_1_upper_age" TEXT,
    "age_addition_1_medical_treatment_code" TEXT,
    "age_addition_2_lower_age" TEXT,
    "age_addition_2_upper_age" TEXT,
    "age_addition_2_medical_treatment_code" TEXT,
    "age_addition_3_lower_age" TEXT,
    "age_addition_3_upper_age" TEXT,
    "age_addition_3_medical_treatment_code" TEXT,
    "age_addition_4_lower_age" TEXT,
    "age_addition_4_upper_age" TEXT,
    "age_addition_4_medical_treatment_code" TEXT,
    "relocation_related" TEXT,
    "basic_kanji_name" TEXT,
    "paranasal_sinus_surgery_endoscope_addition" INTEGER NOT NULL,
    "paranasal_sinus_surgery_bone_soft_tissue_resection_device_addition" TEXT NOT NULL,
    "long_time_anesthesia_management_addition" INTEGER NOT NULL,
    "monitoring_addition" INTEGER NOT NULL,
    "frozen_preserved_allogeneic_tissue_addition" INTEGER NOT NULL,
    "malignant_tumor_pathological_tissue_specimen_addition" INTEGER NOT NULL,
    "external_fixator_addition" INTEGER NOT NULL,
    "ultrasound_cutting_device_addition" INTEGER NOT NULL,
    "left_atrial_appendage_occlusion_surgery_concomitant_division" INTEGER NOT NULL,
    "outpatient_infection_control_improvement_addition_etc" TEXT NOT NULL,
    "ent_infant_treatment_addition" INTEGER NOT NULL,
    "ent_pediatric_antibiotic_appropriate_use_support_addition" INTEGER NOT NULL,
    "incision_local_negative_pressure_closure_treatment_device_addition" INTEGER NOT NULL,
    "nursing_staff_treatment_improvement_evaluation_fee_etc" TEXT NOT NULL,
    "outpatient_home_care_base_up_evaluation_fee_1" TEXT NOT NULL,
    "outpatient_home_care_base_up_evaluation_fee_2" TEXT NOT NULL,
    "remanufactured_single_use_medical_device_use_addition" TEXT NOT NULL,

    CONSTRAINT "medical_treatment_master_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."dental_treatment_master" (
    "id" BIGSERIAL NOT NULL,
    "change_division" INTEGER NOT NULL,
    "master_type" TEXT NOT NULL,
    "code" TEXT NOT NULL,
    "division" TEXT NOT NULL,
    "division_number" TEXT NOT NULL,
    "branch_number" TEXT NOT NULL,
    "item_number" TEXT NOT NULL,
    "addition_code" TEXT NOT NULL,
    "basic_name" TEXT NOT NULL,
    "abbreviated_name" TEXT NOT NULL,
    "points_identifier" INTEGER NOT NULL,
    "points" DECIMAL(10,2) NOT NULL,
    "old_points_identifier" INTEGER NOT NULL,
    "old_points" DECIMAL(10,2) NOT NULL,
    "inpatient_outpatient_application_division" INTEGER NOT NULL,
    "late_elderly_medical_care_application_division" INTEGER NOT NULL,
    "time_addition_division" INTEGER NOT NULL,
    "hospital_clinic_division" INTEGER NOT NULL,
    "nursing_addition" TEXT,
    "region_addition" INTEGER NOT NULL,
    "disease_name_related_division" TEXT,
    "medicine_related_division" INTEGER NOT NULL,
    "number_of_beds_division" INTEGER NOT NULL,
    "notification" TEXT,
    "future_visit" INTEGER NOT NULL,
    "short_stay_surgery" INTEGER NOT NULL,
    "special_notes" INTEGER NOT NULL,
    "inspection_etc_implementation_judgment_division" INTEGER NOT NULL,
    "inspection_etc_implementation_judgment_group_division" TEXT,
    "reduction_target_division" INTEGER NOT NULL,
    "inclusive_reduction_division" TEXT,
    "conformity_division" INTEGER NOT NULL,
    "target_facility_standard" TEXT,
    "facility_standard_1" TEXT,
    "facility_standard_2" TEXT,
    "facility_standard_3" TEXT,
    "facility_standard_4" TEXT,
    "facility_standard_5" TEXT,
    "facility_standard_6" TEXT,
    "facility_standard_7" TEXT,
    "facility_standard_8" TEXT,
    "facility_standard_9" TEXT,
    "facility_standard_10" TEXT,
    "general_rule_addition_group" TEXT NOT NULL,
    "basic_addition_group" TEXT NOT NULL,
    "note_addition_group" TEXT NOT NULL,
    "technique_material_addition_group" TEXT NOT NULL,
    "calculation_limit_table_related_identifier" INTEGER NOT NULL,
    "notch_table_related_identifier" INTEGER NOT NULL,
    "age_limit_table_related_identifier" INTEGER NOT NULL,
    "concurrent_calculation_conflict_table_related_identifier" INTEGER NOT NULL,
    "actual_days_table_related_identifier" INTEGER NOT NULL,
    "changed_date" DATE NOT NULL,
    "abolished_date" DATE NOT NULL,
    "long_time_anesthesia_management_addition" INTEGER NOT NULL,
    "malignant_tumor_pathological_tissue_specimen_addition" INTEGER NOT NULL,
    "nursing_staff_treatment_improvement_evaluation_fee_etc" INTEGER NOT NULL,
    "dental_outpatient_home_care_base_up_evaluation_fee_1" INTEGER NOT NULL,
    "dental_outpatient_home_care_base_up_evaluation_fee_2" INTEGER NOT NULL,
    "publication_order_number" TEXT,

    CONSTRAINT "dental_treatment_master_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."dental_general_rule_addition_correspondence" (
    "id" BIGSERIAL NOT NULL,
    "change_division" INTEGER NOT NULL,
    "group_number" TEXT NOT NULL,
    "addition_code" TEXT NOT NULL,
    "code" TEXT NOT NULL,
    "basic_name" TEXT NOT NULL,
    "addition_identifier" INTEGER NOT NULL,
    "changed_date" DATE NOT NULL,
    "abolished_date" DATE NOT NULL,

    CONSTRAINT "dental_general_rule_addition_correspondence_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."dental_basic_addition_correspondence" (
    "id" BIGSERIAL NOT NULL,
    "change_division" INTEGER NOT NULL,
    "group_number" TEXT NOT NULL,
    "addition_code" TEXT NOT NULL,
    "code" TEXT NOT NULL,
    "basic_name" TEXT NOT NULL,
    "addition_identifier" INTEGER NOT NULL,
    "changed_date" DATE NOT NULL,
    "abolished_date" DATE NOT NULL,

    CONSTRAINT "dental_basic_addition_correspondence_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."dental_note_addition_correspondence" (
    "id" BIGSERIAL NOT NULL,
    "change_division" INTEGER NOT NULL,
    "group_number" TEXT NOT NULL,
    "addition_code" TEXT NOT NULL,
    "code" TEXT NOT NULL,
    "basic_name" TEXT NOT NULL,
    "addition_identifier" INTEGER NOT NULL,
    "changed_date" DATE NOT NULL,
    "abolished_date" DATE NOT NULL,

    CONSTRAINT "dental_note_addition_correspondence_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."dental_technique_material_addition_correspondence" (
    "id" BIGSERIAL NOT NULL,
    "change_division" INTEGER NOT NULL,
    "group_number" TEXT NOT NULL,
    "addition_code" TEXT NOT NULL,
    "code" TEXT NOT NULL,
    "basic_name" TEXT NOT NULL,
    "addition_identifier" INTEGER NOT NULL,
    "changed_date" DATE NOT NULL,
    "abolished_date" DATE NOT NULL,

    CONSTRAINT "dental_technique_material_addition_correspondence_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."dental_calculation_limit" (
    "id" BIGSERIAL NOT NULL,
    "change_division" INTEGER NOT NULL,
    "code" TEXT NOT NULL,
    "division" TEXT NOT NULL,
    "division_number" TEXT NOT NULL,
    "branch_number" TEXT NOT NULL,
    "item_number" TEXT NOT NULL,
    "addition_code" TEXT NOT NULL,
    "basic_name" TEXT NOT NULL,
    "abbreviated_name" TEXT NOT NULL,
    "calculation_unit" INTEGER NOT NULL,
    "calculation_limit_count" INTEGER NOT NULL,
    "upper_limit_error_processing" INTEGER NOT NULL,
    "changed_date" DATE NOT NULL,
    "abolished_date" DATE NOT NULL,

    CONSTRAINT "dental_calculation_limit_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."dental_notch" (
    "id" BIGSERIAL NOT NULL,
    "change_division" INTEGER NOT NULL,
    "code" TEXT NOT NULL,
    "division" TEXT NOT NULL,
    "division_number" TEXT NOT NULL,
    "branch_number" TEXT NOT NULL,
    "item_number" TEXT NOT NULL,
    "addition_code" TEXT NOT NULL,
    "basic_name" TEXT NOT NULL,
    "abbreviated_name" TEXT NOT NULL,
    "points_identifier" INTEGER NOT NULL,
    "points" DECIMAL(10,2) NOT NULL,
    "notch_unit" INTEGER NOT NULL,
    "notch_lower_limit" TEXT NOT NULL,
    "notch_upper_limit" TEXT NOT NULL,
    "notch_value" TEXT NOT NULL,
    "notch_points" DECIMAL(10,2) NOT NULL,
    "notch_upper_lower_error_processing" INTEGER NOT NULL,
    "changed_date" DATE NOT NULL,
    "abolished_date" DATE NOT NULL,

    CONSTRAINT "dental_notch_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."dental_age_limit" (
    "id" BIGSERIAL NOT NULL,
    "change_division" INTEGER NOT NULL,
    "code" TEXT NOT NULL,
    "division" TEXT NOT NULL,
    "division_number" TEXT NOT NULL,
    "branch_number" TEXT NOT NULL,
    "item_number" TEXT NOT NULL,
    "addition_code" TEXT NOT NULL,
    "basic_name" TEXT NOT NULL,
    "abbreviated_name" TEXT NOT NULL,
    "lower_age_limit" TEXT NOT NULL,
    "upper_age_limit" TEXT NOT NULL,
    "changed_date" DATE NOT NULL,
    "abolished_date" DATE NOT NULL,

    CONSTRAINT "dental_age_limit_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."dental_concurrent_calculation_conflict" (
    "id" BIGSERIAL NOT NULL,
    "change_division" INTEGER NOT NULL,
    "code" TEXT NOT NULL,
    "division" TEXT NOT NULL,
    "division_number" TEXT NOT NULL,
    "branch_number" TEXT NOT NULL,
    "item_number" TEXT NOT NULL,
    "addition_code" TEXT NOT NULL,
    "basic_name" TEXT NOT NULL,
    "abbreviated_name" TEXT NOT NULL,
    "conflict_info_1_calculable" INTEGER NOT NULL,
    "conflict_info_1_dental_treatment_code" TEXT NOT NULL,
    "conflict_info_1_division" TEXT NOT NULL,
    "conflict_info_1_division_number" TEXT NOT NULL,
    "conflict_info_1_branch_number" TEXT NOT NULL,
    "conflict_info_1_item_number" TEXT NOT NULL,
    "conflict_info_1_addition_code" TEXT NOT NULL,
    "conflict_info_1_basic_name" TEXT NOT NULL,
    "conflict_info_1_abbreviated_name" TEXT NOT NULL,
    "conflict_info_2_calculable" INTEGER NOT NULL,
    "conflict_info_2_dental_treatment_code" TEXT NOT NULL,
    "conflict_info_2_division" TEXT NOT NULL,
    "conflict_info_2_division_number" TEXT NOT NULL,
    "conflict_info_2_branch_number" TEXT NOT NULL,
    "conflict_info_2_item_number" TEXT NOT NULL,
    "conflict_info_2_addition_code" TEXT NOT NULL,
    "conflict_info_2_basic_name" TEXT NOT NULL,
    "conflict_info_2_abbreviated_name" TEXT NOT NULL,
    "conflict_info_3_calculable" INTEGER NOT NULL,
    "conflict_info_3_dental_treatment_code" TEXT NOT NULL,
    "conflict_info_3_division" TEXT NOT NULL,
    "conflict_info_3_division_number" TEXT NOT NULL,
    "conflict_info_3_branch_number" TEXT NOT NULL,
    "conflict_info_3_item_number" TEXT NOT NULL,
    "conflict_info_3_addition_code" TEXT NOT NULL,
    "conflict_info_3_basic_name" TEXT NOT NULL,
    "conflict_info_3_abbreviated_name" TEXT NOT NULL,
    "conflict_info_4_calculable" INTEGER NOT NULL,
    "conflict_info_4_dental_treatment_code" TEXT NOT NULL,
    "conflict_info_4_division" TEXT NOT NULL,
    "conflict_info_4_division_number" TEXT NOT NULL,
    "conflict_info_4_branch_number" TEXT NOT NULL,
    "conflict_info_4_item_number" TEXT NOT NULL,
    "conflict_info_4_addition_code" TEXT NOT NULL,
    "conflict_info_4_basic_name" TEXT NOT NULL,
    "conflict_info_4_abbreviated_name" TEXT NOT NULL,
    "conflict_info_5_calculable" INTEGER NOT NULL,
    "conflict_info_5_dental_treatment_code" TEXT NOT NULL,
    "conflict_info_5_division" TEXT NOT NULL,
    "conflict_info_5_division_number" TEXT NOT NULL,
    "conflict_info_5_branch_number" TEXT NOT NULL,
    "conflict_info_5_item_number" TEXT NOT NULL,
    "conflict_info_5_addition_code" TEXT NOT NULL,
    "conflict_info_5_basic_name" TEXT NOT NULL,
    "conflict_info_5_abbreviated_name" TEXT NOT NULL,
    "conflict_info_6_calculable" INTEGER NOT NULL,
    "conflict_info_6_dental_treatment_code" TEXT NOT NULL,
    "conflict_info_6_division" TEXT NOT NULL,
    "conflict_info_6_division_number" TEXT NOT NULL,
    "conflict_info_6_branch_number" TEXT NOT NULL,
    "conflict_info_6_item_number" TEXT NOT NULL,
    "conflict_info_6_addition_code" TEXT NOT NULL,
    "conflict_info_6_basic_name" TEXT NOT NULL,
    "conflict_info_6_abbreviated_name" TEXT NOT NULL,
    "conflict_info_7_calculable" INTEGER NOT NULL,
    "conflict_info_7_dental_treatment_code" TEXT NOT NULL,
    "conflict_info_7_division" TEXT NOT NULL,
    "conflict_info_7_division_number" TEXT NOT NULL,
    "conflict_info_7_branch_number" TEXT NOT NULL,
    "conflict_info_7_item_number" TEXT NOT NULL,
    "conflict_info_7_addition_code" TEXT NOT NULL,
    "conflict_info_7_basic_name" TEXT NOT NULL,
    "conflict_info_7_abbreviated_name" TEXT NOT NULL,
    "conflict_info_8_calculable" INTEGER NOT NULL,
    "conflict_info_8_dental_treatment_code" TEXT NOT NULL,
    "conflict_info_8_division" TEXT NOT NULL,
    "conflict_info_8_division_number" TEXT NOT NULL,
    "conflict_info_8_branch_number" TEXT NOT NULL,
    "conflict_info_8_item_number" TEXT NOT NULL,
    "conflict_info_8_addition_code" TEXT NOT NULL,
    "conflict_info_8_basic_name" TEXT NOT NULL,
    "conflict_info_8_abbreviated_name" TEXT NOT NULL,
    "conflict_info_9_calculable" INTEGER NOT NULL,
    "conflict_info_9_dental_treatment_code" TEXT NOT NULL,
    "conflict_info_9_division" TEXT NOT NULL,
    "conflict_info_9_division_number" TEXT NOT NULL,
    "conflict_info_9_branch_number" TEXT NOT NULL,
    "conflict_info_9_item_number" TEXT NOT NULL,
    "conflict_info_9_addition_code" TEXT NOT NULL,
    "conflict_info_9_basic_name" TEXT NOT NULL,
    "conflict_info_9_abbreviated_name" TEXT NOT NULL,
    "conflict_info_10_calculable" INTEGER NOT NULL,
    "conflict_info_10_dental_treatment_code" TEXT NOT NULL,
    "conflict_info_10_division" TEXT NOT NULL,
    "conflict_info_10_division_number" TEXT NOT NULL,
    "conflict_info_10_branch_number" TEXT NOT NULL,
    "conflict_info_10_item_number" TEXT NOT NULL,
    "conflict_info_10_addition_code" TEXT NOT NULL,
    "conflict_info_10_basic_name" TEXT NOT NULL,
    "conflict_info_10_abbreviated_name" TEXT NOT NULL,
    "changed_date" DATE NOT NULL,
    "abolished_date" DATE NOT NULL,

    CONSTRAINT "dental_concurrent_calculation_conflict_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."dental_actual_days_related" (
    "id" BIGSERIAL NOT NULL,
    "change_division" INTEGER NOT NULL,
    "code" TEXT NOT NULL,
    "division" TEXT NOT NULL,
    "division_number" TEXT NOT NULL,
    "branch_number" TEXT NOT NULL,
    "item_number" TEXT NOT NULL,
    "addition_code" TEXT NOT NULL,
    "basic_name" TEXT NOT NULL,
    "abbreviated_name" TEXT NOT NULL,
    "actual_days" INTEGER NOT NULL,
    "days_times" INTEGER NOT NULL,
    "changed_date" DATE NOT NULL,
    "abolished_date" DATE NOT NULL,

    CONSTRAINT "dental_actual_days_related_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."dispensing_master" (
    "id" BIGSERIAL NOT NULL,
    "change_division" INTEGER NOT NULL,
    "master_identifier" TEXT NOT NULL,
    "code" TEXT NOT NULL,
    "kanji_effective_digits" INTEGER NOT NULL,
    "kanji_name" TEXT NOT NULL,
    "kana_effective_digits" INTEGER NOT NULL,
    "kana_name" TEXT NOT NULL,
    "receipt_display_symbol_code" TEXT NOT NULL,
    "receipt_display_order_number" TEXT NOT NULL,
    "new_or_current_points_identifier" INTEGER NOT NULL,
    "dispensing_quantity_calculation_flag" INTEGER NOT NULL,
    "new_or_current_points_basic_points" DECIMAL(9,2) NOT NULL,
    "notch_value_calculation_identifier" INTEGER NOT NULL,
    "lower_limit" TEXT NOT NULL,
    "upper_limit" TEXT NOT NULL,
    "notch_value" TEXT,
    "notch_points" DECIMAL(9,2),
    "upper_lower_error_processing" INTEGER NOT NULL,
    "deduction_behavior_division" INTEGER NOT NULL,
    "deduction_target_behavior_division" INTEGER NOT NULL,
    "dispensing_behavior_identifier_division" INTEGER NOT NULL,
    "inclusive_identifier_division" INTEGER NOT NULL,
    "dispensing_behavior_type_1" INTEGER NOT NULL,
    "dispensing_behavior_type_2" INTEGER NOT NULL,
    "late_elderly_application_division" INTEGER NOT NULL,
    "facility_standard_1" TEXT NOT NULL,
    "facility_standard_2" TEXT NOT NULL,
    "facility_standard_3" TEXT NOT NULL,
    "facility_standard_4" TEXT NOT NULL,
    "facility_standard_5" TEXT NOT NULL,
    "facility_standard_6" TEXT NOT NULL,
    "facility_standard_7" TEXT NOT NULL,
    "facility_standard_8" TEXT NOT NULL,
    "facility_standard_9" TEXT NOT NULL,
    "facility_standard_10" TEXT NOT NULL,
    "receipt_unit_conflict_code" TEXT NOT NULL,
    "prescription_reception_unit_conflict_code" TEXT NOT NULL,
    "dispensing_unit_conflict_code" TEXT NOT NULL,
    "narcotic_poison_stimulant_psychotropic" INTEGER NOT NULL,
    "time_addition_division" INTEGER NOT NULL,
    "dosage_form" INTEGER NOT NULL,
    "receipt_unit_upper_limit_count" TEXT NOT NULL,
    "receipt_unit_upper_limit_error_processing" INTEGER NOT NULL,
    "prescription_reception_unit_upper_limit_count" TEXT NOT NULL,
    "prescription_reception_unit_upper_limit_error_processing" INTEGER NOT NULL,
    "note_addition_code" TEXT,
    "note_addition_serial_number" TEXT NOT NULL,
    "lower_age_limit" TEXT NOT NULL,
    "upper_age_limit" TEXT NOT NULL,
    "pharmaceutical_management_fee_division" INTEGER NOT NULL,
    "notification_etc_identifier_division_1" INTEGER NOT NULL,
    "notification_etc_identifier_division_2" INTEGER NOT NULL,
    "old_points_identifier" INTEGER NOT NULL,
    "old_points" DECIMAL(9,2),
    "changed_date" DATE NOT NULL,
    "abolished_date" DATE NOT NULL,
    "publication_order_number" TEXT,
    "code_table_number" TEXT NOT NULL,
    "notification_related_number" TEXT NOT NULL,
    "relocation_related" TEXT,

    CONSTRAINT "dispensing_master_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."home_nursing_care_master" (
    "id" BIGSERIAL NOT NULL,
    "change_division" INTEGER NOT NULL,
    "master_type" TEXT NOT NULL,
    "code" TEXT NOT NULL,
    "division_number" TEXT NOT NULL,
    "branch_number" TEXT NOT NULL,
    "item_number" TEXT NOT NULL,
    "basic_name" TEXT NOT NULL,
    "abbreviated_name_effective_digits" INTEGER NOT NULL,
    "abbreviated_name" TEXT NOT NULL,
    "abbreviated_kana_name_effective_digits" INTEGER NOT NULL,
    "abbreviated_kana_name" TEXT NOT NULL,
    "data_standard_code" TEXT NOT NULL,
    "kanji_effective_digits" INTEGER NOT NULL,
    "kanji_name" TEXT NOT NULL,
    "amount_identifier" INTEGER NOT NULL,
    "new_or_current_amount" DECIMAL(10,2) NOT NULL,
    "old_amount_identifier" INTEGER NOT NULL,
    "old_amount" DECIMAL(10,2) NOT NULL,
    "notch_value_calculation_identifier" INTEGER NOT NULL,
    "lower_limit" TEXT NOT NULL,
    "upper_limit" TEXT NOT NULL,
    "notch_value" TEXT NOT NULL,
    "notch_amount" DECIMAL(10,2) NOT NULL,
    "upper_lower_error_processing" INTEGER NOT NULL,
    "lower_age_limit" TEXT NOT NULL,
    "upper_age_limit" TEXT NOT NULL,
    "late_elderly_medical_care_application_division" INTEGER NOT NULL,
    "medical_observation_law_target_division" INTEGER NOT NULL,
    "profession_code_1" TEXT NOT NULL,
    "profession_code_2" TEXT NOT NULL,
    "profession_code_3" TEXT NOT NULL,
    "profession_code_4" TEXT NOT NULL,
    "profession_code_5" TEXT NOT NULL,
    "profession_code_6" TEXT NOT NULL,
    "profession_code_7" TEXT NOT NULL,
    "profession_code_8" TEXT NOT NULL,
    "profession_code_9" TEXT NOT NULL,
    "profession_code_10" TEXT NOT NULL,
    "profession_code_11" TEXT NOT NULL,
    "profession_code_12" TEXT NOT NULL,
    "profession_code_13" TEXT NOT NULL,
    "profession_code_14" TEXT NOT NULL,
    "profession_code_15" TEXT NOT NULL,
    "implementation_count_division" INTEGER NOT NULL,
    "home_nursing_care_instruction_division" INTEGER NOT NULL,
    "special_home_nursing_care_instruction_division" INTEGER NOT NULL,
    "addition_single_calculation_division" INTEGER NOT NULL,
    "addition_group" TEXT NOT NULL,
    "facility_standard_group" TEXT NOT NULL,
    "basic_addition_correspondence_table_related_identifier" INTEGER NOT NULL,
    "calculation_limit_table_related_identifier" INTEGER NOT NULL,
    "concurrent_calculation_conflict_table_related_identifier" INTEGER NOT NULL,
    "receipt_display_column" INTEGER NOT NULL,
    "receipt_display_item" INTEGER NOT NULL,
    "receipt_display_serial_number" INTEGER NOT NULL,
    "receipt_display_symbol_1" INTEGER NOT NULL,
    "receipt_display_symbol_2" INTEGER NOT NULL,
    "receipt_display_symbol_3" INTEGER NOT NULL,
    "receipt_display_symbol_4" TEXT NOT NULL,
    "receipt_display_symbol_5" TEXT NOT NULL,
    "receipt_display_symbol_6" TEXT NOT NULL,
    "receipt_display_symbol_7" TEXT NOT NULL,
    "receipt_display_symbol_8" TEXT NOT NULL,
    "receipt_display_symbol_9" TEXT NOT NULL,
    "publication_order_number" TEXT,
    "home_nursing_care_type" TEXT NOT NULL,
    "changed_date" DATE NOT NULL,
    "abolished_date" DATE NOT NULL,

    CONSTRAINT "home_nursing_care_master_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."home_nursing_care_basic_addition_correspondence" (
    "id" BIGSERIAL NOT NULL,
    "change_division" INTEGER NOT NULL,
    "group_number" TEXT NOT NULL,
    "code" TEXT NOT NULL,
    "abbreviated_name" TEXT NOT NULL,
    "addition_identifier" INTEGER NOT NULL,
    "changed_date" DATE NOT NULL,
    "abolished_date" DATE NOT NULL,

    CONSTRAINT "home_nursing_care_basic_addition_correspondence_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."home_nursing_care_calculation_limit" (
    "id" BIGSERIAL NOT NULL,
    "change_division" INTEGER NOT NULL,
    "code" TEXT NOT NULL,
    "abbreviated_name" TEXT NOT NULL,
    "calculation_unit" TEXT NOT NULL,
    "calculation_unit_name" TEXT NOT NULL,
    "calculation_limit_count" INTEGER NOT NULL,
    "upper_limit_error_processing" INTEGER NOT NULL,
    "changed_date" DATE NOT NULL,
    "abolished_date" DATE NOT NULL,

    CONSTRAINT "home_nursing_care_calculation_limit_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."home_nursing_care_concurrent_calculation_conflict" (
    "id" BIGSERIAL NOT NULL,
    "change_division" INTEGER NOT NULL,
    "code" TEXT NOT NULL,
    "abbreviated_name_1" TEXT NOT NULL,
    "conflict_division" INTEGER NOT NULL,
    "conflict_home_nursing_care_code" TEXT NOT NULL,
    "abbreviated_name_2" TEXT NOT NULL,
    "conflict_unit" INTEGER NOT NULL,
    "special_condition" INTEGER NOT NULL,
    "changed_date" DATE NOT NULL,
    "abolished_date" DATE NOT NULL,

    CONSTRAINT "home_nursing_care_concurrent_calculation_conflict_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."home_nursing_care_facility_standard" (
    "id" BIGSERIAL NOT NULL,
    "change_division" INTEGER NOT NULL,
    "group_number" TEXT NOT NULL,
    "code" TEXT NOT NULL,
    "abbreviated_name" TEXT NOT NULL,
    "facility_standard" TEXT NOT NULL,
    "facility_standard_identifier" TEXT NOT NULL,
    "changed_date" DATE NOT NULL,
    "abolished_date" DATE NOT NULL,

    CONSTRAINT "home_nursing_care_facility_standard_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "organization_user_user_id_key" ON "public"."organization_user"("user_id");

-- CreateIndex
CREATE INDEX "organization_user_organization_id_idx" ON "public"."organization_user"("organization_id");

-- CreateIndex
CREATE INDEX "patient_organization_id_idx" ON "public"."patient"("organization_id");

-- CreateIndex
CREATE UNIQUE INDEX "disease_name_master_code_key" ON "public"."disease_name_master"("code");

-- CreateIndex
CREATE UNIQUE INDEX "modifier_master_code_key" ON "public"."modifier_master"("code");

-- CreateIndex
CREATE UNIQUE INDEX "dental_formula_master_code_key" ON "public"."dental_formula_master"("code");

-- CreateIndex
CREATE UNIQUE INDEX "medicine_master_code_key" ON "public"."medicine_master"("code");

-- CreateIndex
CREATE UNIQUE INDEX "specific_equipment_master_code_key" ON "public"."specific_equipment_master"("code");

-- CreateIndex
CREATE UNIQUE INDEX "comment_master_code_key" ON "public"."comment_master"("code");

-- CreateIndex
CREATE UNIQUE INDEX "medical_treatment_master_code_key" ON "public"."medical_treatment_master"("code");

-- CreateIndex
CREATE UNIQUE INDEX "dental_treatment_master_code_key" ON "public"."dental_treatment_master"("code");

-- CreateIndex
CREATE UNIQUE INDEX "dental_treatment_master_general_rule_addition_group_key" ON "public"."dental_treatment_master"("general_rule_addition_group");

-- CreateIndex
CREATE UNIQUE INDEX "dental_treatment_master_basic_addition_group_key" ON "public"."dental_treatment_master"("basic_addition_group");

-- CreateIndex
CREATE UNIQUE INDEX "dental_treatment_master_note_addition_group_key" ON "public"."dental_treatment_master"("note_addition_group");

-- CreateIndex
CREATE UNIQUE INDEX "dental_treatment_master_technique_material_addition_group_key" ON "public"."dental_treatment_master"("technique_material_addition_group");

-- CreateIndex
CREATE INDEX "dental_general_rule_addition_correspondence_group_number_idx" ON "public"."dental_general_rule_addition_correspondence"("group_number");

-- CreateIndex
CREATE INDEX "dental_basic_addition_correspondence_group_number_idx" ON "public"."dental_basic_addition_correspondence"("group_number");

-- CreateIndex
CREATE INDEX "dental_note_addition_correspondence_group_number_idx" ON "public"."dental_note_addition_correspondence"("group_number");

-- CreateIndex
CREATE INDEX "dental_technique_material_addition_correspondence_group_num_idx" ON "public"."dental_technique_material_addition_correspondence"("group_number");

-- CreateIndex
CREATE INDEX "dental_calculation_limit_code_idx" ON "public"."dental_calculation_limit"("code");

-- CreateIndex
CREATE INDEX "dental_notch_code_idx" ON "public"."dental_notch"("code");

-- CreateIndex
CREATE INDEX "dental_age_limit_code_idx" ON "public"."dental_age_limit"("code");

-- CreateIndex
CREATE INDEX "dental_concurrent_calculation_conflict_code_idx" ON "public"."dental_concurrent_calculation_conflict"("code");

-- CreateIndex
CREATE INDEX "dental_actual_days_related_code_idx" ON "public"."dental_actual_days_related"("code");

-- CreateIndex
CREATE UNIQUE INDEX "dispensing_master_code_key" ON "public"."dispensing_master"("code");

-- CreateIndex
CREATE UNIQUE INDEX "home_nursing_care_master_code_key" ON "public"."home_nursing_care_master"("code");

-- CreateIndex
CREATE UNIQUE INDEX "home_nursing_care_master_addition_group_key" ON "public"."home_nursing_care_master"("addition_group");

-- CreateIndex
CREATE UNIQUE INDEX "home_nursing_care_master_facility_standard_group_key" ON "public"."home_nursing_care_master"("facility_standard_group");

-- CreateIndex
CREATE INDEX "home_nursing_care_basic_addition_correspondence_group_numbe_idx" ON "public"."home_nursing_care_basic_addition_correspondence"("group_number");

-- CreateIndex
CREATE INDEX "home_nursing_care_calculation_limit_code_idx" ON "public"."home_nursing_care_calculation_limit"("code");

-- CreateIndex
CREATE INDEX "home_nursing_care_concurrent_calculation_conflict_code_idx" ON "public"."home_nursing_care_concurrent_calculation_conflict"("code");

-- CreateIndex
CREATE INDEX "home_nursing_care_facility_standard_group_number_idx" ON "public"."home_nursing_care_facility_standard"("group_number");

-- AddForeignKey
ALTER TABLE "public"."organization_user" ADD CONSTRAINT "organization_user_organization_id_fkey" FOREIGN KEY ("organization_id") REFERENCES "public"."organization"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."patient" ADD CONSTRAINT "patient_organization_id_fkey" FOREIGN KEY ("organization_id") REFERENCES "public"."organization"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."dental_general_rule_addition_correspondence" ADD CONSTRAINT "dental_general_rule_addition_correspondence_group_number_fkey" FOREIGN KEY ("group_number") REFERENCES "public"."dental_treatment_master"("general_rule_addition_group") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."dental_basic_addition_correspondence" ADD CONSTRAINT "dental_basic_addition_correspondence_group_number_fkey" FOREIGN KEY ("group_number") REFERENCES "public"."dental_treatment_master"("basic_addition_group") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."dental_note_addition_correspondence" ADD CONSTRAINT "dental_note_addition_correspondence_group_number_fkey" FOREIGN KEY ("group_number") REFERENCES "public"."dental_treatment_master"("note_addition_group") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."dental_technique_material_addition_correspondence" ADD CONSTRAINT "dental_technique_material_addition_correspondence_group_nu_fkey" FOREIGN KEY ("group_number") REFERENCES "public"."dental_treatment_master"("technique_material_addition_group") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."dental_calculation_limit" ADD CONSTRAINT "dental_calculation_limit_code_fkey" FOREIGN KEY ("code") REFERENCES "public"."dental_treatment_master"("code") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."dental_notch" ADD CONSTRAINT "dental_notch_code_fkey" FOREIGN KEY ("code") REFERENCES "public"."dental_treatment_master"("code") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."dental_age_limit" ADD CONSTRAINT "dental_age_limit_code_fkey" FOREIGN KEY ("code") REFERENCES "public"."dental_treatment_master"("code") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."dental_concurrent_calculation_conflict" ADD CONSTRAINT "dental_concurrent_calculation_conflict_code_fkey" FOREIGN KEY ("code") REFERENCES "public"."dental_treatment_master"("code") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."dental_actual_days_related" ADD CONSTRAINT "dental_actual_days_related_code_fkey" FOREIGN KEY ("code") REFERENCES "public"."dental_treatment_master"("code") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."home_nursing_care_basic_addition_correspondence" ADD CONSTRAINT "home_nursing_care_basic_addition_correspondence_group_numb_fkey" FOREIGN KEY ("group_number") REFERENCES "public"."home_nursing_care_master"("addition_group") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."home_nursing_care_calculation_limit" ADD CONSTRAINT "home_nursing_care_calculation_limit_code_fkey" FOREIGN KEY ("code") REFERENCES "public"."home_nursing_care_master"("code") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."home_nursing_care_concurrent_calculation_conflict" ADD CONSTRAINT "home_nursing_care_concurrent_calculation_conflict_code_fkey" FOREIGN KEY ("code") REFERENCES "public"."home_nursing_care_master"("code") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."home_nursing_care_facility_standard" ADD CONSTRAINT "home_nursing_care_facility_standard_group_number_fkey" FOREIGN KEY ("group_number") REFERENCES "public"."home_nursing_care_master"("facility_standard_group") ON DELETE RESTRICT ON UPDATE CASCADE;
