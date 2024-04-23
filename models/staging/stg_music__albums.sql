select 
    albumid as album_id,
    title as album_name,
    artistid as artist_id
from {{ source('music', 'album') }}