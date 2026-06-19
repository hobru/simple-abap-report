# Squad Decisions

## Active Decisions

### 2026-06-19T23:26:54+02:00: Issue-handling workflow (standing directive)
**By:** Holger Bruchelt (via Copilot)  
**What:** Every time work is requested on an issue, follow exactly: (1) analyse the issue using abapGit/ABAP context; (2) evaluate feasibility and ask clarifying questions if anything is unclear; (3) create a new branch and implement the fix on it, testing in the SAP system; (4) if tests fail, fix and re-test, repeating until fixed or until clarification is needed; (5) once confirmed, open a pull request and ask the user to merge it; (6) after the PR is merged, close the issue with appropriate information.  
**Why:** User directive — captured for team memory.

### 2026-06-19T23:37:06+02:00: Issue workflow addendum — target system
**By:** Holger Bruchelt (via Copilot)  
**What:** For the implement+test step (step 3 of the issue workflow), all development and testing MUST be performed in the NetWeaver Trial A4H system, accessed via the `trial-abap-adt` ADT MCP connection. Do not use any other connected SAP system for issue development.  
**Why:** User directive — captured for team memory.

### 2026-06-19: Parker — Decision Record: Issue #1
**Author:** Parker (ABAP Developer)  
**Issue:** #1 — Report is too simple (ask for name, display Hello <Name>)

#### Package: $TMP
- The program did not yet exist in the connected trial system.
- No project package was documented, so `$TMP` was used for the initial system deploy.
- For a proper transport to other systems, the package should be reviewed and set to a Z- or Y-namespace package with a transport request.

#### Parameter name: P_NAME
- Used `P_NAME` as the ABAP PARAMETERS field name (standard naming prefix `P_` for single-value parameters).
- Type: `c LENGTH 30` — classic character field, 30 chars, matching typical name inputs.
- Selection text label: **"Name"** (TPOOL ID=S entry in `zr_simple_hello.prog.xml`).

#### Output pattern
- `DATA(lv_name) = CONV string( p_name ).` to strip trailing spaces from the CHAR field.
- `WRITE / |Hello { lv_name }|.` — modern ABAP string template for output.

#### Runtime test status
- `RunReport` via ADT MCP requires `ZADT_VSP` WebSocket handler, which is **not available** on this trial system.
- Verified instead: clean syntax check (null response = no errors), successful activation (confirmed by `GetSource` returning the live source).

### 2026-06-19T23:38:55+02:00: Parker Decision — Issue #3 Selection Text
**Issue:** GitHub #3, "Field is called P_NAME"  
**Decision:** Use a selection text for parameter `P_NAME` with the friendly prompt "Please enter your name."  
**Rationale:** The report source can stay simple (`PARAMETERS p_name ...`), while the user-facing prompt is maintained through ABAP text elements. In abapGit this is persisted as a TPOOL `ID=S` item in `src/zr_simple_hello.prog.xml`.  
**Validation:** `ZR_SIMPLE_HELLO` syntax check returned no messages and activation succeeded in the trial system. Direct text element update/verification through `SetTextElements`/`GetTextElements` was blocked by the trial system WebSocket endpoint returning a bad handshake.

## Governance

- All meaningful changes require team consensus
- Document architectural decisions here
- Keep history focused on work, decisions focused on direction
