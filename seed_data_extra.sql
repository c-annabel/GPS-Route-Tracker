-- ============================================================
-- GPS Route Tracker - Additional Seed Data
-- Adds users 3 & 4 (Sarra, Ambika) + extra sessions
-- for Luca and Annabel to give everyone 3 sessions each
-- Run as gpsuser AFTER the original seed_data.sql
-- ============================================================

-- New users
INSERT INTO gps_users (username, email) VALUES ('sarra.d', 'sarra@example.com');
INSERT INTO gps_users (username, email) VALUES ('ambika.g', 'ambika@example.com');

-- ============================================================
-- LUCA - Session 3: ByWard Market Evening Stroll
-- ============================================================
INSERT INTO gps_sessions (user_id, label, started_at, ended_at)
VALUES (
    (SELECT user_id FROM gps_users WHERE username = 'luca.b'),
    'ByWard Market Evening',
    TIMESTAMP '2026-03-23 18:30:00',
    TIMESTAMP '2026-03-23 18:40:00'
);

INSERT INTO gps_waypoints (session_id, latitude, longitude, altitude_m, speed_kmh, accuracy_m, recorded_at)
VALUES ((SELECT session_id FROM gps_sessions WHERE label = 'ByWard Market Evening'), 45.4296, -75.6862, 65.0, 0.0,  4.5, TIMESTAMP '2026-03-23 18:30:00');
INSERT INTO gps_waypoints (session_id, latitude, longitude, altitude_m, speed_kmh, accuracy_m, recorded_at)
VALUES ((SELECT session_id FROM gps_sessions WHERE label = 'ByWard Market Evening'), 45.4310, -75.6845, 65.1, 4.8, 4.2, TIMESTAMP '2026-03-23 18:31:30');
INSERT INTO gps_waypoints (session_id, latitude, longitude, altitude_m, speed_kmh, accuracy_m, recorded_at)
VALUES ((SELECT session_id FROM gps_sessions WHERE label = 'ByWard Market Evening'), 45.4324, -75.6828, 65.2, 5.0, 4.0, TIMESTAMP '2026-03-23 18:33:00');
INSERT INTO gps_waypoints (session_id, latitude, longitude, altitude_m, speed_kmh, accuracy_m, recorded_at)
VALUES ((SELECT session_id FROM gps_sessions WHERE label = 'ByWard Market Evening'), 45.4338, -75.6811, 65.3, 4.7, 4.3, TIMESTAMP '2026-03-23 18:34:30');
INSERT INTO gps_waypoints (session_id, latitude, longitude, altitude_m, speed_kmh, accuracy_m, recorded_at)
VALUES ((SELECT session_id FROM gps_sessions WHERE label = 'ByWard Market Evening'), 45.4325, -75.6795, 65.2, 4.9, 4.1, TIMESTAMP '2026-03-23 18:36:00');
INSERT INTO gps_waypoints (session_id, latitude, longitude, altitude_m, speed_kmh, accuracy_m, recorded_at)
VALUES ((SELECT session_id FROM gps_sessions WHERE label = 'ByWard Market Evening'), 45.4312, -75.6812, 65.1, 5.1, 4.4, TIMESTAMP '2026-03-23 18:37:30');
INSERT INTO gps_waypoints (session_id, latitude, longitude, altitude_m, speed_kmh, accuracy_m, recorded_at)
VALUES ((SELECT session_id FROM gps_sessions WHERE label = 'ByWard Market Evening'), 45.4299, -75.6829, 65.0, 4.6, 4.2, TIMESTAMP '2026-03-23 18:39:00');
INSERT INTO gps_waypoints (session_id, latitude, longitude, altitude_m, speed_kmh, accuracy_m, recorded_at)
VALUES ((SELECT session_id FROM gps_sessions WHERE label = 'ByWard Market Evening'), 45.4286, -75.6846, 64.9, 0.0, 4.5, TIMESTAMP '2026-03-23 18:40:00');

INSERT INTO gps_routes (session_id, total_distance_km, duration_min, waypoint_count)
VALUES ((SELECT session_id FROM gps_sessions WHERE label = 'ByWard Market Evening'), 0.82, 10.0, 8);

-- ============================================================
-- ANNABEL - Session 2: Algonquin College Campus Loop
-- ============================================================
INSERT INTO gps_sessions (user_id, label, started_at, ended_at)
VALUES (
    (SELECT user_id FROM gps_users WHERE username = 'annabel.c'),
    'Algonquin College Campus Loop',
    TIMESTAMP '2026-03-24 12:00:00',
    TIMESTAMP '2026-03-24 12:12:00'
);

