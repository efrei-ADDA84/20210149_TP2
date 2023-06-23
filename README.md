# 20210149_TP4 (le TP4 est dans la branche TP4 de ce repository)

THEIVENDIRAN Thushanthy

NB : En raison d'un problème technique lié à mes token Git, je n'ai pas pu push correctement mon code sur le repository. J'ai du créer une branche à partir de code du TP2 et n'ai pas retirer ces fichiers polluants. Ils sont donc confondus avec mes fichiers du TP4.

Pour la réalisation du TP4, voici les étapes que j'ai suivi :

1. Création de 6 fichiers distincts :
   - data.tf : pour récupérer des informations sur un sous-réseau (azurerm_subnet) et un réseau virtuel (azurerm_virtual_network) dans Azure, puis les exposer via des  (output)
   - network.tf : pour déployer 4 ressources sur Azure et créer une adresse IP publique, une interface réseau, une paire de clés privée / publique, un fichier local contenant la clé publique SSH
   - outouputs.tf : qui contient les sorties récupérés à partir des ressources déployées
   - provider.tf : pour définir les fournisseurs (providers) requis par l'infrastructure Terraform
   - variables.tf : pour définir les différentes variables et ainsi veiller au respect des différentes contraintes
   - vm.tf : pour créer une ressource de machine virtuelle Linux dans Azure en utilisant le fournisseur AzureRM. 
     La configuration de ces fichiers prend en compte l'ensemble des contraintes énoncées.
    
3. Il faut ensuite exécuter les commandes suivante pour pouvoir créer une machine virtuelle sur Azure :
- az login : pour s'authentifier sur Azure
- terraform init : pour initialiser un nouveau répertoire de travail Terraform
- terraform plan : pour créer un plan d'exécution Terraform
- terraform apply : pour appliquer les changements décrits dans le plan Terraform. Cette commande exécute réellement les actions nécessaires pour créer, mettre à jour ou supprimer les ressources

La principale difficulté consistait à créer le bon type de bloc (data, resource, output...) et de spécifier correctement les variables et arguments à utiliser. 

J'ai également eu une erreur quant à l'utilistion de l'ID de souscription lors de l'exécution de la commande terraform apply : 
A resource with the ID "/subscriptions/765266c6-9a23-4638-af32-dd1e32613047/resourceGroups/ADDA84-CTP/providers/Microsoft.Network/publicIPAddresses/public-ip" already exists - to be managed via Terraform this resource needs to be imported into the State.
Afin de la résoudre, j'ai donc exécuter la commande suivante dans le Termial : 
terraform import azurerm_public_ip.tp4 /subscriptions/765266c6-9a23-4638-af32-dd1e32613047/resourceGroups/ADDA84-CTP/providers/Microsoft.Network/publicIPAddresses/public-ip

Concernant l'intérêt de l'utilisation de Terraform pour deployer des ressources sur le cloud plutôt que la CLI ou l'interface utilisateur, Terraform offre plusieurs avantages : 
- Terraform facilite la gestion, la collaboration et le contrôle des modifications de l'infrastructure étant donné que l'infrastructure est codée, versionnée et peut être traitée comme du code source
- Terraform permet d'automatiser le processus de déploiement et de gestion des ressources sur le cloud
- Egalement, Terraform gère les dépendances entre les ressources et suit l'état de l'infrastructure
