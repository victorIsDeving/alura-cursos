# execute 'apt-get update'
exec { 'apt-update':                    # exec resource named 'apt-update'
  command => '/usr/bin/apt-get update'  # command this resource will run
}

# install php7.2 package and mysql, é sempre bom ser específico na versão
package { [ 'php7.2' , 'php7.2-mysql']: # isso por si só já instala esses dois pacotes, o resto é boa prática
  require => Exec['apt-update'],        # require 'apt-update' before installing
  ensure => installed,
}

# comando para subir o php7, colocar ele para rodar de fato
exec { 'run-php7':
  require => Package['php7.2'], # requer o php7 de package que já esteja instalado para executar
  command => '/usr/bin/php -S 0.0.0.0:8888 -t /vagrant/src &'   
    # php -S vem da documentação do php mesmo, o 0.0.0.0:8888 é o localhost (entende como qualquer ip) e a porta 
    # em que colocamos a máquina virtual do php, dentro do Vagrantfile
    # o -t é o target, o arquivo php que ele vai abrir na porta em questão, que é o endereço que vem em seguida
    # lembrando que o endereço que vem em seguida é do comando sendo executado na máquina virtual!
    # não precisa do nome do arquivo, ele procura sozinho pelo index.php
}
