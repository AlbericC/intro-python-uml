Premiers pas de programmation fonctionnelle
===========================================

La programmation fonctionnelle est un style de programmation qui utilise uniquement des fonctions et leurs valeurs de retour pour remplir son objectif.

Ce style s'oppose aux styles "procédural" et "orienté objet". Le style procédural consiste en un simple enchaînement d'actions, et le style orienté objet s'appuie sur des classes et des instances pour héberger le code.

Définir une fonction
-----------------------

Une fonction est créée en python grâce à la clause ``def``. Celle-ci donne son nom à la fonction et définit sa signature.

``` python
# exemple simpliste de fonction
def au_carre(x):
    """renvoie le carré de x"""
    return x**2
```

``` python
# exemple réaliste de fonction
def c(x):
    """ returns the minimal coins set
    to get the given amount in euros"""
    coins = (50000, 20000, 10000, 5000, 2000, 1000,
             500, 200, 100, 50, 20, 10, 5, 2, 1)
    resul = []
    remain = int(x * 100)
    for co in coins:
        while co <= remain:
            resul.append(co)
            remain -= co
            if remain == 0:
                break
    return [str(r) + '¢' if r % 100 else str(r // 100) + '€'
            for r in resul]
```

La clause ``return`` interrompt l'exécution d'une fonction et définit la valeur qu'elle renvoie.

Signature d'une fonction
---------------------------

La signature d'une fonction est la définition résumée de l'action de cette fonction. On y trouve les noms des arguments, et le cas échéant le type des valeurs renvoyées. Depuis python 3, les annotations de fonction permettent de donner ces informations de façon claire.^[voir [@py3doc][https://docs.python.org/3/library/typing.html](https://docs.python.org/3/library/typing.html)]

``` python
def xml_prop_from_rdf_uri(node_uri: str, g: rdflib.Graph) -> namedtuple:
    """Given an uri an a graph,
    gives out the tag and uid of its corresponding xml node"""
    uri = rdflib.URIRef
    t, u = g.resource(uri(node_uri)).identifier.toPython().split('#')
    return tu(t, u)
```
Dans l'exemple ci-dessus, la fonction définie attend une chaîne de caractère et un Graphe et retourne un ``namedtuple`` (objet fourni par le module collections)

De façon analogue, l'exemple suivant définit un test applicable à 2 entiers, dont le résultat est un booléen.

``` python
def isAnagram(a: int, b: int) -> bool:
    """tells whether a and b are anagrams of each other."""
    # used in pb 52
    digitsA = [int(c) for c in str(a)]
    digitsB = [int(c) for c in str(b)]
    if len(digitsA) != len(digitsB):
        return False
    for n in digitsA:
        if n not in digitsB:
            return False
        else:
            digitsB.remove(n)
    if len(digitsB):
        return False
    return True
```

La chaîne de caractères entre triple guillemets est appelée une *docstring* et sert (comme son appellation l'indique) à documenter la fonction. Le code suivant montre un exemple de fonction complètement documentée^[On remarquera que les annotations ne sont pas utilisées, la *docstring* donnant toute l'information utile.]:

``` python
def sum_multiples(n, factors):
    """Sum of multiples of ``factors`` up to ``n``

    Args:
        n (int): the upper limit
        factors (Iterable): a collection of factors
    Returns:
        int: sum of numbers below ``n`` that are multiples
            of numbers in ``factors``
    """
    facts = set(factors)  # unicity / generators

    def is_multiple(k):
        """bool: True if k is a multiple of any n in ``facts``
        """
        return any(k % i == 0 for i in facts)

    return sum(k for k in range(n + 1) if is_multiple(k))
```

Le détail des styles recommandés pour les *docstrings* sont disponibles sur les sites donnés en références dans ce document[@googledocstring, @numpydocstring].

\newpage

Fonctions remarquables
=======================

Un certain nombre de constructions de fonctions sont intéressantes. Nous en détaillons deux cas ici, l'un est une particularité de construction permise dans tous les langages, l'autre est spécifique à python.

Fonctions récursives
--------------------

Pratiquement tous les langages de programmation permettent d'appeler une fonction à partir d'elle-même. Une fonction présentant cette construction est une *fonction récursive*. Cette construction est encouragée dans de nombreux langages compilés, car elle peut être optimisée (surtout si la récursion est la dernière instruction, on parle alors de *tail recursion*). En python par contre, rien n'est prévu dans l'implémentation standard pour optimiser les fonctions définies par récursion, il est plus intéressant de définir une fonction itérative quand c'est possible.

L'exemple suivant propose les deux implémentations pour la fonction factorielle ( $fact(n)=\prod_{k=1}^{n}k$ ) :

``` python
# factorielle (recursive)
def fact(n):
    """Factorial
    Returns n!
    """
    if n in {0, 1}:
        return 1
    else:
        return fact(n - 1) * n

# factorielle (iterative)
def fact(n):
    """Factorial
    Returns n!
    """
    prod = 1
    for k in range(1, n+1):
        prod *= k  # equiv prod = prod * k
    return prod
```



Générateurs : `yield`
---------------------

Un générateur en python est une fonction particulière, qui utilise le mot-clé `yield` en lieu et place de `return`. Typiquement associé à un processus itératif, le générateur va renvoyer des objets (pas seulement des nombres) un à un, la `def` qui l'abrite conserve son état entre les renvois de valeurs. On peut itérer sur un générateur, mais on ne peut pas utiliser d'indices ni de *slices*. Il est prudent de prévoir une condition d'arrêt dans les générateurs, pour éviter les boucles infinies, mais ce n'est pas obligatoire.

``` python
# générateur de nombres pairs
def evens(min=0, max=None):
    i = min
    while (max == None) or (i < max) :
        yield i
        i += 2

print(list(evens(max=20)))
```

Les générateurs ont de nombreux avantages : ils sont peu coûteux en mémoire, puisque une valeur est générée à la fois, ils sont rapides, et peuvent s'enchaîner : un générateur peut sans problème être construit sur l'itération dans un autre. Par ailleurs, ils permettent d'injecter de la logique relativement complexe dans la construction d'un objet itérable, comme l'illustre l'exemple ci-dessous :


``` python
def is_prime(n):
    """test for prime numbers
    returns True is n has only 1 and itself as divisors"""
    for maybe_divisor in range(2, 1 + int(n ** 0.5)):
        if n % maybe_divisor == 0:
            return False
    else:  # no divisor found
        # loop not broken by `return`
        return True

def primes(min=2, max=None):
    """primes generator

    Args:
        min (int): lower value
        max (int): upper limit

    Yields:
        int: prime number

    Examples:
        >>> for number in primes(max=100):
        ...     print(number, end=' ')
    """
    p = min
    while (max == None) or (p < max):
        if is_prime(p):
            yield p
        p += 1
```



\newpage


