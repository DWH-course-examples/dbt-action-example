ARG DBT_VERSION=1.0.0
FROM fishtownanalytics/dbt:${DBT_VERSION}

# WORKDIR /usr/app/
ENV DBT_PROFILES_DIR=.


RUN set -ex \
    && python -m pip install --upgrade pip setuptools \
    && python -m pip install --upgrade dbt-postgres==1.4.0 dbt-core==1.4.0 'dbt-clickhouse>=1.2.2' numpy

# ENTRYPOINT ["dbt"]
ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]


