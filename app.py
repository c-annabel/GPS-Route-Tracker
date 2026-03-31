"""
GPS Route Tracker - Flask Backend
Oracle 26ai Free Edition
CST8276 Group 2
- Timestamps returned as Python datetime objects (no colons in SQL)
"""

from flask import Flask, jsonify, send_from_directory, request
import oracledb

app = Flask(__name__, static_folder="static")

# ============================================================
# Oracle Connection Config
# ============================================================
DB_CONFIG = {
    "user":     "gpsuser",
    "password": "gpspassword123",
    "dsn":      "localhost:1521/FREEPDB1"
}

def get_connection():
    return oracledb.connect(**DB_CONFIG)

def fmt(dt):
    """Format datetime to readable string - no colons needed in SQL."""
    if dt is None:
        return None
    return dt.strftime("%Y-%m-%d %H:%M")

def fmt_full(dt):
    """Format with seconds for waypoints."""
    if dt is None:
        return None
    return dt.strftime("%Y-%m-%d %H:%M:%S")


# ============================================================
# Serve the frontend
# ============================================================
@app.route("/")
def index():
    return send_from_directory("static", "index.html")


# ============================================================
# API: Get all users
# GET /api/users
# ============================================================
@app.route("/api/users")
def get_users():
    try:
        conn = get_connection()
        cursor = conn.cursor()
        cursor.execute("""
            SELECT user_id, username, email
            FROM gps_users
            ORDER BY username
        """)
        rows = cursor.fetchall()
        users = [
            {"user_id": row[0], "username": row[1], "email": row[2]}
            for row in rows
        ]
        cursor.close()
        conn.close()
        return jsonify(users)
    except Exception as e:
        return jsonify({"error": str(e)}), 500


# ============================================================
# API: Get sessions for a user
# GET /api/sessions?user_id=1
# ============================================================
@app.route("/api/sessions")
def get_sessions():
    user_id = request.args.get("user_id")
    if not user_id:
        return jsonify({"error": "user_id is required"}), 400
    try:
        conn = get_connection()
        cursor = conn.cursor()
        cursor.execute(f"""
        SELECT s.session_id,
            s.label,
            s.started_at,
            s.ended_at,
            NVL(r.total_distance_km, 0),
            NVL(r.duration_min, 0),
            NVL(r.waypoint_count, 0)
        FROM gps_sessions s
        LEFT JOIN gps_routes r ON r.session_id = s.session_id
        WHERE s.user_id = {int(user_id)}
        ORDER BY s.started_at DESC
        """)
        rows = cursor.fetchall()
        sessions = [
            {
                "session_id":     row[0],
                "label":          row[1],
                "started":        fmt(row[2]),
                "ended":          fmt(row[3]),
                "distance_km":    float(row[4]),
                "duration_min":   float(row[5]),
                "waypoint_count": int(row[6])
            }
            for row in rows
        ]
        cursor.close()
        conn.close()
        return jsonify(sessions)
    except Exception as e:
        return jsonify({"error": str(e)}), 500


# ============================================================
# API: Get waypoints for a session (ordered by time)
# GET /api/waypoints?session_id=1
# ============================================================
@app.route("/api/waypoints")
def get_waypoints():
    session_id = request.args.get("session_id")
    if not session_id:
        return jsonify({"error": "session_id is required"}), 400
    try:
        conn = get_connection()
        cursor = conn.cursor()
        cursor.execute(f"""
            SELECT latitude, longitude, altitude_m,
                speed_kmh, accuracy_m, recorded_at
            FROM gps_waypoints
            WHERE session_id = {int(session_id)}
            ORDER BY recorded_at ASC
        """)
        rows = cursor.fetchall()
        waypoints = [
            {
                "lat":        float(row[0]),
                "lng":        float(row[1]),
                "altitude":   float(row[2]) if row[2] else None,
                "speed":      float(row[3]) if row[3] else None,
                "accuracy":   float(row[4]) if row[4] else None,
                "recorded_at": fmt_full(row[5])
            }
            for row in rows
        ]
        cursor.close()
        conn.close()
        return jsonify(waypoints)
    except Exception as e:
        return jsonify({"error": str(e)}), 500


# ============================================================
# API: Get summary for a session
# GET /api/summary?session_id=1
# ============================================================
@app.route("/api/summary")
def get_summary():
    session_id = request.args.get("session_id")
    if not session_id:
        return jsonify({"error": "session_id is required"}), 400
    try:
        conn = get_connection()
        cursor = conn.cursor()
        cursor.execute(f"""
            SELECT s.label,
                s.started_at,
                s.ended_at,
                NVL(r.total_distance_km, 0),
                NVL(r.duration_min, 0),
                NVL(r.waypoint_count, 0)
            FROM gps_sessions s
            LEFT JOIN gps_routes r ON r.session_id = s.session_id
            WHERE s.session_id = {int(session_id)}
        """)
        row = cursor.fetchone()
        cursor.close()
        conn.close()
        if not row:
            return jsonify({"error": "Session not found"}), 404
        return jsonify({
            "label":          row[0],
            "started":        fmt(row[1]),
            "ended":          fmt(row[2]),
            "distance_km":    float(row[3]),
            "duration_min":   float(row[4]),
            "waypoint_count": int(row[5])
        })
    except Exception as e:
        return jsonify({"error": str(e)}), 500


if __name__ == "__main__":
    app.run(debug=True, port=5000)