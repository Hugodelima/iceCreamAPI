# Projeto Docker com Ruby e PostgreSQL

Este projeto utiliza Docker Compose para configurar um ambiente com Ruby e PostgreSQL. O container Ruby é preparado com as dependências necessárias e o container PostgreSQL é configurado para persistir os dados.

## Estrutura do Projeto

```
.
├── docker-compose.yml
└── (outros arquivos do projeto)
```

## Tecnologias Usadas

- Ruby 3.1.6 (baseado em Alpine)
- PostgreSQL 16.4 (baseado em Alpine)
- Docker e Docker Compose

## Configuração

### Pré-requisitos

- Docker
- Docker Compose

### Instruções

1. **Clone o repositório:**

```bash
git clone https://github.com/pleasematheus/railsOnDocker.git
cd railsOnDocker
```

2. **Inicie os containers:**

```bash
docker-compose up
```

Isso iniciará os containers de Ruby e PostgreSQL. O container Ruby ficará em execução e disponível para acesso via terminal.

3. **Acesse o container Ruby:**

Para acessar o terminal do container Ruby, use:

```bash
docker exec -it <nome-do-container-ruby> sh
```

`sh` por ser substituído por `/bin/sh`.
`ash` ou `/bin/ash` também pode ser utilizado.

Substitua `<nome-do-container-ruby>` pelo nome real do container, que pode ser obtido com `docker ps`.

### Mapeamento de Diretórios

- A pasta atual do host está mapeada para a pasta home (`/home`) do container Ruby, permitindo acesso aos arquivos do projeto diretamente no container.

## Persistência de Dados

O container PostgreSQL utiliza um volume nomeado para garantir que os dados sejam mantidos mesmo se o container for removido.

## Parar os Containers

Se precisar parar os container e não remove-los, use:

```bash
docker compose stop
```

## Inicia-los novamente

Caso precise iniciar os container novamente, utilize:

```bash
docker compose start
```

## Remover Containers

Para remover os containers, use:

```bash
docker-compose down
```

## Como conectar no container Ruby

1. Instale a extensão [Dev Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) no seu VSCode;

2. Ao abrir o VSCode, vá a até o canto inferior esquerdo e clique na opção `Open a Remote Window`;

3. Selecione a opção `Attach to Running Container`;

4. Selecione o container Ruby;

5. Uma nova janela do VSCode será aberta e a conexão será feita;

6. Navegue até a pasta `/home`;

7. Seja feliz :D;

## Como iniciar um projeto em com Ruby on Rails

1. Utilize o comando:
```bash
rails new <nome-do-projeto>
```
ou

```bash
rails new <nome-do-projeto> -d postgresql
```

2. Entre no caminho do projeto:
```bash
cd <nome-do-projeto>
```

3. Instale o bundle:
```bash
bundle install
```

4. Configure o arquivo `database.yml` dentro da pasta `config`:
```bash
nano config/database.yml
```
Sintaxe do arquivo:

```yml
default:
  adapter: postgresql
  encoding: unicode
  pool: 5 # Definida por padrão
  database: 
  username: 
  password: 1234
  host: <container-postgres>
  port: 5432
```

5. Inicie o banco de dados:
```bash
rails db:create
```

6. Faça a migração:
```bash
rails db:migrate
```

7. Por fim, inicie o servidor utilizando uma porta diferente da padrão:
```bash
rails s -p <porta>
```

## Contribuição

Sinta-se à vontade para contribuir com este projeto. Abra um pull request ou um issue se encontrar algum problema.
