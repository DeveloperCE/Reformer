<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml" indent="yes"/>
  
<xsl:key name="group" match="item" use="@name"/>
  
<xsl:template match="Pay">
  <Employees>
    <xsl:apply-templates select="item[generate-id(.) = generate-id(key('group',@name))]" />
  </Employees>
</xsl:template>
  
<xsl:template match="item">
  <Employee name="{@name}" surname="{@surname}">
    <xsl:for-each select="key('group',@name)">
      <salary amount="{@amount}" mount="{@mount}"/>
    </xsl:for-each>
  </Employee>
</xsl:template>

</xsl:stylesheet>
