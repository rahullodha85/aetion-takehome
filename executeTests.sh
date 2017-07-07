#!/bin/bash
inputTags=$1
if [ "$inputTags" == "" ] ; then
    tags='~@ignored'
else
    tags='@'$inputTags
fi
mvn clean test -Dcucumber.options="--tags $tags"