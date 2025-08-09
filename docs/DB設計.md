# DB設計

codeにはインデックスを貼るようにする

## organization テーブル

| カラム名                       | データ型    | NULL許容 | 主キー | 外部キー | コメント         |
|------------------------------|-----------|--------|------|--------|------------------|
| id                           | UUID      | NO     | PK   |        | 医療機関ID       |
| name                         | VARCHAR(255)| NO     |      |        | 医療機関名       |
| short_name                   | VARCHAR(255)| NO     |      |        | 医療機関名（短縮名） |
| prefecture_code              | INT       | NO     |      |        | 都道府県コード   |
| medical_institution_code     | VARCHAR(20)| NO     |      |        | 医療機関コード   |
| facility_standard_notification_code | VARCHAR(20)| NO     |      |        | 施設基準届出コード |
| phone_number                 | VARCHAR(50)| YES    |      |        | 電話番号         |
| created_at                   | TIMESTAMP | NO     |      |        | 作成日時         |
| updated_at                   | TIMESTAMP | NO     |      |        | 更新日時         |

## patient テーブル

| カラム名           | データ型    | NULL許容 | 主キー | 外部キー         | コメント       |
|------------------|-----------|--------|------|----------------|--------------|
| id               | UUID      | NO     | PK   |                | 患者ID         |
| organization_id  | UUID      | NO     |      | FK (organization.id) | 所属する医療機関 |
| first_name       | VARCHAR(255)| NO     |      |                | 名             |
| last_name        | VARCHAR(255)| NO     |      |                | 姓             |
| kana_first_name  | VARCHAR(255)| NO     |      |                | 名（ふりがな） |
| kana_last_name   | VARCHAR(255)| NO     |      |                | 姓（ふりがな） |
| gender           | INT       | NO     |      |                | 性別           |
| date_of_birth    | DATE      | NO     |      |                | 生年月日       |
| phone_number     | VARCHAR(50)| YES    |      |                | 電話番号       |
| created_at       | TIMESTAMP | NO     |      |                | 作成日時       |
| updated_at       | TIMESTAMP | NO     |      |                | 更新日時       |
| deleted_at       | TIMESTAMP | YES    |      |                | 論理削除日時   |

## disease_name_master テーブル

| カラム名                                     | データ型    | NULL許容 | 主キー | コメント                 |
|--------------------------------------------|-----------|--------|------|--------------------------|
| id                                         | BIGINT    | NO     | PK   | 内部管理用ID (連番)      |
| change_division                            | INT       | NO     |      | 変更区分                 |
| master_type                                | VARCHAR(1)| NO     |      | マスター種別             |
| code                                       | VARCHAR(7)| NO     |      | 傷病名コード             |
| transition_destination_code                | VARCHAR(7)| YES    |      | 移行先コード             |
| basic_name_length                          | INT       | NO     |      | 傷病名基本名称桁数       |
| basic_name                                 | VARCHAR(60)| NO     |      | 傷病名基本名称           |
| abbreviated_name_length                    | INT       | NO     |      | 傷病名省略名称桁数       |
| abbreviated_name                           | VARCHAR(40)| YES    |      | 傷病名省略名称           |
| kana_name_length                           | INT       | NO     |      | 傷病名カナ名称桁数       |
| kana_name                                  | VARCHAR(100)| NO     |      | 傷病名カナ名称           |
| disease_management_number                  | VARCHAR(8)| NO     |      | 病名管理番号             |
| adoption_division                          | INT       | NO     |      | 採択区分                 |
| exchange_code                              | VARCHAR(4)| NO     |      | 病名交換用コード         |
| icd10_1_2013                               | VARCHAR(5)| YES    |      | ICD-10-1 (2013)          |
| icd10_2_2013                               | VARCHAR(5)| YES    |      | ICD-10-2 (2013)          |
| single_use_prohibition_division            | VARCHAR(2)| NO     |      | 単独使用禁止区分         |
| not_for_insurance_claim_division           | INT       | NO     |      | 保険請求外区分           |
| specific_disease_target_division           | VARCHAR(2)| YES    |      | 特定疾患等対象区分       |
| recorded_date                              | DATE      | YES    |      | 収載年月日               |
| changed_date                               | DATE      | YES    |      | 変更年月日               |
| abolished_date                             | DATE      | YES    |      | 廃止年月日               |
| basic_name_change_info                     | INT       | NO     |      | 傷病名基本名称（変更情報） |
| abbreviated_name_change_info               | INT       | NO     |      | 傷病名省略名称（変更情報） |
| kana_name_change_info                      | INT       | NO     |      | 傷病名カナ名称（変更情報） |
| adoption_division_change_info              | INT       | NO     |      | 採択区分（変更情報）     |
| exchange_code_change_info                  | INT       | NO     |      | 病名交換用コード（変更情報） |
| dental_abbreviated_name_change_info        | INT       | NO     |      | 歯科傷病名省略名称（変更情報） |
| intractable_disease_outpatient_target_division_change_info | INT       | NO     |      | 難病外来対象区分（変更情報） |
| dental_specific_disease_target_division_change_info | INT       | NO     |      | 歯科特定疾患対象区分（変更情報） |
| single_use_prohibition_division_change_info | INT       | NO     |      | 単独使用禁止区分（変更情報） |
| not_for_insurance_claim_division_change_info | INT       | NO     |      | 保険請求外区分（変更情報） |
| specific_disease_target_division_change_info | INT       | NO     |      | 特定疾患等対象区分（変更情報） |
| transition_destination_disease_management_number | VARCHAR(8)| YES    |      | 移行先病名管理番号       |
| dental_abbreviated_name                    | VARCHAR(40)| YES    |      | 歯科傷病名省略名称       |
| dental_abbreviated_name_length             | INT       | NO     |      | 歯科傷病名省略名称桁数   |
| intractable_disease_outpatient_target_division | VARCHAR(2)| YES    |      | 難病外来対象区分         |
| dental_specific_disease_target_division    | VARCHAR(2)| YES    |      | 歯科特定疾患対象区分     |
| icd10_1_2013_change_info                   | INT       | NO     |      | ICD-10-1 (2013)（変更情報） |
| icd10_2_2013_change_info                   | INT       | NO     |      | ICD-10-2 (2013)（変更情報） |

## modifier_master テーブル

| カラム名                       | データ型    | NULL許容 | 主キー | コメント         |
|------------------------------|-----------|--------|------|------------------|
| id                           | BIGINT    | NO     | PK   | 内部管理用ID (連番) |
| change_division              | INT       | NO     |      | 変更区分         |
| master_type                  | VARCHAR(1)| NO     |      | マスター種別     |
| code                         | VARCHAR(4)| NO     |      | 修飾語コード     |
| modifier_name_length         | INT       | NO     |      | 修飾語名称桁数   |
| modifier_name                | VARCHAR(40)| NO     |      | 修飾語名称       |
| kana_name_length             | INT       | NO     |      | 修飾語カナ名称桁数 |
| kana_name                    | VARCHAR(60)| NO     |      | 修飾語カナ名称   |
| modifier_name_change_info    | INT       | NO     |      | 修飾語名称（変更情報） |
| kana_name_change_info        | INT       | NO     |      | 修飾語カナ名称（変更情報） |
| recorded_date                | DATE      | YES    |      | 収載年月日       |
| changed_date                 | DATE      | YES    |      | 変更年月日       |
| abolished_date               | DATE      | YES    |      | 廃止年月日       |
| modifier_management_number   | VARCHAR(8)| NO     |      | 修飾語管理番号   |
| modifier_exchange_code       | VARCHAR(9)| YES    |      | 修飾語交換用コード |
| modifier_division            | VARCHAR(8)| YES    |      | 修飾語区分       |

## dental_formula_master テーブル

| カラム名           | データ型    | NULL許容 | 主キー | コメント         |
|------------------|-----------|--------|------|------------------|
| id               | BIGINT    | NO     | PK   | 内部管理用ID (連番) |
| change_division  | INT       | NO     |      | 変更区分         |
| master_type      | VARCHAR(1)| NO     |      | マスター種別     |
| code             | VARCHAR(6)| NO     |      | 歯式コード       |
| dental_formula_name | VARCHAR(100)| NO     |      | 歯式名称         |
| changed_date     | DATE      | YES    |      | 変更年月日       |
| abolished_date   | DATE      | YES    |      | 廃止年月日       |

## medicine_master テーブル

