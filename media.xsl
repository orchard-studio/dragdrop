<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="xml"
	doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
	doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
	omit-xml-declaration="yes"
	encoding="UTF-8"
	indent="yes" />

<xsl:template match="/">
	<h1><xsl:value-of select="$page-title"/></h1>
   <p>Boom</p>
  <xsl:apply-templates select="//data/section-1/entry" mode="media"/>
</xsl:template>
      <xsl:template match="//data/section-1/entry" mode="media">
        <div id="div1" ondrop="drop(event,'{images/filename}:capn')" ondragover="allowDrop(event)"></div>
        <img id="drag1" src="{$workspace}/{images/@path}/{images/filename}" width="300px" draggable="true" ondragstart="drag(event,'{images/filename}:capn',this)"/>
      </xsl:template>
</xsl:stylesheet>