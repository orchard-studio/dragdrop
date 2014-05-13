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
  <h1>
      Images
    </h1>
  <ul class="thumb">    
    
  <xsl:apply-templates select="//data/section-2/entry" mode="media"/>
  </ul>
    <hr/>
  <h1>
      Videos
    </h1>
  <ul class="thumb">       
    <xsl:apply-templates select="//data/section-3/entry" mode="media"/>
  </ul>
</xsl:template>
      <xsl:template match="//data/section-2/entry" mode="media">        
        <li>
        <a class="hover_image" href="{$workspace}/{images/@path}/{images/filename}">
          <img id="drag1" src="{$workspace}/{images/@path}/{images/filename}" width="300px" draggable="true" ondragstart="drag(event,'{images/filename}:capn',this)"/>
         </a>
          </li>
      </xsl:template>
      <xsl:template match="//data/section-3/entry" mode="media">        
        <li>
          <span class="hover_video" data-video-id="y-{video-id}">
           <img id="drag1" src="{stills/thumbnail}" width="{stills/oembed/width}" draggable="true" ondragstart="drag(event,'{video-id}:capn',this)"/>                      
            </span>
          </li>
      </xsl:template>
</xsl:stylesheet>