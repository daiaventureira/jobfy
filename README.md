# Jobfy 

Essa aplicação é um app que conecta usuários com projetos e profissionais que desejam partipar, desenvolvida utilizando Ruby on Rails e Active Storage.
A aplicação tem uma funcionalidade de login. Após logado o usuário pode adicionar proejetos, como título, descrição, habilidades necessárias, data limite para solicitar participação, valor. O profissional após logado tem que obrigatoriamente preencher o perfil antes de ver projetos e se candidatar.


## Requirements

* Eu estou assumindo que você tenha ruby 3 instalado na sua máquina

## Installation

* primeiro você precisa clonar o repositório. No seu terminal rode o comando:

```bash
$ git clone git@github.com:daiaventureira/jobfy.git
```

* Após isso rode os seguintes comando dentro do seu repositório jobfy localmente:

```bash
 $ bundle install
```

```bash
 $ rails db:setup
```

## Usage


Para rodar localmente:

```bash
 $ rails server
```

* Se você tiver um erro no webpacker:

```bash
 $ rails webpacker:install
```

```bash 
 $ rails server
``` 
 
No seu browser digite: "localhost:3000" e isso irá mostrar a seguinte página:
<img width="1145" alt="Screen Shot 2021-10-17 at 10 59 08 PM" src="https://user-images.githubusercontent.com/44145146/137662544-d104d05c-3669-44c7-8654-8298abf690c2.png">


## informações

* Ruby version:  ruby 3.0.0p0

* Rails version: Rails 6.1.4.1

* Active Storage

 
## Tests


* This application includes models and controllers tests.

* Running the models tests:

```bash
$ rails test:models 
```

* Running the controllers tests

```bash
$ rails test:controllers
```



