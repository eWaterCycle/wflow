# DockerFile for PCR-GLOB model. The ini-file should be mounted as config.ini,
# the input data root directory should be mounted as /data
FROM continuumio/miniconda3:4.8.2
LABEL maintainer=s.verhoeven@esciencecenter.nl

COPY environment.yml /opt

RUN conda env update -n base --file /opt/environment.yml

# build
COPY . /opt/wflow/
WORKDIR /opt/wflow
RUN python3 setup.py install
VOLUME /data
WORKDIR /
ENTRYPOINT ["python3","/opt/conda/bin/wflow_sbm.py","-C","/data"]
