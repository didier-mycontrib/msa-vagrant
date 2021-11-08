* Le plugin jwt de kong sert à générer et vérifier des jetons jwt (mais à priori sans communication avec serveur oauth2)
* Le plugin oauth2 de kong sert à gérer une authentification oauth2 de manière semi-autonome 
  (il faut quelquefois/souvent coder un "authorisation serveur simplifié qui communique avec kong oauth2" )
* Le plugin tierce partie open source jwt-keycloak (https://github.com/gbbirkisson/kong-plugin-jwt-keycloak) 
sert à vérifier un jeton via une communication avec  keycloack mais n'est plus officiellement maintenu depuis 2019
* Le plugin oidc de kong (à installer en plus) gère un flow OIDC complet avec redirections et cookies
--------------------
De manière à limiter au mieux l'empreinte carbonne/cpu/resource , 
on aimerait utiliser le plugin oauth2 de kong sans keycloak et keycloak n'aurait alors pas besoin d'être systématiquement démarré.
Ceci dit le plugin oauth2 de kong n'est intéressant que via l'ajout d'un mini serveur d'authorisation à coder (avec base et bcrypt):
on configure dans le plugin kong/oauth2 un speudo_user générique puis on lui associe un username/password authentifié par une appli à écrire 
(un peu à la manière de hydra) . et HEUREUSEMENT (à la fin du flow) injection de propriete (uerserid , scope) dans entete http envoyée vers upstream
(ex: X-Consumer-Username , X-Authenticated-Scope , ...)
