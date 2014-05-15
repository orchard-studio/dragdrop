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
<xsl:variable name="amountpages" select="//data/section-4/pagination/@total-pages"/>
	<ul class="thumb tabbed files open">       
    <xsl:apply-templates select="//data/section-4/entry" mode="media"/>
	
  </ul>
  <xsl:call-template name="pagination">
        <xsl:with-param name="pagination" select="//data/section-4/pagination" />
        <xsl:with-param name="pagination-url" select="'?p=$'" />
        <xsl:with-param name="show-range" select="'$amountpages'" />
        <xsl:with-param name="label-next" select="'Next Page'" />
        <xsl:with-param name="label-previous" select="'Previous Page'" />     
      </xsl:call-template>
  
</xsl:template>
  <xsl:template match="//data/section-4/entry" mode="media">        
        <li>
        <a class="hover_files" href="{$workspace}/{file/@path}/{file/filename}" data-caption="{file/filename}" draggable="true" ondragstart="drag(event,'{file/filename}:capn',this)">			
			<!--<img id="drag1" width="150px" draggable="true" ondragstart="drag(event,'{file/filename}:capn',this)" src="data:image/png;base64,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"/>
          -->
		  </a>
		 <span class="info"><p><xsl:value-of select="caption"/></p></span>
          <div class="hovered-box">
            
            <span class="caption"><p>Caption  : <xsl:value-of select="caption"/></p></span>
          </div>
          </li>
      </xsl:template>
</xsl:stylesheet>