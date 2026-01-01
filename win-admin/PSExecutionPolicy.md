## Types of Powershell Execution Policies

* **Restricted**-no scripts allowed to run; only interactive commands can be executed
* **AllSigned**-only scripts signed by a trusted publisher are allowed to run, and the system will prompt the user to confirm a script's publisher
* **RemotedSigned**-locally created scripts can run without signing (however, a trusted publisher must sign scripts downloaded from the internet)
* **Unrestricted**-ALL scripts can run without restriction (still prompts for confirmation when running scripts downloaded from the web)
* **Bypass**-NO restrictions or warnings; all scripts allowed to run regardless of origin with no confirmation prompted
* **Undefined**-no execution policy set in the current scope. The system inherits the execution policy from a broader scope such as LocalMachine

## Scopes for Execution Policy

* **CurrentUser**-affects the user currently logged in and persists for future sessions of that user
* **LocalMachine**-applies to all users and sessions on the computer. Requires administrative priviledges to modify.
* **Process**-affects the current PS session only; doesn't persist after the session ends