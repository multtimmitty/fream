# FREAM
--------

fream es un simple script que facilita la liberacion de memoria RAM
esto es muy util para ordenadores con poca memoria ram 2,4 y 8 GB
el script sincroniza el cache de la memoria RAM y elimina lo que ya
no esta en uso.

MODO DE USO
-----------

Clonar el Repositorio

      https://github.com/multtimy/fream.git

Darle Permisos de Ejecucion al Script fream.sh

      chmod 755 fream.sh

Ejecutar con privilegios el script

      sudo ./fream.sh



NOTA
----

Para poder un alias o un enlace simbolico en distros linux. agregar la
siguente linea


Hacer un alias, esto depende del tipo de shell que se use, para ello
se debe saber cual el archivo RC. y agregar la siguiente linea


      alias <nombre_del_alias>='<Path_Completo>/fream.sh'


Hacer un enlace simbolico, esto dependera de donde se quiera guardar
en este caso sera en /bin.

      ln -s -f <Path_Completo>/fream.sh /bin/fream





