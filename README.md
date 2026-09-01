# Kwenzio CRIS

Kwenzio CRIS is a proactive relationship intelligence system designed to help businesses understand their customers, detect relationship risks, and determine the next best action.

Rather than functioning solely as a traditional customer relationship management system, Kwenzio CRIS is intended to analyze customer information and relationship signals to help businesses identify what is happening within a customer relationship, understand why it may be happening and decide what action should be taken next.

> **Project Status:** Early Development
> Kwenzio CRIS is currently under active development. The architecture, features, integrations, and technology choices described in this document may evolve as the product is developed.

---


## Overview

Businesses accumulate significant amounts of customer information across conversations, interactions, transactions, support activity, notes, and other operational systems.

Having customer data, however, does not automatically provide customer understanding.

Important relationship signals can be difficult to identify when information is fragmented or when teams must manually review large amounts of customer history.

Kwenzio CRIS aims to turn customer information into actionable relationship intelligence.

At a high level, the system is intended to help answer questions such as:

* What is currently happening with this customer?
* What has changed in the relationship?
* Is there evidence that the relationship is strengthening or weakening?
* Are there unresolved issues or emerging risks?
* What information should a team member pay attention to?
* What should the business do next?
* Why is a particular action being recommended?

The long-term objective is to move customer management from primarily reactive workflows toward proactive relationship management.

---

## Motivation

Traditional customer management systems are effective at storing customer information, but users are often still responsible for interpreting that information themselves.

This can create several problems:

* Important customer signals may be buried in historical information.
* Relationship risks may only become visible after a customer complains or disengages.
* Teams may struggle to determine which customers require attention first.
* Customer context may be distributed across multiple records or interactions.
* Follow-up actions may depend heavily on individual judgment.
* Valuable historical information may exist without being converted into actionable insight.

Kwenzio CRIS is being developed to provide an intelligence layer over customer information.

The system should help transform:

```text
Customer Data
      ↓
Customer Context
      ↓
Relationship Signals
      ↓
Risk / Opportunity Detection
      ↓
Recommended Next Action
      ↓
Human Decision and Action
```

The system is intended to support human decision-making rather than simply store customer records.

---

## Goals

The primary goals of Kwenzio CRIS are to:

1. Build a structured understanding of each customer relationship.
2. Maintain useful historical customer context.
3. Detect meaningful relationship signals.
4. Identify potential relationship risks before they become critical.
5. Surface customer opportunities when appropriate.
6. Prioritize customers that may require attention.
7. Recommend relevant next actions.
8. Explain the evidence and reasoning behind recommendations where possible.
9. Reduce the amount of customer information users need to manually review.
10. Help teams manage customer relationships proactively.

---

## Core Capabilities

The exact implementation is still under development, but Kwenzio CRIS is expected to evolve around several core capabilities.

### Customer Profiles

Maintain structured information about customers and their relationship with the business.

A customer profile may eventually contain information such as:

* Contact information
* Organization information
* Relationship status
* Customer history
* Important dates
* Tags or categories
* Internal notes
* Assigned team members
* Relationship health indicators

### Customer Timeline

Maintain a chronological record of important customer events.

Examples may include:

* Conversations
* Meetings
* Calls
* Support interactions
* Transactions
* Internal notes
* Commitments
* Complaints
* Follow-ups
* Significant relationship changes

### Relationship Intelligence

Analyze available customer information to identify meaningful signals.

Potential signals may include:

* Reduced engagement
* Unresolved issues
* Repeated complaints
* Missed commitments
* Significant changes in communication
* Positive engagement
* Increased interest
* Potential expansion opportunities
* Customer inactivity

The final signal model has not yet been defined.

### Relationship Risk Detection

Identify customers whose relationships may require attention.

The system may eventually consider factors such as:

* Recent interactions
* Historical behavior
* Unresolved issues
* Engagement patterns
* Customer sentiment
* Important commitments
* Relationship changes

Risk detection methodology is still to be determined and should be validated before being relied upon for operational decisions.

### Next Best Action

Recommend an appropriate action based on available customer context.

Examples could include:

* Follow up with the customer.
* Respond to an unresolved issue.
* Schedule a conversation.
* Review a recent complaint.
* Re-engage an inactive customer.
* Escalate a relationship risk.
* Recognize a positive customer milestone.
* Investigate an identified opportunity.

Recommendations should ideally include the relevant evidence or context that caused the recommendation to be generated.

### Search

Allow users to locate customer information efficiently.

The initial implementation is expected to use PostgreSQL-backed search.

Future search requirements may include:

* Full-text search
* Filtering
* Customer timeline search
* Semantic search
* Hybrid lexical and semantic search

These capabilities will be evaluated as product requirements become clearer.

### AI-Assisted Analysis

Kwenzio CRIS is expected to use a large language model where AI meaningfully improves customer understanding or recommendation quality.

Potential applications include:

* Customer history summarization
* Interaction analysis
* Signal extraction
* Relationship summaries
* Risk explanation
* Next-best-action generation
* Natural-language queries over customer information

The LLM provider and integration architecture have not yet been selected.

