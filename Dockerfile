FROM ubuntu:18.04

# install tesseract & other required packages
RUN apt-get update && apt-get install -y \
	nano \
	wget \
	tesseract-ocr \
	libtesseract-dev \
	tesseract-ocr-deu \
	poppler-utils \
	&& rm -rf /var/lib/apt/lists/*


RUN adduser --disabled-password --gecos "" tesseract
USER tesseract
WORKDIR /home/tesseract

# define environment variables for miniconda installation
ENV PATH="/home/tesseract/miniconda3/bin:${PATH}"
ARG PATH="/home/tesseract/miniconda3/bin:${PATH}"

# install & activate miniconda
RUN wget \
	https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \
	&& mkdir /home/tesseract/.conda \
	&& bash Miniconda3-latest-Linux-x86_64.sh -b \
	&& rm -f Miniconda3-latest-Linux-x86_64.sh \
	&& conda init bash

# install required python packages
RUN conda install numpy pandas pillow scikit-image
RUN pip install pdf2image pytesseract streamlit

# copy application code
COPY vizeract.py sample_doc.pdf /home/tesseract/

# expose application port
EXPOSE 80

# start streamlit server
CMD streamlit run vizeract.py --server.port 80