| カラム名                                     | データ型    | NULL許容 | 主キー | コメント                 |
|--------------------------------------------|-----------|--------|------|--------------------------|
| id                                         | BIGINT    | NO     | PK   | 内部管理用ID (連番)      |
| change_division                            | INT       | NO     |      | 変更区分                 |
| master_type                                | VARCHAR(1)| NO     |      | マスター種別             |
| code                                       | VARCHAR(9)| NO     |      | 医薬品コード             |
| kanji_effective_digits                     | INT       | NO     |      | 漢字有効桁数             |
| kanji_name                                 | VARCHAR(64)| NO     |      | 漢字名称                 |
| kana_effective_digits                      | INT       | NO     |      | カナ有効桁数             |
| kana_name                                  | VARCHAR(20)| NO     |      | カナ名称                 |
| unit_code                                  | VARCHAR(3)| NO     |      | 単位コード               |
| unit_kanji_effective_digits                | INT       | NO     |      | 単位漢字有効桁数         |
| unit_kanji_name                            | VARCHAR(12)| NO     |      | 単位漢字名称             |
| amount_type                                | INT       | NO     |      | 金額種別                 |
| new_or_current_amount                      | DECIMAL(13, 2)| NO     |      | 新又は現金額             |
| narcotic_poison_stimulant_psychotropic     | INT       | NO     |      | 麻薬・毒薬・覚醒剤原料・向精神薬 |
| nerve_destroying_agent                     | INT       | NO     |      | 神経破壊剤               |
| biological_preparation                     | INT       | NO     |      | 生物学的製剤             |
| generic_drug                               | INT       | NO     |      | 後発品                   |
| dental_specific_drug                       | INT       | NO     |      | 歯科特定薬剤             |
| contrast_agent                             | INT       | NO     |      | 造影（補助）剤           |
| injection_volume                           | DECIMAL(5, 0)| YES    |      | 注射容量                 |
| listing_method_identifier                  | INT       | NO     |      | 収載方式等識別           |
| product_name_related                       | VARCHAR(9)| YES    |      | 商品名等関連             |
| old_amount_type                            | INT       | NO     |      | 金額種別 (旧金額)        |
| old_amount                                 | DECIMAL(13, 2)| NO     |      | 旧金額                   |
| kanji_name_change_division                 | INT       | NO     |      | 漢字名称変更区分         |
| kana_name_change_division                  | INT       | NO     |      | カナ名称変更区分         |
| dosage_form                                | INT       | NO     |      | 剤形                     |
| changed_date                               | DATE      | NO     |      | 変更年月日               |
| abolished_date                             | DATE      | NO     |      | 廃止年月日               |
| drug_price_standard_listing_code           | VARCHAR(12)| YES    |      | 薬価基準収載医薬品コード |
| publication_order_number                   | VARCHAR(9)| YES    |      | 公表順序番号             |
| transitional_measure_date_or_product_code_expiration_date | DATE      | YES    |      | 経過措置年月日又は商品名医薬品コード使用期限 |
| basic_kanji_name                           | VARCHAR(200)| YES    |      | 基本漢字名称             |
| drug_price_standard_listing_date           | DATE      | YES    |      | 薬価基準収載年月日       |
| generic_name_code                          | VARCHAR(12)| YES    |      | 一般名コード             |
| standard_description_of_generic_prescription | VARCHAR(200)| YES    |      | 一般名処方の標準的な記載 |
| generic_prescription_addition_target_division | INT       | NO     |      | 一般名処方加算対象区分   |
| anti_hiv_drug_division                     | INT       | NO     |      | 抗HIV薬区分              |
| long_term_listed_product_related           | VARCHAR(9)| YES    |      | 長期収載品関連           |
| selective_medical_treatment_division       | INT       | NO     |      | 選定療養区分             |

## specific_equipment_master テーブル

| カラム名                                     | データ型    | NULL許容 | 主キー | コメント                 |
|--------------------------------------------|-----------|--------|------|--------------------------|
| id                                         | BIGINT    | NO     | PK   | 内部管理用ID (連番)      |
| change_division                            | INT       | NO     |      | 変更区分                 |
| master_type                                | VARCHAR(1)| NO     |      | マスター種別             |
| code                                       | VARCHAR(9)| NO     |      | 特定器材コード           |
| kanji_effective_digits                     | INT       | NO     |      | 漢字有効桁数             |
| kanji_name                                 | VARCHAR(64)| NO     |      | 漢字名称                 |
| kana_effective_digits                      | INT       | NO     |      | カナ有効桁数             |
| kana_name                                  | VARCHAR(20)| NO     |      | カナ名称                 |
| unit_code                                  | VARCHAR(3)| NO     |      | 単位コード               |
| unit_kanji_effective_digits                | INT       | NO     |      | 単位漢字有効桁数         |
| unit_kanji_name                            | VARCHAR(12)| NO     |      | 単位漢字名称             |
| amount_type                                | INT       | NO     |      | 金額種別                 |
| new_or_current_amount                      | DECIMAL(13, 2)| NO     |      | 新又は現金額             |
| age_addition_division                      | INT       | NO     |      | 年齢加算区分             |
| lower_age_limit                            | VARCHAR(2)| NO     |      | 下限年齢                 |
| upper_age_limit                            | VARCHAR(2)| NO     |      | 上限年齢                 |
| old_amount_type                            | INT       | NO     |      | 金額種別 (旧金額)        |
| old_amount                                 | DECIMAL(13, 2)| NO     |      | 旧金額                   |
| kanji_name_change_division                 | INT       | NO     |      | 漢字名称変更区分         |
| kana_name_change_division                  | INT       | NO     |      | カナ名称変更区分         |
| oxygen_etc_division                        | INT       | NO     |      | 酸素等区分               |
| specific_equipment_type                    | INT       | NO     |      | 特定器材種別             |
| upper_limit_price                          | INT       | NO     |      | 上限価格                 |
| upper_limit_points                         | VARCHAR(7)| NO     |      | 上限点数                 |
| publication_order_number                   | VARCHAR(9)| YES    |      | 公表順序番号             |
| abolition_new_establishment_related        | VARCHAR(9)| YES    |      | 廃止・新設関連           |
| changed_date                               | DATE      | NO     |      | 変更年月日               |
| transitional_measure_date                  | DATE      | NO     |      | 経過措置年月日           |
| abolished_date                             | DATE      | NO     |      | 廃止年月日               |
| separate_table_number                      | VARCHAR(2)| YES    |      | 別表番号                 |
| division_number                            | VARCHAR(3)| YES    |      | 区分番号                 |
| dpc_application_division                   | INT       | NO     |      | DPC適用区分              |
| basic_kanji_name                           | VARCHAR(300)| YES    |      | 基本漢字名称             |
| remanufactured_single_use_medical_device   | VARCHAR(3)| NO     |      | 再製造単回使用医療機器   |

## comment_master テーブル

| カラム名                       | データ型    | NULL許容 | 主キー | コメント         |
|------------------------------|-----------|--------|------|------------------|
| id                           | BIGINT    | NO     | PK   | 内部管理用ID (連番) |
| change_division              | INT       | NO     |      | 変更区分         |
| master_type                  | VARCHAR(1)| NO     |      | マスター種別     |
| division                     | INT       | NO     |      | 区分             |
| pattern                      | VARCHAR(2)| NO     |      | パターン         |
| serial_number                | VARCHAR(6)| NO     |      | 一連番号         |
| kanji_effective_digits       | INT       | NO     |      | 漢字有効桁数     |
| kanji_name                   | VARCHAR(300)| NO     |      | 漢字名称         |
| kana_effective_digits        | INT       | NO     |      | カナ有効桁数     |
| kana_name                    | VARCHAR(20)| NO     |      | カナ名称         |
| receipt_edit_info_column_position_1 | VARCHAR(2)| YES    |      | レセプト編集情報 カラム位置1 |
| receipt_edit_info_digits_1   | VARCHAR(2)| YES    |      | レセプト編集情報 桁数1 |
| receipt_edit_info_column_position_2 | VARCHAR(2)| YES    |      | レセプト編集情報 カラム位置2 |
| receipt_edit_info_digits_2   | VARCHAR(2)| YES    |      | レセプト編集情報 桁数2 |
| receipt_edit_info_column_position_3 | VARCHAR(2)| YES    |      | レセプト編集情報 カラム位置3 |
| receipt_edit_info_digits_3   | VARCHAR(2)| YES    |      | レセプト編集情報 桁数3 |
| receipt_edit_info_column_position_4 | VARCHAR(2)| YES    |      | レセプト編集情報 カラム位置4 |
| receipt_edit_info_digits_4   | VARCHAR(2)| YES    |      | レセプト編集情報 桁数4 |
| selectable_comment_identifier | INT       | NO     |      | 選択式コメント識別 |
| changed_date                 | DATE      | NO     |      | 変更年月日       |
| abolished_date               | DATE      | NO     |      | 廃止年月日       |
| code                         | VARCHAR(9)| NO     |      | コメントコード   |
| publication_order_number     | VARCHAR(9)| YES    |      | 公表順序番号     |

## medical_treatment_master テーブル

