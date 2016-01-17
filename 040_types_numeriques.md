Types numériques de python
==============================

NoneType, singleton de ``None``
---------------------------

`None` est la valeur de "rien". Cette valeur spéciale représente l'absence de valeur. C'est aussi la valeur que renvoie une fonction qui ne donne pas de résultat. Son type est `NoneType`.

`NoneType` ne contient que la valeur `None` : c'est un type qui n'admet qu'un individu, un singleton.


bool, type énuméré des valeurs logiques
---------------------------------------

La logique booléenne admet deux valeurs, "vrai" et "faux", souvent notées "1" et "0". Python les désigne sous les noms `True` et `False`.
Les opérateurs `or` et `and` correspondent aux opérations booléennes éponymes. `not` est la négation booléenne.
Le type `bool` de ces valeurs n'admet que celles-ci, on dit qu'il s'agit d'un type énuméré (cardinalité 2).

### Évaluation des valeurs en contexte booléen
Tout objet en python a une valeur équivalente booléenne, qui vaut pour les tests logiques (la documentation officielle parle de *boolean context*).

  -------------------------------------------------------------
            `False`             `True`
  ---------------------------- --------------------------------
       nombre égal à zéro        tout autre nombre

   Séquence ou conteneur vide    tout autre conteneur

  -------------------------------------------------------------


int, type des valeurs entières
------------------------------

Illimités en valeur, dans la limite de la mémoire disponible ($2^{31}$ ou $2^{64}$ dans d'autres langages).

 Opérateur    Opération
----------    ----------------------------------------------------------
``+``         addition
``-``         soustraction
``*``         multiplication
``/``         division
``//``        division en partie entière
``%``         modulo des nombres ou reste de la division euclidienne
``**``        puissance
``<<``        décalage bit-à-bit vers la gauche (le poids fort)
``>>``        décalage bit-à-bit vers la droite (le poids faible)

float, type de base pour tous les réels
---------------------------------------

Nombres 'à virgule flottante' réels, dans la limite de la précision de la machine. Admettent les opérations usuelles. (évidemment les opérations de décalage bit-à-bit ne sont pas disponibles).

complex, type des nombres complexes
-----------------------------------

Ils contiennent une part réelle `z.real` et une part imaginaire `z.imag`. Ils supportent les opérations usuelles. Souffrent des mêmes limites que les `float`.

![Hiérarchie des classes numériques telle que présentée par le module numbers. Integral et Number sont abstraites.](img/image-8.png)

![Hiérarchie des types de base dans l'implémentation de référence de python 3.5](img/image-9.png)

Autres modules proposant des types numériques
---------------------------------------------

De nombreux modules proposent des types numériques complémentaires, que ce soit pour des raisons de performances ([``numpy``](http://www.numpy.org/) par exemple, codé en C, utilise des types reprenant les contraintes de C), ou d'usage pratique. Le module ``Decimal`` est très utile pour éviter les erreurs de conversions en base 2.^[voir [@py3doc, section 9.4] à [https://docs.python.org/3/library/decimal.html](https://docs.python.org/3/library/decimal.html)]

Tous les modules de la librairie standard proposant des solutions pour le calcul numérique sont regroupés dans [@py3doc, section 9] ^[[https://docs.python.org/3/library/numeric.html](https://docs.python.org/3/library/numeric.html)]

Il n'est pas inclus dans la librairie standard de python, mais on peut noter également [``pint``](http://pint.readthedocs.org), très pratique pour gérer les grandeurs physiques, leurs conversions, etc.

\newpage
