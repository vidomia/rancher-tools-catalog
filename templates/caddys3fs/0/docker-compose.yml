version: '2'
services:
  filebackend:
    image: registry.containers.ovh.net/vidomia/s3fs:latest
    privileged: true
    devices:
    - /dev/fuse:/dev/fuse:rwm
    cap_add:
    - SYS_ADMIN
    volumes:
      - app-volume2:/var/s3
    environment:
      S3KEY: 'nNB7FSg6yqJyTkDU'
      SECRET: 'FWPW9kyy2KtmKw4v'
      ENDPOINT: 'http://vidomia.pro.dns-orange.fr:9000'
      BUCKET: 'replicamp.com'
    labels:
      traefik.frontend.rule: Host:${DOMAINNAME}
      traefik.port: '2015'
      traefik.enable: 'true'
volumes:
    app-volume2: