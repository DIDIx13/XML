<?xml version="1.0" encoding="UTF-8"?>
<!--
    dominique huguenin (dominique.huguenin@rpn.ch)
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <!-- -->
    <xsl:output method="html" encoding="UTF-8"/>
    <!-- -->
    <xsl:template match="/">
        <!--
        <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
        -->
        <html lang="fr">
            <head>
                <title>Campanule - gestion des commandes</title>
                <link href="./css/main.css" rel="stylesheet" media="screen"/>
            </head>
            <body>
                <header>
                    <h1>Campanule - gestion des commandes</h1>
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

    <xsl:template match="articles">
        <section>
            <xsl:apply-templates select="article"/>
        </section>
    </xsl:template>

    <xsl:template match="article">
        <section>
            <h2>Articles</h2>
            <xsl:apply-templates select="identifiant"/>
            <xsl:apply-templates select="mouchard"/>
            <table>
                <tbody>
                    <tr>
                        <th>nom</th>
                        <td>
                            <xsl:value-of select="nom"/>
                        </td>
                    </tr>
                    <tr>
                        <th>poids</th>
                        <td>
                            <xsl:value-of select="poids"/>
                        </td>
                    </tr>
                    <tr>
                        <th>couleur</th>
                        <td>
                            <xsl:value-of select="couleur"/>
                        </td>
                    </tr>
                    <tr>
                        <th>qteStock</th>
                        <td>
                            <xsl:value-of select="qteStock"/>
                        </td>
                    </tr>
                    <tr>
                        <th>prixAchat</th>
                        <td>
                            <xsl:value-of select="prixAchat"/>
                        </td>
                    </tr>
                    <tr>
                        <th>prixVente</th>
                        <td>
                            <xsl:value-of select="prixVente"/>
                        </td>
                    </tr>
                </tbody>

            </table>
        </section>
        <hr/>

    </xsl:template>

    <xsl:template match="clients">
        <section>
            <xsl:apply-templates select="client"/>
        </section>
    </xsl:template>

    <xsl:template match="client">
        <section>
            <h2>Client</h2>
            <xsl:apply-templates select="identifiant"/>
            <xsl:apply-templates select="mouchard"/>
            <table>
                <tbody>
                    <tr>
                        <th>nom</th>

                        <td>
                            <xsl:value-of select="nom"/>
                        </td>
                    </tr>
                    <tr>
                        <th>prenom</th>

                        <td>
                            <xsl:value-of select="prenom"/>
                        </td>
                    </tr>
                    <tr>
                        <th>localite</th>
                        <td>
                            <xsl:value-of select="localite"/>
                        </td>
                    </tr>
                    <tr>
                        <th>chiffreAffaire</th>

                        <td>
                            <xsl:value-of select="chiffreAffaire"/>
                        </td>
                    </tr>
                    <tr>
                        <th>typeClient</th>
                        <td>
                            <xsl:value-of select="typeClient"/>
                        </td>
                    </tr>
                    <tr>
                        <th>codePays</th>
                        <td>
                            <xsl:value-of select="codePays"/>
                        </td>
                    </tr>
                </tbody>
            </table>
        </section>
        <hr/>

    </xsl:template>

    <xsl:template match="commandes">
        <section>
            <xsl:apply-templates select="commande"/>
        </section>
    </xsl:template>

    <xsl:template match="commande">
        <section>
            <h2>Commande</h2>
            <xsl:apply-templates select="identifiant"/>
            <xsl:apply-templates select="mouchard"/>

            <table>
                <tbody>
                    <tr>
                        <th></th>
                        <td>
                            <xsl:apply-templates select="client"/>
                        </td>
                    </tr>
                    <tr>
                        <th>date</th>
                        <td>
                            <xsl:value-of select="dateCommande"/>
                        </td>
                    </tr>
                    <tr>
                        <th>lignes</th>
                        <td>
                            <xsl:apply-templates select="lignes"/>
                        </td>
                    </tr>
                </tbody>
            </table>
        </section>
        <hr/>
    </xsl:template>

    <xsl:template match="lignes">
        <xsl:apply-templates select="item"/>
    </xsl:template>

    <xsl:template match="item">
        <h3>Ligne</h3>
        <table>
            <tbody>
                <tr>
                    <th></th>
                    <td>
                        <xsl:apply-templates select="article"/>
                    </td>
                </tr>
                <tr>
                    <th>qteCommandee</th>
                    <td>
                        <xsl:value-of select="qteCommandee"/>
                    </td>
                </tr>
                <tr>
                    <th>qteTotaleLivree</th>
                    <td>
                        <xsl:value-of select="qteTotaleLivree"/>
                    </td>
                </tr>
                <tr>
                    <th>prixVenteReel</th>
                    <td>
                        <xsl:value-of select="prixVenteReel"/>
                    </td>
                </tr>
                <tr>
                    <th>dateLivraisonPrevue</th>
                    <td>
                        <xsl:value-of select="dateLivraisonPrevue"/>
                    </td>
                </tr>
            </tbody>
        </table>
    </xsl:template>

    <xsl:template match="identifiant">
        <small>
            uuid : <xsl:value-of select="uuid"/>;
            version : <xsl:value-of select="version"/>;
        </small>
    </xsl:template>


    <xsl:template match="mouchard">
        <small>
            <xsl:if test="dateCreation">
                création : <xsl:value-of select="userCreation"/>
                <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                <xsl:value-of select="dateCreation"/>;
            </xsl:if>
            <xsl:if test="dateModification">
                modification : <xsl:value-of select="userModification"/>
                <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                <xsl:value-of select="dateModification"/>;
            </xsl:if>
            <xsl:if test="dateSuppression">
                suppression : <xsl:value-of select="userSuppression"/>
                <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                <xsl:value-of select="dateSuppression"/>;
            </xsl:if>
        </small>
    </xsl:template>



</xsl:stylesheet>
