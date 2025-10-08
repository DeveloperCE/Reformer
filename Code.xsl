<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="xml" indent="yes"/>

  <xsl:template match="/Pay ">
    <Employees>
      <xsl:for-each-group select="item" group-by="@name">
        <Employee name="{current-grouping-key()}" >
          <xsl:attribute name="surname">
            <xsl:value-of select="@surname"/>
          </xsl:attribute>
          <xsl:for-each select="current-group()">
            <Salary>
              <xsl:attribute name="amount">
                <xsl:value-of select="@amount"/>
              </xsl:attribute>
              <xsl:attribute name="mount">
                <xsl:value-of select="@mount"/>
              </xsl:attribute>
            </Salary>
          </xsl:for-each>
        </Employee>
      </xsl:for-each-group>
    </Employees>
  </xsl:template>
</xsl:stylesheet>