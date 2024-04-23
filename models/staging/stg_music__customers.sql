select 
    CustomerId as customer_id,
    FirstName as customer_first_name,
    LastName as customer_last_name,
    Company as customer_work_company,
    Address as customer_mailing_address,
    City as customer_mailing_city,
    State as customer_mailing_state,
    Country as customer_mailing_country,
    PostalCode as customer_mailing_zipcode,
    Phone as customer_phone_number,
    Fax as customer_fax_number,
    Email as customer_email_address,
    SupportRepId as representative_employee_id
from {{ source('music', 'customer') }}