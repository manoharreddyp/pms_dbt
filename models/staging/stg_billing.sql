{{ config(materialized='view') }}

select
    billing_id::int as billing_id,
    appointment_id::int as appointment_id,
    patient_id::int as patient_id,
    billed_amount::number(10,2) as billed_amount,
    paid_amount::number(10,2) as paid_amount,
    case when upper(insurance_claimed) in ('TRUE','1','T') then true else false end as insurance_claimed
from {{ source('pms_raw', 'BILLING') }}
