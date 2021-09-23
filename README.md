# vizeract
A simple app for visualizing output from the Tesseract OCR engine.

![screenshot](https://i.ibb.co/Tbxf9sv/vizeract-screenshot.png)

## Background
Tesseract is one of the most popular, open source OCR engines. However, it's application can be rather complicated for inexperienced users. In particular, there is no build-in functionality to visualize the output bounding boxes for the identified words. Additionally, it is difficult to guess, which settings for the OCR Engine Mode (OEM) and the Page Segmentation Mode (PSM) will produce the best results.

Vizeract provides a lightweight web app for running Tesseract on arbitrary PDF documents with different settings and visualizing the results.

## Getting started
Vizeract can be easily built and hosted in a Docker container. The setup was tested with Docker version 20.10.8.

```bash
# clone repository
git clone https://github.com/serge724/vizeract.git

# enter vizeract directory
cd vizeract

# build docker image
docker build -t vizeract .

# start container mapped to localhost:5000
docker run -it --rm -p 5000:80 vizeract
```

Alternatively, the Vizeract Streamlit app can be started directly from a Conda environment. However, this requires a local installation of Tesseract (4.0.0-beta.1) and Leptonica (1.75.3).

```bash
# create conda environment
conda env create -f conda_env.yml

# activate environment
conda activate vizeract

# run streamlit app on localhost:5000
streamlit run vizeract.py --server.port=5000
```

## Features
Vizeract allows you to
* upload arbitrary PDF documents and run Tesseract from your browser.
* experiment with different [OEM & PSM settings](http://manpages.ubuntu.com/manpages/cosmic/man1/tesseract.1.html).
* experiment with different [binarization methods](https://scikit-image.org/docs/dev/auto_examples/segmentation/plot_thresholding.html) for image preprocessing.
* visualize words identified by Tesseract via corresponding bounding boxes.

## Limitations
* Works currently only with PDFs that contain one page.

## License
This project is licensed under the terms of the GNU Affero General Public License v3.0.
