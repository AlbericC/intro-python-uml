[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/AlbericC/intro-python-uml/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

# Intro à python 3 et UML 2

Ce dépôt contient les sources (pandoc markdown) et le Makefile pour compiler un cours d'introduction à la programmation.

# Download

Le plus simple reste de passer par la page [releases](https://github.com/AlbericC/intro-python-uml/releases) pour télécharger la dernière version (au format pdf)

# Compilation des sources

Ça peut être utile de compiler soi-même le pdf, Pour tester une modification, introduire des infos supplémentaires, ou autre.

Il faut pour cela disposer de pandoc en mesure de générer un pdf, ainsi que graphviz.

Sur une dérivée Debian, il doit suffire de faire :

    $ sudo aptitude install texlive pandoc graphviz  # dépendance de compilation de pdf

Pour installer les sources.

Compiler le pdf se fait ensuite avec

    $ make

Éviter de commit des fichiers qui ne sont pas des sources ; penser à `make clean` avant de `git commit`

*J'utilise git-flow pour essayer de garder le log git sensé, merci de ne pousser que sur `develop`*




