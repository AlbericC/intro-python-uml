Définition de classes avec python 3
===================================

Bases
-----

Python permet de définir des classes avec la syntaxe suivante :

``` python
class Eleve():
    pass

eleve1 = Eleve()
```

Ce qui se produit à l'exécution de ce code est déjà assez subtil et mérite d'être éclairci. La directive ``class`` déclare une nouvelle classe, ``Eleve``, à la façon d'une fonction. Elle n'*hérite* d'aucune autre classe^[en termes UML2, elle n'est pas une *spécialisation* d'une autre classe.]. Python en fait donc une classe spécialisée d'``object``, le type le plus vaste de python.]

Il n'y a aucune instruction dans cette classe (``pass`` ne sert qu'à éviter une erreur de syntaxe si la classe était vide), elle n'ajoute donc rien à ``object``. La dernière ligne appelle cette classe, comme une fonction, pour créer une instance de cette classe, ``eleve1``.

À ce point, il est possible d'ajouter des attributs à ``eleve1``^[La classe ``Eleve`` n'ayant aucun intérêt pour le moment, nous aurions pu nous contenter de ``eleve1 == object()``] :

``` python
eleve1.nom = "Nom de Famille"
eleve1.prenom = "Prénom"
# etc.
```
Bien entendu, l'intérêt d'une classe est de définir les attributs de ses instances une seule fois, et non de déclarer les individus un à un ! Cela se fait avec une méthode de classe appelée *initializer* qui se nomme toujours ``__init__`` en python. Cette fonction particulière accepte toujours des arguments, le premier est nommé *self* et désigne l'instance qui est créée. Nous pouvons raffiner l'exemple précédent :

``` python
class Eleve():

    def __init__(self, nom, prenom):
        self.nom = nom
        self.prenom = prenom
        self.notes = []


eleve1 = Eleve("Nomdefamille", "Prénom")
```

En pratique, à chaque fois que le programme rencontrera `Eleve()`, il créera une instance, et immédiatement ensuite il appelle `instance.__init__()`. Si `__init__` admet des arguments, ils doivent être passés à la classe à la création de l'instance, comme dans le *snippet* de code précédent.

De la même façon que ``__init__``, des fonctions peuvent être déclarées dans le corps de la classe. Il s'agit de méthodes d'instance, qui reçoivent toujours *self* et peuvent agir sur l'instance comme ``__init__`` le fait.

``` python
class Eleve():

    def __init__(self, nom, prenom):
        self.nom = nom
        self.prenom = prenom
        self.notes = []

    def evaluer(self, note):
        """ajouter cette note aux évaluations de l'élève"""
        self.notes.append(note)  #ajouter cette note en fin de liste


eleve1 = Eleve("Nomdefamille", "Prénom")
eleve1.evaluer(12)
eleve1.evaluer(15)

print(eleve1.notes)
```

On peut définir des classes aussi riches de méthodes d'instances que l'on veut, mais pour gagner en fonctionnalités, on peut utiliser les *propriétés d'instances*, qui correspondent aux *propriétés dérivées* d'UML 2. Pour ce cas simplifié, ajoutons la moyenne à la classe.

``` python
# classe Eleve définie avec une méthode `moyenne()`
class Eleve():

    def __init__(self, nom, prenom):
        self.nom = nom
        self.prenom = prenom
        self.notes = []

    def evaluer(self, note):
        """ajouter cette note aux évaluations de l'élève"""
        self.notes.append(note)  #ajouter cette note en fin de liste

    def moyenne(self):
        """calcule la moyenne de cet élève"""
        if self.notes:
            return sum(self.notes)/len(self.notes)
        else:
            return None

eleve1 = Eleve("AutreNom","AutrePrénom")
eleve1.evaluer(13)
eleve1.evaluer(16)
print(eleve1.moyenne())
```

``` python
# classe Eleve définie avec une propriété dérivée `moyenne`
class Eleve():

    def __init__(self, nom, prenom):
        self.nom = nom
        self.prenom = prenom
        self.notes = []

    def evaluer(self, note):
        """ajouter cette note aux évaluations de l'élève"""
        self.notes.append(note)  #ajouter cette note en fin de liste

    @property
    def moyenne(self):
        """calcule la moyenne de cet élève"""
        if notes:
            return sum(self.notes)/len(self.notes)
        else:
            return None

eleve1 = Eleve("AutreNom","AutrePrénom")
eleve1.evaluer(13)
eleve1.evaluer(16)
print(eleve1.moyenne)
eleve1.evaluer(17)
print(eleve1.moyenne)
```

L'intérêt de cette technique est d'alléger l'écriture, et de garantir que l'attribut dérivé (ici ``moyenne``) sera mis à jour sans autre démarche pour l'utilisateur de la classe.^[il n'y a pas de mise à jour de la moyenne avec une fonction "*update_moyenne*" par exemple]

Une classe `Student` utilisable
-------------------------------

~~~ python
class Student():
    """Class for registering a student"""

    def __init__(self, nom, prenom):
        self.nom = nom
        self.prenom = prenom
        self.notes = []

    def evaluer(self, note):
        """ajouter cette note aux évaluations de l'élève"""
        self.notes.append(note)  # ajouter cette note en fin de liste

    @property
    def moyenne(self):
        """calcule la moyenne de cet élève"""
        if self.notes:
            return sum(self.notes) / len(self.notes)
        else:
            return None

    def __str__(self):
        """MAGIC METHOD : utilisée pour formatter l'objet avec str"""
        return "{s.prenom} {s.nom} : {s.moyenne}".format(s=self)

# fin de la classe, on est revenu au niveau haut  du script
students = """Arthur Pendragon
Sir Lancelot"""

students = [Student(ligne.split()[1], ligne.split()[0])
            for ligne in students.splitlines()]

# outputs
print("initial state")
print("\n".join(map(str, students)))
print('\n')

print("adding marks")
students[0].evaluer(12)
students[1].evaluer(17)
print("with marks")
print("\n".join(map(str, students)))
print('\n')

print("adding a student")
brian = Student("", "Brian")
students.append(brian)
print("\n".join(map(str, students)))
print('\n')

print('update to `brian` variable')
brian.evaluer(3)
print("\n".join(map(str, students)))
print('\n')
~~~

\newpage


