<xsl:stylesheet version="1.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	>
<xsl:output method="text" />

<xsl:template match="/">
<xsl:apply-templates select="form"/>
</xsl:template>

<xsl:template match="form|section">
<xsl:apply-templates select="list|text|section|table"/>
</xsl:template>


<xsl:template match="title|text|integer">
<xsl:text>
</xsl:text>
<xsl:text>  - </xsl:text>
 <xsl:value-of select="normalize-space(.)"/>
<xsl:text>
</xsl:text>
</xsl:template>

<xsl:template match="list">
<xsl:apply-templates select="title"/>
<xsl:apply-templates select="choice"/>
</xsl:template>


<xsl:template match="choice">
<xsl:text>     - </xsl:text>
 <xsl:value-of select="normalize-space(.)"/>
<xsl:text>
</xsl:text>
</xsl:template>

<xsl:template match="table">
<xsl:apply-templates select="title"/>
<xsl:for-each select="row">
<xsl:text>
  - </xsl:text>
 <xsl:value-of select="normalize-space(.)"/>
<xsl:text> [</xsl:text>
<xsl:for-each select="../column">
	 <xsl:text>	</xsl:text>
	 <xsl:value-of select="normalize-space(.)"/>
</xsl:for-each>
<xsl:text>]</xsl:text>
</xsl:for-each>
</xsl:template>

</xsl:stylesheet>
