---
title: Perfume's Insights
---
## Audio Features

```sql tracks
  SELECT * FROM spotify.mart_tracks
```

```sql mart_albums
  SELECT
    album_name,
    CONCAT(FORMAT('{:02d}', album_number::INTEGER),'_',album_name) AS album_name_s,
    album_number::INTEGER,
    release_date,
    MIN(tempo) AS min_tempo,
    MAX(tempo) AS max_tempo,
    AVG(tempo) AS avg_tempo,
    MIN(duration_s) AS min_duration_s,
    MAX(duration_s) AS max_duration_s,
    AVG(duration_s) AS avg_duration_s,
  FROM spotify.mart_tracks
  GROUP BY 1,2,3,4
  ORDER BY album_name_s
```

### Popularity x Tempo(BPM)

<ScatterPlot 
  data={tracks}
  x=tempo
  y=popularity
  series=name
/>

### AVG Tempo by Albums

<LineChart 
  data={mart_albums}
  x=album_name
  y='avg_tempo'
  yMin=100
  sort=false
/>

### AVG Duration by Albums

<LineChart 
  data={mart_albums}
  x=album_name
  y='avg_duration_s'
  yMin=150
  sort=false
/>

## List of Albums

```sql albums
  select
      *,
      '/albums/' || id as album_link,
  from spotify.albums
  order by release_date
```

<DataTable data={albums} link=album_link rows=all search=true>
  <Column id=jacket_url contentType=image height=40px align=center />
  <Column id=name />
  <Column id=release_date fmt=longdate />
</DataTable>