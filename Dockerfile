FROM ghcr.io/chevereto/chevereto:latest

# Railway's image layer flattening resurrects the mpm_event symlinks that the
# upstream image removed with a2dismod, so apache sees two MPMs and dies.
# Overwrite the module files instead of deleting them — content survives, deletions don't.
USER root
RUN printf '# mpm_event disabled for Railway\n' > /etc/apache2/mods-available/mpm_event.load \
 && printf '# mpm_event disabled for Railway\n' > /etc/apache2/mods-available/mpm_event.conf

# Stay root for the entrypoint chown; apache master runs as root, PHP workers as www-data
# (stock php:apache behavior — upstream's USER www-data can't fix root-owned volume mounts).
COPY railway-entrypoint.sh /railway-entrypoint.sh
RUN chmod +x /railway-entrypoint.sh
ENTRYPOINT ["/railway-entrypoint.sh"]
CMD ["apache2-foreground"]