| カラム名                                     | データ型    | NULL許容 | 主キー | コメント                 |
|--------------------------------------------|-----------|--------|------|--------------------------|
| id                                         | BIGINT    | NO     | PK   | 内部管理用ID (連番)      |
| change_division                            | INT       | NO     |      | 変更区分                 |
| master_type                                | VARCHAR(1)| NO     |      | マスター種別             |
| code                                       | VARCHAR(9)| NO     |      | 診療行為コード           |
| abbreviated_kanji_effective_digits         | INT       | NO     |      | 省略漢字有効桁数         |
| abbreviated_kanji_name                     | VARCHAR(64)| NO     |      | 省略漢字名称             |
| abbreviated_kana_effective_digits          | INT       | NO     |      | 省略カナ有効桁数         |
| abbreviated_kana_name                      | VARCHAR(20)| NO     |      | 省略カナ名称             |
| data_standard_code                         | VARCHAR(3)| NO     |      | データ規格コード         |
| kanji_effective_digits                     | INT       | NO     |      | 漢字有効桁数             |
| kanji_name                                 | VARCHAR(12)| NO     |      | 漢字名称                 |
| point_identifier                           | INT       | NO     |      | 点数識別                 |
| new_or_current_points                      | DECIMAL(10, 2)| NO     |      | 新又は現点数             |
| inpatient_outpatient_application_division  | INT       | NO     |      | 入外適用区分             |
| late_elderly_medical_care_application_division | INT       | NO     |      | 後期高齢者医療適用区分   |
| point_column_aggregation_destination_identifier_outpatient | VARCHAR(3)| YES    |      | 点数欄集計先識別（入院外） |
| inclusive_target_inspection                | VARCHAR(2)| YES    |      | 包括対象検査             |
| dpc_application_division                   | INT       | NO     |      | DPC適用区分              |
| hospital_clinic_division                   | INT       | NO     |      | 病院・診療所区分         |
| image_surgery_support_addition             | INT       | NO     |      | 画像等手術支援加算       |
| medical_observation_law_target_division    | INT       | NO     |      | 医療観察法対象区分       |
| nursing_addition                           | VARCHAR(2)| YES    |      | 看護加算                 |
| anesthesia_identifier_division             | INT       | NO     |      | 麻酔識別区分             |
| disease_name_related_division              | VARCHAR(2)| YES    |      | 傷病名関連区分           |
| actual_days                                | INT       | NO     |      | 実日数                   |
| days_times                                 | INT       | NO     |      | 日数・回数               |
| medicine_related_division                  | INT       | NO     |      | 医薬品関連区分           |
| notch_value_calculation_identifier         | INT       | NO     |      | きざみ値計算識別         |
| lower_limit                                | VARCHAR(8)| YES    |      | 下限値                   |
| upper_limit                                | VARCHAR(8)| YES    |      | 上限値                   |
| notch_value                                | VARCHAR(8)| YES    |      | きざみ値                 |
| notch_points                               | DECIMAL(10, 2)| YES    |      | きざみ点数               |
| upper_lower_error_processing               | INT       | NO     |      | 上下限エラー処理         |
| upper_limit_count                          | VARCHAR(3)| YES    |      | 上限回数                 |
| upper_limit_count_error_processing         | INT       | NO     |      | 上限回数エラー処理       |
| note_addition_code                         | VARCHAR(4)| YES    |      | 注加算コード             |
| note_addition_serial_number                | VARCHAR(1)| NO     |      | 注加算通番               |
| general_rule_age                           | INT       | NO     |      | 通則年齢                 |
| lower_age_limit                            | VARCHAR(2)| NO     |      | 下限年齢                 |
| upper_age_limit                            | VARCHAR(2)| NO     |      | 上限年齢                 |
| time_addition_division                     | INT       | NO     |      | 時間加算区分             |
| conformity_division                        | INT       | NO     |      | 適合区分                 |
| target_facility_standard                   | VARCHAR(4)| YES    |      | 対象施設基準             |
| treatment_infant_addition_division         | INT       | NO     |      | 処置乳幼児加算区分       |
| extremely_low_birth_weight_infant_addition_division | INT       | NO     |      | 極低出生体重児加算区分   |
| inpatient_basic_fee_etc_deduction_target_identifier | INT       | NO     |      | 入院基本料等減算対象識別 |
| donor_aggregation_division                 | INT       | NO     |      | ドナー分集計区分         |
| inspection_etc_implementation_judgment_division | INT       | NO     |      | 検査等実施判断区分       |
| inspection_etc_implementation_judgment_group_division | VARCHAR(2)| YES    |      | 検査等実施判断グループ区分 |
| reduction_target_division                  | INT       | NO     |      | 逓減対象区分             |
| spinal_evoked_potential_measurement_etc_addition_division | INT       | NO     |      | 脊髄誘発電位測定等加算区分 |
| cervical_lymph_node_dissection_addition_division | INT       | NO     |      | 頸部郭清術併施加算区分   |
| automatic_suture_device_addition_division  | INT       | NO     |      | 自動縫合器加算区分       |
| outpatient_management_addition_division    | INT       | NO     |      | 外来管理加算区分         |
| old_point_identifier                       | INT       | NO     |      | 点数識別 (旧点数)        |
| old_points                                 | DECIMAL(10, 2)| NO     |      | 旧点数                   |
| kanji_name_change_division                 | INT       | NO     |      | 漢字名称変更区分         |
| kana_name_change_division                  | INT       | NO     |      | カナ名称変更区分         |
| specimen_inspection_comment                | INT       | NO     |      | 検体検査コメント         |
| general_rule_addition_fixed_points_target_division | INT       | NO     |      | 通則加算所定点数対象区分 |
| inclusive_reduction_division               | VARCHAR(3)| YES    |      | 包括逓減区分             |
| ultrasound_endoscopy_inspection_addition_division | INT       | NO     |      | 超音波内視鏡検査加算区分 |
| point_column_aggregation_destination_identifier_inpatient | VARCHAR(3)| YES    |      | 点数欄集計先識別（入院） |
| automatic_anastomosis_device_addition_division | INT       | NO     |      | 自動吻合器加算区分       |
| notification_etc_identifier_division_1     | INT       | NO     |      | 告示等識別区分（１）    |
| notification_etc_identifier_division_2     | INT       | NO     |      | 告示等識別区分（２）    |
| region_addition                            | INT       | NO     |      | 地域加算                 |
| number_of_beds_division                    | INT       | NO     |      | 病床数区分               |
| facility_standard_1                        | VARCHAR(4)| YES    |      | 施設基準①               |
| facility_standard_2                        | VARCHAR(4)| YES    |      | 施設基準②               |
| facility_standard_3                        | VARCHAR(4)| YES    |      | 施設基準③               |
| facility_standard_4                        | VARCHAR(4)| YES    |      | 施設基準④               |
| facility_standard_5                        | VARCHAR(4)| YES    |      | 施設基準⑤               |
| facility_standard_6                        | VARCHAR(4)| YES    |      | 施設基準⑥               |
| facility_standard_7                        | VARCHAR(4)| YES    |      | 施設基準⑦               |
| facility_standard_8                        | VARCHAR(4)| YES    |      | 施設基準⑧               |
| facility_standard_9                        | VARCHAR(4)| YES    |      | 施設基準⑨               |
| facility_standard_10                       | VARCHAR(4)| YES    |      | 施設基準⑩               |
| ultrasound_coagulation_cutting_device_etc_addition_division | INT       | NO     |      | 超音波凝固切開装置等加算区分 |
| short_stay_surgery                         | INT       | NO     |      | 短期滞在手術             |
| dental_application_division                | INT       | NO     |      | 歯科適用区分             |
| code_table_number_alphabet_part            | VARCHAR(1)| YES    |      | コード表用番号（アルファベット部） |
| notification_related_number_alphabet_part  | VARCHAR(1)| YES    |      | 告示・通知関連番号（アルファベット部） |
| changed_date                               | DATE      | NO     |      | 変更年月日               |
| abolished_date                             | DATE      | NO     |      | 廃止年月日               |
| publication_order_number                   | VARCHAR(9)| YES    |      | 公表順序番号             |
| code_table_number_chapter                  | INT       | NO     |      | コード表用番号 章        |
| code_table_number_part                     | INT       | NO     |      | コード表用番号 部        |
| code_table_number_division_number          | INT       | NO     |      | コード表用番号 区分番号  |
| code_table_number_branch_number            | INT       | NO     |      | コード表用番号 枝番      |
| code_table_number_item_number              | INT       | NO     |      | コード表用番号 項番      |
| notification_related_number_chapter        | INT       | NO     |      | 告示・通知関連番号 章    |
| notification_related_number_part           | INT       | NO     |      | 告示・通知関連番号 部    |
| notification_related_number_division_number | INT       | NO     |      | 告示・通知関連番号 区分番号 |
| notification_related_number_branch_number  | INT       | NO     |      | 告示・通知関連番号 枝番  |
| notification_related_number_item_number    | INT       | NO     |      | 告示・通知関連番号 項番  |
| age_addition_1_lower_age                   | VARCHAR(2)| YES    |      | 年齢加算① 下限年齢      |
| age_addition_1_upper_age                   | VARCHAR(2)| YES    |      | 年齢加算① 上限年齢      |
| age_addition_1_medical_treatment_code      | VARCHAR(9)| YES    |      | 年齢加算① 注加算診療行為コード |
| age_addition_2_lower_age                   | VARCHAR(2)| YES    |      | 年齢加算② 下限年齢      |
| age_addition_2_upper_age                   | VARCHAR(2)| YES    |      | 年齢加算② 上限年齢      |
| age_addition_2_medical_treatment_code      | VARCHAR(9)| YES    |      | 年齢加算② 注加算診療行為コード |
| age_addition_3_lower_age                   | VARCHAR(2)| YES    |      | 年齢加算③ 下限年齢      |
| age_addition_3_upper_age                   | VARCHAR(2)| YES    |      | 年齢加算③ 上限年齢      |
| age_addition_3_medical_treatment_code      | VARCHAR(9)| YES    |      | 年齢加算③ 注加算診療行為コード |
| age_addition_4_lower_age                   | VARCHAR(2)| YES    |      | 年齢加算④ 下限年齢      |
| age_addition_4_upper_age                   | VARCHAR(2)| YES    |      | 年齢加算④ 上限年齢      |
| age_addition_4_medical_treatment_code      | VARCHAR(9)| YES    |      | 年齢加算④ 注加算診療行為コード |
| relocation_related                         | VARCHAR(9)| YES    |      | 異動関連                 |
| basic_kanji_name                           | VARCHAR(128)| YES    |      | 基本漢字名称             |
| paranasal_sinus_surgery_endoscope_addition | INT       | NO     |      | 副鼻腔手術用内視鏡加算   |
| paranasal_sinus_surgery_bone_soft_tissue_resection_device_addition | INT       | NO     |      | 副鼻腔手術用骨軟部組織切除機器加算 |
| long_time_anesthesia_management_addition   | INT       | NO     |      | 長時間麻酔管理加算       |
| monitoring_addition                        | INT       | NO     |      | モニタリング加算         |
| frozen_preserved_allogeneic_tissue_addition | INT       | NO     |      | 凍結保存同種組織加算     |
| malignant_tumor_pathological_tissue_specimen_addition | INT       | NO     |      | 悪性腫瘍病理組織標本加算 |
| external_fixator_addition                  | INT       | NO     |      | 創外固定器加算           |
| ultrasound_cutting_device_addition         | INT       | NO     |      | 超音波切削機器加算       |
| left_atrial_appendage_occlusion_surgery_concomitant_division | INT       | NO     |      | 左心耳閉鎖術併施区分     |
| outpatient_infection_control_improvement_addition_etc | VARCHAR(1)| NO     |      | 外来感染対策向上加算等   |
| ent_infant_treatment_addition              | INT       | NO     |      | 耳鼻咽喉科乳幼児処置加算 |
| ent_pediatric_antibiotic_appropriate_use_support_addition | INT       | NO     |      | 耳鼻咽喉科小児抗菌薬適正使用支援加算 |
| incision_local_negative_pressure_closure_treatment_device_addition | INT       | NO     |      | 切開創局所陰圧閉鎖処置機器加算 |
| nursing_staff_treatment_improvement_evaluation_fee_etc | VARCHAR(1)| NO     |      | 看護職員処遇改善評価料等 |
| outpatient_home_care_base_up_evaluation_fee_1 | VARCHAR(1)| NO     |      | 外来・在宅ベースアップ評価料（１） |
| outpatient_home_care_base_up_evaluation_fee_2 | VARCHAR(1)| NO     |      | 外来・在宅ベースアップ評価料（２） |
| remanufactured_single_use_medical_device_use_addition | VARCHAR(3)| NO     |      | 再製造単回使用医療機器使用加算 |

