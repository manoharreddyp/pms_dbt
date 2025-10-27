{{ config(materialized='view') }}

select
    appointment_id::int as appointment_id,
    patient_id::int as patient_id,
    provider_id::int as provider_id,
    to_timestamp(appointment_dt) as appointment_dt,
    visit_type,
    diagnosis_code
from {{ source('pms_raw', 'APPOINTMENTS') }}
