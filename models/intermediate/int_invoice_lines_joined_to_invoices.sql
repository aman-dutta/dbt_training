with invoiceline as (
    select *
    from {{ ref('stg_music__invoice_lines') }}
),

invoice as (
    select *
    from {{ ref('stg_music__invoices') }}
),

invoice_joined_with_invoice_line as (
    select 
        invoiceline.invoice_lineid,
        invoiceline.invoice_id,
        invoiceline.track_id,
        invoice.customer_id,
        invoice.invoice_date_est,
        invoice.billing_address,
        invoice.billing_city,
        invoice.billing_state,
        invoice.billing_country,
        invoiceline.quantity_purchased,
        invoiceline.invoice_lineitem_revenue_usd
    from invoiceline
    inner join invoice on invoiceline.invoice_id =  invoice.invoice_id
)

select *
from invoice_joined_with_invoice_line