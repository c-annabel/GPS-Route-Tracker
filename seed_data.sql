-- ============================================================
-- GPS Route Tracker - Sample Data
-- 2 users, 3 sessions, ~15 waypoints each
-- All routes are in Ottawa, Ontario
-- Run as gpsuser after schema.sql
-- ============================================================

-- Users
INSERT INTO gps_users (username, email) VALUES ('luca.b', 'luca@example.com');
INSERT INTO gps_users (username, email) VALUES ('annabel.c', 'annabel@example.com');

-- Sessions
-- Session 1: Rideau Canal Walk (user 1)
INSERT INTO gps_sessions (user_id, label, started_at, ended_at)
VALUES (1, 'Rideau Canal Walk',
    TIMESTAMP '2026-03-20 08:00:00',
    TIMESTAMP '2026-03-20 08:45:00');

-- Session 2: Bank Street Drive (user 1)
INSERT INTO gps_sessions (user_id, label, started_at, ended_at)
VALUES (1, 'Bank Street Drive',
    TIMESTAMP '2026-03-21 17:00:00',
    TIMESTAMP '2026-03-21 17:20:00');

-- Session 3: Carleton Campus Loop (user 2)
INSERT INTO gps_sessions (user_id, label, started_at, ended_at)
VALUES (2, 'Carleton Campus Loop',
    TIMESTAMP '2026-03-22 12:00:00',
    TIMESTAMP '2026-03-22 12:30:00');

-- ============================================================
-- SESSION 1 WAYPOINTS: Rideau Canal Walk
-- Confederation Square south along the canal to Dow's Lake
-- ============================================================
INSERT INTO gps_waypoints (session_id, latitude, longitude, altitude_m, speed_kmh, accuracy_m, recorded_at)
VALUES (1, 45.4235, -75.6979, 70.2, 4.5, 5.0, TIMESTAMP '2026-03-20 08:00:00');
INSERT INTO gps_waypoints (session_id, latitude, longitude, altitude_m, speed_kmh, accuracy_m, recorded_at)
VALUES (1, 45.4218, -75.6962, 70.1, 4.8, 4.5, TIMESTAMP '2026-03-20 08:03:00');
INSERT INTO gps_waypoints (session_id, latitude, longitude, altitude_m, speed_kmh, accuracy_m, recorded_at)
VALUES (1, 45.4200, -75.6945, 69.8, 5.1, 4.0, TIMESTAMP '2026-03-20 08:06:00');
INSERT INTO gps_waypoints (session_id, latitude, longitude, altitude_m, speed_kmh, accuracy_m, recorded_at)
VALUES (1, 45.4182, -75.6928, 69.5, 4.9, 4.2, TIMESTAMP '2026-03-20 08:09:00');
INSERT INTO gps_waypoints (session_id, latitude, longitude, altitude_m, speed_kmh, accuracy_m, recorded_at)
VALUES (1, 45.4165, -75.6912, 69.2, 5.0, 4.8, TIMESTAMP '2026-03-20 08:12:00');
INSERT INTO gps_waypoints (session_id, latitude, longitude, altitude_m, speed_kmh, accuracy_m, recorded_at)
VALUES (1, 45.4148, -75.6896, 68.9, 4.7, 5.1, TIMESTAMP '2026-03-20 08:15:00');
INSERT INTO gps_waypoints (session_id, latitude, longitude, altitude_m, speed_kmh, accuracy_m, recorded_at)
VALUES (1, 45.4130, -75.6882, 68.6, 4.6, 4.9, TIMESTAMP '2026-03-20 08:18:00');
INSERT INTO gps_waypoints (session_id, latitude, longitude, altitude_m, speed_kmh, accuracy_m, recorded_at)
VALUES (1, 45.4112, -75.6870, 68.3, 5.2, 4.3, TIMESTAMP '2026-03-20 08:21:00');
INSERT INTO gps_waypoints (session_id, latitude, longitude, altitude_m, speed_kmh, accuracy_m, recorded_at)
VALUES (1, 45.4094, -75.6858, 68.0, 4.9, 4.7, TIMESTAMP '2026-03-20 08:24:00');
INSERT INTO gps_waypoints (session_id, latitude, longitude, altitude_m, speed_kmh, accuracy_m, recorded_at)
VALUES (1, 45.4076, -75.6848, 67.8, 5.3, 5.0, TIMESTAMP '2026-03-20 08:27:00');
INSERT INTO gps_waypoints (session_id, latitude, longitude, altitude_m, speed_kmh, accuracy_m, recorded_at)
VALUES (1, 45.4058, -75.6840, 67.5, 4.8, 4.6, TIMESTAMP '2026-03-20 08:30:00');
INSERT INTO gps_waypoints (session_id, latitude, longitude, altitude_m, speed_kmh, accuracy_m, recorded_at)
VALUES (1, 45.4040, -75.6833, 67.2, 4.5, 5.2, TIMESTAMP '2026-03-20 08:33:00');
INSERT INTO gps_waypoints (session_id, latitude, longitude, altitude_m, speed_kmh, accuracy_m, recorded_at)
VALUES (1, 45.4022, -75.6828, 67.0, 4.7, 4.8, TIMESTAMP '2026-03-20 08:36:00');
INSERT INTO gps_waypoints (session_id, latitude, longitude, altitude_m, speed_kmh, accuracy_m, recorded_at)
VALUES (1, 45.4003, -75.6824, 66.8, 4.4, 5.0, TIMESTAMP '2026-03-20 08:39:00');
INSERT INTO gps_waypoints (session_id, latitude, longitude, altitude_m, speed_kmh, accuracy_m, recorded_at)
VALUES (1, 45.3985, -75.6820, 66.5, 0.0, 4.5, TIMESTAMP '2026-03-20 08:45:00');

