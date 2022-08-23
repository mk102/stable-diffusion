FROM pytorch/pytorch:1.12.1-cuda11.3-cudnn8-runtime 

RUN conda install git

COPY environment.yaml .

RUN conda env create -f environment.yaml
RUN echo "source activate ldm" >> ~/.bashrc
RUN conda install -c conda-forge opencv
RUN apt-get update
RUN apt-get install -y libglib2.0-0 libsm6 libxrender1 libxext6

WORKDIR /stable-diffusion