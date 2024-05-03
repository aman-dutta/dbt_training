with music_playlist_tracks as (
    select *
    from {{ ref('stg_music__playlist_tracks')}}
),

music_playlists as (
    select *
    from {{ ref ('stg_music__playlists') }}
),

tracks_joined_to_albums_artists_genre_mediatype as (
    select *
    from {{ ref('int_tracks_joined_to_albums_artists_genre_mediatype')}}
),

music_playlist as (
    select 
        music_playlists.playlist_id,
        music_playlist_tracks.track_id,
        tracks_joined_to_albums_artists_genre_mediatype.album_id,
        tracks_joined_to_albums_artists_genre_mediatype.mediatype_id,
        tracks_joined_to_albums_artists_genre_mediatype.genre_id,
        music_playlists.playlist_name,
        tracks_joined_to_albums_artists_genre_mediatype.track_name,
        tracks_joined_to_albums_artists_genre_mediatype.track_composer,
        tracks_joined_to_albums_artists_genre_mediatype.album_title,
        tracks_joined_to_albums_artists_genre_mediatype.artist_name,
        tracks_joined_to_albums_artists_genre_mediatype.genre_name,
        tracks_joined_to_albums_artists_genre_mediatype.mediatype_name,
        tracks_joined_to_albums_artists_genre_mediatype.track_length_ms,
        tracks_joined_to_albums_artists_genre_mediatype.track_length_seconds,
        tracks_joined_to_albums_artists_genre_mediatype.track_length_mins,
        tracks_joined_to_albums_artists_genre_mediatype.bytes,
        tracks_joined_to_albums_artists_genre_mediatype.unit_price
    from music_playlist_tracks
    left join music_playlists
        on music_playlist_tracks.playlist_id = music_playlists.playlist_id
    left join tracks_joined_to_albums_artists_genre_mediatype
        on music_playlist_tracks.track_id = tracks_joined_to_albums_artists_genre_mediatype.track_id
)

select *
from music_playlist