INSERT INTO gps_waypoints (session_id, latitude, longitude, altitude_m, speed_kmh, accuracy_m, recorded_at)
VALUES ((SELECT session_id FROM gps_sessions WHERE label = 'Algonquin College Campus Loop'), 45.3484, -75.7590, 88.0, 0.0, 4.0, TIMESTAMP '2026-03-24 12:00:00');
INSERT INTO gps_waypoints (session_id, latitude, longitude, altitude_m, speed_kmh, accuracy_m, recorded_at)
VALUES ((SELECT session_id FROM gps_sessions WHERE label = 'Algonquin College Campus Loop'), 45.3493, -75.7570, 88.1, 5.2, 3.8, TIMESTAMP '2026-03-24 12:01:30');
INSERT INTO gps_waypoints (session_id, latitude, longitude, altitude_m, speed_kmh, accuracy_m, recorded_at)
VALUES ((SELECT session_id FROM gps_sessions WHERE label = 'Algonquin College Campus Loop'), 45.3502, -75.7550, 88.2, 5.5, 4.1, TIMESTAMP '2026-03-24 12:03:00');
INSERT INTO gps_waypoints (session_id, latitude, longitude, altitude_m, speed_kmh, accuracy_m, recorded_at)
VALUES ((SELECT session_id FROM gps_sessions WHERE label = 'Algonquin College Campus Loop'), 45.3511, -75.7530, 88.3, 5.3, 4.0, TIMESTAMP '2026-03-24 12:04:30');
INSERT INTO gps_waypoints (session_id, latitude, longitude, altitude_m, speed_kmh, accuracy_m, recorded_at)
VALUES ((SELECT session_id FROM gps_sessions WHERE label = 'Algonquin College Campus Loop'), 45.3520, -75.7510, 88.2, 5.0, 3.9, TIMESTAMP '2026-03-24 12:06:00');
INSERT INTO gps_waypoints (session_id, latitude, longitude, altitude_m, speed_kmh, accuracy_m, recorded_at)
VALUES ((SELECT session_id FROM gps_sessions WHERE label = 'Algonquin College Campus Loop'), 45.3511, -75.7492, 88.1, 5.4, 4.2, TIMESTAMP '2026-03-24 12:07:30');
INSERT INTO gps_waypoints (session_id, latitude, longitude, altitude_m, speed_kmh, accuracy_m, recorded_at)
VALUES ((SELECT session_id FROM gps_sessions WHERE label = 'Algonquin College Campus Loop'), 45.3502, -75.7474, 88.0, 5.1, 4.0, TIMESTAMP '2026-03-24 12:09:00');
INSERT INTO gps_waypoints (session_id, latitude, longitude, altitude_m, speed_kmh, accuracy_m, recorded_at)
VALUES ((SELECT session_id FROM gps_sessions WHERE label = 'Algonquin College Campus Loop'), 45.3493, -75.7456, 87.9, 4.8, 3.8, TIMESTAMP '2026-03-24 12:10:30');
INSERT INTO gps_waypoints (session_id, latitude, longitude, altitude_m, speed_kmh, accuracy_m, recorded_at)
VALUES ((SELECT session_id FROM gps_sessions WHERE label = 'Algonquin College Campus Loop'), 45.3484, -75.7590, 88.0, 0.0, 4.0, TIMESTAMP '2026-03-24 12:12:00');

INSERT INTO gps_routes (session_id, total_distance_km, duration_min, waypoint_count)
VALUES ((SELECT session_id FROM gps_sessions WHERE label = 'Algonquin College Campus Loop'), 1.05, 12.0, 9);

-- ============================================================
-- ANNABEL - Session 3: Carling Ave Bike Path
-- ============================================================
INSERT INTO gps_sessions (user_id, label, started_at, ended_at)
VALUES (
    (SELECT user_id FROM gps_users WHERE username = 'annabel.c'),
    'Carling Ave Bike Path',
    TIMESTAMP '2026-03-25 08:00:00',
    TIMESTAMP '2026-03-25 08:12:00'
);

