![Tests](https://img.shields.io/github/actions/workflow/status/TidalCub/Alpaca-Cafe/rubyonrails.yml?branch=main&label=Tests&style=flat-square) ![Linting](https://img.shields.io/github/actions/workflow/status/TidalCub/Alpaca-Cafe/linting.yml?branch=main&label=Linting&style=flat-square) ![Security](https://img.shields.io/github/actions/workflow/status/TidalCub/Alpaca-Cafe/rubyonrails.yml?branch=main&label=Security%20Audit&style=flat-square)

![Closed Issues](https://img.shields.io/github/issues-search/TidalCub/Alpaca-Cafe?query=is%3Aopen&style=flat-square&label=Open%20Issues&color=dfb317) ![Closed Issues](https://img.shields.io/github/issues-search/TidalCub/Alpaca-Cafe?query=is%3Aclosed&style=flat-square&label=Closed%20Issues&color=44cc11)


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