---

## How Kwenzio CRIS Works

The intended high-level processing model is:

```text
Customer Information
        │
        ▼
Data Ingestion / Entry
        │
        ▼
Structured Customer Records
        │
        ▼
Customer Timeline
        │
        ▼
Search / Retrieval
        │
        ▼
Relationship Analysis
        │
        ├───────────────┐
        ▼               ▼
Signal Detection    Context Generation
        │               │
        └───────┬───────┘
                ▼
        Risk / Opportunity
             Analysis
                │
                ▼
        Next Best Action
                │
                ▼
        User Review / Action
```

This architecture represents the intended direction of the system and is not yet the implemented production architecture.

---

## Technology Stack

### Backend

The application is built using **Ruby on Rails**.

Rails will initially provide the primary application layer, including:

* Business logic
* Data access
* Web application functionality
* Background processing integration
* API functionality where required

### Frontend

The initial frontend will use a Rails-based web interface.

The exact frontend architecture may evolve as product requirements become clearer.

### Database

**PostgreSQL** is the primary relational database.

It will initially be responsible for storing application data and supporting search requirements.

### Artificial Intelligence

The project is expected to integrate with an external LLM API.

The provider has not yet been selected.

Any AI architecture will account for:

* Data privacy
* Data minimization
* Prompt management
* Structured outputs
* Reliability
* Observability
* Model cost
* Latency
* Model/version changes
* Failure handling
* Evaluation of generated recommendations

### Retrieval

The retrieval architecture is still under evaluation.

The project should avoid introducing additional retrieval infrastructure until the product requirements justify it.

Initial implementations may rely heavily on PostgreSQL before evaluating techniques such as semantic or hybrid retrieval.

---

## System Architecture

Kwenzio CRIS is currently being developed as a Rails application.

The initial architectural principle is to keep the system as simple as possible while maintaining clear domain boundaries.

A likely initial architecture is:

```text
                     ┌──────────────────────┐
                     │      Web Browser     │
                     └──────────┬───────────┘
                                │
                                ▼
                     ┌──────────────────────┐
                     │   Rails Web Layer    │
                     └──────────┬───────────┘
                                │
                                ▼
                     ┌──────────────────────┐
                     │ Application / Domain │
                     │        Logic         │
                     └───────┬──────┬───────┘
                             │      │
                    ┌────────┘      └─────────┐
                    ▼                         ▼
          ┌──────────────────┐       ┌──────────────────┐
          │    PostgreSQL    │       │   AI Services    │
          │                  │       │                  │
          └──────────────────┘       └──────────────────┘
```

Any additional infrastructure will be introduced based on demonstrated requirements rather than assumed future scale.

---

## Project Structure

Kwenzio CRIS currently follows the standard Ruby on Rails application structure.

A simplified representation is:

```text
kwenzio-cris/
├── app/
│   ├── controllers/
│   ├── helpers/
│   ├── jobs/
│   ├── mailers/
│   ├── models/
│   └── views/
├── bin/
├── config/
├── db/
├── lib/
├── log/
├── public/
├── storage/
├── test/
├── tmp/
├── vendor/
├── Gemfile
├── Gemfile.lock
├── Rakefile
├── config.ru
└── README.md
```

**The structure will evolve as domain concepts are introduced.**

---

## Getting Started

### Prerequisites

Before setting up Kwenzio CRIS locally, ensure the required development dependencies are installed.

At minimum, development will require:

* Git
* Ruby v4.0.3
* Rails v8.1.3
* RubyGems
* Bundler v4.0.18 
* PostgreSQL

### Clone the Repository

```bash
git clone git@github.com:Kwenzio/kwenzio-cris.git
cd kwenzio-cris
```

### Install Ruby Dependencies

```bash
bundle install
```
### Copy & update sample Enviroment Variables
cp .env.example .env

### Database Setup
Then run:

```bash
bin/rails db:prepare
```
Reset the local database when appropriate:

```bash
bin/rails db:reset
```

> `db:reset` destroys and recreates the local database. Do not run destructive database commands against production data.

---

## Running the Application

Start the local development environment using the command appropriate for the project's Rails configuration:

```bash
bin/dev
```

or:

```bash
bin/rails server
```

Once running, open the local application in a web browser.

---

## Testing

Automated tests should accompany application behavior as the system is developed.

Run the Rails test suite with:

```bash
bin/rails test
```

If system tests are configured:

```bash
bin/rails test:system
```

Testing should eventually cover critical areas including:

* Customer data management
* Customer timeline behavior
* Relationship signal detection
* Risk calculations
* Recommendation generation
* Authorization
* Data isolation
* AI integration behavior
* Failure and fallback behavior

AI-generated functionality should not be evaluated only through conventional unit tests. Once AI features are introduced, the project should establish evaluation datasets and expected behavioral criteria for important AI workflows.

---

## AI and Retrieval

AI is expected to become an important component of Kwenzio CRIS, but the implementation has intentionally not yet been fixed.

### Principles

AI functionality should be designed around several principles.

**Evidence before generation**

Recommendations should be grounded in available customer information whenever possible.