## dental_treatment_master テーブル

| カラム名                                     | データ型    | NULL許容 | 主キー | コメント                 |
|--------------------------------------------|-----------|--------|------|--------------------------|
| id                                         | BIGINT    | NO     | PK   | 内部管理用ID (連番)      |
| change_division                            | INT       | NO     |      | 変更区分                 |
| master_type                                | VARCHAR(1)| NO     |      | マスター種別             |
| code                                       | VARCHAR(9)| NO     |      | 歯科診療行為コード       |
| division                                   | VARCHAR(1)| NO     |      | 区分                     |
| division_number                            | VARCHAR(3)| NO     |      | 区分番号                 |
| branch_number                              | VARCHAR(2)| NO     |      | 区分番号の枝番           |
| item_number                                | VARCHAR(3)| NO     |      | 項番                     |
| addition_code                              | VARCHAR(5)| NO     |      | 加算コード               |
| basic_name                                 | VARCHAR(200)| NO     |      | 基本名称                 |
| abbreviated_name                           | VARCHAR(64)| NO     |      | 省略名称                 |
| points_identifier                          | INT       | NO     |      | 点数等識別               |
| points                                     | DECIMAL(10, 2)| NO     |      | 点数等                   |
| old_points_identifier                      | INT       | NO     |      | 点数等識別 (旧点数)      |
| old_points                                 | DECIMAL(10, 2)| NO     |      | 旧点数等                 |
| inpatient_outpatient_application_division  | INT       | NO     |      | 入外適用区分             |
| late_elderly_medical_care_application_division | INT       | NO     |      | 後期高齢者医療適用区分   |
| time_addition_division                     | INT       | NO     |      | 時間加算区分             |
| hospital_clinic_division                   | INT       | NO     |      | 病院・診療所区分         |
| nursing_addition                           | VARCHAR(2)| YES    |      | 看護加算                 |
| region_addition                            | INT       | NO     |      | 地域加算                 |
| disease_name_related_division              | VARCHAR(2)| YES    |      | 傷病名関連区分           |
| medicine_related_division                  | INT       | NO     |      | 医薬品関連区分           |
| number_of_beds_division                    | INT       | NO     |      | 病床数区分               |
| notification                               | VARCHAR(2)| YES    |      | 届出                     |
| future_visit                               | INT       | NO     |      | 未来院                   |
| short_stay_surgery                         | INT       | NO     |      | 短期滞在手術             |
| special_notes                              | INT       | NO     |      | 特記事項                 |
| inspection_etc_implementation_judgment_division | INT       | NO     |      | 検査等実施判断区分       |
| inspection_etc_implementation_judgment_group_division | VARCHAR(2)| YES    |      | 検査等実施判断グループ区分 |
| reduction_target_division                  | INT       | NO     |      | 逓減対象区分             |
| inclusive_reduction_division               | VARCHAR(3)| YES    |      | 包括逓減区分             |
| conformity_division                        | INT       | NO     |      | 適合区分                 |
| target_facility_standard                   | VARCHAR(4)| YES    |      | 対象施設基準             |
| facility_standard_1                        | VARCHAR(4)| YES    |      | 施設基準①               |
| facility_standard_2                        | VARCHAR(4)| YES    |      | 施設基準②               |
| facility_standard_3                        | VARCHAR(4)| YES    |      | 施設基準③               |
| facility_standard_4                        | VARCHAR(4)| YES    |      | 施設基準④               |
| facility_standard_5                        | VARCHAR(4)| YES    |      | 施設基準⑤               |
| facility_standard_6                        | VARCHAR(4)| YES    |      | 施設基準⑥               |
| facility_standard_7                        | VARCHAR(4)| YES    |      | 施設基準⑦               |
| facility_standard_8                        | VARCHAR(4)| YES    |      | 施設基準⑧               |
| facility_standard_9                        | VARCHAR(4)| YES    |      | 施設基準⑨               |
| facility_standard_10                       | VARCHAR(4)| YES    |      | 施設基準⑩               |
| general_rule_addition_group                | VARCHAR(4)| NO     |      | 通則加算グループ         |
| basic_addition_group                       | VARCHAR(4)| NO     |      | 基本加算グループ         |
| note_addition_group                        | VARCHAR(4)| NO     |      | 注加算グループ           |
| technique_material_addition_group          | VARCHAR(4)| NO     |      | 手技・材料加算グループ   |
| calculation_limit_table_related_identifier | INT       | NO     |      | 算定回数限度テーブル関連識別 |
| notch_table_related_identifier             | INT       | NO     |      | きざみテーブル関連識別   |
| age_limit_table_related_identifier         | INT       | NO     |      | 年齢制限テーブル関連識別 |
| concurrent_calculation_conflict_table_related_identifier | INT       | NO     |      | 併算定背反テーブル関連識別 |
| actual_days_table_related_identifier       | INT       | NO     |      | 実日数テーブル関連識別   |
| changed_date                               | DATE      | NO     |      | 変更年月日               |
| abolished_date                             | DATE      | NO     |      | 廃止年月日               |
| long_time_anesthesia_management_addition   | INT       | NO     |      | 長時間麻酔管理加算       |
| malignant_tumor_pathological_tissue_specimen_addition | INT       | NO     |      | 悪性腫瘍病理組織標本加算 |
| nursing_staff_treatment_improvement_evaluation_fee_etc | INT       | NO     |      | 看護職員処遇改善評価料等 |
| dental_outpatient_home_care_base_up_evaluation_fee_1 | INT       | NO     |      | 歯科外来・在宅ベースアップ評価料（１） |
| dental_outpatient_home_care_base_up_evaluation_fee_2 | INT       | NO     |      | 歯科外来・在宅ベースアップ評価料（２） |
| publication_order_number                   | VARCHAR(9)| YES    |      | 公表順序番号             |

## dental_general_rule_addition_correspondence テーブル

