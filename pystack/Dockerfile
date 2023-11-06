FROM darribas/gdsr:3.0

LABEL org.label-schema.license="GPL-2.0" \
      org.label-schema.vcs-url="https://github.com/gdsl-ul/gdsr" \
      org.label-schema.vendor="Geographic Data Science Lab" \
      maintainer="Dani Arribas-Bel <D.Arribas-Bel@liverpool.ac.uk>"

# Install Mambaforge
RUN wget -O Mambaforge.sh "https://github.com/conda-forge/miniforge/releases/latest/download/Mambaforge-$(uname)-$(uname -m).sh" \
 && bash Mambaforge.sh -b -p "/opt/conda" \
 && echo ". /opt/conda/etc/profile.d/conda.sh" >> /home/rstudio/.bashrc \
 && echo ". /opt/conda/etc/profile.d/mamba.sh" >> /home/rstudio/.bashrc \
 && echo "conda activate base" >> /home/rstudio/.bashrc
ENV PATH="/opt/conda/bin:${PATH}"
RUN cat /home/rstudio/.bashrc
USER rstudio
# Install GDS env
RUN . /opt/conda/etc/profile.d/conda.sh \
 && . /opt/conda/etc/profile.d/mamba.sh \
 && conda activate \
 && mamba create --name gds --file https://github.com/darribas/gds_env/raw/v10.0/gds_py/gds_py_explicit_ubuntu-latest.txt \
 && mamba activate gds \
 # pip does not make it to explicit
 # Bring them over manually from:
 # https://github.com/darribas/gds_env/blob/v10.0/gds_py/gds_py.yml#L49-L59
 && pip install \
      jupyterlab-geojson \
      jupyterlab_myst \
      matplotlib-scalebar \
      polars \
      pymorton \
      pytest-cov \
      pytest-tornasync \
      simplification \
      urbangrammar-graphics \
      watermark

USER root
# Install reticulate
RUN R -e "install.packages('reticulate', repos='https://cran.rstudio.com');"