INSERT INTO gps_waypoints (session_id, latitude, longitude, altitude_m, speed_kmh, accuracy_m, recorded_at)
VALUES ((SELECT session_id FROM gps_sessions WHERE label = 'Carling Ave Bike Path'), 45.3745, -75.7425, 83.0,  0.0, 5.0, TIMESTAMP '2026-03-25 08:00:00');
INSERT INTO gps_waypoints (session_id, latitude, longitude, altitude_m, speed_kmh, accuracy_m, recorded_at)
VALUES ((SELECT session_id FROM gps_sessions WHERE label = 'Carling Ave Bike Path'), 45.3752, -75.7402, 83.1, 20.5, 4.8, TIMESTAMP '2026-03-25 08:01:30');
INSERT INTO gps_waypoints (session_id, latitude, longitude, altitude_m, speed_kmh, accuracy_m, recorded_at)
VALUES ((SELECT session_id FROM gps_sessions WHERE label = 'Carling Ave Bike Path'), 45.3759, -75.7379, 83.2, 22.0, 5.1, TIMESTAMP '2026-03-25 08:03:00');
INSERT INTO gps_waypoints (session_id, latitude, longitude, altitude_m, speed_kmh, accuracy_m, recorded_at)
VALUES ((SELECT session_id FROM gps_sessions WHERE label = 'Carling Ave Bike Path'), 45.3766, -75.7356, 83.3, 21.5, 4.9, TIMESTAMP '2026-03-25 08:04:30');
INSERT INTO gps_waypoints (session_id, latitude, longitude, altitude_m, speed_kmh, accuracy_m, recorded_at)
VALUES ((SELECT session_id FROM gps_sessions WHERE label = 'Carling Ave Bike Path'), 45.3773, -75.7333, 83.2, 23.0, 5.2, TIMESTAMP '2026-03-25 08:06:00');
INSERT INTO gps_waypoints (session_id, latitude, longitude, altitude_m, speed_kmh, accuracy_m, recorded_at)
VALUES ((SELECT session_id FROM gps_sessions WHERE label = 'Carling Ave Bike Path'), 45.3780, -75.7310, 83.1, 22.5, 5.0, TIMESTAMP '2026-03-25 08:07:30');
INSERT INTO gps_waypoints (session_id, latitude, longitude, altitude_m, speed_kmh, accuracy_m, recorded_at)
VALUES ((SELECT session_id FROM gps_sessions WHERE label = 'Carling Ave Bike Path'), 45.3787, -75.7287, 83.0, 21.0, 4.8, TIMESTAMP '2026-03-25 08:09:00');
INSERT INTO gps_waypoints (session_id, latitude, longitude, altitude_m, speed_kmh, accuracy_m, recorded_at)
VALUES ((SELECT session_id FROM gps_sessions WHERE label = 'Carling Ave Bike Path'), 45.3794, -75.7264, 82.9,  0.0, 5.0, TIMESTAMP '2026-03-25 08:12:00');

INSERT INTO gps_routes (session_id, total_distance_km, duration_min, waypoint_count)
VALUES ((SELECT session_id FROM gps_sessions WHERE label = 'Carling Ave Bike Path'), 3.18, 12.0, 8);

-- ============================================================
-- SARRA - Session 1: Parliament Hill to ByWard Market
-- ============================================================
INSERT INTO gps_sessions (user_id, label, started_at, ended_at)
VALUES (
    (SELECT user_id FROM gps_users WHERE username = 'sarra.d'),
    'Parliament Hill to ByWard Market',
    TIMESTAMP '2026-03-20 10:00:00',
    TIMESTAMP '2026-03-20 10:15:00'
);

