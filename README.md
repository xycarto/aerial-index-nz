# aerial-index-nz

**IN DEVELOPMENT**

Method for indexing NZ Aerial Imagery hosted on S3. Outputs to **GPKG**

## Basic Method

Pull Docker

```
make docker-pull
```

Run Single Acquisition

```
make get-data region=[REGION NMAE HERE] workunit=[WORKUNIT NAME HERE]
```

Example

```
make get-data region=wellington workunit=carterton_2021_0.075m
```