# Valkyrie API

This is a simple API server that uses the Valkyrie backend. There is no front end.

## Installing

```
docker-compose build
docker-compose run web rake db:create db:migrate
docker-compose up
```

## Sample requests:

```
# Create
curl -X POST -d"title=Jane Eyre" http://localhost:3000/v1/resources

# Retrieve
curl http://localhost:3000/v1/resources/f8f7cade-cecf-4da2-9d54-8478c08c99c6
```

## TODO:

* Make the handlers configurable
* JSON-API
* Document the API (with OAS?)
* Support attached files

## Contributing 

If you're working on a PR for this project, create a feature branch off of `main`. 

This repository follows the [Samvera Community Code of Conduct](https://samvera.atlassian.net/wiki/spaces/samvera/pages/405212316/Code+of+Conduct) and [language recommendations](https://github.com/samvera/maintenance/blob/master/templates/CONTRIBUTING.md#language).  Please ***do not*** create a branch called `master` for this repository or as part of your pull request; the branch will either need to be removed or renamed before it can be considered for inclusion in the code base and history of this repository.
