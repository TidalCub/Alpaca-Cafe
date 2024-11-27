# Alpaca Cafe

A dissertation project.


## Infrastructure

![Infrastructure](non-app-related/diagrams/Infrastructure.svg)

For redundancy, HaProxy will be used, with two instances of the application.

Postgres will be configured in a master-slave relationship for redundancy.

### Scalability
This setup allows for more instances of the application to be deployed quickly to meet potential demand. 

The master-slave postgres setup allows for additional postgres instances if needed.

### Reliability
HaProxy performs health checks on servers and will route accordingly 

The web servers will be configured with both postgres instances, in the event of the master going down, the web servers will then try to establish a connection with the next available slave. Example:

```yaml
production:
  primary:
    database: primary_database
    username: root
    password: <%= ENV['ROOT_PASSWORD'] %>
    adapter: mysql2
  primary_replica:
    database: primary_database
    username: root
    password: <%= ENV['ROOT_READONLY'] %>
    adapter: mysql2
    replica: true
```

This will allow for automatic failover of databases without intervention.

Some notes:
- Primary_replica is read and write so features can continue.
- It may be of use for more reliability that a third read-only database be set up, in the event of two failed databases, something is properly very wrong, and this will preserve data. 