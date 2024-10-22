# XPATH (éléments de solution)

## Dans une structure xml d'articles, en utilisant XPath :

1. Extraire la liste des noms d'articles
    ```
    //article/nom/child::text()
    ```
    ```    
    AGRAFEUSE
    CALCULATRICE
    CACHET DATEUR
    LAMPE
    LAMPE
    LAMPE
    LAMPE
    PESE-LETTRE1-500
    PESE-LETTRE1-1000
    PESE-LETTRE1-500
    PESE-LETTRE1-1000
    CRAYON
    CRAYON
    CRAYON LUXE
    CRAYON LUXE
    CRAYON LUXE
    CRAYON LUXE
    COFFRET SIMPLE
    COFFRET LUXE
    ```

1. Extraire la liste des uuids
    ```
    //article/identifiant/uuid/child::text()
    ```
    ```    
    DEMO0000-0000-0000-0001-000000000001
    DEMO0000-0000-0000-0001-000000000002
    DEMO0000-0000-0000-0001-000000000003
    DEMO0000-0000-0000-0001-000000000004
    DEMO0000-0000-0000-0001-000000000005
    DEMO0000-0000-0000-0001-000000000006
    DEMO0000-0000-0000-0001-000000000007
    DEMO0000-0000-0000-0001-000000000008
    DEMO0000-0000-0000-0001-000000000009
    DEMO0000-0000-0000-0001-000000000010
    DEMO0000-0000-0000-0001-000000000011
    DEMO0000-0000-0000-0001-000000000012
    DEMO0000-0000-0000-0001-000000000013
    DEMO0000-0000-0000-0001-000000000014
    DEMO0000-0000-0000-0001-000000000015
    DEMO0000-0000-0000-0001-000000000016
    DEMO0000-0000-0000-0001-000000000017
    DEMO0000-0000-0000-0001-000000000018
    DEMO0000-0000-0000-0001-000000000019
    ```

1. Extraire la liste des noms d'articles blancs
    ```
    //article[couleur="BLANC"]/nom/child::text()
    ```
    ```
    CACHET DATEUR
    LAMPE
    ```

1. Extraire l'article  DEMO0000-0000-0000-0001-000000000007 dans son entier.

    ```
    //article[identifiant/uuid="DEMO0000-0000-0000-0001-000000000007"]

    //identifiant[uuid="DEMO0000-0000-0000-0001-000000000007"]/parent::node()
    ```
    ```
    <article>
        <identifiant>
            <uuid>DEMO0000-0000-0000-0001-000000000007</uuid>
            <version>0</version>
        </identifiant>
        <mouchard>
            <dateCreation>2017-11-30T08:19:48.743Z</dateCreation>
            <userCreation>testUser</userCreation>
        </mouchard>
        <nom>LAMPE</nom>
        <poids>550.0</poids>
        <couleur>VERT</couleur>
        <qteStock>3</qteStock>
        <prixAchat>105.00</prixAchat>
        <prixVente>149.00</prixVente>
    </article>
    ```
1. Extraire la couleur de l'article DEMO0000-0000-0000-0001-000000000007.
    ```
    //identifiant[uuid="DEMO0000-0000-0000-0001-000000000007"]/parent::node()/couleur/child::text()
    ```
    ```
    VERT
    ```

## Dans une structure xml des commandes en utilisant XPath :

1. Extraire les identifiants des commandes qui contiennent un article bleu
    ```
    //article[couleur="BLEU"]/ancestor::commande/identifiant/uuid/text()

    //commande[descendant::article/couleur="BLEU"]/identifiant/uuid/text()
    ```
    ```    
    DEMO0000-0000-0000-0003-000000000003
    DEMO0000-0000-0000-0003-000000000004
    DEMO0000-0000-0000-0003-000000000005
    DEMO0000-0000-0000-0003-000000000009
    ```

1. Extraire les identifiants des commandes qui contiennent l'article DEMO0000-0000-0000-0001-000000000012
    ```
    //article/identifiant[uuid="DEMO0000-0000-0000-0001-000000000012"]/ancestor::commande/identifiant/uuid/text()

    //commande[descendant::article/identifiant/uuid="DEMO0000-0000-0000-0001-000000000012"]/identifiant/uuid/text()

    //commande[contains(descendant::article/identifiant/uuid,"12")]/identifiant/uuid
    ```
    ```    
    DEMO0000-0000-0000-0003-000000000004
    DEMO0000-0000-0000-0003-000000000009
    DEMO0000-0000-0000-0003-000000000010
    ```

1. Extraire les identifiants des commandes qui contiennent des articles vendus plus cher que le prix de vente
    ```
    //item[article/prixVente < prixVenteReel ]/ancestor::commande/identifiant/uuid/text()

    //commande[descendant::item[prixVenteReel > article/prixVente]]/identifiant/uuid
    ```
    ```    
    DEMO0000-0000-0000-0003-000000000003
    DEMO0000-0000-0000-0003-000000000004
    DEMO0000-0000-0000-0003-000000000009
    DEMO0000-0000-0000-0003-000000000010
    ```

## Références

1. XPathUtil - plugin detail. [http://plugins.netbeans.org/plugin/18522/][10]

[10]:http://plugins.netbeans.org/plugin/18522/