**Explainability**

Users should be able to understand why important risks, signals, or actions were surfaced.

**Human oversight**

AI-generated recommendations should assist users rather than silently make consequential customer decisions.

**Structured outputs**

Where application logic depends on model output, structured and validated responses should be preferred over unrestricted generated text.

**Privacy**

Only information necessary for a particular AI operation should be provided to external model services.

**Evaluation**

AI functionality should be evaluated against defined examples and expected outcomes before being treated as reliable.

### Retrieval Strategy

The initial retrieval strategy has not yet been selected.

PostgreSQL should remain the default starting point where practical.

More specialized retrieval infrastructure should be introduced only when requirements demonstrate a need for capabilities such as:

* Semantic similarity
* Retrieval-augmented generation
* Large-scale unstructured document retrieval
* Hybrid lexical/vector search

---

## Development Guidelines

### Keep Business Logic Explicit

Important relationship intelligence logic should not be hidden inside controllers or views.

As the application grows, domain behavior should remain explicit, testable, and understandable.

### Prefer Simple Architecture Initially

Kwenzio CRIS is an early-stage application.

Do not introduce infrastructure solely because it may theoretically be required later.

Prefer:

```text
Simple
    ↓
Observable
    ↓
Measurable
    ↓
Validated
    ↓
Scale when necessary
```

### Document Important Decisions

Significant architectural decisions should be documented when they are made.

Examples include:

* LLM provider selection
* Retrieval architecture
* Background job infrastructure
* Authentication architecture
* Multi-tenancy strategy
* Search architecture
* Deployment platform

Architecture Decision Records (ADRs) may be introduced as the number of significant decisions grows.

### Keep the README Current

Changes that alter development setup, required configuration, architecture, or major functionality should include corresponding documentation changes.

---

## Security

Kwenzio CRIS can process sensitive business and customer information. Treat security and privacy as core system requirements.

Read the [Security Policy](SECURITY.md) for the complete security requirements, threat model, and reporting process.

Keep these security properties:

* Do not commit credentials or customer data.
* Validate all external input.
* Authenticate users before protected operations.
* Authorize each operation on customer data.
* Keep tenant data separate.
* Remove sensitive data from logs and error messages.
* Minimize data that goes to an external service.
* Treat artificial intelligence input and output as untrusted data.
* Keep dependencies current.

Report a vulnerability through the private process in [SECURITY.md](SECURITY.md). Do not create a public issue for an undisclosed vulnerability.

---

## Deployment

The production deployment platform is currently **TBD**.

Before production deployment, the project will need decisions regarding:

* Application hosting
* PostgreSQL hosting
* Secret management
* Background jobs
* File/object storage
* Email delivery
* Logging
* Error monitoring
* Application monitoring
* Backups
* SSL/TLS
* Domain configuration
* CI/CD
* AI service configuration

Deployment instructions should be added once the production infrastructure is selected.

---

## Roadmap

Kwenzio CRIS is currently in the initial development phase.

The following represents a high-level direction rather than a committed release schedule.

### Phase 1: Foundation

* Establish Rails application architecture
* Configure PostgreSQL
* Define core domain model
* Establish authentication
* Determine organization/account model
* Implement customer management
* Establish automated testing conventions

### Phase 2: Customer Context

* Customer profiles
* Customer interactions
* Customer timeline
* Notes and activities
* Search and filtering
* Relationship history

### Phase 3: Relationship Intelligence

* Define relationship signals
* Establish signal extraction
* Develop relationship health/risk model
* Surface important customer changes
* Develop risk explanations

### Phase 4: AI Intelligence

* Select LLM provider
* Implement AI integration layer
* Customer summarization
* Context extraction
* AI-assisted relationship analysis
* Next-best-action recommendations
* Recommendation explanations
* AI evaluation framework

### Phase 5: Proactive Workflows

* Customer prioritization
* Alerts
* Follow-up workflows
* Action tracking
* Relationship monitoring
* Opportunity detection

### Phase 6: Production Readiness

* Production deployment
* Observability
* Performance testing
* Security review
* Backup and recovery strategy
* AI cost monitoring
* Privacy controls
* Operational documentation

The roadmap should be revised as customer research and product requirements evolve.

---

## Contributing

Read [CONTRIBUTING.md](CONTRIBUTING.md) before you make a change.

Use this basic workflow:

1. Create a branch from the current `main` branch.
2. Make one focused change.
3. Add or update tests.
4. Update the related documentation.
5. Run `bin/ci`.
6. Open a pull request with a clear description.

The contribution guide contains setup instructions, code rules, security requirements, and a pull-request checklist.

---

## Documentation Status

This README describes both the current project setup and the intended direction of Kwenzio CRIS.

Because the project is in early development:

* Sections marked **TBD** represent decisions that have not yet been made.
* Proposed functionality should not be interpreted as currently implemented functionality.
* Architecture diagrams describe intended direction unless explicitly stated otherwise.
* This document should evolve alongside the application.

---

## Kwenzio CRIS

**Understand the relationship. Detect what matters. Determine what to do next.**
