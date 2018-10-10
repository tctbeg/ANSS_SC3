<xsl:stylesheet version="1.0"
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        xmlns:scs="http://geofon.gfz-potsdam.de/ns/seiscomp3-schema/0.10"
        xmlns:qml="http://quakeml.org/xmlns/quakeml/1.0"
        xmlns ="http://quakeml.org/xmlns/bed/1.2"
        xmlns:q = "http://quakeml.org/xmlns/bed/1.2"
        exclude-result-prefixes="scs qml xsl q">


  
    <xsl:output method="xml" encoding="UTF-8" indent="yes"/>


    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="q:event">
      <xsl:copy>
        <xsl:apply-templates select="@*|node()"/>
        <xsl:element name="type">not existing</xsl:element>
      </xsl:copy>
    </xsl:template>

    <xsl:template match="q:arrival">
    </xsl:template>

    <xsl:template match="q:pick">
    </xsl:template>

    <xsl:template match="q:stationMagnitude">
    </xsl:template>

    <xsl:template match="q:arrival">
    </xsl:template>

    <xsl:template match="q:stationMagnitudeContribution">
    </xsl:template>

    <xsl:template match="q:amplitude">
    </xsl:template>
  
    <xsl:template match="q:magnitude">
    </xsl:template>


</xsl:stylesheet>
