-- Table of users with at least two viewed videos.
-- Means that at least two different videos have been viewed.
SELECT DISTINCT
    a.user_id,
    a.video_id
FROM user_playlist AS a
JOIN user_playlist AS b ON b.user_id = a.user_id AND b.video_id <> a.video_id
ORDER BY a.user_id, a.video_id;