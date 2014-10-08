FROM jpetazzo/dind
MAINTAINER David Gageot <david@gageot.net>

ENTRYPOINT ["./fiboid.sh"]

ADD startdocker.sh /
ADD fiboid.sh /
