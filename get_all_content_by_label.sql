SELECT
    tr.id AS tuid,
    tr.isrc,
    tr.track_name,
    r.release_id,
    r.upc,
    r.release_name,
    ai.artist_id,
    ai.name AS artist_name,
    v.vendor_id AS label_id,
    IFF(v.company = '' OR v.company IS NULL, v.name, v.company) AS label_name
FROM orchard_app_reporting.art_relations.track tr
    INNER JOIN orchard_app_reporting.art_relations.releases r ON tr.release_id = r.release_id
    INNER JOIN orchard_app_reporting.art_relations.artist_info ai ON r.artist_id = ai.artist_id
    INNER JOIN orchard_app_reporting.art_relations.vendor v ON ai.vendor_id = v.vendor_id
    --INNER JOIN intelligence.prod.vw_active_vendor_contract vw ON v.vendor_id = vw.vendor_id
WHERE label_id = 21786;
