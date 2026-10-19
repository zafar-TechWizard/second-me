# Feature: [Name Here]

**Status:** [ ] Not analyzed | [ ] In progress | [ ] Documented | [ ] Specced for build

---

## What it does (user-facing)
> Describe the feature from the user's perspective. What do they see and experience?

---

## How it works (technical)
> Explain the mechanism discovered through analysis.

---

## Key classes / files
| Class / File | Role |
|---|---|
| `com.app.package.ClassName` | Description |

---

## API calls involved
| Endpoint | Method | Auth | Purpose |
|---|---|---|---|
| `/api/v1/endpoint` | GET | Bearer | What it fetches |

### Sample request
```json
{}
```

### Sample response
```json
{}
```

---

## Data flow
```
User action
    → ViewModel/Presenter
    → Repository
    → API call / Local DB
    → UI update
```

---

## Premium gate
> How does the app enforce this being a premium feature?
> Is it: server-side check / local flag / in-app billing receipt / subscription token?

---

## How we could build this ourselves
> Conceptual notes on implementing this feature from scratch.

---

## Notes / Unknowns
- [ ] Thing that needs runtime confirmation
- [ ] Thing that wasn't clear from static analysis
