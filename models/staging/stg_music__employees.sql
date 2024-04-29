select 
    employeeid as employee_id,
    lastname as employee_last_name,
    firstname as employee_first_name,
    title as employee_title,
    reportsto as supervisor_employee_id,
    birthdate as employee_birth_date,
    hiredate as employee_hired_date,
    address as employee_address,
    city as employee_city,
    state as employee_state,
    country as employee_country,
    postalcode as employee_zipcode,
    phone as employee_phone_number,
    fax as employee_fax_number,
    email as employee_email_address
from {{ source('music', 'employee') }}
