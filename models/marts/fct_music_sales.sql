with invoice_lines_and_invoices as (
    select *
    from {{ ref('int_invoice_lines_joined_to_invoices') }}
),

customers_and_employees as (
    select *
    from {{ ref('int_customers_joined_to_employees') }}
),

tracks_albums_artists_genre_mediatype as (
    select *
    from {{ ref('int_tracks_joined_to_albums_artists_genre_mediatype') }}
),

music_sales as (
    select 
        invoice_lines_and_invoices.invoice_lineid,
        invoice_lines_and_invoices.invoice_id,
        tracks_albums_artists_genre_mediatype.track_id,
        tracks_albums_artists_genre_mediatype.album_id,
        tracks_albums_artists_genre_mediatype.mediatype_id,
        tracks_albums_artists_genre_mediatype.genre_id,
        customers_and_employees.customer_id,
        customers_and_employees.employee_id,
        invoice_lines_and_invoices.invoice_date_est,
        invoice_lines_and_invoices.billing_state,
        invoice_lines_and_invoices.billing_country,
        invoice_lines_and_invoices.quantity_purchased,
        invoice_lines_and_invoices.invoice_lineitem_revenue_usd,
        tracks_albums_artists_genre_mediatype.track_name,
        tracks_albums_artists_genre_mediatype.track_composer,
        tracks_albums_artists_genre_mediatype.album_title,
        tracks_albums_artists_genre_mediatype.artist_name,
        tracks_albums_artists_genre_mediatype.mediatype_name,
        tracks_albums_artists_genre_mediatype.genre_name,
        tracks_albums_artists_genre_mediatype.track_length_ms,
        tracks_albums_artists_genre_mediatype.track_length_seconds,
        tracks_albums_artists_genre_mediatype.track_length_mins,
        tracks_albums_artists_genre_mediatype.bytes,
        customers_and_employees.customer_mailing_state,
        customers_and_employees.customer_mailing_country,
        customers_and_employees.customer_email_address,
        customers_and_employees.employee_first_name,
        customers_and_employees.employee_last_name,
        customers_and_employees.employee_name,
        customers_and_employees.employee_title,
        customers_and_employees.employee_city,
        customers_and_employees.employee_state,
        customers_and_employees.employee_country
    from invoice_lines_and_invoices
    left join customers_and_employees
        on 
            invoice_lines_and_invoices.customer_id 
            = customers_and_employees.customer_id
    left join tracks_albums_artists_genre_mediatype
        on 
            invoice_lines_and_invoices.track_id
            = tracks_albums_artists_genre_mediatype.track_id
)

select *
from music_sales
