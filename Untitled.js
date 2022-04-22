user: MASTER_CAP_PROJECT $ cds init MASTER_CAP_PROYECT

user: MASTER_CAP_PROJECT $ cds deploy --to sqlite:db/base_datos.db

user: MASTER_CAP_PROJECT $ git init

user: MASTER_CAP_PROJECT $ git config --global user.name "Daniel"

user: MASTER_CAP_PROJECT $ git config --global user.email "dhdezleon@gmail.com"

user: MASTER_CAP_PROJECT $ git remote add cap https://github.com/DanielHdez/MASTER_CAP_PROJECT.git

user: MASTER_CAP_PROJECT $ git add .

user: MASTER_CAP_PROJECT $ git commit -m "Commit del Programa"

user: MASTER_CAP_PROJECT $ git push cap master
user: MASTER_CAP_PROJECT $ cds db/schema.cds -2 sql > ddl__

user: MASTER_CAP_PROJECT $ npm start