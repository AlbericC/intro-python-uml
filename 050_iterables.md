Conteneurs ou *itérables* python
==============================

Types de séquences
------------------

### Atteindre les éléments d'une séquence: indexage et "slice"
Les séquences sont des ensemble ordonnées l'élément repérés par des entiers positifs (les indices). La fonction incluse ``len()`` renvoie le nombre d'éléments d'une séquence. Une séquence de $n$ éléments a les indices $0, 1, 2, \cdots, n-1$.

On atteint l'élément $i$ d'une séquence $S$ avec l'expression ``S[i]``.

Les séquences supportent également le *slicing* : ``S[i:j]`` contient les éléments d'indice k tel que $i <= k < j$^[Attention aux inégalités strictes ou non, ce n'est pas une information inutile pour les slices.]. Dans une expression, une *slice* de séquence est une séquence du même type. Les indices de cette nouvelle séquence débutent à\ 0.

On peut également étendre le *slicing* d'un troisième paramètre, le pas. ``S[i:j:p]`` contient les éléments d'indice k où $k = i + p \cdot n , n \geq 0, i \leq k<j$.


### Types de séquences "immutable"

Ces séquences ne peuvent être modifiées après leur création. Toutefois, si l'objet contient des références à d'autres objet, eux, mutables, alors les modifications de ces derniers peuvent être changés, mais les références de l'objet immutable ne seront jamais modifiées.

Chaînes de caractères ou *Strings*
:   : une chaîne de caractères est une séquence de valeurs représentant des caractères^[en réalité des *code points* Unicode]. Python n'a pas de type ``char``; les valeurs contenues dnas une ``str`` sont elles-mêmes des ``str`` de longueur\ 1.

    Les fonctions incluses ``ord()`` et ``chr()`` permettent de convertir un caractère en entier et réciproquement.

Tuples
:   : les éléments d'un tuple sont n'importe quels objets python. Les tuples sont construits en séparant des éléments par une virgule ; une tuple d'un seul élément peut être réalisé en suffixant l'élément d'une virgule.

    Une paire vide de parenthèse crée un tuple vide.

``` python
    tuple_unitaire = 42,
```

### Types de séquences "mutable"

Les séquences *mutables* peuvent être modifiées après leur création. L'indexage et le *slicing* peuvent servir à leur modification, comme à des instructions ``del`` pour l'effacement.

``` python
>>> ma_liste
['a', 'b', 'c']
>>> del ma_liste[2]
>>> ma_liste
['a', 'b']
>>> ma_liste[0] = 42
>>> ma_liste
[42, 'b']
```

Listes
:   : les listes sont constituées d'objets python quelconques. Elles sont construites en plaçant une liste d'expression (ou de valeurs) séaprée par des virgules entre crochets. Il n'y a pas besoin d'une syntaxe spéciale our construire des listes de longueur\ 0 ou\ 1.

D'autres types mutables de séquence sont fournis par des modules externes, comme ``array``^[[@py3doc, section 8.7] [https://docs.python.org/3/library/array.html](https://docs.python.org/3/library/array.html)] ou le module ``collections``^[[@py3doc, section 8.3] [https://docs.python.org/3/library/collections.html](https://docs.python.org/3/library/collections.html)]

Types ensemblistes
---------------------

Ces types représentent des finis, non ordonnés d'objets uniques et **immutable**. Dépourvus d'ordre, on ne peut les indexer. Par contre, il est possible de "boucler" ou itérer sur ces éléments ; et la fonction ``len()`` donne le nombre d'éléments contenus. Leurs usages courants sont la suppression des doublons, les test d'appartenance rapides, et bien entendu les opération ensemblistes.

---------------------------------------------------------------------------------------
   Opérateur Opération ensembliste
------------ --------------------------------------------------------------------------
``in``        test d'appartenance ``x in s``

``not in``    test d'exclusion    ``x not in s``

``s1 <= s2``  sous-ensemble, vrai si $s1 \subseteq s2$

``s1 < s2``   sous-ensemble, vrai si $s1 \subset s2$

``s1 >= s2``  vrai si $\forall i \in s2, i \in s1$

``s1 > s2``   équivalent à ``s2 < s1`` et à `` s1 >= s2 and s1 != s2``

``s1 | s2``   union, renvoie un ``set`` contenant tous les éléments de ``s1`` et ``s2``

``s1 & s2``   intersection, renvoie $s1 \cap s2$

``s1 - s2``   différence, ``set`` de tous les éléments de ``s1`` absents de ``s2``

``s1 ^ s2``   ou exclusif, ``set`` des éléments de s1 ou s2, mais pas dans les deux.
---------------------------------------------------------------------------------------

Pour garantir l'unicité, les éléments d'un set doivent toujours être *immutable*. En particulier les nombres doivent vérifier les règles d'égalité : par exemple, comme ``3 == 3.0``, seul l'un de ces nombres peut se trouver dans un ``set``.

