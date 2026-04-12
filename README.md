# GPS Route Tracker

A full-stack GPS location mapping application built with **Oracle 26ai**, **Python Flask**, and the **Google Maps JavaScript API**. Developed as a milestone project for CST8276 Advanced Database Topics at Algonquin College.

The application stores real GPS waypoints in a relational Oracle database, retrieves them through a REST API, and renders interactive routes on a live Google Maps canvas — including animated time-series playback of historical trips.

---

## Live Demo

![GPS Route Tracker Demo](static/DemoShot.png)

Select a user → select a session → click **Show Route** to draw the route on the map. Hit **Animate Route** to replay the trip waypoint by waypoint with timestamp updates in the sidebar.

---

## What This Project Demonstrates

### Database Skills
- Designed and implemented a **normalised 4-table Oracle schema** from scratch — users, sessions, waypoints, and computed route summaries
- Applied **GENERATED ALWAYS AS IDENTITY** for collision-free primary keys
- Created a **composite B-Tree index** on `(session_id, recorded_at)` to optimise time-ordered GPS queries
- Verified index usage with **Oracle EXPLAIN PLAN** — confirmed `INDEX RANGE SCAN` with no full table scans
- Managed **foreign key constraints** across all four tables to enforce referential integrity
- Seeded the database with **100+ real Ottawa GPS waypoints** across 4 users and 12 sessions using structured SQL scripts

### Backend Skills
- Built a **Python Flask REST API** with 4 focused endpoints
- Connected to Oracle 26ai using **python-oracledb in thin mode** — no Oracle client installation required
- Handled a **real-world Oracle driver bug** (ORA-01745 colon scanning in `TO_CHAR` format strings) by moving date formatting to Python's `datetime.strftime()`
- Returned **Python datetime objects** directly from Oracle and formatted them server-side
- Served the static frontend from Flask — single-command startup with `python app.py`

### Frontend Skills
- Built a **single-page application** in vanilla HTML, CSS, and JavaScript — no framework dependencies
- Integrated the **Google Maps JavaScript API** to render polylines, custom markers, and animated route playback
- Used the **browser fetch() API** to consume JSON from Flask endpoints
- Implemented **map bounds fitting**, green/red start/end markers, and a yellow animated arrow marker
- Built a responsive two-panel layout — stats sidebar and full-height map canvas

### Engineering Practices
- Used **Git and GitHub** for version control throughout the project
- Structured the project as **three independently testable layers** — each layer works without the others
- Wrote **SQL DDL scripts** (`schema.sql`) and **data seeding scripts** (`seed_data.sql`, `seed_data_extra.sql`) that are fully reproducible
- Debugged and resolved real production-style errors under deadline pressure

---

## Tech Stack

| Layer | Technology |
|---|---|
| Database | Oracle 26ai Free Edition (FREEPDB1) |
| ORM / Driver | python-oracledb (thin mode) |
| Backend | Python 3 · Flask |
| Frontend | HTML · CSS · Vanilla JavaScript |
| Maps | Google Maps JavaScript API |
| Version Control | Git · GitHub |

---

## Database Schema

```
GPS_USERS
  user_id    NUMBER  PK  IDENTITY
  username   VARCHAR2(100)
  email      VARCHAR2(200)
  created_at TIMESTAMP

GPS_SESSIONS
  session_id NUMBER  PK  IDENTITY
  user_id    NUMBER  FK → GPS_USERS
  label      VARCHAR2(200)
  started_at TIMESTAMP
  ended_at   TIMESTAMP

GPS_WAYPOINTS  ← core table
  waypoint_id NUMBER  PK  IDENTITY
  session_id  NUMBER  FK → GPS_SESSIONS
  latitude    NUMBER(10,7)
  longitude   NUMBER(10,7)
  altitude_m  NUMBER(8,2)
  speed_kmh   NUMBER(6,2)
  accuracy_m  NUMBER(6,2)
  recorded_at TIMESTAMP
  INDEX: idx_wp_session_time (session_id, recorded_at)

GPS_ROUTES
  route_id          NUMBER  PK  IDENTITY
  session_id        NUMBER  FK → GPS_SESSIONS
  total_distance_km NUMBER(8,3)
  duration_min      NUMBER(6,1)
  waypoint_count    NUMBER
  computed_at       TIMESTAMP
```

---

## API Endpoints

