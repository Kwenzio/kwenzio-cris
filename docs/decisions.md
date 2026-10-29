# Ledger of Decisions
Date: 19 / 10 / 2026
- use postgresql as the database
** i have always used psql as it is highly recommended
for multi-tenant saas solutions.
** also for RLS (key factor) in my decision over MySQL
** most of the data will be relational so no-SQL options
are out

- use rails authentication instead of devise
** i am learning so my auth will teach me more
** i will easily customize the authentication from my research
diving into the devise magic at this time to blanket my learning
** i need to be able to track sessions and revoke them easily,
with devise, i am sure it is possible but right now is not the time
to skip this fun of implementing it myself.
