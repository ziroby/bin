#!/usr/bin/env bash
#!/usr/bin/env bash
set -ex


if [ -f ./gradlew ]; then
  command=./gradlew
  default=assemble

elif [ -f build.gradle ]; then
  command=gradle
  default=assemble

elif [ -f pom.xml ]; then
  command=mvn
  default=install

elif [ -f build.sbt ]; then
  command=sbt
  default=publishLocal

else 
  echo "Unknown build directory"
  exit 1
fi

if [ "x$*" = "x" ]; then
	${command} $default
else
	${command} "$@"
fi


