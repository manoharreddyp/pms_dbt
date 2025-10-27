{{ config(materialized='view') }}

select
    patient_id,
    first_name,
    last_name,
    dob,
    gender,
    phone,
    email,
    address
--from {{ source('pms_raw', 'PATIENTS') }}
from {{ source('pms_raw', 'PATIENTS') }}
