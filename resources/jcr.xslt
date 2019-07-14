<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

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
