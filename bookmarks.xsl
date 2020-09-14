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
			<link rel="apple-touch-icon" sizes="180x180" href="apple-touch-icon.png" />
			<link rel="icon" type="image/png" sizes="32x32" href="favicon-32x32.png" />
			<link rel="icon" type="image/png" sizes="16x16" href="favicon-16x16.png" />
			<link rel="manifest" href="site.webmanifest" />
			<link href="css/bootstrap.min.css" rel="stylesheet" />
			<link href="css/scrolling-nav.css" rel="stylesheet" />
		</head>
		<body id="page-top" data-spy="scroll" data-target=".navbar-fixed-top">

			<!-- Navigation -->
			<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
				<div class="container">
					<!--<div class="navbar-header page-scroll">
						<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
							<span class="sr-only">Toggle navigation</span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
						<a class="navbar-brand page-scroll" href="#page-top">Quotidien</a>
					</div>-->

					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="collapse navbar-collapse navbar-ex1-collapse">
						<ul class="nav navbar-nav">
							<!-- Hidden li included to remove active class from about link when scrolled up past about section -->
							<!--<li class="hidden">
								<a class="page-scroll" href="#page-top"></a>
							</li>-->
							<xsl:for-each select="cat">
								<li>
									<a class="page-scroll"><xsl:attribute name="href">#<xsl:value-of select="@id"/></xsl:attribute><xsl:value-of select="@title"/></a>
								</li>
							</xsl:for-each>
						</ul>
					</div>
					<!-- /.navbar-collapse -->
				</div>
				<!-- /.container -->
			</nav>
		
			<xsl:for-each select="cat">
				<!-- Intro Section -->
				<section class="intro-section"><xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
					<div class="container">
						<div class="row">
							<xsl:for-each select="subcat">
								<div class="col-md-2">
									<div class="panel panel-default">
										<div class="panel-heading">
											<h3 class="panel-title"><xsl:value-of select="@title"/></h3>
										</div>
										<div class="panel-body">
											<ul class="nav">
												<xsl:for-each select="bm">				
													<li style="text-align: left;"><xsl:attribute name="title"><xsl:value-of select="text()"/></xsl:attribute>									
									<xsl:choose>
									<xsl:when test="@limg">
														<a target="_blank"><xsl:attribute name="href"><xsl:value-of select="@href"/></xsl:attribute>
															<table width="100%"><tr><td align="center"><img><xsl:attribute name="src"><xsl:value-of select="@limg" /></xsl:attribute><xsl:attribute name="alt"><xsl:value-of select="text()"/></xsl:attribute></img></td></tr></table>
														</a>
									</xsl:when>
									<xsl:otherwise>
														<a target="_blank"><xsl:attribute name="href"><xsl:value-of select="@href"/></xsl:attribute>
															<table><tr><td><img alt=""><xsl:attribute name="src"><xsl:value-of select="@img" /></xsl:attribute></img></td><td>&#160;&#160;</td><td><xsl:value-of select="text()"/></td></tr></table>
														</a>
									</xsl:otherwise>
									</xsl:choose>
													</li>
												</xsl:for-each>
											</ul>
										</div>
									</div>
								</div>
							</xsl:for-each>
						</div>
					</div>
				</section>
			</xsl:for-each>
							<!--
								<li><a><xsl:attribute name="href">#subcat_<xsl:value-of select="count(parent::*/preceding-sibling::*)+1"/>_<xsl:value-of select="position()"/></xsl:attribute><xsl:value-of select="@title"/></a></li>
							</xsl:for-each>
						
						
						
						
						
						

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
      					<li><a target="_blank"><xsl:attribute name="href"><xsl:value-of select="@iref"/></xsl:attribute><xsl:value-of select="text()"/></a></li>
    					</xsl:when>
    					<xsl:otherwise>
      					<li><a target="_blank"><xsl:attribute name="href"><xsl:value-of select="@href"/></xsl:attribute><xsl:value-of select="text()"/></a></li>
    					</xsl:otherwise>
  					</xsl:choose>
					</xsl:for-each>
					</ul>
				</xsl:for-each>
			</xsl:for-each>-->

			<!-- jQuery -->
			<script src="js/jquery.js">&#160;</script>

			<!-- Bootstrap Core JavaScript -->
			<script src="js/bootstrap.min.js">&#160;</script>

			<!-- Scrolling Nav JavaScript -->
			<script src="js/jquery.easing.min.js">&#160;</script>
			<!--<script src="js/scrolling-nav.js">&#160;</script>-->

		</body>
	</html>
</xsl:template>

</xsl:stylesheet>
