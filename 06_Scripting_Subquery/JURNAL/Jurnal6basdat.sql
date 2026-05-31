SELECT m.NAMA,
       EXTRACT(YEAR FROM DATE '2020-01-01')
       - EXTRACT(YEAR FROM m.TGL_LAHIR) AS UMUR
FROM MEMBER_103122400060 m
WHERE m.ID_MEMBER IN
(
    SELECT tr.ID_MEMBER
    FROM TRANSAKSI_103122400060 tr
    WHERE tr.ID_JADWAL IN
    (
        SELECT j.ID_JADWAL
        FROM JADWAL_103122400060 j
        WHERE j.ID_FILM =
        (
            SELECT ID_FILM
            FROM FILM_103122400060
            WHERE JUDUL = 'Habibie Ainun 3'
        )
        AND j.ID_THEATER IN
        (
            SELECT ID_THEATER
            FROM THEATER_103122400060
            WHERE HARGA >
            (
                SELECT HARGA
                FROM THEATER_103122400060
                WHERE ID_THEATER = 'Teater 1'
            )
        )
    )
)
ORDER BY UMUR DESC;