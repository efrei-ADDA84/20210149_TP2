# 20210149_TP2

THEIVENDIRAN Thushanthy

Pour la réalisation du TP2, voici les étapes que j'ai suivi :

1. Création d'un repository sur Docker Hub : tp2

2. Configuration d'un workflow Github Action de façon à build et push l'image sur Docker Hub à chaque nouveau commit Git. Pour cette étape-ci, je me suis aidé de la documentation Docker Hub et ai spécié que le tag à utiliser est le tag thushanthy/tp2:latest

3. Transformation du wrapper précédemment créé en API. Pour cela j'ai réutilisé le code Python du TP1 et l'ai adapté : le fichier api.py contient le code, qui à partir d'une longitude et une latitude spécifiée dans l'URL, récupère la variable d'environnement API_KEY et renvoie, sur une page web, le résultat de la requête sous format JSON. J'ai pour cela, utilisé les bibliothèques os et requests de Python, mais également le package Flask. Celui-ci permet de récupérer les arguments spécifiés dans l'URL (longitude et latitude) et de renvoyer un élément JSON sur une page web.

4. Création d'un répertoire avec un DockerFile comme pour le TP1. Seulement, pour ce TP là on précise que l'on souhaite également installer la bibliothèque flask. Cette fois-ci, j'ai également préciser les versions des packages que je souhaitais.

5. On vérifie que l'action rajouté au workflow fonctionne correctement avec les commandes "git add -A", "git commit -m "message"" et "git push". Chacune des actions est bien répertorié sur Git.

La principale difficulté à laquelle j'ai fait face dans ce TP, c'est l'utilisation des ports et des hosts. Etant donné que je n'avais pas construits de "bridge" je ne pouvais pas faire simultanément de test en local et sur ma machine virtuelle. J'avais également une erreur dans mon URL, ce qui me renvoyait sur une page avec l'erreur "internal server error".
