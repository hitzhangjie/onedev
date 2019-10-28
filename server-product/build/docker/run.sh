#!/bin/sh
buildVersion=$(mvn org.apache.maven.plugins:maven-help-plugin:3.1.0:evaluate -Dexpression=project.version -q -DforceStdout -f ../pom.xml)
docker run -it --rm -v /var/run/docker.sock:/var/run/docker.sock -v $(which docker):/usr/bin/docker -v /opt/onedev:/opt/onedev -p 6610:6610 1dev/server:${buildVersion}
