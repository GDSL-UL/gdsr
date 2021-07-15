FROM darribas/gdsr:1.0

LABEL org.label-schema.license="GPL-2.0" \
      org.label-schema.vcs-url="https://github.com/gdsl-ul/gdsr" \
      org.label-schema.vendor="Geographic Data Science Lab" \
      maintainer="Dani Arribas-Bel <D.Arribas-Bel@liverpool.ac.uk>"

# Install Miniconda
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \
    -O $HOME/miniconda.sh && \
 sh $HOME/miniconda.sh -b -p /opt/conda && \
 rm $HOME/miniconda.sh && \
 ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
 echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc && \
 echo "conda activate base" >> $HOME/.bashrc && \
 find /opt/conda/ -follow -type f -name '*.a' -delete && \
 find /opt/conda/ -follow -type f -name '*.js.map' -delete && \
 /opt/conda/bin/conda clean -afy
ENV PATH="/opt/conda/bin:${PATH}"

# Install GDS environment
RUN conda env create -f https://github.com/darribas/gds_env/raw/v6.1/gds_py/gds_py.yml 
RUN bash -c "source /opt/conda/etc/profile.d/conda.sh && \
    conda activate gds  && \
    pip install -r https://github.com/darribas/gds_env/raw/v6.1/gds_py/gds_py_pip.txt" 
EXPOSE 8888

# Install reticulate
RUN R -e "install.packages('reticulate', repos='https://cran.rstudio.com');"
