<?xml version="1.0" encoding="utf-8"?>
<!-- based on SO answer http://stackoverflow.com/a/9471505/166062 by dvdvorle http://stackoverflow.com/users/481635/dvdvorle -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="text" indent="no"/>
  <xsl:template match="/testsuites">
  <xsl:text>Testsuites: </xsl:text><xsl:value-of select="@name" />
    <xsl:text>
--------- ----------- ---------</xsl:text>
  <xsl:apply-templates select="testsuite" />
  </xsl:template>
  
  <xsl:template match="testsuite">
<xsl:text>

Tests run: </xsl:text>
    <xsl:value-of select="@tests" />
    <xsl:text>, Skipped: </xsl:text>
    <xsl:value-of select="@skipped" />
    <xsl:text>, Failures: </xsl:text>
    <xsl:value-of select="@failures" />
    <xsl:text>, Errors: </xsl:text>
    <xsl:value-of select="@errors" />
    <xsl:text>, Time elapsed: </xsl:text>
    <xsl:value-of select="@time" />
    <xsl:text> sec</xsl:text>
    <xsl:text>
--------- ----------- ---------</xsl:text>
    <xsl:apply-templates select="testcase" />
  </xsl:template>

  <xsl:template match="testcase">
<xsl:text>
* </xsl:text>
    <xsl:value-of select="@classname" />
    <xsl:text>
- "</xsl:text>
    <xsl:choose>
      <xsl:when test="failure"><xsl:text>[FAILURE] </xsl:text><xsl:apply-templates select="failure"/></xsl:when>
      <xsl:when test="error"><xsl:text>[ERROR] </xsl:text><xsl:apply-templates select="error"/></xsl:when>
      <xsl:when test="skipped"><xsl:text>[SKIPPED] </xsl:text><xsl:apply-templates select="skipped"/></xsl:when>
      <xsl:otherwise><xsl:text>[SUCCESS] </xsl:text></xsl:otherwise>
    </xsl:choose>
    <xsl:value-of select="@name" />
    <xsl:text>" took </xsl:text>
    <xsl:value-of select="@time" />
  </xsl:template>

  <xsl:template match="error | failure">
    <xsl:value-of select="@message" />
    <xsl:if test="@type != @message">
      <xsl:text> </xsl:text><xsl:value-of select="@type" />
    </xsl:if>
    <xsl:text>
</xsl:text>
    <xsl:value-of select="." />
  </xsl:template>

</xsl:stylesheet>
