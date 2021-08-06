FROM julia:1.0

WORKDIR = /root

ADD Project.toml .julia/environments/v1.0/

ADD Manifest.toml .julia/environments/v1.0/

ADD install.jl .

ADD k-means.jl .

RUN ["julia","install.jl"]

CMD ["julia"]