<?xml version="1.0"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:template match="/">
        <html>
            <head>
                <title>Recipes | KRT XML</title>
                <link rel="stylesheet" type="text/css" href="recipe.css"/>
            </head>
            <body>
							 <header>
								 Recipe Project - ISTE 610.01 - Knowledge Representation Techniques  <br/>
								 @Author - Nirbhay Pherwani | <a target="_blank" href="https://nirbhay.me">https://nirbhay.me</a>
							 </header>
                <xsl:for-each select="/recipes/recipe">
                    <div class="card" style="border:5px Solid #C32026; border-radius: 15px;">
                        <div class="heading">
                            <b>
                                <xsl:value-of select="name" />
                            </b>
                        </div>
                        <br />
                        <div class="heading">
          Publisher / Creator : <xsl:value-of select="source" /></div>
                        <br />
                        <img style="width:100%">
                            <xsl:attribute name="src">
                                <xsl:value-of select="photo" />
                            </xsl:attribute>
                        </img>
                        <p class="serves">
                            <p class="servings">Serves <xsl:value-of select="serves" /></p>
                        </p>
                        <table>
                            <tr>
                                <th>Ingredient</th>
                                <th>Quantity</th>
                                <th>Measurement</th>
                            </tr>
                            <xsl:for-each select="ingredients/ingredient">
                                <tr>
                                    <td>
                                        <xsl:value-of select="." />
                                        <xsl:choose>
                                            <xsl:when test="@optional='yes'">
                                                <br />
                                                <br />
                                                <div class="optional">
                                                    <b>Optional</b>
                                                </div>
                                            </xsl:when>
                                        </xsl:choose>
                                    </td>
                                    <td>
                                        <xsl:value-of select="@amount" />
                                    </td>
                                    <td>
                                        <xsl:value-of select="@measurement" />
                                    </td>
                                </tr>
                            </xsl:for-each>
                        </table>
                        <br />
                        <div class="heading">Preparation Steps</div>
                        <table>
                            <xsl:for-each select="preparation/step">
                                <tr>
                                    <td>
                                        <xsl:value-of select="." />
                                    </td>
                                </tr>
                            </xsl:for-each>
                        </table>
                        <br />
                        <xsl:choose>
                            <xsl:when test="hints/hint">
                                <div class="heading">Hints</div>
                                <table>
                                    <xsl:for-each select="hints/hint">
                                        <tr>
                                            <td class="hint">
                                                <xsl:value-of select="." />
                                            </td>
                                        </tr>
                                    </xsl:for-each>
                                </table>
                            </xsl:when>
                        </xsl:choose>
                    </div>
                    <br />
                    <br />
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
