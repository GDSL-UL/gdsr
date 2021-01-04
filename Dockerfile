FROM rocker/geospatial:4.0.3

LABEL org.label-schema.license="GPL-2.0" \
      org.label-schema.vcs-url="https://github.com/gdsl-ul/XXX" \
      org.label-schema.vendor="Geographic Data Science Lab" \
      maintainer="Dani Arribas-Bel <D.Arribas-Bel@liverpool.ac.uk>"

RUN wget https://github.com/darribas/gds_env/raw/6.0alpha/gds/install_R_gds.sh \
    -O $HOME/install_R_gds.sh \
 && chmod +x $HOME/install_R_gds.sh \
 && $HOME/install_R_gds.sh \
 && rm $HOME/install_R_gds.sh
