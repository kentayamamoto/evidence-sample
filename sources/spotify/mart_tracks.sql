SELECT
  t.*,
  f.tempo,
  f.danceability,
  f.duration_ms,
  (f.duration_ms / 1000)::INTEGER AS duration_s,
  a.name AS album_name,
  a.jacket_url,
  a.release_date AS release_datetime,
  a.release_date::DATE AS release_date,
  td.popularity,
  dense_rank() OVER (ORDER BY a.release_date) AS album_number
FROM tracks t
LEFT JOIN audio_features f
ON t.id=f.id
LEFT JOIN albums a
ON t.album_id=a.id
LEFT JOIN track_details td
ON t.id=td.id