| カラム名           | データ型    | NULL許容 | 主キー | 外部キー | コメント         |
|------------------|-----------|--------|------|--------|------------------|
| id               | BIGINT    | NO     | PK   |        | 内部管理用ID (連番) |
| change_division  | INT       | NO     |      |        | 変更区分         |
| group_number     | VARCHAR(4)| NO     |      | FK (dental_treatment_master.general_rule_addition_group) | グループ番号     |
| addition_code    | VARCHAR(5)| NO     |      |        | 加算コード       |
| code | VARCHAR(9)| NO     |      |        | 歯科診療行為コード |
| basic_name       | VARCHAR(200)| NO     |      |        | 基本名称         |
| addition_identifier | INT       | NO     |      |        | 加算識別         |
| changed_date     | DATE      | NO     |      |        | 変更年月日       |
| abolished_date   | DATE      | NO     |      |        | 廃止年月日       |

## dental_basic_addition_correspondence テーブル

| カラム名           | データ型    | NULL許容 | 主キー | 外部キー | コメント         |
|------------------|-----------|--------|------|--------|------------------|
| id               | BIGINT    | NO     | PK   |        | 内部管理用ID (連番) |
| change_division  | INT       | NO     |      |        | 変更区分         |
| group_number     | VARCHAR(4)| NO     |      | FK (dental_treatment_master.basic_addition_group) | グループ番号     |
| addition_code    | VARCHAR(5)| NO     |      |        | 加算コード       |
| code | VARCHAR(9)| NO     |      |        | 歯科診療行為コード |
| basic_name       | VARCHAR(200)| NO     |      |        | 基本名称         |
| addition_identifier | INT       | NO     |      |        | 加算識別         |
| changed_date     | DATE      | NO     |      |        | 変更年月日       |
| abolished_date   | DATE      | NO     |      |        | 廃止年月日       |

## dental_note_addition_correspondence テーブル

| カラム名           | データ型    | NULL許容 | 主キー | 外部キー | コメント         |
|------------------|-----------|--------|------|--------|------------------|
| id               | BIGINT    | NO     | PK   |        | 内部管理用ID (連番) |
| change_division  | INT       | NO     |      |        | 変更区分         |
| group_number     | VARCHAR(4)| NO     |      | FK (dental_treatment_master.note_addition_group) | グループ番号     |
| addition_code    | VARCHAR(5)| NO     |      |        | 加算コード       |
| code | VARCHAR(9)| NO     |      |        | 歯科診療行為コード |
| basic_name       | VARCHAR(200)| NO     |      |        | 基本名称         |
| addition_identifier | INT       | NO     |      |        | 加算識別         |
| changed_date     | DATE      | NO     |      |        | 変更年月日       |
| abolished_date   | DATE      | NO     |      |        | 廃止年月日       |

## dental_technique_material_addition_correspondence テーブル

| カラム名           | データ型    | NULL許容 | 主キー | 外部キー | コメント         |
|------------------|-----------|--------|------|--------|------------------|
| id               | BIGINT    | NO     | PK   |        | 内部管理用ID (連番) |
| change_division  | INT       | NO     |      |        | 変更区分         |
| group_number     | VARCHAR(4)| NO     |      | FK (dental_treatment_master.technique_material_addition_group) | グループ番号     |
| addition_code    | VARCHAR(5)| NO     |      |        | 加算コード       |
| code | VARCHAR(9)| NO     |      |        | 歯科診療行為コード |
| basic_name       | VARCHAR(200)| NO     |      |        | 基本名称         |
| addition_identifier | INT       | NO     |      |        | 加算識別         |
| changed_date     | DATE      | NO     |      |        | 変更年月日       |
| abolished_date   | DATE      | NO     |      |        | 廃止年月日       |

## dental_calculation_limit テーブル

| カラム名           | データ型    | NULL許容 | 主キー | 外部キー | コメント         |
|------------------|-----------|--------|------|--------|------------------|
| id               | BIGINT    | NO     | PK   |        | 内部管理用ID (連番) |
| change_division  | INT       | NO     |      |        | 変更区分         |
| code | VARCHAR(9)| NO     |      | FK (dental_treatment_master.code) | 歯科診療行為コード |
| division         | VARCHAR(1)| NO     |      |        | 区分             |
| division_number  | VARCHAR(3)| NO     |      |        | 区分番号         |
| branch_number    | VARCHAR(2)| NO     |      |        | 枝番             |
| item_number      | VARCHAR(3)| NO     |      |        | 項番             |
| addition_code    | VARCHAR(5)| NO     |      |        | 加算コード       |
| basic_name       | VARCHAR(200)| NO     |      |        | 基本名称         |
| abbreviated_name | VARCHAR(64)| NO     |      |        | 省略名称         |
| calculation_unit | INT       | NO     |      |        | 算定単位         |
| calculation_limit_count | INT       | NO     |      |        | 算定回数限度     |
| upper_limit_error_processing | INT       | NO     |      |        | 上限回数エラー処理 |
| changed_date     | DATE      | NO     |      |        | 変更年月日       |
| abolished_date   | DATE      | NO     |      |        | 廃止年月日       |

## dental_notch テーブル

| カラム名           | データ型    | NULL許容 | 主キー | 外部キー | コメント         |
|------------------|-----------|--------|------|--------|------------------|
| id               | BIGINT    | NO     | PK   |        | 内部管理用ID (連番) |
| change_division  | INT       | NO     |      |        | 変更区分         |
| code | VARCHAR(9)| NO     |      | FK (dental_treatment_master.code) | 歯科診療行為コード |
| division         | VARCHAR(1)| NO     |      |        | 区分             |
| division_number  | VARCHAR(3)| NO     |      |        | 区分番号         |
| branch_number    | VARCHAR(2)| NO     |      |        | 枝番             |
| item_number      | VARCHAR(3)| NO     |      |        | 項番             |
| addition_code    | VARCHAR(5)| NO     |      |        | 加算コード       |
| basic_name       | VARCHAR(200)| NO     |      |        | 基本名称         |
| abbreviated_name | VARCHAR(64)| NO     |      |        | 省略名称         |
| points_identifier | INT       | NO     |      |        | 点数等識別       |
| points           | DECIMAL(10, 2)| NO     |      |        | 点数             |
| notch_unit       | INT       | NO     |      |        | きざみ単位       |
| notch_lower_limit | VARCHAR(8)| NO     |      |        | きざみ下限値     |
| notch_upper_limit | VARCHAR(8)| NO     |      |        | きざみ上限値     |
| notch_value      | VARCHAR(8)| NO     |      |        | きざみ値         |
| notch_points     | DECIMAL(10, 2)| NO     |      |        | きざみ点数       |
| notch_upper_lower_error_processing | INT       | NO     |      |        | きざみ上下限エラー処理 |
| changed_date     | DATE      | NO     |      |        | 変更年月日       |
| abolished_date   | DATE      | NO     |      |        | 廃止年月日       |

## dental_age_limit テーブル

| カラム名           | データ型    | NULL許容 | 主キー | 外部キー | コメント         |
|------------------|-----------|--------|------|--------|------------------|
| id               | BIGINT    | NO     | PK   |        | 内部管理用ID (連番) |
| change_division  | INT       | NO     |      |        | 変更区分         |
| code | VARCHAR(9)| NO     |      | FK (dental_treatment_master.code) | 歯科診療行為コード |
| division         | VARCHAR(1)| NO     |      |        | 区分             |
| division_number  | VARCHAR(3)| NO     |      |        | 区分番号         |
| branch_number    | VARCHAR(2)| NO     |      |        | 枝番             |
| item_number      | VARCHAR(3)| NO     |      |        | 項番             |
| addition_code    | VARCHAR(5)| NO     |      |        | 加算コード       |
| basic_name       | VARCHAR(200)| NO     |      |        | 基本名称         |
| abbreviated_name | VARCHAR(64)| NO     |      |        | 省略名称         |
| lower_age_limit  | VARCHAR(2)| NO     |      |        | 下限年齢         |
| upper_age_limit  | VARCHAR(2)| NO     |      |        | 上限年齢         |
| changed_date     | DATE      | NO     |      |        | 変更年月日       |
| abolished_date   | DATE      | NO     |      |        | 廃止年月日       |

## dental_concurrent_calculation_conflict テーブル