INSERT INTO gps_waypoints (session_id, latitude, longitude, altitude_m, speed_kmh, accuracy_m, recorded_at)
VALUES ((SELECT session_id FROM gps_sessions WHERE label = 'Parliament Hill to ByWard Market'), 45.4253, -75.7001, 74.0, 0.0, 5.0, TIMESTAMP '2026-03-20 10:00:00');
INSERT INTO gps_waypoints (session_id, latitude, longitude, altitude_m, speed_kmh, accuracy_m, recorded_at)
VALUES ((SELECT session_id FROM gps_sessions WHERE label = 'Parliament Hill to ByWard Market'), 45.4253, -75.6985, 73.8, 5.2, 4.8, TIMESTAMP '2026-03-20 10:01:45');
INSERT INTO gps_waypoints (session_id, latitude, longitude, altitude_m, speed_kmh, accuracy_m, recorded_at)
VALUES ((SELECT session_id FROM gps_sessions WHERE label = 'Parliament Hill to ByWard Market'), 45.4253, -75.6968, 73.5, 5.0, 4.5, TIMESTAMP '2026-03-20 10:03:30');
INSERT INTO gps_waypoints (session_id, latitude, longitude, altitude_m, speed_kmh, accuracy_m, recorded_at)
VALUES ((SELECT session_id FROM gps_sessions WHERE label = 'Parliament Hill to ByWard Market'), 45.4253, -75.6950, 73.2, 5.4, 4.3, TIMESTAMP '2026-03-20 10:05:15');
INSERT INTO gps_waypoints (session_id, latitude, longitude, altitude_m, speed_kmh, accuracy_m, recorded_at)
VALUES ((SELECT session_id FROM gps_sessions WHERE label = 'Parliament Hill to ByWard Market'), 45.4265, -75.6934, 73.0, 5.1, 4.6, TIMESTAMP '2026-03-20 10:07:00');
INSERT INTO gps_waypoints (session_id, latitude, longitude, altitude_m, speed_kmh, accuracy_m, recorded_at)
VALUES ((SELECT session_id FROM gps_sessions WHERE label = 'Parliament Hill to ByWard Market'), 45.4278, -75.6918, 72.8, 5.3, 4.4, TIMESTAMP '2026-03-20 10:08:45');
INSERT INTO gps_waypoints (session_id, latitude, longitude, altitude_m, speed_kmh, accuracy_m, recorded_at)
VALUES ((SELECT session_id FROM gps_sessions WHERE label = 'Parliament Hill to ByWard Market'), 45.4285, -75.6901, 72.6, 5.0, 4.2, TIMESTAMP '2026-03-20 10:10:30');
INSERT INTO gps_waypoints (session_id, latitude, longitude, altitude_m, speed_kmh, accuracy_m, recorded_at)
VALUES ((SELECT session_id FROM gps_sessions WHERE label = 'Parliament Hill to ByWard Market'), 45.4290, -75.6882, 72.4, 5.2, 4.5, TIMESTAMP '2026-03-20 10:12:15');
INSERT INTO gps_waypoints (session_id, latitude, longitude, altitude_m, speed_kmh, accuracy_m, recorded_at)
VALUES ((SELECT session_id FROM gps_sessions WHERE label = 'Parliament Hill to ByWard Market'), 45.4296, -75.6862, 72.2, 0.0, 4.8, TIMESTAMP '2026-03-20 10:15:00');

INSERT INTO gps_routes (session_id, total_distance_km, duration_min, waypoint_count)
VALUES ((SELECT session_id FROM gps_sessions WHERE label = 'Parliament Hill to ByWard Market'), 1.18, 15.0, 9);

-- ============================================================
-- SARRA - Session 2: Centretown Morning Walk
-- ============================================================
INSERT INTO gps_sessions (user_id, label, started_at, ended_at)
VALUES (
    (SELECT user_id FROM gps_users WHERE username = 'sarra.d'),
    'Centretown Morning Walk',
    TIMESTAMP '2026-03-21 07:30:00',
    TIMESTAMP '2026-03-21 07:48:00'
);

INSERT INTO gps_waypoints (session_id, latitude, longitude, altitude_m, speed_kmh, accuracy_m, recorded_at)
VALUES ((SELECT session_id FROM gps_sessions WHERE label = 'Centretown Morning Walk'), 45.4108, -75.6892, 70.0, 0.0, 4.5, TIMESTAMP '2026-03-21 07:30:00');
INSERT INTO gps_waypoints (session_id, latitude, longitude, altitude_m, speed_kmh, accuracy_m, recorded_at)
VALUES ((SELECT session_id FROM gps_sessions WHERE label = 'Centretown Morning Walk'), 45.4120, -75.6875, 70.1, 5.3, 4.3, TIMESTAMP '2026-03-21 07:32:00');
INSERT INTO gps_waypoints (session_id, latitude, longitude, altitude_m, speed_kmh, accuracy_m, recorded_at)
VALUES ((SELECT session_id FROM gps_sessions WHERE label = 'Centretown Morning Walk'), 45.4132, -75.6858, 70.2, 5.5, 4.1, TIMESTAMP '2026-03-21 07:34:00');
INSERT INTO gps_waypoints (session_id, latitude, longitude, altitude_m, speed_kmh, accuracy_m, recorded_at)
VALUES ((SELECT session_id FROM gps_sessions WHERE label = 'Centretown Morning Walk'), 45.4144, -75.6842, 70.3, 5.1, 4.4, TIMESTAMP '2026-03-21 07:36:00');
INSERT INTO gps_waypoints (session_id, latitude, longitude, altitude_m, speed_kmh, accuracy_m, recorded_at)
VALUES ((SELECT session_id FROM gps_sessions WHERE label = 'Centretown Morning Walk'), 45.4156, -75.6825, 70.4, 5.4, 4.2, TIMESTAMP '2026-03-21 07:38:00');
INSERT INTO gps_waypoints (session_id, latitude, longitude, altitude_m, speed_kmh, accuracy_m, recorded_at)
VALUES ((SELECT session_id FROM gps_sessions WHERE label = 'Centretown Morning Walk'), 45.4168, -75.6810, 70.5, 5.0, 4.0, TIMESTAMP '2026-03-21 07:40:00');
INSERT INTO gps_waypoints (session_id, latitude, longitude, altitude_m, speed_kmh, accuracy_m, recorded_at)
VALUES ((SELECT session_id FROM gps_sessions WHERE label = 'Centretown Morning Walk'), 45.4180, -75.6795, 70.6, 5.2, 4.3, TIMESTAMP '2026-03-21 07:42:00');
INSERT INTO gps_waypoints (session_id, latitude, longitude, altitude_m, speed_kmh, accuracy_m, recorded_at)
VALUES ((SELECT session_id FROM gps_sessions WHERE label = 'Centretown Morning Walk'), 45.4168, -75.6778, 70.5, 5.1, 4.1, TIMESTAMP '2026-03-21 07:44:00');
INSERT INTO gps_waypoints (session_id, latitude, longitude, altitude_m, speed_kmh, accuracy_m, recorded_at)
VALUES ((SELECT session_id FROM gps_sessions WHERE label = 'Centretown Morning Walk'), 45.4144, -75.6762, 70.3, 5.3, 4.4, TIMESTAMP '2026-03-21 07:46:00');
INSERT INTO gps_waypoints (session_id, latitude, longitude, altitude_m, speed_kmh, accuracy_m, recorded_at)
VALUES ((SELECT session_id FROM gps_sessions WHERE label = 'Centretown Morning Walk'), 45.4120, -75.6780, 70.1, 0.0, 4.5, TIMESTAMP '2026-03-21 07:48:00');

