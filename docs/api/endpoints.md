# API Endpoints

> Populated by REA network analysis and static analysis.
> This is a living document — add entries as they're discovered.

---

## Base URL
```
https://api.[app-domain].com   ← fill in after analysis
```

## Authentication
> How does the app authenticate? JWT? Session cookie? API key?
> Where is the token stored? SharedPreferences? Keystore?

---

## Endpoints

### Auth
| Method | Path | Description |
|---|---|---|
| POST | `/auth/login` | |
| POST | `/auth/refresh` | |

### Premium / Subscription
| Method | Path | Description |
|---|---|---|
| GET | `/subscription/status` | |
| POST | `/subscription/verify` | |

### [Feature Group]
| Method | Path | Description |
|---|---|---|
| | | |

---

## Common Headers
```
Authorization: Bearer <token>
Content-Type: application/json
X-App-Version: ...
X-Device-ID: ...
```

---

## Notes
- Add raw traffic captures to `../../analysis/network/`
- Note which endpoints are gated behind premium checks
