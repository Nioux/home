<xsl:stylesheet xmlns:xsl='http://www.w3.org/1999/XSL/Transform' version="1.0">
<xsl:output
	method="xml"
	encoding="ISO-8859-1"
	media-type="text/html" 
	omit-xml-declaration="yes"
	doctype-public= "-//W3C//DTD XHTML 1.0 Strict//EN"
	doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
	indent="yes" />



<xsl:template match="bms">
	<html xmlns="http://www.w3.org/1999/xhtml">
		<head>
			<title>iNioux</title>
			<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
			<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;" />
			<link rel="apple-touch-icon" href="iui/little-nioux.png" />
			<meta name="apple-touch-fullscreen" content="YES" />
			<style type="text/css" media="screen">@import "iui/iui.css";</style>
			<script type="application/x-javascript" src="iui/iui.js">&#160;</script>
		</head>
		<body>

			<div class="toolbar">
				<h1 id="pageTitle">&#160;</h1>
				<a id="backButton" class="button" href="#">&#160;</a>
			</div>

			<ul id="home" title="iNioux" selected="true">
  			<xsl:for-each select="cat">
  				<li><a><xsl:attribute name="href">#cat_<xsl:value-of select="position()"/></xsl:attribute><xsl:value-of select="@title"/></a></li>
  			</xsl:for-each>
			</ul>

			<xsl:for-each select="cat">
				<ul><xsl:attribute name="id">cat_<xsl:value-of select="position()"/></xsl:attribute><xsl:attribute name="title"><xsl:value-of select="@title"/></xsl:attribute>
  				<xsl:for-each select="subcat">
    				<li><a><xsl:attribute name="href">#subcat_<xsl:value-of select="count(parent::*/preceding-sibling::*)+1"/>_<xsl:value-of select="position()"/></xsl:attribute><xsl:value-of select="@title"/></a></li>
  				</xsl:for-each>
				</ul>

				<xsl:for-each select="subcat">
					<ul><xsl:attribute name="id">subcat_<xsl:value-of select="count(parent::*/preceding-sibling::*)+1"/>_<xsl:value-of select="position()"/></xsl:attribute><xsl:attribute name="title"><xsl:value-of select="@title"/></xsl:attribute>
					<xsl:for-each select="bm">
  					<xsl:choose>
    					<xsl:when test="@iref">
							<xsl:choose>
								<xsl:when test="@limg">
									<li><a target="_blank"><xsl:attribute name="href"><xsl:value-of select="@iref"/></xsl:attribute><img><xsl:attribute name="src"><xsl:value-of select="@limg"/></xsl:attribute></img></a></li>
								</xsl:when>
								<xsl:otherwise>
									<li><a target="_blank"><xsl:attribute name="href"><xsl:value-of select="@iref"/></xsl:attribute><xsl:value-of select="text()"/></a></li>
								</xsl:otherwise>
							</xsl:choose>
    					</xsl:when>
    					<xsl:otherwise>
							<xsl:choose>
								<xsl:when test="@limg">
									<li><a target="_blank"><xsl:attribute name="href"><xsl:value-of select="@href"/></xsl:attribute><img><xsl:attribute name="src"><xsl:value-of select="@limg"/></xsl:attribute></img></a></li>
								</xsl:when>
								<xsl:otherwise>
									<li><a target="_blank"><xsl:attribute name="href"><xsl:value-of select="@href"/></xsl:attribute><xsl:value-of select="text()"/></a></li>
								</xsl:otherwise>
							</xsl:choose>
    					</xsl:otherwise>
  					</xsl:choose>
					</xsl:for-each>
					</ul>
				</xsl:for-each>
			</xsl:for-each>

		</body>
	</html>
</xsl:template>

</xsl:stylesheet>
