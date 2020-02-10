#!/usr/bin/env bash
#!/usr/bin/env bash
set -ex

if [ -f pom.xml ]; then
  command=mvn
  default=install

elif [ -f build.gradle ]; then
  command=gradle
  default=package

elif [ -f build.sbt ]; then
  command=sbt
  default=build

else 
  echo "Unknown build directory"
  exit 1
fi

if [ "x$*" = "x" ]; then
	${command} $default
else
	${command} "$@"
fi


