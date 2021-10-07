FROM python:3.9.0

WORKDIR /home/

RUN echo "dkanrjsk4"

RUN git clone https://github.com/lapera00/gis_3ban_2.git

WORKDIR /home/gis_3ban_2/

#RUN echo "SECRET_KEY=django-insecure-c%vq5&2cv-vyn5&owh@9exf*g0ix6vtyz2z3e)@sano-8*sf54" > .env

RUN pip install -r requirements.txt

RUN pip install gunicorn

RUN pip install mysqlclient

EXPOSE 8000

CMD ["bash", "-c", "python manage.py collectstatic --noinput --settings=gis_3ban_2.settings.deploy && python manage.py migrate --settings=gis_3ban_2.settings.deploy && gunicorn --env DJANGO_SETTINGS_MODULE=gis_3ban_2.settings.deploy gis_3ban_2.wsgi --bind 0.0.0.0:8000"]
