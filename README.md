# 20210149_TP3

THEIVENDIRAN Thushanthy

(Attention : le code se trouve dans la branche TP3 du dépôt 20210149_TP2)

Pour la réalisation de ce TP3 : 

  1. J'ai tout d'abord repris le code fonctionnel du TP2 qui renvoie la météo en spécifiant la longitude et la latitude dans l'URL, avec, pour variable d'environnement, l'API Key
 
  2. J'ai ensuite modifié le code du fichier docker-image.yml pour inclure la création et l'utilisation d'une instance de conteneur sur Azure. 
  
  Pour cela, j'ai utilisé les variables secrètes crées au niveau de l'organisation. Le code suivant permet de s'authentifier sur Azure :
          - name: 'Login via Azure CLI'
          uses: azure/login@v1
          with:
            creds: ${{ secrets.AZURE_CREDENTIALS }}
   
   On spécifie ensuite, à l'aide du code suivant, qu'à chaque push sur Git, on souhaite accéder au registre de conteneur efreidevops et faire un docker build et push sur l'instance associé à notre numéro etudiant 
             - name: 'Build and push image'
          uses: azure/docker-login@v1
          with:
            login-server: ${{ secrets.REGISTRY_LOGIN_SERVER }}
            username: ${{ secrets.REGISTRY_USERNAME }}
            password: ${{ secrets.REGISTRY_PASSWORD }}
        - run: |
            docker build . -t ${{ secrets.REGISTRY_LOGIN_SERVER}}/20210149:${{ github.sha }}
            docker push ${{ secrets.REGISTRY_LOGIN_SERVER}}/20210149:${{ github.sha }}
    
 Le code suivant, lui, permet de déployer une instance de Conteneur Azure, en précisant les différentes contraintes à respecter :

   - name: 'Deploy to Azure Container Instances'
    uses: 'azure/aci-deploy@v1'
    with:
      resource-group: ${{ secrets.RESOURCE_GROUP }}
      dns-name-label: devops-20210149
      image: ${{ secrets.REGISTRY_LOGIN_SERVER }}/20210149:${{ github.sha }}
      registry-login-server: ${{ secrets.REGISTRY_LOGIN_SERVER }}
      registry-username: ${{ secrets.REGISTRY_USERNAME }}
      registry-password: ${{ secrets.REGISTRY_PASSWORD }}
      name: 20210149
      location: 'france south'
     
  3. Une fois la base du fichier .yml créé, il a fallu prendre en considération la cohérence dans l'utilisation des ports pour pouvoir exécuter le curl sans erreur. Il a alors fallu consulter sur Azure le port associé à mon instance de conteneur pour spécifier le même dans le fichier api.py et le fichier docker-image.yml. Dans mon cas c'était le port 80.
  
  4. Ensuite, après un premier essai avec l'API Key entrée en dur dans le code Python, j'ai voulu stocker cette clé dans Git en tant que variable secrète. Le code suivant permet d'utiliser la variable ainsi créée en tant que variable d'environnement lors de l'exécution du code: 
    secure-environment-variables: API_KEY=${{ secrets.API_KEY }}

Il a également fallu penser à changer la localisation (france south) dans la commande curl à exécuter pour obtenir la réponse à la requête.

Les prinicipales difficultées rencontrées lors de ce TP étaient donc les suivantes : 
- la cohérence des ports à utiliser
- la création d'une varibale d'environnement à partir d'une variable secrète stockée sur Git

L'intérêt principal de l'utilisation d'Azure réside dans le fait que, une fois l'instance de conteneur déployée, la commande curl peut être exécutée à tout moment, par n'importe qui (disposant des accès), même si le pc du développeur est éteint. Le service, lui, continue à tourner.
