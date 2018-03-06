#! /bin/sh

# If theme name is set and a package.json is present,
# build the node modules.
if [ -r /var/www/package.json ]; then
    touch BUILDING.txt
    npm install
    touch INITIALIZED.txt
fi

# Keep the container present if not in a CI, otherwise exit.
if [ -z ${CI_BUILD_ID} ]; then
  tail -f /dev/null
fi
