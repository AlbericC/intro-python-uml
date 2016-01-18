Conseils au jeune programmeur
=============================

Cette dernière section regroupe des conseils à l'attention de ceux qui, pris d'un goût pour la programmation à travers Python, voudraient aller plus loin.

Comme pour une langue étrangère, la maîtrise d'un langage de programmation se base sur une maîtrise des idiomes, et du vocabulaires. Les idiomes d'une langue correspondent aux constructions et au style d'un langage, alors que le vocabulaire est représenté par la librairie standard, et les modules qu'elle contient.

Il faut bien noter que programmer est un savoir-faire qui s'entretient. N'hésitez pas à l'exercer, c'est la meilleure voie vers le progrès. En revenant à un programme, plus tard, vous mesurerez vos progrès.

On peut presque tout automatiser en programmant : décidez d'une tâche (simple et répétitive) que vous voulez faire executer par un programme, et en avant ! Le téléchargement de tous les articles de votre quotidien, le filtrage de votre page facebook ou twitter, le tri d'un grand nombre de valeurs à partir d'une ligne de commande, sont des petits projets, parfois difficile mais formateurs. La suppression et le nettoyage de fichiers inutiles est également un problème amusant, qu'on peut résoudre en utilisant un *hash*, par exemple SHA-1^[Voici un excellent prétexte pour aller chercher dans les docs de python et Wikipedia en parallèle].

