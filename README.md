# Overview
This container provides node and npm. If a package.json is present in the `web/assets` directory then npm install is run by the entrypoint script.

# Example docker-compose settings

```
front-end:
    image: fathershawn/front-end:latest
    depends_on:
      - web
    volumes:
      - .:/var/www
    networks:
      - internal
    working_dir: /var/www/web/assets
```

A gulp build could then be triggered in your directory:

```
docker-compose exec front-end /var/www/web/assets/node_modules/.bin/encore dev
```
