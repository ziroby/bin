#!/usr/bin/env bash
#!/usr/bin/env bash
set -ex

if [ -f pom.xml ]; then
  command=mvn
  default=install

elif [ -f build.sbt ]; then
  command=gradle
  default=package

else 
  echo "Unknown build directory"
  exit 1
fi

if [ "x$*" = "x" ]; then
	${command} $default
else
	${command} "$@"
fi