C'est aussi une bonne idée d'entretenir sa culture de l'informatique (ou de s'en faire une). Passer de temps en temps consulter un blog de programmeurs[^sametmax], un magazine spécialisé, ou apprendre sur les systèmes POSIX (que n'importe quel amateur de programmation a sous la main).

[^sametmax]: presque uniquement python, <http://sametmax.com>

Passez du temps sur les documentations des outils que vous choisissez: dans le domaine de l'informatique, l'outil est bien moins important que le mode d'emploi. Cherchez par exemple dans les documentations de python le rôle des méthodes dites "magiques" comme ``__mul__``, ``__rdiv__``, etc. Si vous êtes en voie de tester ou vous convertir à un système POSIX, les pages de manuel (``man``) sont une mine d'information, pas très lisible mais incroyablement dense.

Modules utiles pour débuter
---------------------------

### Packages dans la librairie standard

Quand la logique semble longue à écrire, ou même à décrire, c'est souvent que le problème que vous cherchez à résoudre est trop vaste. Pour la plupart des autres cas, la librairie standard contient une variété de modules et packages pour des situations que vous ne serez sans doute pas les premiers à rencontrer.

Voici quelques packages inclus avec toutes les distributions de python, et qui sont soit très utiles, soit représentatifs de ce qu'on peut trouver dans la librairie standard.

Package `csv`:
:   pour lire et écrire des fichier CSV (Comma Separated Values) notamment ceux que les tableurs peuvent utiliser.

Package `functools`:
:   outils pour manipuler, ou modifier des fonctions. Excellent point de départ pour passer un moment à découvrir les documentations, et mine d'or pour simplifier et accélerer du code.

Package `itertools`:
:   la contrepartie à `functools` mais pour les itérateurs et les itérations. Comme `functools`, c'est un excellent point de départ pour découvrir la documentation.

Package `collections`:
:   ce package fournit des structures de données légères, qui permettent de clarifier le flux de code. `collections.namedtuple` en particulier, est remarquable.

Package `sys`:
:   permet d'accéder aux informations et fonctionnalités du "système". Attention toutefois, cette expression est à comprendre au sens "le système python"...

Package `os`:
:   toutes les fonctions au niveau du système hôte (Windows, Linux, MacOS) sont accessibles à travers ce package et ses sous-packages. Avantage notable: la portabilité est simplifiée, la plupart des instruction de `os` sont en effet traduites pour avoir un effet semblable sur les différents systèmes.

Package `json`:
:   pour stocker des données sur le disque, il faut bien les écrire sous la forme de fichiers. Python propose en natif `pickle` qui est déconseillé[^pickle]. Plus portable et lisible les formats YAML et JSON sont plsu adaptés. JSON est fourni par la librairie standard.

Package `copy`:
:   fournit `copy` et `deepcopy`, qui peremettent de créer des copies d'objets mutable (*e.g.* listes) qui ne s'influencent pas mutuellement.

Package `time`, `datetime`:
:   outils de mesure (`time`) ou de représentation (`datetime`) du temps.

Package `cProfile`:
:   module de profilage. Pas simple à lire, il fournit par contre une bonne porte d'entrée pour comprendre ce qui ralentit un traitement. Il faut lire la documentation de ce module calmement, et ne pas oublier que python n'est pas construit pour être un langage hautes performances...

Package `re`:
:   pour "*regular expressions*". Les expressions régulières sont probablement l'outil le plus puissant pour traiter les chaînes de caractères. Leur utilisation demande par contre une certaine concentration, car le principe ni la syntaxe ne sont simples.

...et bien d'autres qu'il vous faudra découvrir par vous-même.

[^pickle]: Par l'auteur de ce document. D'autres le conseillent, avec des réserves. Les raisons et situations où `pickle` est adapté sont assez spécifiques, la façon la plus sûre de l'utiliser est encore de l'éviter.


### Packages externes sur PyPI

Package `camel` (pour YAML):
:   dépassant les limites de JSON, camel propose une interface simple et efficace pour sérialiser les données avec YAML.

Package `pint` (grandeurs physiques):
:   que ce soit pour des calculs simulatoires ou simplement pour faciliter les conversions, pint est très puissant et pratique. Attention pour les débutants, il emploie un *design pattern* dans son code avec un objet parent `UnitRegistery`, ce qui peut surprendre au début.

Package `begins` (ligne de commande):
:   begins facilite la construction de programmes appellables depuis la ligne de commande (le terminal). Surtout si vous utilisez un système POSIX, c'est extrêmement pratique.

Package `flake8`:
:   inspecteur de code, aide à rendre votre code plus lisible et à corriger certaines erreurs.

Style de programmation
----------------------

### *The Zen of Python by Tim Peters*^[`import this`]

Au cours de votre parcours avec python (et peut-être avec d'autres langages), je vous conseille de revenir prendre un peu de recul sur ce texte, qui résume la philosophie du code python. Vous constaterez sans doute qu'avec le temps et la pratique, vous y trouverez de plus en plus de sens.

> Beautiful is better than ugly.\
> Explicit is better than implicit.\
> Simple is better than complex.\
> Complex is better than complicated.\
> Flat is better than nested.\
> Sparse is better than dense.\
> Readability counts.\
> Special cases aren't special enough to break the rules.\
> Although practicality beats purity.\
> Errors should never pass silently.\
> Unless explicitly silenced.\
> In the face of ambiguity, refuse the temptation to guess.\
> There should be one-- and preferably only one --obvious way to do it.\
> Although that way may not be obvious at first unless you're Dutch.\
> Now is better than never.\
> Although never is often better than *right* now.\
> If the implementation is hard to explain, it's a bad idea.\
> If the implementation is easy to explain, it may be a good idea.\
> Namespaces are one honking great idea -- let's do more of those!

### Documentation du code

> “Always code as if the guy who ends up maintaining your code will be a violent psychopath who knows where you live.”
>
> \hfill Martin Golding

Martin Golding ne parle pas au hasard : ce "*guy*" sera probablement vous, quelques mois ou années dans le futur. L'expérience montre que bien souvent, les codes écrits sans considération pour le futur lecteur ou le mainteneur causent une frustration extrême, et souvent à terme, leur abandon. À titre d'illustration, j'ai récemment relu un de mes codes anciens où le commentaire suivant se trouvait: `# Dear future self, sorry. I wrote this yesterday and it seems to work, yet I don't known why. You'll have to recode all this.`

Respectez les conventions de commentaire, incluez des docstrings, vous réduirez votre effort futur pour l'entretien de votre projet.

### PEP 008, la convention de style de code python
[La PEP^[**P**ython **E**nhancement **P**roposal]n°8](http://www.python.org/dev/peps/pep-0008/) est la convention *de facto* de style, qui donne des conseils pour garder le code lisible à l'œil humain.
Les points essentiels de cette convention sont les suivants :

Convention de nommage
:   La casse des caractères doit assister la compréhension : on utilise donc la `CASSE MAJUSCULE` pour les constantes et les paramètres qui ne sont pas appelés à varier, la `CasseMixte`^[ou "CamelCase"], c'est-à-dire les mots capitalisés et joints, pour les noms de classes, la `casse_basse_avec_des_underscores`^[dite aussi "snake_case"] pour les noms de variables et autres. Les noms de variables très courts sont peu explicites, il est recommandé de les reserver aux usages très locaux, comme les variables de boucle, les indices, etc.

Indentation
:   On utilise 4 espaces pour indenter, et on évite d'utiliser les tabulations.

Espacement
:   Le code gagne en lisibilité quand les espacements sont bien utilisés : la PEP 8 recommande donc de laisser **2 lignes vides entre les fonctions et classes de haut niveau**, mais également **1 ligne blanche entre les sous fonctions ou entre les méthodes de classes**. On utilise églement l'espacement pour mettre en valeur la logique des opérations, en laissant un espace de chaque côté des opérateurs, sauf si grouper des termes facilite la compréhension d'une expressions.
    De la même façon, les virgules, points-virgules, et deux-points sont suivis d'un espace.

Commentaires
:   Les commentaires pythons commencent toujours avec un `#`. Quand un commentaire apparaît en fin de ligne, il convient de placer 2 espaces avant ce `#` et un espace après lui.

Docstrings
:   Les docstrings sont toujours délimitées par des tripes guillemets doubles (`"""Texte de Documentation"""`). Cela permet de les reconnaître des chaînes de caractères qui seraient présentes ailleurs dans le code pour les besoins du traitmeent lui-même.

Longueur des lignes
:   C'est le point sur lequel la PEP8 est la plus critiquable : elle recommande en effet de limiter la longueur des lignes à 79 caractères, ce qui est souvent très contraignant. Cette recommandation qui vise à permettre d'éditer du code même sur de très petits terminaux est souvent outrepassée, mais on considère qu'il faut éviter les lignes trop longues. Les guides de style recommandent généralement de rester sous les 100 caractères par ligne (blancs compris).

En définitive, toutes les conventions de la PEP8 et une vérification de la syntaxe sont fournis par Flake8, un outil que la plupart des projets à l'heure actuelle considèrent comme la façon la plus simple et sûre de garantir une qualité minimum du code.

### Répartition en modules

Cela dépasse le cadre de ce document, mais il est possible de regrouper des portions de code en "modules" et "packages". Le premier est excessivement simple, le second demande un peu de recherche dans les documentations officielles de python, ou sur Internet.

Liens pour se documenter
------------------------

Eevee
:   [Eevee](http://eev.ee/) (anglais) est un développeur expert sur plusieurs langages. Si l'univers et la sensibilité de Eevee sont déconcertantes, les contributions qu'il fournit à l'écosystème python sont remarquables, notamment [camel](http://eev.ee/blog/2015/10/15/dont-use-pickle-use-camel/), et les explications et regards qu'il donne sur l'informatique sont riches de recul. On peut en particulier consulter son article ["Next steps for beginning programmers"](http://eev.ee/blog/2015/10/10/next-steps-for-beginning-programmers/) qui donne quelques pistes pour se faire une culture de programmeur.


Sam & Max
:   [Sam & Max](http://sametmax.com/) sont deux développeurs anonymes spécialisés en python, qui ont décidé de tenir une veille technique sur python, de partager leur savoirs et savoirs-faire, en les vulgarisant raisonnablement.[Leur résumé de la PEP8 est particulièrement utile](http://sametmax.com/le-pep8-en-resume/). **Attention** le sous-titre de ce blog est "Du code, du cul", et il contient ***systématiquement*** des images explicites dans tous les articles. Il n'est pas conseillé de le consulter au travail ! (les raisons de ce choix sont présentées sur [une page du site](http://sametmax.com/pouvez-vous-separer-le-cul-de-la-programmation-svp/))

Les documentatiosn officielles
:   [La documentation officielle python](https://docs.python.org/3/) reste dans l'immense majorité des cas la première et la meilleure source d'informations pour se dépanner.

Les conférences de Raymond Hettinger
:   [Raymond Hettinger](https://www.youtube.com/results?search_query=raymond%20hettinger%20class%20python) est un des contributeurs au langage python lui-même, et est à l'origine de plusieurs des améliorations qui ont conduit à python 3. En marge de son activité de consultant programmeur, il donne des conférences de grande qualité sur des fondamentaux du langage.

Informations à éviter
---------------------

Comme Internet est parfois peu fiable, quelques sites sont notoirement une mauvaise source d'information pour se documenter au sujet de python.

*   Le site / livre "Learn Python The Hard Way" (parfois référencé LPTHW) est hors d'âge, et mal construit. Tout conseil s'appuyant sur ce livre est à prendre avec *beaucoup* de prudence.
*   StackOverflow est un site d'entraide sur les sujets informatiques. La communauté python de ce site est issue d'autres langages, et ne propose pratiquement jamais de solutions "pythonesques" mais des transpositions de constructions courantes dans d'autres langages. Ces solutions sont toujours médiocres, il faut y préférer les solutions natives de python.