| Method | Endpoint | Description |
|---|---|---|
| GET | `/api/users` | All users ordered by username |
| GET | `/api/sessions?user_id=N` | Sessions for a user with route stats |
| GET | `/api/waypoints?session_id=N` | Ordered waypoints for a session |
| GET | `/api/summary?session_id=N` | Distance, duration, waypoint count |

---

## Project Structure

```
GPS-Route-Tracker/
├── app.py                  Flask backend — 4 REST endpoints
├── schema.sql              Oracle DDL — creates gpsuser and all tables
├── seed_data.sql           Initial GPS data — 2 users, 3 sessions
├── seed_data_extra.sql     Extended data — 2 more users, 9 more sessions
├── requirements.txt        Python dependencies
├── static/
│   └── index.html          Complete frontend — maps, dropdowns, animation
└── README.md
```

---

## Setup & Running

### Prerequisites
- Oracle 26ai Free Edition installed locally
- Python 3.x
- A Google Maps JavaScript API key ([get one free here](https://console.cloud.google.com))

### Steps

**1. Install Python dependencies**
```bash
pip install oracledb flask
```

**2. Create the database schema (as SYSDBA)**
```bash
sqlplus sys/your_password@localhost:1521/FREEPDB1 as sysdba
```
```sql
@schema.sql
```

**3. Load sample data (as gpsuser)**
```bash
sqlplus gpsuser/gpspassword123@localhost:1521/FREEPDB1
```
```sql
@seed_data.sql
@seed_data_extra.sql
```

**4. Add your Google Maps API key**

In `static/index.html`, replace `YOUR_GOOGLE_MAPS_API_KEY` at the bottom of the file.

**5. Run the app**
```bash
python app.py
```

Open **http://localhost:5000** in your browser.

---

## Key Technical Decisions

**Why a composite index on `(session_id, recorded_at)`?**
GPS queries always filter by session and require chronological ordering. The composite index satisfies both conditions in a single index scan. EXPLAIN PLAN confirms `INDEX RANGE SCAN` on `IDX_WP_SESSION_TIME` — no full table scans even as data grows.

**Why python-oracledb thin mode?**
Thin mode requires no Oracle client installation on the host machine, making the app portable across development environments without setup overhead.

**Why format timestamps in Python instead of SQL?**
Oracle's `TO_CHAR()` format strings contain colons (`HH24:MI:SS`) which python-oracledb scans as bind variable indicators, triggering `ORA-01745`. Moving formatting to Python's `datetime.strftime()` eliminates the error and keeps SQL clean.

**Why a single `index.html` file?**
Keeps the frontend dependency-free and portable. Anyone can open it, read it, and understand the full frontend in one file — no build tools, no bundlers, no framework.

---

## Sample Data — Ottawa GPS Routes

| User | Session | Distance | Duration |
|---|---|---|---|
| luca.b | Rideau Canal Walk | 2.84 km | 45 min |
| luca.b | Bank Street Drive | 2.75 km | 20 min |
| luca.b | ByWard Market Evening | 0.82 km | 10 min |
| annabel.c | Carleton Campus Loop | 1.82 km | 30 min |
| annabel.c | Algonquin College Loop | 1.05 km | 12 min |
| annabel.c | Carling Ave Bike Path | 3.18 km | 12 min |
| sarra.d | Parliament Hill to ByWard | 1.18 km | 15 min |
| sarra.d | Centretown Morning Walk | 1.52 km | 18 min |
| sarra.d | Gatineau Hills Trail | 2.05 km | 25 min |
| ambika.g | Westboro to Tunney's | 3.52 km | 45 min |
| ambika.g | uOttawa Campus Walk | 1.02 km | 12 min |
| ambika.g | Glebe Afternoon Walk | 1.24 km | 15 min |

---

## Lessons Learned

- **Test the database connection first.** Every integration bug we hit would have been caught earlier if we had verified the Oracle-to-Flask path before writing the frontend.
- **Oracle driver behaviour matters.** The `ORA-01745` error from colon characters in `TO_CHAR` format strings is not widely documented — understanding why it happens and fixing it at the root rather than working around it was a meaningful debugging exercise.
- **Build the core before adding features.** Losing a group member mid-project reinforced the value of having a working end-to-end path (schema → one endpoint → map renders a route) before layering in additional sessions, users, and UI features.

---

## Author

- Annabel Cheng

---

## Course Context

This project was built for **CST8276 Advanced Database Topics** at Algonquin College. The course covers Oracle Database administration, query optimisation, indexing strategies, execution plans, NoSQL systems (MongoDB, Neo4j), and full-stack database integration. This project was the capstone assignment requiring a live working demonstration.
