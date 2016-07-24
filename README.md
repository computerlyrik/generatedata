# generatedata for Docker
Docker packaging of generatedata

## Improvements

- make extensive use of official php base image (lesser uncommon events)
- Make the version configurable for build releases
- Add a onbuild so End-Users can comfortably configure their ready-to-ship generatedata

## Usage

### Run

You will need an [mysql container](https://hub.docker.com/_/mysql/) to serve a database.

**Do not use these settings in production** (especially the mysql container configuration)

```bash
docker run --name generatedata-mysql -e MYSQL_ALLOW_EMPTY_PASSWORD=yes -e MYSQL_DATABASE=generatedata -d mysql:5.7 && \
docker run --name generatedata -d --link generatedata-mysql:db -p 80:80 computerlyrik/generatedata
```

Open <http://localhost/generatedata/install.php>

For initial configuration settings see [Example settings.php](#example-settingsphp)

### OnBuild

Use to pre-confiure your personal containers with a private `[settings.php](http://benkeen.github.io/generatedata/settingsFile.html)`.

The file will automatically included in your container build, given the follwing directory layout

```
./Dockerfile
./settings.php
```

#### Example Dockerfile

```
FROM computerlyirk/generatedata
```

#### Example settings.php

```php
<?php

$dbHostname     = 'db';
$dbName         = 'generatedata';
$dbUsername     = 'root';
$dbPassword     = '';
$dbTablePrefix  = 'gd_';
$encryptionSalt = 'furb4';

$apiEnabled = true;


?>
```
## Development


### Build

#### Build current version

```docker build```

#### Build any released version

```docker build --build-arg generatedata_version=3.2.4```
