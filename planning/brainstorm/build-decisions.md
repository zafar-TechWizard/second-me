# Build Decisions Brainstorm

> Filled in during Phase 5, after we understand the original app.
> This is where we decide what OUR app will look like.

---

## Features We Want to Build
> List from most to least important

- [ ] Feature 1
- [ ] Feature 2
- [ ] Feature 3

---

## Tech Stack Decision

### Frontend
| Option | Pros | Cons | Decision |
|---|---|---|---|
| React Native | Already familiar | ... | |
| Flutter | Great UI, fast | ... | |
| Kotlin Native | Best perf | Steeper curve | |

**Chosen:** ...

### Backend (if needed)
| Option | Pros | Cons |
|---|---|---|
| Node.js + Express | Fast to build | |
| Supabase (BaaS) | No backend code | |
| Firebase | Real-time, auth | Vendor lock |
| Self-hosted | Full control | More work |

**Chosen:** ...

### Database
- Local: Room / SQLite / Hive / AsyncStorage
- Remote: PostgreSQL / Firestore / Supabase

---

## What We're Doing Differently / Better
> List improvements or simplifications vs the original app

1. ...
2. ...

---

## What We're Skipping
> Features from the original that we don't need

1. ...

---

## Open Questions
- [ ] Do we need a backend at all?
- [ ] What's our auth approach?
- [ ] Do we need offline support?
