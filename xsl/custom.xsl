<xsl:stylesheet version="1.0"
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        xmlns:scs="http://geofon.gfz-potsdam.de/ns/seiscomp3-schema/0.10"
        xmlns:qml="http://quakeml.org/xmlns/quakeml/1.0"
        xmlns ="http://quakeml.org/xmlns/bed/1.2"
        xmlns:q = "http://quakeml.org/xmlns/bed/1.2"
        exclude-result-prefixes="scs qml xsl q">
 
    <xsl:output method="xml" encoding="UTF-8" indent="yes"/>
    <xsl:strip-space elements="*"/>

    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
 
    <xsl:template match="q:magnitude[not (q:type = 'ML')]">
    </xsl:template>

    <xsl:template match="q:magnitude[q:type = 'ML']/q:mag/q:value">
      <xsl:copy>
        <xsl:value-of select="round(current() * 10) div 10"/>
      </xsl:copy>
    </xsl:template>

</xsl:stylesheet>


