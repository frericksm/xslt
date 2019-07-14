<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:fn_old="http://www.w3.org/2004/10/xpath-functions" xmlns:isp="http://www.sk.de/isp/1.0" xmlns:jcr="http://www.jcp.org/jcr/1.0" xmlns:mix="http://www.jcp.org/jcr/mix/1.0" xmlns:nt="http://www.jcp.org/jcr/nt/1.0" xmlns:rep="internal" xmlns:sv="http://www.jcp.org/jcr/sv/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema">

  <!--Identity template, 
      provides default behavior that copies all content into the output -->
  <xsl:template match="@*|node()">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>
  
  <!--More specific template for Node766 that provides custom behavior -->
  <xsl:template match="node/property[@name='jcr:primaryType']/value[text()='isp:dataMapping']/parent/parent">  
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
      <!--Do something special for Node766, like add a certain string-->
    </xsl:copy>
  </xsl:template>

<xsl:template match="@name[parent::node]">
  <xsl:attribute name="name">
    <xsl:value-of select="'your value here'"/>
  </xsl:attribute>
</xsl:template>
</xsl:stylesheet>
