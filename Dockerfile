# Pulled on May 4th'23
FROM rocker/geospatial:4.3.0

LABEL org.label-schema.license="GPL-2.0" \
      org.label-schema.vcs-url="https://github.com/gdsl-ul/gdsr" \
      org.label-schema.vendor="Geographic Data Science Lab" \
      maintainer="Dani Arribas-Bel <D.Arribas-Bel@liverpool.ac.uk>"

# Load up stack
RUN wget https://github.com/darribas/gds_env/raw/v9.1/gds/install_R_gds.sh \
    -O $HOME/install_R_gds.sh \
 && chmod +x $HOME/install_R_gds.sh \
 && $HOME/install_R_gds.sh \
 && rm $HOME/install_R_gds.sh

# [Temp] Extra packages for courses
RUN R -e "install.packages(c( \
        'caret', \
        'ggimage', \
        'ggpmisc', \
        'ggformula', \
        'modelsummary', \
        'Metrics', \
        'plotly', \
        'rpart.plot', \
        'ranger', \
        'tidycensus' \
            ), repos='https://cran.rstudio.com');"

#--- tippecanoe (here for mapboxapi) ---#
RUN git clone https://github.com/felt/tippecanoe.git \
 && cd tippecanoe \
 && make -j

RUN cd tippecanoe \
 && make install \
 && cd .. \
 && rm -rf tippecanoe

USER rstudio
# Check out book
RUN wget https://github.com/GDSL-UL/san/archive/refs/heads/master.zip \
    -O /home/rstudio/san.zip \
 && cd /home/rstudio \
 && unzip /home/rstudio/san.zip \
 && rm /home/rstudio/san.zip 
# Check out R4ps
RUN wget https://github.com/fcorowe/r4ps/archive/refs/heads/main.zip \
    -O /home/rstudio/r4ps.zip \
 && cd /home/rstudio \
 && unzip /home/rstudio/r4ps.zip \
 && rm /home/rstudio/r4ps.zip 
# Check out WMA
RUN wget https://github.com/GDSL-UL/wma/archive/refs/heads/main.zip \
    -O /home/rstudio/wma.zip \
 && cd /home/rstudio \
 && unzip /home/rstudio/wma.zip \
 && rm /home/rstudio/wma.zip 

# Slim down
RUN rm -rf /home/rstudio/san-master/docs \
 && rm -rf /home/rstudio/r4ps-main/docs \
 && rm -rf /home/rstudio/wma-main/docs

USER root
