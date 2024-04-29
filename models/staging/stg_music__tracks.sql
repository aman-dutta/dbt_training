select 
    trackid as track_id,
    name as track_name,
    mediatypeid as mediatype_id,
    genreid as genre_id,
    composer as track_composer,
    milliseconds as track_length_ms,
    bytes as bytes,
    unitprice as unit_price,
    milliseconds/1000 as track_length_seconds,
    milliseconds/60000 as track_length_mins
from {{ source('music', 'track') }}

