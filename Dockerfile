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
        'plotly', \
        'ggimage', \
        'ggpmisc', \
        'ggformula', \
        'modelsummary', \
        'Metrics', \
        'rpart.plot', \
        'caret', \
        'ranger' \
            ), repos='https://cran.rstudio.com');"

# Check out book
RUN wget https://github.com/GDSL-UL/san/archive/v0.1.0.zip \
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

#        # Build PDF
#        RUN R -e "tinytex::tlmgr(c(\
#                    'option', \
#                    'repository', \
#                    'http://mirror.ox.ac.uk/sites/ctan.org/systems/texlive/tlnet/'\
#                    ));"
#        RUN cd /home/rstudio/san-0.1.0 \
#         && make all

#        # Slim down
#        RUN rm -rf /home/rstudio/san-0.1.0/docs

