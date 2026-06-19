# simple-abap-report

A minimal "Hello World" ABAP report packaged in [abapGit](https://abapgit.org) format.

## Contents

| Object | Type | Description |
| ------ | ---- | ----------- |
| `ZR_SIMPLE_HELLO` | Program (report) | Writes `Hello World` to the list |

## Layout

```
.abapgit.xml                     abapGit repository configuration
src/zr_simple_hello.prog.abap    report source code
src/zr_simple_hello.prog.xml     abapGit object metadata
src/package.devc.xml             package metadata
```

## Install

1. Open the abapGit UI in your SAP system (`ZABAPGIT`).
2. Choose **New Online** and enter this repository URL.
3. Assign a target package and pull the repository.
4. Run report `ZR_SIMPLE_HELLO` (transaction `SA38`).