| カラム名           | データ型    | NULL許容 | 主キー | 外部キー | コメント         |
|------------------|-----------|--------|------|--------|------------------|
| id               | BIGINT    | NO     | PK   |        | 内部管理用ID (連番) |
| change_division  | INT       | NO     |      |        | 変更区分         |
| code | VARCHAR(9)| NO     |      | FK (dental_treatment_master.dental_treatment_code) | 歯科診療行為コード |
| division         | VARCHAR(1)| NO     |      |        | 区分             |
| division_number  | VARCHAR(3)| NO     |      |        | 区分番号         |
| branch_number    | VARCHAR(2)| NO     |      |        | 枝番             |
| item_number      | VARCHAR(3)| NO     |      |        | 項番             |
| addition_code    | VARCHAR(5)| NO     |      |        | 加算コード       |
| basic_name       | VARCHAR(200)| NO     |      |        | 基本名称         |
| abbreviated_name | VARCHAR(64)| NO     |      |        | 省略名称         |
| conflict_info_1_calculable | INT       | NO     |      |        | 背反1 算定可否   |
| conflict_info_1_dental_treatment_code | VARCHAR(9)| NO     |      |        | 背反1 歯科診療行為コード |
| conflict_info_1_division | VARCHAR(1)| NO     |      |        | 背反1 区分       |
| conflict_info_1_division_number | VARCHAR(3)| NO     |      |        | 背反1 区分番号   |
| conflict_info_1_branch_number | VARCHAR(2)| NO     |      |        | 背反1 枝番       |
| conflict_info_1_item_number | VARCHAR(3)| NO     |      |        | 背反1 項番       |
| conflict_info_1_addition_code | VARCHAR(5)| NO     |      |        | 背反1 加算コード |
| conflict_info_1_basic_name | VARCHAR(200)| NO     |      |        | 背反1 基本名称   |
| conflict_info_1_abbreviated_name | VARCHAR(64)| NO     |      |        | 背反1 省略名称   |
| conflict_info_2_calculable | INT       | NO     |      |        | 背反2 算定可否   |
| conflict_info_2_dental_treatment_code | VARCHAR(9)| NO     |      |        | 背反2 歯科診療行為コード |
| conflict_info_2_division | VARCHAR(1)| NO     |      |        | 背反2 区分       |
| conflict_info_2_division_number | VARCHAR(3)| NO     |      |        | 背反2 区分番号   |
| conflict_info_2_branch_number | VARCHAR(2)| NO     |      |        | 背反2 枝番       |
| conflict_info_2_item_number | VARCHAR(3)| NO     |      |        | 背反2 項番       |
| conflict_info_2_addition_code | VARCHAR(5)| NO     |      |        | 背反2 加算コード |
| conflict_info_2_basic_name | VARCHAR(200)| NO     |      |        | 背反2 基本名称   |
| conflict_info_2_abbreviated_name | VARCHAR(64)| NO     |      |        | 背反2 省略名称   |
| conflict_info_3_calculable | INT       | NO     |      |        | 背反3 算定可否   |
| conflict_info_3_dental_treatment_code | VARCHAR(9)| NO     |      |        | 背反3 歯科診療行為コード |
| conflict_info_3_division | VARCHAR(1)| NO     |      |        | 背反3 区分       |
| conflict_info_3_division_number | VARCHAR(3)| NO     |      |        | 背反3 区分番号   |
| conflict_info_3_branch_number | VARCHAR(2)| NO     |      |        | 背反3 枝番       |
| conflict_info_3_item_number | VARCHAR(3)| NO     |      |        | 背反3 項番       |
| conflict_info_3_addition_code | VARCHAR(5)| NO     |      |        | 背反3 加算コード |
| conflict_info_3_basic_name | VARCHAR(200)| NO     |      |        | 背反3 基本名称   |
| conflict_info_3_abbreviated_name | VARCHAR(64)| NO     |      |        | 背反3 省略名称   |
| conflict_info_4_calculable | INT       | NO     |      |        | 背反4 算定可否   |
| conflict_info_4_dental_treatment_code | VARCHAR(9)| NO     |      |        | 背反4 歯科診療行為コード |
| conflict_info_4_division | VARCHAR(1)| NO     |      |        | 背反4 区分       |
| conflict_info_4_division_number | VARCHAR(3)| NO     |      |        | 背反4 区分番号   |
| conflict_info_4_branch_number | VARCHAR(2)| NO     |      |        | 背反4 枝番       |
| conflict_info_4_item_number | VARCHAR(3)| NO     |      |        | 背反4 項番       |
| conflict_info_4_addition_code | VARCHAR(5)| NO     |      |        | 背反4 加算コード |
| conflict_info_4_basic_name | VARCHAR(200)| NO     |      |        | 背反4 基本名称   |
| conflict_info_4_abbreviated_name | VARCHAR(64)| NO     |      |        | 背反4 省略名称   |
| conflict_info_5_calculable | INT       | NO     |      |        | 背反5 算定可否   |
| conflict_info_5_dental_treatment_code | VARCHAR(9)| NO     |      |        | 背反5 歯科診療行為コード |
| conflict_info_5_division | VARCHAR(1)| NO     |      |        | 背反5 区分       |
| conflict_info_5_division_number | VARCHAR(3)| NO     |      |        | 背反5 区分番号   |
| conflict_info_5_branch_number | VARCHAR(2)| NO     |      |        | 背反5 枝番       |
| conflict_info_5_item_number | VARCHAR(3)| NO     |      |        | 背反5 項番       |
| conflict_info_5_addition_code | VARCHAR(5)| NO     |      |        | 背反5 加算コード |
| conflict_info_5_basic_name | VARCHAR(200)| NO     |      |        | 背反5 基本名称   |
| conflict_info_5_abbreviated_name | VARCHAR(64)| NO     |      |        | 背反5 省略名称   |
| conflict_info_6_calculable | INT       | NO     |      |        | 背反6 算定可否   |
| conflict_info_6_dental_treatment_code | VARCHAR(9)| NO     |      |        | 背反6 歯科診療行為コード |
| conflict_info_6_division | VARCHAR(1)| NO     |      |        | 背反6 区分       |
| conflict_info_6_division_number | VARCHAR(3)| NO     |      |        | 背反6 区分番号   |
| conflict_info_6_branch_number | VARCHAR(2)| NO     |      |        | 背反6 枝番       |
| conflict_info_6_item_number | VARCHAR(3)| NO     |      |        | 背反6 項番       |
| conflict_info_6_addition_code | VARCHAR(5)| NO     |      |        | 背反6 加算コード |
| conflict_info_6_basic_name | VARCHAR(200)| NO     |      |        | 背反6 基本名称   |
| conflict_info_6_abbreviated_name | VARCHAR(64)| NO     |      |        | 背反6 省略名称   |
| conflict_info_7_calculable | INT       | NO     |      |        | 背反7 算定可否   |
| conflict_info_7_dental_treatment_code | VARCHAR(9)| NO     |      |        | 背反7 歯科診療行為コード |
| conflict_info_7_division | VARCHAR(1)| NO     |      |        | 背反7 区分       |
| conflict_info_7_division_number | VARCHAR(3)| NO     |      |        | 背反7 区分番号   |
| conflict_info_7_branch_number | VARCHAR(2)| NO     |      |        | 背反7 枝番       |
| conflict_info_7_item_number | VARCHAR(3)| NO     |      |        | 背反7 項番       |
| conflict_info_7_addition_code | VARCHAR(5)| NO     |      |        | 背反7 加算コード |
| conflict_info_7_basic_name | VARCHAR(200)| NO     |      |        | 背反7 基本名称   |
| conflict_info_7_abbreviated_name | VARCHAR(64)| NO     |      |        | 背反7 省略名称   |
| conflict_info_8_calculable | INT       | NO     |      |        | 背反8 算定可否   |
| conflict_info_8_dental_treatment_code | VARCHAR(9)| NO     |      |        | 背反8 歯科診療行為コード |
| conflict_info_8_division | VARCHAR(1)| NO     |      |        | 背反8 区分       |
| conflict_info_8_division_number | VARCHAR(3)| NO     |      |        | 背反8 区分番号   |
| conflict_info_8_branch_number | VARCHAR(2)| NO     |      |        | 背反8 枝番       |
| conflict_info_8_item_number | VARCHAR(3)| NO     |      |        | 背反8 項番       |
| conflict_info_8_addition_code | VARCHAR(5)| NO     |      |        | 背反8 加算コード |
| conflict_info_8_basic_name | VARCHAR(200)| NO     |      |        | 背反8 基本名称   |
| conflict_info_8_abbreviated_name | VARCHAR(64)| NO     |      |        | 背反8 省略名称   |
| conflict_info_9_calculable | INT       | NO     |      |        | 背反9 算定可否   |
| conflict_info_9_dental_treatment_code | VARCHAR(9)| NO     |      |        | 背反9 歯科診療行為コード |
| conflict_info_9_division | VARCHAR(1)| NO     |      |        | 背反9 区分       |
| conflict_info_9_division_number | VARCHAR(3)| NO     |      |        | 背反9 区分番号   |
| conflict_info_9_branch_number | VARCHAR(2)| NO     |      |        | 背反9 枝番       |
| conflict_info_9_item_number | VARCHAR(3)| NO     |      |        | 背反9 項番       |
| conflict_info_9_addition_code | VARCHAR(5)| NO     |      |        | 背反9 加算コード |
| conflict_info_9_basic_name | VARCHAR(200)| NO     |      |        | 背反9 基本名称   |
| conflict_info_9_abbreviated_name | VARCHAR(64)| NO     |      |        | 背反9 省略名称   |
| conflict_info_10_calculable | INT       | NO     |      |        | 背反10 算定可否  |
| conflict_info_10_dental_treatment_code | VARCHAR(9)| NO     |      |        | 背反10 歯科診療行為コード |
| conflict_info_10_division | VARCHAR(1)| NO     |      |        | 背反10 区分      |
| conflict_info_10_division_number | VARCHAR(3)| NO     |      |        | 背反10 区分番号  |
| conflict_info_10_branch_number | VARCHAR(2)| NO     |      |        | 背反10 枝番      |
| conflict_info_10_item_number | VARCHAR(3)| NO     |      |        | 背反10 項番      |
| conflict_info_10_addition_code | VARCHAR(5)| NO     |      |        | 背反10 加算コード |
| conflict_info_10_basic_name | VARCHAR(200)| NO     |      |        | 背反10 基本名称  |
| conflict_info_10_abbreviated_name | VARCHAR(64)| NO     |      |        | 背反10 省略名称  |
| changed_date     | DATE      | NO     |      |        | 変更年月日       |
| abolished_date   | DATE      | NO     |      |        | 廃止年月日       |

