select 
    TrackId as track_id,
    Name as track_name,
    MediaTypeId as mediatype_id,
    GenreId as genre_id,
    Composer as track_composer,
    Milliseconds as track_length_ms,
    Bytes as bytes,
    UnitPrice as unit_price,
    Milliseconds/1000 as track_length_seconds,
    Milliseconds/60000 as track_length_mins
from {{ source('music', 'track') }}

