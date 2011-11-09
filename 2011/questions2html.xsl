<xsl:stylesheet version="1.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	>
<xsl:output method="html" />

<xsl:template match="/">
<html><head>
<title><xsl:value-of select="form/title"/></title>
<style type="text/css">
dl	{
	margin:5px;
	}
dt	{
	font-size:120%;

	}
dd	{

	}
label	{
	min-width:200px;
	}
</style>
</head><body>
<form action="#">
<div style="margin:10px;">
<xsl:apply-templates select="form"/>
</div>
</form>
</body></html>
</xsl:template>


<xsl:template match="form">
<h1><xsl:value-of select="title"/></h1>
<p><xsl:value-of select="description"/></p>
<hr/>
<xsl:apply-templates select="section"/>

</xsl:template>

<xsl:template match="section">
<div style="margin:10px;padding:10px;">
<h2><xsl:value-of select="title"/></h2>
<p><xsl:value-of select="description"/></p>
<dl>
<xsl:apply-templates select="text|integer|table|list"/>
</dl>
</div>

</xsl:template>

<xsl:template match="text">
<dt><xsl:value-of select="title"/></dt>
<dd><input type="text"/></dd>
</xsl:template>

<xsl:template match="integer">
<dt><xsl:value-of select="title"/></dt>
<dd><input type="text"/></dd>
</xsl:template>


<xsl:template match="list">
<dt><xsl:value-of select="title"/></dt>
<xsl:apply-templates select="choice"/>
</xsl:template>


<xsl:template match="choice">
<dd>
	<input type="checkbox"/>
	<xsl:text> </xsl:text>
	<label><xsl:value-of select="."/></label>
	
</dd>
</xsl:template>

<xsl:template match="table">
<dt><xsl:value-of select="title"/></dt>
<table border="1" width="100%">
<tr>
<th/>
<xsl:for-each select="column">
<th><xsl:value-of select="."/></th>
</xsl:for-each>
</tr>
<xsl:for-each select="row">
<tr>
<th><xsl:value-of select="."/></th>
<xsl:for-each select="../column">
	 <td>
	 <input type="radio"/>
	 </td>
</xsl:for-each>
</tr>
</xsl:for-each>
</table>
</xsl:template>





</xsl:stylesheet>