INSERT INTO gps_routes (session_id, total_distance_km, duration_min, waypoint_count)
VALUES ((SELECT session_id FROM gps_sessions WHERE label = 'Centretown Morning Walk'), 1.52, 18.0, 10);

-- ============================================================
-- SARRA - Session 3: Gatineau Hills Trail
-- ============================================================
INSERT INTO gps_sessions (user_id, label, started_at, ended_at)
VALUES (
    (SELECT user_id FROM gps_users WHERE username = 'sarra.d'),
    'Gatineau Hills Trail',
    TIMESTAMP '2026-03-22 09:00:00',
    TIMESTAMP '2026-03-22 09:25:00'
);

INSERT INTO gps_waypoints (session_id, latitude, longitude, altitude_m, speed_kmh, accuracy_m, recorded_at)
VALUES ((SELECT session_id FROM gps_sessions WHERE label = 'Gatineau Hills Trail'), 45.5015, -75.7835, 220.0, 0.0, 6.0, TIMESTAMP '2026-03-22 09:00:00');
INSERT INTO gps_waypoints (session_id, latitude, longitude, altitude_m, speed_kmh, accuracy_m, recorded_at)
VALUES ((SELECT session_id FROM gps_sessions WHERE label = 'Gatineau Hills Trail'), 45.5025, -75.7820, 224.5, 6.5, 5.8, TIMESTAMP '2026-03-22 09:03:00');
INSERT INTO gps_waypoints (session_id, latitude, longitude, altitude_m, speed_kmh, accuracy_m, recorded_at)
VALUES ((SELECT session_id FROM gps_sessions WHERE label = 'Gatineau Hills Trail'), 45.5035, -75.7805, 229.0, 7.0, 5.5, TIMESTAMP '2026-03-22 09:06:00');
INSERT INTO gps_waypoints (session_id, latitude, longitude, altitude_m, speed_kmh, accuracy_m, recorded_at)
VALUES ((SELECT session_id FROM gps_sessions WHERE label = 'Gatineau Hills Trail'), 45.5045, -75.7790, 233.5, 6.8, 5.7, TIMESTAMP '2026-03-22 09:09:00');
INSERT INTO gps_waypoints (session_id, latitude, longitude, altitude_m, speed_kmh, accuracy_m, recorded_at)
VALUES ((SELECT session_id FROM gps_sessions WHERE label = 'Gatineau Hills Trail'), 45.5055, -75.7775, 238.0, 7.2, 6.0, TIMESTAMP '2026-03-22 09:12:00');
INSERT INTO gps_waypoints (session_id, latitude, longitude, altitude_m, speed_kmh, accuracy_m, recorded_at)
VALUES ((SELECT session_id FROM gps_sessions WHERE label = 'Gatineau Hills Trail'), 45.5065, -75.7760, 242.5, 6.9, 5.8, TIMESTAMP '2026-03-22 09:15:00');
INSERT INTO gps_waypoints (session_id, latitude, longitude, altitude_m, speed_kmh, accuracy_m, recorded_at)
VALUES ((SELECT session_id FROM gps_sessions WHERE label = 'Gatineau Hills Trail'), 45.5075, -75.7745, 247.0, 7.1, 5.5, TIMESTAMP '2026-03-22 09:18:00');
INSERT INTO gps_waypoints (session_id, latitude, longitude, altitude_m, speed_kmh, accuracy_m, recorded_at)
VALUES ((SELECT session_id FROM gps_sessions WHERE label = 'Gatineau Hills Trail'), 45.5085, -75.7730, 251.5, 6.7, 5.9, TIMESTAMP '2026-03-22 09:21:00');
INSERT INTO gps_waypoints (session_id, latitude, longitude, altitude_m, speed_kmh, accuracy_m, recorded_at)
VALUES ((SELECT session_id FROM gps_sessions WHERE label = 'Gatineau Hills Trail'), 45.5095, -75.7715, 256.0, 0.0, 6.0, TIMESTAMP '2026-03-22 09:25:00');

