FROM synbiohub/docker-base-python:snapshot

COPY . .

EXPOSE 5000

RUN pip3 install -r requirements.txt

RUN git clone https://github.com/intbio-ncl/shortbol

RUN pip3 install -e ./shortbol

ENV FLASK_APP=app.py

CMD ["waitress-serve", "--port=5000", "app:app" ]
