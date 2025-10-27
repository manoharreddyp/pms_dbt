{{ config(materialized='table') }}

select
    patient_id,
    concat(first_name, ' ', last_name) as patient_name,
    dob,
    gender,
    phone,
    email,
    address,
    current_timestamp() as loaded_at
from {{ ref('stg_patients') }}
