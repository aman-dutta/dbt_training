select 
    invoiceid as invoice_id,
    customerid as customer_id,
    invoicedate as invoice_date_est,
    billingaddress as billing_address,
    billingcity as billing_city,
    billingstate as billing_state,
    billingcountry as billing_country,
    billingpostalcode as invoice_revenue_usd
from {{ source('music', 'invoice') }}
