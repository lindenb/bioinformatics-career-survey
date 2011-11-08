<xsl:stylesheet version="1.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	>
<xsl:output method="text" />

<xsl:template match="/">
<xsl:apply-templates select="form"/>
</xsl:template>

<xsl:template match="form|section">
<xsl:apply-templates select="list|text|section"/>
</xsl:template>


<xsl:template match="title|text">
<xsl:text>
</xsl:text>
<xsl:text>  - </xsl:text>
 <xsl:value-of select="normalize-space(.)"/>
<xsl:text>
</xsl:text>
</xsl:template>

<xsl:template match="list">
<xsl:text>
</xsl:text>
<xsl:apply-templates select="title"/>
<xsl:apply-templates select="choice"/>
</xsl:template>


<xsl:template match="choice">
<xsl:text>     - </xsl:text>
 <xsl:value-of select="normalize-space(.)"/>
<xsl:text>
</xsl:text>
</xsl:template>


</xsl:stylesheet>
