# docker-generatedata
Docker packaging of generatedata

## Improvements

- make extensive use of official php base image (lesser uncommon events)
- Make the version configurable for build releases
- Add a onbuild so End-Users can comfortably configure their ready-to-ship generatedata

## Usage


### Build

docker build

docker build --build-arg generatedata_version=3.2.4

### OnBuild

Given follwing directory layout

./Dockerfile
./settings.php

and a Dockerfile

```
FROM computerlyirk/generatedata
```

The ```settings.php``` will automatically be used for generatedata.

### Run

docker run computerlyrik/generatedata 

```bash
docker run --name generatedata-mysql -e MYSQL_ALLOW_EMPTY_PASSWORD=yes -e MYSQL_DATABASE=generatedata -d mysql:5.7 && \
docker run --name generatedata -d --link generatedata-mysql:db -p 80:80 computerlyrik/generatedata
```

Open http://localhost/generatedata/install.php

## TODO
- Add enable API as run parameter
