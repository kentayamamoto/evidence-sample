---
title: Album Detail
---

<iframe style="border-radius:12px" src="https://open.spotify.com/embed/album/{params.album}?utm_source=generator" width="100%" height="352" frameBorder="0" allowfullscreen="" allow="autoplay; clipboard-write; encrypted-media; fullscreen; picture-in-picture" loading="lazy"></iframe>

```sql albums
  select
      *,
      '/albums/' || id as album_link,
  from spotify.albums
  WHERE albums.id = '${params.album}'
  order by release_date
```

```sql tracks
  SELECT * FROM spotify.mart_tracks
    WHERE album_id = '${params.album}'
    ORDER BY track_number
```

<DataTable data={tracks} rows=all>
  <Column id=track_number title=# />
  <Column id=name />
  <Column id=duration_s contentType=colorscale />
  <Column id=tempo contentType=colorscale />
  <Column id=popularity contentType=colorscale />
  <Column id=danceability contentType=colorscale />
</DataTable>