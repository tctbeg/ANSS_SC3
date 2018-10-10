#!/bin/bash

scxmldump -d mysql://sysop:sysop@localhost/seiscomp3 -E $1 -PMAfp |  xsltproc  $SEISCOMP_ROOT/share/xml/0.10/sc3ml_0.10__quakeml_1.2.xsl - | xsltproc xsl/anss.xsl -