## dental_actual_days_related テーブル

| カラム名           | データ型    | NULL許容 | 主キー | 外部キー | コメント         |
|------------------|-----------|--------|------|--------|------------------|
| id               | BIGINT    | NO     | PK   |        | 内部管理用ID (連番) |
| change_division  | INT       | NO     |      |        | 変更区分         |
| code | VARCHAR(9)| NO     |      | FK (dental_treatment_master.dental_treatment_code) | 歯科診療行為コード |
| division         | VARCHAR(1)| NO     |      |        | 区分             |
| division_number  | VARCHAR(3)| NO     |      |        | 区分番号         |
| branch_number    | VARCHAR(2)| NO     |      |        | 枝番             |
| item_number      | VARCHAR(3)| NO     |      |        | 項番             |
| addition_code    | VARCHAR(5)| NO     |      |        | 加算コード       |
| basic_name       | VARCHAR(200)| NO     |      |        | 基本名称         |
| abbreviated_name | VARCHAR(64)| NO     |      |        | 省略名称         |
| actual_days      | INT       | NO     |      |        | 実日数           |
| days_times       | INT       | NO     |      |        | 日数・回数       |
| changed_date     | DATE      | NO     |      |        | 変更年月日       |
| abolished_date   | DATE      | NO     |      |        | 廃止年月日       |

## dispensing_master テーブル

| カラム名                                     | データ型    | NULL許容 | 主キー | コメント                 |
|--------------------------------------------|-----------|--------|------|--------------------------|
| id                                         | BIGINT    | NO     | PK   | 内部管理用ID (連番)      |
| change_division                            | INT       | NO     |      | 変更区分                 |
| master_identifier                          | VARCHAR(1)| NO     |      | マスター識別             |
| code                                       | VARCHAR(9)| NO     |      | 調剤行為コード           |
| kanji_effective_digits                     | INT       | NO     |      | 漢字有効桁数             |
| kanji_name                                 | VARCHAR(64)| NO     |      | 漢字名称                 |
| kana_effective_digits                      | INT       | NO     |      | カナ有効桁数             |
| kana_name                                  | VARCHAR(20)| NO     |      | カナ名称                 |
| receipt_display_symbol_code                | VARCHAR(3)| NO     |      | レセプト表示用記号コード |
| receipt_display_order_number               | VARCHAR(3)| NO     |      | レセプト表示順番号       |
| new_or_current_points_identifier           | INT       | NO     |      | 新又は現点数点数識別     |
| dispensing_quantity_calculation_flag       | INT       | NO     |      | 調剤数量計算フラグ       |
| new_or_current_points_basic_points         | DECIMAL(9, 2)| NO     |      | 新又は現点数(基本点数)   |
| notch_value_calculation_identifier         | INT       | NO     |      | きざみ値計算識別         |
| lower_limit                                | VARCHAR(3)| NO     |      | 下限値                   |
| upper_limit                                | VARCHAR(3)| NO     |      | 上限値                   |
| notch_value                                | VARCHAR(3)| YES    |      | きざみ値                 |
| notch_points                               | DECIMAL(9, 2)| YES    |      | きざみ点数               |
| upper_lower_error_processing               | INT       | NO     |      | 上下限エラー処理         |
| deduction_behavior_division                | INT       | NO     |      | 減算行為区分             |
| deduction_target_behavior_division         | INT       | NO     |      | 減算対象行為区分         |
| dispensing_behavior_identifier_division    | INT       | NO     |      | 調剤行為識別区分         |
| inclusive_identifier_division              | INT       | NO     |      | 包括識別区分             |
| dispensing_behavior_type_1                 | INT       | NO     |      | 調剤行為種類（１）      |
| dispensing_behavior_type_2                 | INT       | NO     |      | 調剤行為種類（２）      |
| late_elderly_application_division          | INT       | NO     |      | 後期高齢者適用区分       |
| facility_standard_1                        | VARCHAR(3)| NO     |      | 施設基準①               |
| facility_standard_2                        | VARCHAR(3)| NO     |      | 施設基準②               |
| facility_standard_3                        | VARCHAR(3)| NO     |      | 施設基準③               |
| facility_standard_4                        | VARCHAR(3)| NO     |      | 施設基準④               |
| facility_standard_5                        | VARCHAR(3)| NO     |      | 施設基準⑤               |
| facility_standard_6                        | VARCHAR(3)| NO     |      | 施設基準⑥               |
| facility_standard_7                        | VARCHAR(3)| NO     |      | 施設基準⑦               |
| facility_standard_8                        | VARCHAR(3)| NO     |      | 施設基準⑧               |
| facility_standard_9                        | VARCHAR(3)| NO     |      | 施設基準⑨               |
| facility_standard_10                       | VARCHAR(3)| NO     |      | 施設基準⑩               |
| receipt_unit_conflict_code                 | VARCHAR(2)| NO     |      | レセプト単位背反区分コード |
| prescription_reception_unit_conflict_code  | VARCHAR(2)| NO     |      | 処方箋受付回単位背反区分コード |
| dispensing_unit_conflict_code              | VARCHAR(2)| NO     |      | 調剤単位背反区分コード   |
| narcotic_poison_stimulant_psychotropic     | INT       | NO     |      | 麻薬・毒薬・覚醒剤原料・向精神薬 |
| time_addition_division                     | INT       | NO     |      | 時間加算区分             |
| dosage_form                                | INT       | NO     |      | 剤形                     |
| receipt_unit_upper_limit_count             | VARCHAR(2)| NO     |      | レセプト単位 上限回数    |
| receipt_unit_upper_limit_error_processing  | INT       | NO     |      | レセプト単位 上限回数エラー処理 |
| prescription_reception_unit_upper_limit_count | VARCHAR(2)| NO     |      | 処方箋受付回単位 上限回数 |
| prescription_reception_unit_upper_limit_error_processing | INT       | NO     |      | 処方箋受付回単位 上限回数エラー処理 |
| note_addition_code                         | VARCHAR(4)| YES    |      | 注加算コード             |
| note_addition_serial_number                | VARCHAR(1)| NO     |      | 注加算通番               |
| lower_age_limit                            | VARCHAR(2)| NO     |      | 下限年齢                 |
| upper_age_limit                            | VARCHAR(2)| NO     |      | 上限年齢                 |
| pharmaceutical_management_fee_division     | INT       | NO     |      | 薬学管理料区分           |
| notification_etc_identifier_division_1     | INT       | NO     |      | 告示等識別区分（１）    |
| notification_etc_identifier_division_2     | INT       | NO     |      | 告示等識別区分（２）    |
| old_points_identifier                      | INT       | NO     |      | 旧点数識別               |
| old_points                                 | DECIMAL(9, 2)| YES    |      | 旧点数                   |
| changed_date                               | DATE      | NO     |      | 変更年月日               |
| abolished_date                             | DATE      | NO     |      | 廃止年月日               |
| publication_order_number                   | VARCHAR(9)| YES    |      | 公表順序番号             |
| code_table_number                          | VARCHAR(10)| NO     |      | コード表用番号           |
| notification_related_number                | VARCHAR(10)| NO     |      | 告示・通知関連番号       |
| relocation_related                         | VARCHAR(9)| YES    |      | 異動関連                 |

## home_nursing_care_master テーブル

