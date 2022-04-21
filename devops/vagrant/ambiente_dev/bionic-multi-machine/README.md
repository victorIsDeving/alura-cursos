## Essa é uma [máquina virtual múltipla](https://www.vagrantup.com/docs/multi-machine)

É meio que uma forma de criar um sistema de herança entre as máquinas virtuais  
É, essencialmente, a mesma coisa da máquina virtual da pasta ***bionic***, com a adição da instalação do *php* junto com o *mysql*

### O que tem de diferente

Toda a parte do *mysql* está encápsulada dentro do bloco que começa na linha 18
    
    config.vm.define "mysqldb" do |mysql|`  
        .
        .
        .
    end

Tudo que era do *mysql* e tinha como começo da linha o `config`, agora começa com *mysql* (o que vem dentro do `||`), dá pra ver esa diferença comparando com o arquivo **Vagrantfile** da máquina virtual da pasta ***bionic***  
Assim, quando subirmos a máquina, está não terá mais a nomenclatura default, passando a se chamar *mysqldb*

Na linha 49 começa o bloco que define a instalação do *php*

Antes da criação da máquina virtual, ao rodar um `vagrant status`, ele já vai mostrar uma diferença em duas máquinas virtuais, uma chamada `mysql`e outra chamada `phpweb`

![Primeiro `vagrant up`, antes da criação da máquina virtual em si](../assets/readme-images/bionic-multi-machine/vagrant-status.png)