Il existe deux types de ``set`` dans python:

``set``
:   : c'est un ensemble mutable, créé par le constructeur inclus ``set()``. Il peut être modifié après sa création, par exemple avec ``add()``

---------------------------- -------------------------------------------------------------------------------------------
`add(elem)`                  Ajouter un élément au ``set``

`remove(elem)`               Enlever ``elem`` du ``set``. Crée une erreur si $elem \notin set$

`discard(elem)`              Enlever ``elem`` de ``set`` s'il s'y trouve.

`pop()`                      Enlève n'importe quel objet du ``set`` et le renvoie.

`clear()`                    Ôte tous ses éléments à un ensemble
------------------------------------------------------------------------------------------------------------------------

``frozenset``
:   : ils représentent un ensemble immutable. Ils sont créés par le constructeru inclus ``frozenset()``. un ``frozenset`` est immutable et peut donc être un élément d'un autre ensemble.

Type de mise en correspondance (*mapping*)
----------------------------------------

L'unique type de mise en correspondance disponible en python est le dictionnaire. En lieu et place d'index, il utilise des *clés*. Pour un dictionnaire ``d``, la notation ``d[k]`` correspond à la *valeur* du dictionnaire référencée par la clé ``k`` dans ``d``. On peut utiliser cette forme dans des expressions aussi bien que pour des instructions ``del``. La fonction ``len`` renvoie pour un dictionnaire le nombre de paires "clé--valeur" qu'il contient.

Les clés sont uniques, et ne peuvent donc être que des objets *immutable*. Les dictionnaires eux-mêmes sont *mutable*, et sont créés à l'aide de la notation utilisant des accolades.

Des modules complémentaires comme ``collections``^[[@py3doc, section 8.3] [https://docs.python.org/3/library/collections.html](https://docs.python.org/3/library/collections.html)] fournissent d'autres types de mise en correspondance.

[datamodelpython]: https://docs.python.org/3/reference/datamodel.html#the-standard-type-hierarchy

Définition par intension
---------------------------

Les itérables peuvent être définis pas intension, c'est-à-dire à partir d'une expression de type générateur dans le délimiteur adapté : ``{}`` pour les ``set``, ``[]`` pour les listes, par exemple. Les tuples peuvent également l'être, avec le créateur ``tuple()`` cependant.

Ces expressions sont construites sur le modèle ``<expr> for <variable> in <iterable>``, ``<variable>`` peut être utilisée dans l'expression ``<expr>``.

``` python
>>> {chr(c) for c in range(32,127,10)}
{'4', '>', '\\', 'R', '*', 'z', 'H', 'p', ' ', 'f'}
>>> [ord(c) for c in "abcdefgh"]
[97, 98, 99, 100, 101, 102, 103, 104]
```

On peut également ajouter un test sur les valeurs avec une clause ``if``.

``` python
>>> {chr(c) for c in range(32,127,5) if chr(c).isalpha()}
{'k', 'u', 'C', 'a', 'R', 'z', 'H', 'p', 'f', 'M', 'W'}
```

Pour définir des dictionnaires en intension, on utilise la syntaxe ``{cle:valeur for ...}``.

``` python
>>> names = ['King Arthur', 'Sir Lancelot', 'Patsy', 'Sir Robin',
    'Sir Bedevere', 'Sir Galahad']
>>> {name: len(name) for name in names}
{'Patsy': 5, 'Sir Robin': 9, 'Sir Galahad': 11, 'Sir Lancelot': 12,
'Sir Bedevere': 12, 'King Arthur': 11}
>>> {name: len(name) for name in names if ' ' in name}
{'Sir Galahad': 11, 'Sir Lancelot': 12, 'Sir Robin': 9,
'Sir Bedevere': 12, 'King Arthur': 11}
```

Il est même possible de combiner les itérations dans une intension.

``` python
>>> [a + b for a in "abc" for b in "123"]
['a1', 'a2', 'a3', 'b1', 'b2', 'b3', 'c1', 'c2', 'c3']
```

Cette notation est découragée pour une intension complexe, car elle nuit à la lisibilité. L'ordre des clauses ``for`` est également source d'erreurs, il est souvent plus sûr de construire les séquences par modifications successives. À titre de contre-exemple, la fonction du code suivant fonctionne, mai s elle est tout à fait illisible et incompréhensible, à cause de l'imbrication des listes en intension.

``` python
def tell(inst):
    print("{:>16}: {}\n".format(
          "instance",
          ", ".join(a for a in vars(inst)
                    if not a.startswith("__"))) +
        "".join(["{:>16}: {}\n".format(
            cls.__name__,
            ", ".join(sorted([a for a in vars(cls)
                             if not a.startswith("__")]))
                             ) for cls in type(inst).__mro__]) +
        "{:>16}: {}\n".format(
            type(type(inst)).__name__,
            ", ".join(a for a in vars(type(type(inst)))
                      if not a.startswith("__"))
            )
        )
```

\newpage


