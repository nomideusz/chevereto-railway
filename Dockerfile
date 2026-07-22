FROM ghcr.io/chevereto/chevereto:latest

# Railway's image layer flattening resurrects the mpm_event symlinks that the
# upstream image removed with a2dismod, so apache sees two MPMs and dies.
# Overwrite the module files instead of deleting them — content survives, deletions don't.
USER root
RUN printf '# mpm_event disabled for Railway\n' > /etc/apache2/mods-available/mpm_event.load \
 && printf '# mpm_event disabled for Railway\n' > /etc/apache2/mods-available/mpm_event.conf
USER www-data
