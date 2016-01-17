Contrôle du flux d'exécution
============================

On parle de contrôle du flux d'exécution au sujet des possibilités d'exécuter certaines actions ou instructions sous conditions.

Choix avec `if`
---------------

Une clause `if` est suivie d'un bloc indenté, qui ne sera exécuté que si le test de la clause `if` évalue à `True`.

Une clause ``if`` peut être associée à une clause ``else`` à sa suite, qui est elle exécutée si la condition de la clause ``if`` évalue à  ``False`` en contexte booléen.

Entre ces deux clauses peuvent se trouver autant de clauses ``elif`` que nécessaire. Chacune de ces clause est exclusive avec les autres et la clause ``if``: ``elif`` est un raccourci d'écriture pour "``else if``. La forme générale est donc celle présentée dans l'exemple suivant :

``` python
if x < 0:
    x = 0
    print('Negative changed to zero')
elif x == 0:
    print('Zero')
elif x == 1:
    print('Single')
else:
    print('More')
```

La possibilité d'utiliser ``if``--``elif``--``else`` fait qu'il n'y a pas de structure syntaxique du type de ``switch / case`` en python^[Cette structure existe dans d'autres langages, voir par exemple [https://en.wikipedia.org/wiki/Switch_statement](https://en.wikipedia.org/wiki/Switch_statement)].

Répétition avec `while`
-----------------------

La clause `while` est assortie d'un test. Celui-ci est vérifié à chaque début d'itération, les instructions de la boucle `while` sont exécutées si ce test évalue à `True`. Une boucle ouverte par une ligne `while True:` est donc exécutée indéfiniment (à moins d'une instruction `break`).

L'exemple suivant affiche les éléments de la suite de Fibonacci et s'interrompt ***avant*** la première valeur supérieure ou égale à 10.

``` python
# Fibonacci series:
# the sum of two elements defines the next
a, b = 0, 1
while b < 10:
    print(b)
    a, b = b, a+b
```

Répétition avec "for"
---------------------

Une boucle `for` est exécutée pour chaque élément du "conteneur" passé à la clause `for`. Cet objet ne doit pas être modifié durant la boucle.

Les deux constructions du code suivant sont équivalentes :

~~~ python
# version utilisant `for`
conteneur = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
for i in conteneur:
    print(i)

# version utilisant while
conteneur = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
idx = 0
while idx < len(conteneur):
    i = conteneur[idx]
    idx = idx + 1
    print(i)
~~~

La version utilisant ``for`` est plus lisible, ne crée pas autant de risque d'erreur (oubli de la ligne incrémentant ``idx`` par exemple), et ne crée pas de variables inutiles (seule ``i`` est créée par la boucle), elle est donc préférable dans tous les cas où elle peut être utilisée.

Contrôle fin sur le flux d'exécution : `break`, `continue`
----------------------------------------------------------

Deux instructions permettent de perturber le déroulement d'une boucle `for` ou `while`.

``break``
:   : l'exécution de l'instruction ``break`` interrompt la boucle qui l'englobe, et seulement la boucle la plus réduite. ``break`` fonctionne sur les boucles ``while`` et ``for`` indifférement.

``` python
# chercher un élément (exemple)
for i in conteneur:
    if i % 9 == 0:
        print('un multiple de neuf est dans cette liste')
        break
```

``continue``
:   : l'instruction ``continue`` impose à la boucle de passer à l'itération suivante. Comme ``break``, cette instruction n'influe que sur la boucle la plus réduite qui la contient.

``` python
# afficher les nombres pairs
for i in range(20):
    if i % 2 :
        continue
    print(i)
```

L'exemple qui suit montre une utilisation possible de ces deux instructions sur des boucles imbriquées :

``` python
# `break` et `continue` sur deux boucles imbriquées
for n in range(3,20):
    for i in range(2,n):
        if n % i == 0:
            break  # stopper la boucle for
    if i < n - 1:
        # multiple trouvé
        print(n,"n'est pas premier (",i,')')
        continue  # passer au n suivant
    # aucun multiple trouvé
    print(n,"est premier")
```

Clause `else` appliquée aux boucles
-----------------------------------

Une clause `else` peut être ajoutée aux boucles `for` ou `while`. Les instructions du bloc `else` seront dans ce cas exécutées si et seulement si la boucle a pris fin normalement. L'exemple qui suit est une alternative plus lisible au bloc précédent :

``` python
# `else` appliqué à la boucle `for`
for n in range(3,20):
    for i in range(2,n):
        if n % i == 0:
            print(n,"n'est pas premier (",i,')')
            break  # stopper la boucle for
    else:
        print(n, "est premier")
```

\newpage
