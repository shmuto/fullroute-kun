# fullroute-kun
Advertise routes from MRT dump

# Usage

docker compose
```
services:
  fullroute-kun:
    image: fullroute-kun:latest
    volumes:
      - type: bind
        source: ./gobgpd.conf
        target: /gobgp/gobgpd.conf
      - type: bind
        source: ./mrtdump
        target: /gobgp/mrtdump
    environment:
      GOBGPD_CONFIG: /gobgp/gobgpd.conf
      # Path to MRT dump file in container
      MRT_FILE: /gobgp/mrtdump
      # Number of prefixes to advertise
      PREFIX_LIMIT: 1000
      # MRT inject option in gobgp cli
      INJECT_OPTION: --nexthop 1.1.1.1 --no-ipv6
```