INSERT INTO gps_routes (session_id, total_distance_km, duration_min, waypoint_count)
VALUES ((SELECT session_id FROM gps_sessions WHERE label = 'Gatineau Hills Trail'), 2.05, 25.0, 9);

-- ============================================================
-- AMBIKA - Session 1: Westboro to Tunney's Pasture
-- ============================================================
INSERT INTO gps_sessions (user_id, label, started_at, ended_at)
VALUES (
    (SELECT user_id FROM gps_users WHERE username = 'ambika.g'),
    'Westboro to Tunneys Pasture',
    TIMESTAMP '2026-03-20 07:00:00',
    TIMESTAMP '2026-03-20 07:45:00'
);

INSERT INTO gps_waypoints (session_id, latitude, longitude, altitude_m, speed_kmh, accuracy_m, recorded_at)
VALUES ((SELECT session_id FROM gps_sessions WHERE label = 'Westboro to Tunneys Pasture'), 45.3985, -75.7510, 76.0,  0.0, 5.0, TIMESTAMP '2026-03-20 07:00:00');
INSERT INTO gps_waypoints (session_id, latitude, longitude, altitude_m, speed_kmh, accuracy_m, recorded_at)
VALUES ((SELECT session_id FROM gps_sessions WHERE label = 'Westboro to Tunneys Pasture'), 45.3992, -75.7478, 75.8,  5.5, 4.8, TIMESTAMP '2026-03-20 07:05:00');
INSERT INTO gps_waypoints (session_id, latitude, longitude, altitude_m, speed_kmh, accuracy_m, recorded_at)
VALUES ((SELECT session_id FROM gps_sessions WHERE label = 'Westboro to Tunneys Pasture'), 45.3999, -75.7446, 75.5,  5.8, 4.5, TIMESTAMP '2026-03-20 07:10:00');
INSERT INTO gps_waypoints (session_id, latitude, longitude, altitude_m, speed_kmh, accuracy_m, recorded_at)
VALUES ((SELECT session_id FROM gps_sessions WHERE label = 'Westboro to Tunneys Pasture'), 45.4006, -75.7414, 75.2,  6.0, 4.3, TIMESTAMP '2026-03-20 07:15:00');
INSERT INTO gps_waypoints (session_id, latitude, longitude, altitude_m, speed_kmh, accuracy_m, recorded_at)
VALUES ((SELECT session_id FROM gps_sessions WHERE label = 'Westboro to Tunneys Pasture'), 45.4013, -75.7382, 75.0,  5.7, 4.6, TIMESTAMP '2026-03-20 07:20:00');
INSERT INTO gps_waypoints (session_id, latitude, longitude, altitude_m, speed_kmh, accuracy_m, recorded_at)
VALUES ((SELECT session_id FROM gps_sessions WHERE label = 'Westboro to Tunneys Pasture'), 45.4020, -75.7350, 74.8,  5.9, 4.4, TIMESTAMP '2026-03-20 07:25:00');
INSERT INTO gps_waypoints (session_id, latitude, longitude, altitude_m, speed_kmh, accuracy_m, recorded_at)
VALUES ((SELECT session_id FROM gps_sessions WHERE label = 'Westboro to Tunneys Pasture'), 45.4027, -75.7318, 74.5,  6.1, 4.2, TIMESTAMP '2026-03-20 07:30:00');
INSERT INTO gps_waypoints (session_id, latitude, longitude, altitude_m, speed_kmh, accuracy_m, recorded_at)
VALUES ((SELECT session_id FROM gps_sessions WHERE label = 'Westboro to Tunneys Pasture'), 45.4034, -75.7286, 74.2,  5.8, 4.5, TIMESTAMP '2026-03-20 07:35:00');
INSERT INTO gps_waypoints (session_id, latitude, longitude, altitude_m, speed_kmh, accuracy_m, recorded_at)
VALUES ((SELECT session_id FROM gps_sessions WHERE label = 'Westboro to Tunneys Pasture'), 45.4041, -75.7254, 74.0,  6.0, 4.3, TIMESTAMP '2026-03-20 07:40:00');
INSERT INTO gps_waypoints (session_id, latitude, longitude, altitude_m, speed_kmh, accuracy_m, recorded_at)
VALUES ((SELECT session_id FROM gps_sessions WHERE label = 'Westboro to Tunneys Pasture'), 45.4048, -75.7222, 73.8,  0.0, 5.0, TIMESTAMP '2026-03-20 07:45:00');