-- ============================================================
-- SESSION 2 WAYPOINTS: Bank Street Drive
-- Heading south from Somerset St to Carleton University
-- ============================================================
INSERT INTO gps_waypoints (session_id, latitude, longitude, altitude_m, speed_kmh, accuracy_m, recorded_at)
VALUES (2, 45.4180, -75.6894, 72.0, 0.0, 6.0, TIMESTAMP '2026-03-21 17:00:00');
INSERT INTO gps_waypoints (session_id, latitude, longitude, altitude_m, speed_kmh, accuracy_m, recorded_at)
VALUES (2, 45.4155, -75.6894, 71.8, 42.0, 5.5, TIMESTAMP '2026-03-21 17:02:00');
INSERT INTO gps_waypoints (session_id, latitude, longitude, altitude_m, speed_kmh, accuracy_m, recorded_at)
VALUES (2, 45.4130, -75.6894, 71.5, 45.0, 5.0, TIMESTAMP '2026-03-21 17:04:00');
INSERT INTO gps_waypoints (session_id, latitude, longitude, altitude_m, speed_kmh, accuracy_m, recorded_at)
VALUES (2, 45.4105, -75.6894, 71.2, 38.0, 6.0, TIMESTAMP '2026-03-21 17:06:00');
INSERT INTO gps_waypoints (session_id, latitude, longitude, altitude_m, speed_kmh, accuracy_m, recorded_at)
VALUES (2, 45.4080, -75.6894, 70.9, 44.0, 5.5, TIMESTAMP '2026-03-21 17:08:00');
INSERT INTO gps_waypoints (session_id, latitude, longitude, altitude_m, speed_kmh, accuracy_m, recorded_at)
VALUES (2, 45.4055, -75.6894, 70.6, 40.0, 5.0, TIMESTAMP '2026-03-21 17:10:00');
INSERT INTO gps_waypoints (session_id, latitude, longitude, altitude_m, speed_kmh, accuracy_m, recorded_at)
VALUES (2, 45.4030, -75.6894, 70.3, 43.0, 6.5, TIMESTAMP '2026-03-21 17:12:00');
INSERT INTO gps_waypoints (session_id, latitude, longitude, altitude_m, speed_kmh, accuracy_m, recorded_at)
VALUES (2, 45.4005, -75.6894, 70.0, 41.0, 5.5, TIMESTAMP '2026-03-21 17:14:00');
INSERT INTO gps_waypoints (session_id, latitude, longitude, altitude_m, speed_kmh, accuracy_m, recorded_at)
VALUES (2, 45.3980, -75.6894, 69.7, 45.0, 5.0, TIMESTAMP '2026-03-21 17:16:00');
INSERT INTO gps_waypoints (session_id, latitude, longitude, altitude_m, speed_kmh, accuracy_m, recorded_at)
VALUES (2, 45.3955, -75.6894, 69.4, 39.0, 6.0, TIMESTAMP '2026-03-21 17:18:00');
INSERT INTO gps_waypoints (session_id, latitude, longitude, altitude_m, speed_kmh, accuracy_m, recorded_at)
VALUES (2, 45.3930, -75.6894, 69.1, 0.0, 5.5, TIMESTAMP '2026-03-21 17:20:00');

