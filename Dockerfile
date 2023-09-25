FROM perl:5.38.0-bullseye

RUN cpan -T \
    HTTP::Request \
    LWP::Protocol::https \
    LWP::UserAgent \
    YAML::Tiny

WORKDIR /opt/app/
COPY ./app/ /opt/app/

ENTRYPOINT ["perl", "ianaTLD2yaml.pl"]