INSERT INTO gps_routes (session_id, total_distance_km, duration_min, waypoint_count)
VALUES ((SELECT session_id FROM gps_sessions WHERE label = 'Westboro to Tunneys Pasture'), 3.52, 45.0, 10);

-- ============================================================
-- AMBIKA - Session 2: University of Ottawa Campus Walk
-- ============================================================
INSERT INTO gps_sessions (user_id, label, started_at, ended_at)
VALUES (
    (SELECT user_id FROM gps_users WHERE username = 'ambika.g'),
    'University of Ottawa Campus Walk',
    TIMESTAMP '2026-03-21 13:00:00',
    TIMESTAMP '2026-03-21 13:12:00'
);

INSERT INTO gps_waypoints (session_id, latitude, longitude, altitude_m, speed_kmh, accuracy_m, recorded_at)
VALUES ((SELECT session_id FROM gps_sessions WHERE label = 'University of Ottawa Campus Walk'), 45.4228, -75.6830, 68.0, 0.0, 4.0, TIMESTAMP '2026-03-21 13:00:00');
INSERT INTO gps_waypoints (session_id, latitude, longitude, altitude_m, speed_kmh, accuracy_m, recorded_at)
VALUES ((SELECT session_id FROM gps_sessions WHERE label = 'University of Ottawa Campus Walk'), 45.4234, -75.6815, 68.1, 5.5, 3.8, TIMESTAMP '2026-03-21 13:01:30');
INSERT INTO gps_waypoints (session_id, latitude, longitude, altitude_m, speed_kmh, accuracy_m, recorded_at)
VALUES ((SELECT session_id FROM gps_sessions WHERE label = 'University of Ottawa Campus Walk'), 45.4240, -75.6800, 68.2, 5.8, 4.1, TIMESTAMP '2026-03-21 13:03:00');
INSERT INTO gps_waypoints (session_id, latitude, longitude, altitude_m, speed_kmh, accuracy_m, recorded_at)
VALUES ((SELECT session_id FROM gps_sessions WHERE label = 'University of Ottawa Campus Walk'), 45.4246, -75.6785, 68.3, 5.3, 4.0, TIMESTAMP '2026-03-21 13:04:30');
INSERT INTO gps_waypoints (session_id, latitude, longitude, altitude_m, speed_kmh, accuracy_m, recorded_at)
VALUES ((SELECT session_id FROM gps_sessions WHERE label = 'University of Ottawa Campus Walk'), 45.4252, -75.6770, 68.4, 5.6, 3.9, TIMESTAMP '2026-03-21 13:06:00');
INSERT INTO gps_waypoints (session_id, latitude, longitude, altitude_m, speed_kmh, accuracy_m, recorded_at)
VALUES ((SELECT session_id FROM gps_sessions WHERE label = 'University of Ottawa Campus Walk'), 45.4258, -75.6755, 68.5, 5.4, 4.2, TIMESTAMP '2026-03-21 13:07:30');
INSERT INTO gps_waypoints (session_id, latitude, longitude, altitude_m, speed_kmh, accuracy_m, recorded_at)
VALUES ((SELECT session_id FROM gps_sessions WHERE label = 'University of Ottawa Campus Walk'), 45.4252, -75.6740, 68.4, 5.7, 4.0, TIMESTAMP '2026-03-21 13:09:00');
INSERT INTO gps_waypoints (session_id, latitude, longitude, altitude_m, speed_kmh, accuracy_m, recorded_at)
VALUES ((SELECT session_id FROM gps_sessions WHERE label = 'University of Ottawa Campus Walk'), 45.4246, -75.6725, 68.3, 5.2, 3.8, TIMESTAMP '2026-03-21 13:10:30');
INSERT INTO gps_waypoints (session_id, latitude, longitude, altitude_m, speed_kmh, accuracy_m, recorded_at)
VALUES ((SELECT session_id FROM gps_sessions WHERE label = 'University of Ottawa Campus Walk'), 45.4234, -75.6712, 68.1, 0.0, 4.0, TIMESTAMP '2026-03-21 13:12:00');

