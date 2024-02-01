# aerial-index-nz

**IN DEVELOPMENT**

Method for indexing NZ Aerial Imagery hosted on S3. Outputs to **GPKG**

## Basic Method

Pull Docker

```
make docker-pull
```

## Single Acquisition

```
make get-data region=[REGION NAME HERE] workunit=[WORKUNIT NAME HERE]
```

Example

```
make get-data region=wellington workunit=carterton_2021_0.075m
```

## Full Region

Create index for requested region

```
make index-region region=[REGION NAME]
```

Exmaple

```
make index-region region=wellington
```

## Merge GPKGS

After creating indexes, method to merge them into a single file

```
make merge-region region=[REGION NAME]
```

Example
```
make merge-region region=wellington
```