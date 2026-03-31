-- ============================================================
-- GPS Route Tracker - Schema Setup
-- Oracle 26ai Free Edition (FREEPDB1)
-- Run this as SYSDBA first to create the app user,
-- then reconnect as gpsuser to create the tables.
-- ============================================================

-- STEP 1: Run this block as SYSDBA
-- sqlplus sys/your_password@localhost:1521/FREEPDB1 as sysdba

CREATE USER gpsuser IDENTIFIED BY gpspassword123
    DEFAULT TABLESPACE users
    QUOTA UNLIMITED ON users;

GRANT CONNECT, RESOURCE TO gpsuser;
GRANT CREATE SESSION TO gpsuser;

-- ============================================================
-- STEP 2: Reconnect as gpsuser, then run the rest
-- sqlplus gpsuser/gpspassword123@localhost:1521/FREEPDB1
-- ============================================================

-- Users being tracked
CREATE TABLE gps_users (
    user_id    NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    username   VARCHAR2(100) NOT NULL,
    email      VARCHAR2(200),
    created_at TIMESTAMP DEFAULT SYSTIMESTAMP
);

-- A session represents one trip or journey
CREATE TABLE gps_sessions (
    session_id  NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    user_id     NUMBER NOT NULL REFERENCES gps_users(user_id),
    label       VARCHAR2(200),
    started_at  TIMESTAMP,
    ended_at    TIMESTAMP
);

-- The core GPS data - one row per recorded location point
CREATE TABLE gps_waypoints (
    waypoint_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    session_id  NUMBER NOT NULL REFERENCES gps_sessions(session_id),
    latitude    NUMBER(10, 7) NOT NULL,
    longitude   NUMBER(10, 7) NOT NULL,
    altitude_m  NUMBER(8, 2),
    speed_kmh   NUMBER(6, 2),
    accuracy_m  NUMBER(6, 2),
    recorded_at TIMESTAMP NOT NULL
);

-- Index for fast time-ordered retrieval per session (show this during demo!)
CREATE INDEX idx_wp_session_time ON gps_waypoints(session_id, recorded_at);

-- Computed route summaries (populated after a session ends)
CREATE TABLE gps_routes (
    route_id          NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    session_id        NUMBER NOT NULL REFERENCES gps_sessions(session_id),
    total_distance_km NUMBER(8, 3),
    duration_min      NUMBER(6, 1),
    waypoint_count    NUMBER,
    computed_at       TIMESTAMP DEFAULT SYSTIMESTAMP
);

COMMIT;