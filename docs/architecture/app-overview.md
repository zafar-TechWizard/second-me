# App Architecture Overview

> Populated after Phase 2 static analysis.

---

## App Identity
| Field | Value |
|---|---|
| Package name | `com.example.app` |
| Version | |
| Min SDK | |
| Target SDK | |
| Build tool | Gradle / Flutter / React Native |

---

## UI Framework
> Native Android (Kotlin/Java)? Flutter? React Native? Compose?

---

## Architecture Pattern
> MVC / MVP / MVVM / MVI / Clean Architecture?

---

## Key Libraries Detected
| Library | Purpose |
|---|---|
| Retrofit / OkHttp | Networking |
| Room / SQLite | Local database |
| Hilt / Koin | Dependency injection |
| Coroutines / RxJava | Async |
| Coil / Glide | Image loading |

---

## Module Structure
```
app/
  ├── ui/
  ├── data/
  ├── domain/
  └── ...
```

---

## Premium / Subscription System
> How is the premium system architected?
> In-app billing? Server-side subscription? Token-based?

---

## Data Storage
> What's stored locally? SharedPreferences, Room DB, DataStore, files?

---

## Dependency Graph (high level)
```
UI Layer
  ↓ (observes)
ViewModel / Presenter
  ↓ (calls)
Use Cases / Interactors
  ↓ (reads/writes)
Repositories
  ↓             ↓
Remote API    Local DB
```
