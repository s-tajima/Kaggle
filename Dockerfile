FROM kaggle/python

RUN apt-get install -y vim 
RUN pip install kaggle

ENV PWD=/app