| カラム名                                     | データ型    | NULL許容 | 主キー | コメント                 |
|--------------------------------------------|-----------|--------|------|--------------------------|
| id                                         | BIGINT    | NO     | PK   | 内部管理用ID (連番)      |
| change_division                            | INT       | NO     |      | 変更区分                 |
| master_type                                | VARCHAR(1)| NO     |      | マスター種別             |
| code                                       | VARCHAR(9)| NO     |      | 訪問看護療養費コード     |
| division_number                            | VARCHAR(2)| NO     |      | 区分番号                 |
| branch_number                              | VARCHAR(1)| NO     |      | 枝番                     |
| item_number                                | VARCHAR(2)| NO     |      | 項番                     |
| basic_name                                 | VARCHAR(200)| NO     |      | 基本名称                 |
| abbreviated_name_effective_digits          | INT       | NO     |      | 省略名称有効桁数         |
| abbreviated_name                           | VARCHAR(128)| NO     |      | 省略名称                 |
| abbreviated_kana_name_effective_digits     | INT       | NO     |      | 省略カナ名称有効桁数     |
| abbreviated_kana_name                      | VARCHAR(20)| NO     |      | 省略カナ名称             |
| data_standard_code                         | VARCHAR(3)| NO     |      | データ規格コード         |
| kanji_effective_digits                     | INT       | NO     |      | 漢字有効桁数             |
| kanji_name                                 | VARCHAR(12)| NO     |      | 漢字名称                 |
| amount_identifier                          | INT       | NO     |      | 金額識別                 |
| new_or_current_amount                      | DECIMAL(10, 2)| NO     |      | 新又は現金額             |
| old_amount_identifier                      | INT       | NO     |      | 金額識別 (旧金額)        |
| old_amount                                 | DECIMAL(10, 2)| NO     |      | 旧金額                   |
| notch_value_calculation_identifier         | INT       | NO     |      | きざみ値計算識別         |
| lower_limit                                | VARCHAR(8)| NO     |      | 下限値                   |
| upper_limit                                | VARCHAR(8)| NO     |      | 上限値                   |
| notch_value                                | VARCHAR(8)| NO     |      | きざみ値                 |
| notch_amount                               | DECIMAL(10, 2)| NO     |      | きざみ金額               |
| upper_lower_error_processing               | INT       | NO     |      | 上下限エラー処理         |
| lower_age_limit                            | VARCHAR(2)| NO     |      | 下限年齢                 |
| upper_age_limit                            | VARCHAR(2)| NO     |      | 上限年齢                 |
| late_elderly_medical_care_application_division | INT       | NO     |      | 後期高齢者医療適用区分   |
| medical_observation_law_target_division    | INT       | NO     |      | 医療観察法対象区分       |
| profession_code_1                          | VARCHAR(2)| NO     |      | 職種等コード①           |
| profession_code_2                          | VARCHAR(2)| NO     |      | 職種等コード②           |
| profession_code_3                          | VARCHAR(2)| NO     |      | 職種等コード③           |
| profession_code_4                          | VARCHAR(2)| NO     |      | 職種等コード④           |
| profession_code_5                          | VARCHAR(2)| NO     |      | 職種等コード⑤           |
| profession_code_6                          | VARCHAR(2)| NO     |      | 職種等コード⑥           |
| profession_code_7                          | VARCHAR(2)| NO     |      | 職種等コード⑦           |
| profession_code_8                          | VARCHAR(2)| NO     |      | 職種等コード⑧           |
| profession_code_9                          | VARCHAR(2)| NO     |      | 職種等コード⑨           |
| profession_code_10                         | VARCHAR(2)| NO     |      | 職種等コード⑩           |
| profession_code_11                         | VARCHAR(2)| NO     |      | 職種等コード⑪           |
| profession_code_12                         | VARCHAR(2)| NO     |      | 職種等コード⑫           |
| profession_code_13                         | VARCHAR(2)| NO     |      | 職種等コード⑬           |
| profession_code_14                         | VARCHAR(2)| NO     |      | 職種等コード⑭           |
| profession_code_15                         | VARCHAR(2)| NO     |      | 職種等コード⑮           |
| implementation_count_division              | INT       | NO     |      | 実施回数区分             |
| home_nursing_care_instruction_division     | INT       | NO     |      | 訪問看護指示区分         |
| special_home_nursing_care_instruction_division | INT       | NO     |      | 特別訪問看護指示区分     |
| addition_single_calculation_division       | INT       | NO     |      | 加算単独算定区分         |
| addition_group                             | VARCHAR(4)| NO     |      | 加算グループ             |
| facility_standard_group                    | VARCHAR(4)| NO     |      | 施設基準グループ         |
| basic_addition_correspondence_table_related_identifier | INT       | NO     |      | 基本・加算対応テーブル関連識別 |
| calculation_limit_table_related_identifier | INT       | NO     |      | 算定回数限度テーブル関連識別 |
| concurrent_calculation_conflict_table_related_identifier | INT       | NO     |      | 併算定背反テーブル関連識別 |
| receipt_display_column                     | INT       | NO     |      | レセプト表示欄           |
| receipt_display_item                       | INT       | NO     |      | レセプト表示項           |
| receipt_display_serial_number              | INT       | NO     |      | レセプト表示連番         |
| receipt_display_symbol_1                   | INT       | NO     |      | レセプト表示用記号①     |
| receipt_display_symbol_2                   | INT       | NO     |      | レセプト表示用記号②     |
| receipt_display_symbol_3                   | INT       | NO     |      | レセプト表示用記号③     |
| receipt_display_symbol_4                   | INT       | NO     |      | レセプト表示用記号④     |
| receipt_display_symbol_5                   | INT       | NO     |      | レセプト表示用記号⑤     |
| receipt_display_symbol_6                   | INT       | NO     |      | レセプト表示用記号⑥     |
| receipt_display_symbol_7                   | INT       | NO     |      | レセプト表示用記号⑦     |
| receipt_display_symbol_8                   | INT       | NO     |      | レセプト表示用記号⑧     |
| receipt_display_symbol_9                   | INT       | NO     |      | レセプト表示用記号⑨     |
| publication_order_number                   | VARCHAR(9)| YES    |      | 公表順序番号             |
| home_nursing_care_type                     | VARCHAR(2)| NO     |      | 訪問看護療養費種類       |
| changed_date                               | DATE      | NO     |      | 変更年月日               |
| abolished_date                             | DATE      | NO     |      | 廃止年月日               |

## home_nursing_care_basic_addition_correspondence テーブル

| カラム名           | データ型    | NULL許容 | 主キー | 外部キー | コメント         |
|------------------|-----------|--------|------|--------|------------------|
| id               | BIGINT    | NO     | PK   |        | 内部管理用ID (連番) |
| change_division  | INT       | NO     |      |        | 変更区分         |
| group_number     | VARCHAR(4)| NO     |      | FK (home_nursing_care_master.addition_group) | グループ番号     |
| code | VARCHAR(9)| NO     |      |        | 訪問看護療養費コード |
| abbreviated_name | VARCHAR(128)| NO     |      |        | 省略名称         |
| addition_identifier | INT       | NO     |      |        | 加算識別         |
| changed_date     | DATE      | NO     |      |        | 変更年月日       |
| abolished_date   | DATE      | NO     |      |        | 廃止年月日       |

## home_nursing_care_calculation_limit テーブル

| カラム名           | データ型    | NULL許容 | 主キー | 外部キー | コメント         |
|------------------|-----------|--------|------|--------|------------------|
| id               | BIGINT    | NO     | PK   |        | 内部管理用ID (連番) |
| change_division  | INT       | NO     |      |        | 変更区分         |
| code | VARCHAR(9)| NO     |      | FK (home_nursing_care_master.code) | 訪問看護療養費コード |
| abbreviated_name | VARCHAR(128)| NO     |      |        | 省略名称         |
| calculation_unit | VARCHAR(3)| NO     |      |        | 算定単位         |
| calculation_unit_name | VARCHAR(12)| NO     |      |        | 算定単位名称     |
| calculation_limit_count | INT       | NO     |      |        | 算定回数限度     |
| upper_limit_error_processing | INT       | NO     |      |        | 上限回数エラー処理 |
| changed_date     | DATE      | NO     |      |        | 変更年月日       |
| abolished_date   | DATE      | NO     |      |        | 廃止年月日       |

## home_nursing_care_concurrent_calculation_conflict テーブル

| カラム名           | データ型    | NULL許容 | 主キー | 外部キー | コメント         |
|------------------|-----------|--------|------|--------|------------------|
| id               | BIGINT    | NO     | PK   |        | 内部管理用ID (連番) |
| change_division  | INT       | NO     |      |        | 変更区分         |
| code | VARCHAR(9)| NO     |      | FK (home_nursing_care_master.code) | 訪問看護療養費コード |
| abbreviated_name_1 | VARCHAR(128)| NO     |      |        | 省略名称①       |
| conflict_division | INT       | NO     |      |        | 背反区分         |
| conflict_home_nursing_care_code | VARCHAR(9)| NO     |      |        | 背反訪問看護療養費コード |
| abbreviated_name_2 | VARCHAR(128)| NO     |      |        | 省略名称②       |
| conflict_unit    | INT       | NO     |      |        | 背反単位         |
| special_condition | INT       | NO     |      |        | 特例条件         |
| changed_date     | DATE      | NO     |      |        | 変更年月日       |
| abolished_date   | DATE      | NO     |      |        | 廃止年月日       |

## home_nursing_care_facility_standard テーブル

| カラム名           | データ型    | NULL許容 | 主キー | 外部キー | コメント         |
|------------------|-----------|--------|------|--------|------------------|
| id               | BIGINT    | NO     | PK   |        | 内部管理用ID (連番) |
| change_division  | INT       | NO     |      |        | 変更区分         |
| group_number     | VARCHAR(4)| NO     |      | FK (home_nursing_care_master.facility_standard_group) | グループ番号     |
| code | VARCHAR(9)| NO     |      |        | 訪問看護療養費コード |
| abbreviated_name | VARCHAR(128)| NO     |      |        | 省略名称         |
| facility_standard | VARCHAR(4)| NO     |      |        | 施設基準         |
| facility_standard_identifier | VARCHAR(2)| NO     |      |        | 施設基準識別     |
| changed_date     | DATE      | NO     |      |        | 変更年月日       |
| abolished_date   | DATE      | NO     |      |        | 廃止年月日       |
