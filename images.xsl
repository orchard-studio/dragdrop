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
  <ul class="thumb tabbed images open">        
  <xsl:apply-templates select="//data/section-2/entry" mode="media"/>
  </ul>
</xsl:template>
      <xsl:template match="//data/section-2/entry" mode="media">        
        <li>
        <a class="hover_image" href="{$workspace}/{images/@path}/{images/filename}" data-caption="{images/filename}">
          <img id="drag1" src="{$workspace}/{images/@path}/{images/filename}" width="150px" draggable="true" ondragstart="drag(event,'{images/filename}:capn',this)"/>
		  
         </a>
		 <span class="edit"><a href="{$root}/symphony/publish/section-2/edit/{@id}">Edit</a></span>
          <!--<div class="hovered">
            <img id="drag1" src="{$workspace}/{images/@path}/{images/filename}" width="300px" draggable="true" ondragstart="drag(event,'{images/filename}:capn',this)"/>
            <span class="caption">Caption <xsl:value-of select="images/filename"/></span>
          </div>-->
          </li>
      </xsl:template>
      
</xsl:stylesheet>