# Security Policy

Kwenzio CRIS is in early development. This policy applies to the complete repository.

## Supported Versions

The project does not have a stable release.

| Version | Security support |
| --- | --- |
| `main` | Yes |
| Older commits and development branches | No |

Apply security fixes to `main`. Maintainers can backport a fix when a supported release exists.

## Report a Vulnerability

Use the private vulnerability-reporting feature of the repository.

Do not create a public issue for an undisclosed vulnerability.

Include this information in the report:

- A short description of the vulnerability.
- The affected file, route, or component.
- The conditions that cause the vulnerability.
- The possible effect on users or data.
- Safe reproduction steps.
- A proposed fix, if you have one.

Remove credentials, customer data, and unnecessary exploit data from the report.

The maintainers will confirm receipt. They will assess the report and give status updates through the private channel.

## System and Scope

Kwenzio CRIS is a Rails application. It stores and analyzes customer relationship information.

The security scope includes:

- Rails controllers, models, views, mailers, and jobs.
- PostgreSQL data and database migrations.
- Authentication and authorization code.
- Organization and tenant boundaries.
- Search and data-import functions.
- Background jobs and scheduled work.
- External service integrations.
- Future artificial intelligence integrations.
- Application configuration and secret handling.
- Container, deployment, and continuous-integration files.

Customer profiles, contact details, notes, interactions, and business records are sensitive data.

Credentials, session data, encryption keys, and service tokens are sensitive assets.

## Threat Model and Trust Boundaries

Treat all external input as untrusted data.

Untrusted data includes:

- HTTP parameters, headers, cookies, and uploaded files.
- Customer records and user-entered text.
- Imported records and webhook data.
- Search text and filter values.
- Data from external services.
- Artificial intelligence prompts and responses.

An authenticated user can also supply harmful input. Authentication does not make input safe.

Important trust boundaries exist between:

- A browser and the Rails application.
- One organization and another organization.
- The Rails application and PostgreSQL.
- Web requests and background jobs.
- Kwenzio CRIS and an external service.
- Kwenzio CRIS and an artificial intelligence provider.

Authentication, tenant isolation, and artificial intelligence features are not implemented yet. Do not assume that these controls exist.

## Security Invariants

The application must keep these properties:

- Authenticate a user before each protected operation.
- Authorize each read, change, export, and deletion.
- Restrict each tenant query to the current organization.
- Deny access when an authorization decision is not clear.
- Validate external input at each system boundary.
- Use parameterized database queries.
- Keep Rails cross-site request forgery protection active.
- Escape untrusted output before the application shows it.
- Store credentials outside the source code.
- Do not write secrets or sensitive customer data to logs.
- Apply the same access rules in web requests and background jobs.
- Minimize data that goes to an external service.
- Treat artificial intelligence output as untrusted data.
- Require human approval for consequential artificial intelligence actions.
- Keep destructive operations explicit and authorized.

A test can show the intended behavior. A test does not prove that a control is secure.

## Reportable Findings and Severity

Report a flaw when a realistic path can break a security invariant.

Examples of high-impact findings include:

- Access to data from a different tenant.
- Authentication or authorization bypass.
- Remote code execution.
- Exposure of credentials or encryption keys.
- Large-scale disclosure of customer data.
- Unauthorized deletion or export of customer data.

Other reportable findings can include:

- Stored or reflected cross-site scripting.
- Cross-site request forgery with a security effect.
- Injection into a database, command, template, or prompt.
- Unsafe file upload or file access.
- Exposure of sensitive data in logs or error messages.
- Server-side request forgery.
- Unsafe deserialization.
- A vulnerable dependency that is reachable in this application.

Assess severity from reachability, required access, affected data, and business impact.

## Out of Scope and Accepted Risk

No security finding class is excluded by default.

The project has no recorded accepted security risks.

A missing roadmap feature is not a vulnerability by itself. Report the issue when implemented code creates unsafe access or makes a false security claim.

A development-only configuration is not reportable unless it can affect a deployed environment.

Do not perform denial-of-service tests or destructive tests against a system without written authorization.

## Known Limitations and Compensating Controls

The project is in early development. Production architecture and deployment controls are not final.

The current repository has these known limitations:

- Authentication is not implemented.
- The organization and tenant model is not implemented.
- The content security policy template is not active.
- The deployment configuration contains placeholder values.
- The artificial intelligence provider and privacy controls are not selected.

The repository uses these checks:

- Brakeman scans Rails code.
- Bundler Audit checks Ruby dependencies.
- Importmap Audit checks JavaScript dependencies.
- Dependabot checks dependencies each week.
- The continuous-integration workflow runs tests and style checks.

These checks reduce risk. They do not replace security review.
