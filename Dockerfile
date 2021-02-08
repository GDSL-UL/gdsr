# Pulled on Feb 8th'21
FROM rocker/geospatial:4.0.3

LABEL org.label-schema.license="GPL-2.0" \
      org.label-schema.vcs-url="https://github.com/gdsl-ul/gdsr" \
      org.label-schema.vendor="Geographic Data Science Lab" \
      maintainer="Dani Arribas-Bel <D.Arribas-Bel@liverpool.ac.uk>"

# Load up stack
RUN wget https://github.com/darribas/gds_env/raw/c8c86e40d04a9abb449dc730b6408eace6bf35c9/gds/install_R_gds.sh \
    -O $HOME/install_R_gds.sh \
 && chmod +x $HOME/install_R_gds.sh \
 && $HOME/install_R_gds.sh \
 && rm $HOME/install_R_gds.sh

# Check out book
RUN wget https://github.com/GDSL-UL/san/archive/v0.1.0.zip \
    -O /home/rstudio/san.zip \
 && cd /home/rstudio \
 && unzip /home/rstudio/san.zip \
 && rm /home/rstudio/san.zip

# Build PDF
RUN R -e "tinytex::tlmgr(c(\
            'option', \
            'repository', \
            'http://mirror.ox.ac.uk/sites/ctan.org/systems/texlive/tlnet/'\
            ));"
RUN cd /home/rstudio/san-0.1.0 \
 && make all

# Slim down
RUN rm -rf /home/rstudio/san-0.1.0/docs

