# Car price prediction

Este projeto têm por objetivo a criação de um modelo para a previsão da data e hora estimada do fechamento de um chamado, baseado nos atributos dados.

Aplicação de **Análise factorial por componentes principais** (PCA) as notas de alunos

## Requirements
- R 4.2.2
- Git
- Data version Control
- Continuos Machine Learning

### Optional installations for VSCode users
- VSCodium or VSCode
- R extension for VSCode v2.7.0
- R Debugger v0.5.2
- DVC extension



## Estrutura do projeto


### Fluxo de trabalho

Todos os artefatos do projetos são armazenados no Git, desta forma temos a rastreabilidade do código relacionado ao aprendizado de máquina, os conjuntos de dados, esteiras de integração contínua e aprendizados de máquina. Desta forma garantimos que o projeto seja reproduzível e todos as configurações sejam armazenadas como código.

- Versionamento dos conjuntos de dados
Os datasets são versionados utilizando a ferramenta DVC que utiliza o Git como camada de controle de versão, utilizando-se um armezamento remoto.

- **nome**: `car-price/data-registry`
- **identificador**: `1dvQU2I3usATeNlr1Lu4_KXrdpqjrwdWH` (Google drive)

### Registrando um conjundo de dados

```bash
$ dvc add .\data\cardetails-v4.csv
$ git add .\data\cardetails-v4.csv.dvc .\data\.gitignore
$ git commit -m "Add raw data"
```

### Configurando um armazenamento remoto

O comando abaixo configura o armazenamento remoto para o dataset versionado

```bash
$ dvc remote add -d data-registry  gdrive://1dvQU2I3usATeNlr1Lu4_KXrdpqjrwdWH/data-registry/car-price
$ git add .\.dvc\config
$ git commit -m "config remote storage"
```

### Armazenando o conjunto de dados no registro remoto
```bash
$ dvc push
```

### Obtendo um conjunto de dados do registro remoto
```bash
$ git clone ou git pull
$ dvc pull
```

### Alternando entre versões

O Comando abaixo altenará para uma determinada versão do código do modelo e o respectivo dataset.

```
$ git checkout <branch>
$ dvc checkout
```

### Adicionando mudanças
Sempre que realizar mudanças execute os comandos abaixo
```bash
$ dvc add output/notas_fatoriais.xlsx
$ git commit -m "<mensagem>"
$ dvc push
```
Nota: É uma boa prática que a mensagem deve estar  no imperativo, pois ele deve descrever o que foi altera no conjunto de dados.

### 
