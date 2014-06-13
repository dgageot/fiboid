from jpetazzo/dind
maintainer David Gageot <david@gageot.net>

entrypoint ["./fiboid.sh"]

copy startdocker.sh /
copy fiboid.sh /