-- ============================================================
-- SESSION 3 WAYPOINTS: Carleton Campus Loop (user 2)
-- Loop around Carleton University campus
-- ============================================================
INSERT INTO gps_waypoints (session_id, latitude, longitude, altitude_m, speed_kmh, accuracy_m, recorded_at)
VALUES (3, 45.3843, -75.6972, 75.0, 0.0, 4.0, TIMESTAMP '2026-03-22 12:00:00');
INSERT INTO gps_waypoints (session_id, latitude, longitude, altitude_m, speed_kmh, accuracy_m, recorded_at)
VALUES (3, 45.3858, -75.6948, 75.2, 5.5, 3.8, TIMESTAMP '2026-03-22 12:03:00');
INSERT INTO gps_waypoints (session_id, latitude, longitude, altitude_m, speed_kmh, accuracy_m, recorded_at)
VALUES (3, 45.3874, -75.6922, 75.5, 5.8, 4.1, TIMESTAMP '2026-03-22 12:06:00');
INSERT INTO gps_waypoints (session_id, latitude, longitude, altitude_m, speed_kmh, accuracy_m, recorded_at)
VALUES (3, 45.3890, -75.6898, 75.3, 6.0, 4.0, TIMESTAMP '2026-03-22 12:09:00');
INSERT INTO gps_waypoints (session_id, latitude, longitude, altitude_m, speed_kmh, accuracy_m, recorded_at)
VALUES (3, 45.3906, -75.6875, 75.1, 5.7, 3.9, TIMESTAMP '2026-03-22 12:12:00');
INSERT INTO gps_waypoints (session_id, latitude, longitude, altitude_m, speed_kmh, accuracy_m, recorded_at)
VALUES (3, 45.3918, -75.6855, 74.8, 5.9, 4.2, TIMESTAMP '2026-03-22 12:15:00');
INSERT INTO gps_waypoints (session_id, latitude, longitude, altitude_m, speed_kmh, accuracy_m, recorded_at)
VALUES (3, 45.3908, -75.6880, 74.9, 5.6, 4.0, TIMESTAMP '2026-03-22 12:18:00');
INSERT INTO gps_waypoints (session_id, latitude, longitude, altitude_m, speed_kmh, accuracy_m, recorded_at)
VALUES (3, 45.3892, -75.6905, 75.0, 5.8, 3.8, TIMESTAMP '2026-03-22 12:21:00');
INSERT INTO gps_waypoints (session_id, latitude, longitude, altitude_m, speed_kmh, accuracy_m, recorded_at)
VALUES (3, 45.3875, -75.6930, 75.2, 5.5, 4.1, TIMESTAMP '2026-03-22 12:24:00');
INSERT INTO gps_waypoints (session_id, latitude, longitude, altitude_m, speed_kmh, accuracy_m, recorded_at)
VALUES (3, 45.3858, -75.6952, 75.1, 5.7, 3.9, TIMESTAMP '2026-03-22 12:27:00');
INSERT INTO gps_waypoints (session_id, latitude, longitude, altitude_m, speed_kmh, accuracy_m, recorded_at)
VALUES (3, 45.3843, -75.6972, 75.0, 0.0, 4.0, TIMESTAMP '2026-03-22 12:30:00');

-- ============================================================
-- Route summaries
-- ============================================================
INSERT INTO gps_routes (session_id, total_distance_km, duration_min, waypoint_count)
VALUES (1, 2.84, 45.0, 15);

INSERT INTO gps_routes (session_id, total_distance_km, duration_min, waypoint_count)
VALUES (2, 2.75, 20.0, 11);

INSERT INTO gps_routes (session_id, total_distance_km, duration_min, waypoint_count)
VALUES (3, 1.82, 30.0, 11);

COMMIT;