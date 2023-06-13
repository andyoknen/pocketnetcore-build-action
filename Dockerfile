FROM andyoknen/pocketnetcore.build:0.6
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
