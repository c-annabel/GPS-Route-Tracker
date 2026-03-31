# GPS Route Tracker
**CST8276 Group 2 — Oracle 26ai Demo**

GPS location mapping using Google Maps API. Stores route data in Oracle 26ai,
serves it via Flask, and visualises it as interactive routes on Google Maps.

---

## Setup (run in order)

### 1. Install Python dependencies
```bash
pip install -r requirements.txt
```

### 2. Create the database schema
Connect as SYSDBA to create the app user:
```bash
sqlplus sys/your_password@localhost:1521/FREEPDB1 as sysdba
```
Then run:
```sql
@schema.sql
```

### 3. Load sample data
Connect as the app user:
```bash
sqlplus gpsuser/gpspassword123@localhost:1521/FREEPDB1
```
Then run:
```sql
@seed_data.sql
```

### 4. Add your Google Maps API key
In `static/index.html`, replace `YOUR_GOOGLE_MAPS_API_KEY` with your key.
Get one free at https://console.cloud.google.com → enable "Maps JavaScript API".

### 5. Run the Flask app
```bash
python app.py
```
Open http://localhost:5000 in your browser.

---

## API Endpoints
| Endpoint | Description |
|---|---|
| `GET /api/users` | List all users |
| `GET /api/sessions?user_id=1` | List sessions for a user |
| `GET /api/waypoints?session_id=1` | Get ordered waypoints for a session |
| `GET /api/summary?session_id=1` | Get route summary stats |

---

## Project Structure
```
gps-route-tracker/
├── app.py              Flask backend
├── schema.sql          Oracle DDL (4 tables + index)
├── seed_data.sql       Sample Ottawa GPS routes
├── requirements.txt    Python dependencies
├── static/
│   └── index.html      Frontend + Google Maps
└── README.md
```

---

## Tech Stack
- **Database**: Oracle 26ai Free (FREEPDB1)
- **Backend**: Python 3 + Flask + python-oracledb
- **Frontend**: HTML / CSS / JavaScript
- **Maps**: Google Maps JavaScript API