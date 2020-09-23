FROM python:3.7.6-slim

ADD . /app

WORKDIR /app

RUN pip install -r requirements.txt && mkdir /app/output

VOLUME ["/app/output"]

CMD ["python3", "portfolio_manager.py", "--save_plot", "true"]
