FROM continuumio/miniconda3

# Set up the environment
RUN conda create --name Robomac python=3.7 && \
    conda install -n Robomac -c conda-forge pytorch torchvision || \
    conda install pytorch==1.3.0 torchvision==0.4.0 -c pytorch && \
    conda install -n Robomac -c conda-forge jupyterlab && \
    conda install -n Robomac webcolors=1.11 && \
    conda install -n Robomac pillow=6.2.1 && \
    conda clean --all -y

# Set the default shell to bash and activate the environment
SHELL ["/bin/bash", "-c"]

# Activate environment when container starts
RUN echo "conda activate Robomac" >> ~/.bashrc

# Set the entrypoint to start Jupyter Lab
ENTRYPOINT ["/bin/bash", "-c", "source ~/.bashrc && jupyter lab --allow-root"]
