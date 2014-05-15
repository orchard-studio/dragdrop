<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:import href="../utilities/pagination.xsl"/>


<xsl:template match="/">	
<xsl:variable name="amountpages" select="//data/section-2/pagination/@total-pages"/>
  <ul class="thumb tabbed images open">        
  <!--<xsl:apply-templates select="//data/section-2/entry" mode="media"/>-->
 
 <xsl:apply-templates select="//data/section-2/entry" mode="media"/>
     
  </ul>
   <xsl:call-template name="pagination">
        <xsl:with-param name="pagination" select="//data/section-2/pagination" />
        <xsl:with-param name="pagination-url" select="'?p=$'" />
        <xsl:with-param name="show-range" select="'$amountpages'" />
        <xsl:with-param name="label-next" select="'Next Page'" />
        <xsl:with-param name="label-previous" select="'Previous Page'" />     
      </xsl:call-template>
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