Les répertoires resa-app , xy-app , sont des clones des applications angular (via jenkins , checkout scm)
avec (en v1) , un répertoire dist déjà ok .

-----
copies automatiques de xy-app/dist/xy-app
dans frontends-content/xy-app
-----

//NB le repertoire frontends-content doit normalement
//comporter des copies des applications angulars 
//generée par ng build --prod (ex: my-app ou resa-app)
//avec dans index.html base href="." plutot que base href="/"