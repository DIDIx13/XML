<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" encoding="UTF-8"/>

    <xsl:template match="/">
        <!--
        <xsl:text disable-output-escaping='yes'>
                    <![CDATA[<!DOCTYPE html>]]>
                </xsl:text>
        -->        
        <html lang="fr">
            <head>
                <title>Contacts</title>
                <link href="./css/main.css" rel="stylesheet" media="screen"/>
            </head>
            <body>
                <header>
                    <h1>Contacts</h1>
                </header>
                <nav>
                    <ul>
                        <li>
                            <a href="index.html">index.html</a>
                        </li>
                    </ul>
                </nav>
                <xsl:apply-templates/>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="contacts">
        <xsl:apply-templates select="contact"/>
    </xsl:template>

    <xsl:template match="contact">
        <section>
            <h2>Contact</h2>
            <xsl:apply-templates select="identifiant"/>
            <table>
                <tbody>
                    <xsl:apply-templates select="nom"/>
                    <xsl:apply-templates select="date-naissance"/>
                    <xsl:apply-templates select="telephones"/>
                </tbody>
            </table>
        </section>
    </xsl:template>
    
    <xsl:template match="identifiant">
        <small>
            uuid : <a href="contact_{UUID}.xml"> 
                <xsl:value-of select="UUID"/>
            </a>
        </small>
    </xsl:template>
    

    <xsl:template match="nom">
        <tr>
            <th>nom</th>
            <td>
                <xsl:value-of select="."/>
            </td>
        </tr>
    </xsl:template>

    <xsl:template match="date-naissance">
        <tr>
            <th>date de naissance</th>
            <td>
                <xsl:value-of select="."/>
            </td>
        </tr>
    </xsl:template>


    <xsl:template match="telephones">
        <xsl:if test="count(./telephone) > 0" >                    
            <tr>
                <th>Téléphones</th>
                <td>
                    <table>
                        <thead>
                            <tr>
                                <th>Catégorie</th>
                                <th>numéro</th>
                            </tr>
                        </thead>
                        <tbody>
                            <xsl:apply-templates select="telephone"/>
                        </tbody>
                    </table>
                </td>
            </tr>
        </xsl:if>
    </xsl:template>

    <xsl:template match="telephone">
        <tr>
            <td>
                <xsl:value-of select="categorie"/>
            </td>
            <td>
                <xsl:value-of select="numero"/>
            </td>
        </tr>
    </xsl:template>


</xsl:stylesheet>