INSERT INTO gps_routes (session_id, total_distance_km, duration_min, waypoint_count)
VALUES ((SELECT session_id FROM gps_sessions WHERE label = 'University of Ottawa Campus Walk'), 1.02, 12.0, 9);

-- ============================================================
-- AMBIKA - Session 3: Glebe Afternoon Walk
-- ============================================================
INSERT INTO gps_sessions (user_id, label, started_at, ended_at)
VALUES (
    (SELECT user_id FROM gps_users WHERE username = 'ambika.g'),
    'Glebe Afternoon Walk',
    TIMESTAMP '2026-03-23 14:30:00',
    TIMESTAMP '2026-03-23 14:45:00'
);

INSERT INTO gps_waypoints (session_id, latitude, longitude, altitude_m, speed_kmh, accuracy_m, recorded_at)
VALUES ((SELECT session_id FROM gps_sessions WHERE label = 'Glebe Afternoon Walk'), 45.4012, -75.6894, 69.0, 0.0, 4.5, TIMESTAMP '2026-03-23 14:30:00');
INSERT INTO gps_waypoints (session_id, latitude, longitude, altitude_m, speed_kmh, accuracy_m, recorded_at)
VALUES ((SELECT session_id FROM gps_sessions WHERE label = 'Glebe Afternoon Walk'), 45.4000, -75.6878, 68.8, 5.0, 4.3, TIMESTAMP '2026-03-23 14:32:00');
INSERT INTO gps_waypoints (session_id, latitude, longitude, altitude_m, speed_kmh, accuracy_m, recorded_at)
VALUES ((SELECT session_id FROM gps_sessions WHERE label = 'Glebe Afternoon Walk'), 45.3988, -75.6862, 68.6, 5.3, 4.1, TIMESTAMP '2026-03-23 14:34:00');
INSERT INTO gps_waypoints (session_id, latitude, longitude, altitude_m, speed_kmh, accuracy_m, recorded_at)
VALUES ((SELECT session_id FROM gps_sessions WHERE label = 'Glebe Afternoon Walk'), 45.3976, -75.6846, 68.4, 5.1, 4.4, TIMESTAMP '2026-03-23 14:36:00');
INSERT INTO gps_waypoints (session_id, latitude, longitude, altitude_m, speed_kmh, accuracy_m, recorded_at)
VALUES ((SELECT session_id FROM gps_sessions WHERE label = 'Glebe Afternoon Walk'), 45.3964, -75.6830, 68.2, 5.4, 4.2, TIMESTAMP '2026-03-23 14:38:00');
INSERT INTO gps_waypoints (session_id, latitude, longitude, altitude_m, speed_kmh, accuracy_m, recorded_at)
VALUES ((SELECT session_id FROM gps_sessions WHERE label = 'Glebe Afternoon Walk'), 45.3952, -75.6815, 68.0, 5.2, 4.0, TIMESTAMP '2026-03-23 14:40:00');
INSERT INTO gps_waypoints (session_id, latitude, longitude, altitude_m, speed_kmh, accuracy_m, recorded_at)
VALUES ((SELECT session_id FROM gps_sessions WHERE label = 'Glebe Afternoon Walk'), 45.3940, -75.6800, 67.8, 5.0, 4.3, TIMESTAMP '2026-03-23 14:42:00');
INSERT INTO gps_waypoints (session_id, latitude, longitude, altitude_m, speed_kmh, accuracy_m, recorded_at)
VALUES ((SELECT session_id FROM gps_sessions WHERE label = 'Glebe Afternoon Walk'), 45.3928, -75.6785, 67.6, 5.3, 4.1, TIMESTAMP '2026-03-23 14:44:00');
INSERT INTO gps_waypoints (session_id, latitude, longitude, altitude_m, speed_kmh, accuracy_m, recorded_at)
VALUES ((SELECT session_id FROM gps_sessions WHERE label = 'Glebe Afternoon Walk'), 45.3916, -75.6772, 67.4, 0.0, 4.5, TIMESTAMP '2026-03-23 14:45:00');

INSERT INTO gps_routes (session_id, total_distance_km, duration_min, waypoint_count)
VALUES ((SELECT session_id FROM gps_sessions WHERE label = 'Glebe Afternoon Walk'), 1.24, 15.0, 9);

COMMIT;
