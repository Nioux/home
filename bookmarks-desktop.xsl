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
			<style type="text/css">
				<!--<xsl:comment>-->
					body
					{
						font-family : Helvetica;
						color : #AFC2F3;
						background-color : #222222;
					}
					table
					{
						font-family:Helvetica;
					}
					th
					{
						color : #F3C2AF;
						background-color : #535353;
						text-align : center;
					}
					h2
					{
						font-family : Helvetica;
					}
					div
					{
						float : left;
						width : 240px;
						height : 280px;
					}
					a
					{
						color : #C2F3AF;
						font-size : 14px;
						text-decoration : none;
					}
					a:hover
					{
						text-decoration : underline;
					}
				<!--</xsl:comment>-->
			</style>
		</head>
		<body>
			<table cellspacing="0" cellpadding="0">
				<xsl:for-each select="cat">
					<tr><th>
						<h2><xsl:value-of select="@title"/></h2>
					</th></tr>
					<tr><td>
						<xsl:for-each select="subcat">
							<div>
								<h3><xsl:value-of select="@title"/></h3>
								<ul>
									<xsl:for-each select="bm">
										<li>
											<a target="_blank"><xsl:attribute name="href"><xsl:value-of select="@href"/></xsl:attribute><xsl:value-of select="text()"/></a>
											<xsl:if test="@iref">
												&#160;<a target="_blank"><xsl:attribute name="href"><xsl:value-of select="@iref"/></xsl:attribute>(i)</a>
											</xsl:if>
										</li>
									</xsl:for-each>
								</ul>
							</div>
						</xsl:for-each>
					</td></tr>
				</xsl:for-each>
			</table>
		</body>
	</html>
</xsl:template>

</xsl:stylesheet>
