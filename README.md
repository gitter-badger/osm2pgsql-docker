osm2pgsql docker iamge


- Ubuntu 16.04
- osm2pgsql 0.90.0

## Usage

    POSTGIS_INSTANCE="osm-postgis"
    COUNTRY="taiwan"
    [ ! -f osm/${COUNTRY}-latest.osm.pbf ] && mkdir osm && cd osm && http://download.geofabrik.de/asia/${COUNTRY}-latest.osm.pbf

    docker run -i -t --rm --link ${POSTGIS_INSTANCE}:pg -v `pwd`/osm:/osm -e PG_ENV_OSM_DB=postgres -e PG_ENV_OSM_USER=postgres -e COUNTRY=${COUNTRY} osmtw/osm2pgsql -c \
        'PGPASSWORD=$PG_ENV_POSTGRES_PASSWORD osm2pgsql --create --slim --cache 2000 --database $PG_ENV_OSM_DB --username $PG_ENV_OSM_USER --host pg --port $PG_PORT_5432_TCP_PORT /osm/${COUNTRY}-latest.osm.pbf'
