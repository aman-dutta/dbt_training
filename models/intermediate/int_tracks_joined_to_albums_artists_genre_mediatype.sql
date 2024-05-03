with music_tracks as (
    select *
    from {{ ref('stg_music__tracks') }}
),

music_genres as (
    select *
    from {{ ref('stg_music__genres') }}
),

music_media_types as (
    select *
    from {{ ref('stg_music__media_types') }}
),

music_albums as (
    select *
    from {{ ref('stg_music__albums') }}
),

music_artists as (
    select *
    from {{ ref('stg_music__artists') }}
),

tracks_joined_to_albums_artists_genre_mediatype as (
    select 
        music_tracks.track_id,
        music_tracks.album_id,
        music_tracks.mediatype_id,
        music_tracks.genre_id,
        music_tracks.track_name,
        music_tracks.track_composer,
        music_albums.album_title,
        music_artists.artist_name,
        music_media_types.mediatype_name,
        music_genres.genre_name,
        music_tracks.track_length_ms,
        music_tracks.track_length_seconds,
        music_tracks.track_length_mins,
        music_tracks.bytes,
        music_tracks.unit_price
    from music_tracks
    left join music_genres
        on music_tracks.genre_id = music_genres.genre_id
    left join music_media_types
        on music_tracks.mediatype_id = music_media_types.mediatype_id
    left join music_albums
        on music_albums.album_id = music_tracks.album_id
    left join music_artists
        on music_artists.artist_id = music_albums.artist_id
)

select *
from tracks_joined_to_albums_artists_genre_mediatype