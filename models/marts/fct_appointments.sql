{{ config(materialized='table') }}

select
    a.appointment_id,
    a.patient_id,
    p.patient_name,
    a.provider_id,
    a.appointment_dt,
    a.visit_type,
    a.diagnosis_code,
    b.billed_amount,
    b.paid_amount,
    (b.billed_amount - b.paid_amount) as amount_due,
    b.insurance_claimed
from {{ ref('stg_appointments') }} a
left join {{ ref('stg_billing') }} b on a.appointment_id = b.appointment_id
left join {{ ref('dim_patient') }} p on a.patient_id = p.patient_id
