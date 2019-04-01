# DockerFile for PCR-GLOB model. The ini-file should be mounted as config.ini,
# the input data root directory should be mounted as /data
FROM ewatercycle/pcraster-container:latest
MAINTAINER Gijs van den Oord <g.vandenoord@esciencecenter.nl>
COPY . /opt/wflow/
RUN pip install netCDF4 gdal pyproj matplotlib scipy
WORKDIR /opt/wflow/wflow-py
RUN python setup.py install
VOLUME /data
ENV PYTHONPATH /usr/local/python/
WORKDIR /
ENTRYPOINT ["python","/usr/local/bin/wflow_sbm.py","-C","/data"]
