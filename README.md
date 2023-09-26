# ianaTLD2yaml
Origin URL: https://data.iana.org/TLD/tlds-alpha-by-domain.txt

## How to
### original
```bash
cpan -T HTTP::Request LWP::Protocol::https LWP::UserAgent YAML::Tiny
perl ianaTLD2yaml.pl
cat app/tld_list.yaml
```

### docker
```bash
docker compose up
cat app/tld_list.yaml
```

### docker(practical use)
```Dockerfile
FROM tkycraft/ianatld2yaml:latest as tld_list_maker
RUN perl ianaTLD2yaml.pl

FROM hogehoge
COPY --from=tld_list_maker /opt/app/tld_list.yaml ./tld_list.yaml
```

## File to be created
```yaml
---
TLD:
  - AAA
  - AARP
  - ABB
  - ABBOTT
  - ABBVIE
  ~~~
  - ZONE
  - ZUERICH
  - ZW
```
