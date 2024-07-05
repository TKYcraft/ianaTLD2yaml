FROM perl:5.41.1-bullseye

RUN cpan -T \
    HTTP::Request \
    LWP::Protocol::https \
    LWP::UserAgent

WORKDIR /opt/app/
COPY ./app/ /opt/app/

ENTRYPOINT ["perl", "ianaTLD2yaml.pl"]