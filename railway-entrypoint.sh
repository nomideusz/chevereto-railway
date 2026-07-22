#!/bin/sh
# Railway volumes mount root-owned; chevereto's PHP runs as www-data.
# Non-recursive chown of the mountpoint is enough — files created later are www-data already.
set -e
chown www-data:www-data /var/www/html/images
exec "$@"
