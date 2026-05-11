Based on your folder structure, this looks like a **movie ticket booking system backend (Go)**. I’ll design a **complete REST API list** for each module with practical, production-style endpoints.

---

# 🌐 Base Route

```
/api/v1
```

---

# 1. Movie Management (`movie_management`)

```
GET     /movies                → List all movies
GET     /movies/{id}           → Get movie details
POST    /movies                → Create new movie
PUT     /movies/{id}           → Update movie
DELETE  /movies/{id}           → Delete movie
GET     /movies/{id}/shows     → Get all shows for a movie
```

---

# 2. Theatre Management (`theatre_management`)

```
GET     /theatres
GET     /theatres/{id}
POST    /theatres
PUT     /theatres/{id}
DELETE  /theatres/{id}
GET     /theatres/{id}/screens
POST    /theatres/{id}/screens
```

---

# 3. Seat Management (`seat_management`)

```
GET     /screens/{id}/seats
POST    /screens/{id}/seats
PUT     /seats/{id}
DELETE  /seats/{id}

GET     /shows/{id}/available-seats
GET     /shows/{id}/booked-seats
```

---

# 4. Schedule Management (`shedule_management`)

```
GET     /shows
GET     /shows/{id}
POST    /shows
PUT     /shows/{id}
DELETE  /shows/{id}

GET     /movies/{id}/shows
GET     /theatres/{id}/shows
GET     /shows?date=YYYY-MM-DD
```

---

# 5. Ticket Management (`ticket_management`)

```
POST    /tickets               → Book ticket
GET     /tickets/{id}          → Get ticket details
GET     /users/{id}/tickets    → User booking history
DELETE  /tickets/{id}          → Cancel ticket
POST    /tickets/{id}/confirm
POST    /tickets/{id}/hold     → Temporary seat hold
```

---

# 6. Payment System (`payment_system`)

```
POST    /payments              → Initiate payment
GET     /payments/{id}         → Payment status
POST    /payments/{id}/verify
POST    /payments/{id}/refund

POST    /webhooks/payment      → Payment gateway callback
```

---

# 7. Analytics (`analytics`)

```
GET     /analytics/revenue
GET     /analytics/bookings
GET     /analytics/movies/popular
GET     /analytics/theatres/performance
GET     /analytics?from=DATE&to=DATE
```

---

# 8. Booking System (`booking_system`)

(High-level orchestration APIs)

```
POST    /booking/initiate      → Start booking flow
POST    /booking/lock-seats    → Lock seats temporarily
POST    /booking/confirm       → Confirm booking
POST    /booking/cancel        → Cancel booking
GET     /booking/{id}
```

---

# route.go (Main Router Example Structure)

Your `route.go` likely wires all modules:

```
/api/v1
    /movies
    /theatres
    /shows
    /seats
    /tickets
    /payments
    /analytics
    /booking
```

---

# Advanced APIs

These are useful in real systems:

### Search & Filters

```
GET /movies?language=tamil&genre=action
GET /theatres?city=chennai
```

### Auth (if needed)

```
POST /auth/login
POST /auth/register
GET  /auth/me
```

### Real-time (optional)

```
WS /ws/seats/{show_id}   → live seat updates
```

---
