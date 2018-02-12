# Valkyrie API

This is a simple API server that uses the Valkyrie backend. There is no front end.

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
