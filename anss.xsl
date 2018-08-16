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

     
     <xsl:template match="q:event">
       <xsl:copy>
         <xsl:attribute name="catalog:datasource" namespace="http://anss.org/xmlns/catalog/0.1">tx</xsl:attribute>
         <xsl:attribute name="catalog:eventsource" namespace="http://anss.org/xmlns/catalog/0.1">tx</xsl:attribute>
         <xsl:attribute name="catalog:eventid" namespace="http://anss.org/xmlns/catalog/0.1">
           <xsl:value-of select="substring-after(@publicID, 'texnet')"></xsl:value-of>
         </xsl:attribute>
         <xsl:attribute name="catalog:dataid" namespace="http://anss.org/xmlns/catalog/0.1"> 
          <xsl:value-of select="concat('tx', substring-after(@publicID, 'texnet'))"></xsl:value-of>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
       </xsl:copy>
    </xsl:template>

     <xsl:template match="q:origin">
       <xsl:copy>
         <xsl:attribute name="catalog:datasource" namespace="http://anss.org/xmlns/catalog/0.1">tx</xsl:attribute>
         <xsl:attribute name="catalog:eventsource" namespace="http://anss.org/xmlns/catalog/0.1">tx</xsl:attribute>
         <xsl:attribute name="catalog:eventid" namespace="http://anss.org/xmlns/catalog/0.1">
           <xsl:value-of select="substring-after(../../q:event/@publicID, 'texnet')"></xsl:value-of>
         </xsl:attribute>
         <xsl:attribute name="catalog:dataid" namespace="http://anss.org/xmlns/catalog/0.1"> 
          <xsl:value-of select="concat('tx', substring-after(../../q:event/@publicID, 'texnet'))"></xsl:value-of>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
       </xsl:copy>
    </xsl:template>

</xsl:stylesheet>


