# Contributing to Kwenzio CRIS

Thank you for contributing to Kwenzio CRIS.

The project is in early development. Keep each change small, clear, and easy to test.

## Before You Start

Read `README.md` and `SECURITY.md`.

Use an issue or discussion before you make a large change. Describe the problem and the proposed result.

Report vulnerabilities through the private process in `SECURITY.md`.

## Development Requirements

Install these tools:

- Git.
- Ruby 4.0.3.
- Bundler 4.0.18.
- PostgreSQL.
- The system packages that the `pg` and `image_processing` gems require.

## Set Up the Project

Clone the repository. Then, enter the project directory.

Install the Ruby dependencies:

```sh
bundle install
```

Prepare the database:

```sh
bin/rails db:prepare
```

Start the development processes:

```sh
bin/dev
```

You can also start only the Rails server:

```sh
bin/rails server
```

## Make a Change

1. Create a branch from the current `main` branch.
2. Give the branch a short and clear name.
3. Make one related change in the branch.
4. Add or update tests.
5. Update the related documentation.
6. Run the required checks.
7. Open a pull request.

Do not include unrelated formatting or refactoring in the change.

## Code Rules

Follow the Rails conventions in the existing code.

Keep controllers and views small. Put important business rules in explicit and testable objects.

Use clear names. Do not use an abbreviation unless the project defines it.

Do not add infrastructure for a possible future requirement. Add it when a current requirement needs it.

Run RuboCop before you submit Ruby changes:

```sh
bin/rubocop
```

## Tests

Add a test for new behavior and corrected behavior.

Run the complete local check:

```sh
bin/ci
```

Run the system tests when you change user-interface behavior:

```sh
bin/rails test:system
```

Do not remove a test only because the test fails. Correct the code or explain why the test is not valid.

## Database Changes

Use a Rails migration for each database schema change.

Make migrations reversible when Rails supports a safe reverse operation.

Do not change an old migration after other contributors can have used it. Add a new migration.

Test a migration with realistic development data. Do not use production customer data.

## Security and Privacy

Follow the requirements in `SECURITY.md`.

- Do not commit a credential or secret.
- Do not use real customer data in tests or examples.
- Validate external input.
- Authorize each operation on customer data.
- Keep tenant data separate.
- Remove sensitive data from logs and error messages.
- Review each new dependency before you add it.

Stop work and use the private reporting process if you find a vulnerability.

## Artificial Intelligence Changes

Minimize the customer data that you send to an external provider.

Treat model input and model output as untrusted data.

Validate structured model output before application code uses it.

Add tests and evaluation examples for important model behavior.

Keep a human decision point before a consequential action.

Document the provider, model, data flow, failure behavior, and privacy controls.

## Documentation

Update `README.md` when a change affects setup, configuration, architecture, or user behavior.

Use short sentences and active voice. Give one instruction in each procedural sentence.

Use the same technical term for the same item. Define a new technical term before you use it.

Use American English spelling.

## Commits

Write a short commit subject in the imperative form.

Use the commit body to explain the reason for a complex change.

Do not include generated files unless the project requires them.

## Pull Requests

Give the pull request a clear title and description.

Include this information:

- The problem.
- The implemented change.
- The tests that you ran.
- Known limits or follow-up work.
- Screenshots for a visible user-interface change.

Use this checklist:

- [ ] The change has one clear purpose.
- [ ] The tests pass.
- [ ] RuboCop passes.
- [ ] Security checks pass.
- [ ] New behavior has tests.
- [ ] Related documentation is current.
- [ ] The change contains no secret or real customer data.

Respond to review comments with a change or a clear explanation.

The maintainers can request more changes before they merge the pull request.
