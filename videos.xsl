<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:include href="../utilities/pagination.xsl" />
<xsl:output method="xml"
	doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
	doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
	omit-xml-declaration="yes"
	encoding="UTF-8"
	indent="yes" />

<xsl:template match="/">
<xsl:variable name="amountpages" select="//data/section-3/pagination/@total-pages"/>
	<ul class="thumb tabbed videos open">       
    <xsl:apply-templates select="//data/section-3/entry" mode="media"/>
	
  </ul>
  <xsl:call-template name="pagination">
        <xsl:with-param name="pagination" select="//data/section-3/pagination" />
        <xsl:with-param name="pagination-url" select="'?p=$'" />
        <xsl:with-param name="show-range" select="'$amountpages'" />
        <xsl:with-param name="label-next" select="'Next Page'" />
        <xsl:with-param name="label-previous" select="'Previous Page'" />     
      </xsl:call-template>
  
</xsl:template>
<xsl:template match="//data/section-3/entry" mode="media">        
        <li>          
          <span class="video-target" data-caption="{stills/thumbnail}">
            <span class="hover_video" data-video-id="{video-id}">
             <img id="drag1" src="{stills/thumbnail}" width="{stills/oembed/width}" draggable="true" ondragstart="drag(event,'{video-id}:capn',this)"/>                      
            </span>
            <div class="video-wrapper">
              <div class="video-frame">
                <div class="video"></div>				
              </div>
            </div>
          </span>          
			<a href="" class="close"></a>
			<span class="edit"><a href="{$root}/symphony/publish/section-3/edit/{@id}">Edit</a></span>
          </li>
      </xsl:template>
</xsl:stylesheet>