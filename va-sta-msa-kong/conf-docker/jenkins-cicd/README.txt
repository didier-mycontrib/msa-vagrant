URL jenkins console: localhost:8998 (:8080 habituellement et en interne dans container docker)
plugins sélectionnés : git et pipeline
admin/admin (by default)

===============
Jenkinsfile = default pipeline file in scm/git
H/2 * * * * 
for every 2 mn
==============
customer_repo
pipeline from scm/git : https://github.com/didier-mycontrib/customer_repo , branch */main
=============
product_repo
pipeline from scm/git : https://github.com/didier-mycontrib/product_repo , branch */main
=============
reservations
pipeline from scm/git : https://github.com/didier-mycontrib/reservations, branch */main
=============
resa-app
pipeline from scm/git : https://github.com/didier-mycontrib/resa-app, branch */main
====