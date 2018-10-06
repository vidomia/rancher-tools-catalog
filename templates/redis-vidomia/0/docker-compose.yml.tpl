version: '2'
services:
  redis-vidomia-nfs-master:
    tty: true
    image: comodal/alpine-redis:unstable
    command: ['--port', '6379', '--protected-mode', 'no', 'logfile', 'redis-6379.log']
    volumes:
      - redis-module: /redis/modules
      - redis-data: /redis/data
    ports:
      - ${PUBLISH_PORT}:6379/tcp
    labels:
      io.rancher.scheduler.affinity:container_label_soft_ne: io.rancher.stack_service.name=$${stack_name}/$${service_name}
      io.rancher.container.hostname_override: container_name
  redis-vidomia-nfs-slave:
    tty: true
    image: comodal/alpine-redis:unstable
    command: ['--port', '6379', '--protected-mode', 'no', 'logfile', 'redis-6379.log', '--slave-of','redis-vidomia-nfs-master 6379']
    volumes:
      - redis-module: /redis/modules
      - redis-data: /redis/data
    ports:
      - ${PUBLISH_PORT}:6380/tcp
    links:
    - redis-vidomia-nfs-master

volumes:
  redis-module:
    driver: rancher-nfs
    per_container: false
  redis-data:
    driver: rancher-nfs
    per_container: true