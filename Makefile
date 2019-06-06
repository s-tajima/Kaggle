PWD := $(shell pwd)
COMPE := titanic

setup:
	docker pull kaggle/python

build:
	docker build -t kaggle .

shell:
	docker run --rm -it -v $(PWD)/$(COMPE):/app/ -v ~/.kaggle/kaggle.json:/root/.kaggle/kaggle.json kaggle /bin/bash
	
jupyter:
	docker run --rm -it \
		-v $(PWD)/$(COMPE):/app/ \
		-v ~/.kaggle/kaggle.json:/root/.kaggle/kaggle.json \
		-p 127.0.0.1:8888:8888 \
		kaggle \
		jupyter notebook --no-browser --ip="0.0.0.0" --notebook-dir=/app/notebook --allow-root
