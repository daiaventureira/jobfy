# Jobfy 

Essa aplicação é um app que conecta usuários com projetos e profissionais que desejam partipar. Desenvolvida utilizando Ruby on Rails e Active Storage.
A aplicação tem uma funcionalidade de login. Após logado o usuário pode adicionar proejetos, como título, descrição, habilidades necessárias, data limite para solicitar participação e valor. O profissional após logado tem que obrigatoriamente preencher o perfil antes de ver projetos e se candidatar. O usuário (dono do projeto) pode aceitar ou recusar aplicações feitas por profissionais. Os profissionais podem desistir de uma aplicação se ela estiver pendente ou se o usuário aceitou em até 3 dias.

## Requerimentos

* Eu estou assumindo que você tenha ruby 3 instalado na sua máquina

## Instalação

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

## Como usar


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

<img width="1145" alt="Screen Shot 2021-10-18 at 6 33 12 PM" src="https://user-images.githubusercontent.com/44145146/137815493-e841e396-ac48-4427-9ee4-25e13350bebc.png">

Para testar você pode fazer login no usuário:

```bash 
 email: user@a.com.br
 senha: 123456
``` 

Quando clicar em "Login", será redirecionado para a seguinte página:

<img width="1201" alt="Screen Shot 2021-10-28 at 6 02 31 PM" src="https://user-images.githubusercontent.com/44145146/139342479-7894640a-0134-461f-99bb-2a6818aac343.png">

 <img width="1201" alt="Screen Shot 2021-10-28 at 6 03 07 PM" src="https://user-images.githubusercontent.com/44145146/139342544-d6f69146-2acb-41af-a680-6c24f341cc70.png">
 
 Se clicar em "Ver aplicações você verá a seguinte página com informações sobre profissional que aplicou e botões aceitar ou "rejeitar" "propostas":

<img width="1201" alt="Screen Shot 2021-10-28 at 6 03 28 PM" src="https://user-images.githubusercontent.com/44145146/139342572-9ec84497-d0e4-4585-ba44-859aa750d8f5.png">

É possível criar novos projetos:

<img width="1201" alt="Screen Shot 2021-10-28 at 6 05 19 PM" src="https://user-images.githubusercontent.com/44145146/139342790-fe8d2d07-c253-43c4-8b8a-e31e40e5dfcd.png">

Para acessar como profissional use o login:

```bash 
 email: pro@pro2.com.br
 senha: 123456
``` 

Quando clicar em "Login", será redirecionado para a seguinte página:


<img width="1201" alt="Screen Shot 2021-10-28 at 6 06 45 PM" src="https://user-images.githubusercontent.com/44145146/139342911-7659c230-47c8-468b-bd74-abe537fbb363.png">

Se clicar em "Ver aplicações" o atual profissional verá a seguinte página:

<img width="1201" alt="Screen Shot 2021-10-28 at 6 08 18 PM" src="https://user-images.githubusercontent.com/44145146/139343048-9be47fe0-9669-4aff-8ab7-50e7dd8f0d55.png">

Se clicar em "Veja seu perfil" o profissional poderá atualizar perfil:

<img width="1201" alt="Screen Shot 2021-10-28 at 6 09 10 PM" src="https://user-images.githubusercontent.com/44145146/139343116-2eb82468-c278-4db0-afaf-20615cc1d7bb.png">

Em "Ver projetos disponíveis" há uma lista de projetos disponíveis para o profissional se inscrever:

<img width="1201" alt="Screen Shot 2021-10-28 at 6 10 28 PM" src="https://user-images.githubusercontent.com/44145146/139343230-352c4766-07f4-4b51-9225-86041c6a81e5.png">

Clicando no título o profissional poderá ver a descrição do projeto, bem como outras informações e se candidatar caso não tenha se candidatado:
<img width="1201" alt="Screen Shot 2021-10-28 at 6 32 28 PM" src="https://user-images.githubusercontent.com/44145146/139345289-9e7067b8-80a9-413c-91f6-029c176a12aa.png">


## Informações

* Ruby version:  ruby 3.0.0p0

* Rails version: Rails 6.1.4.1

* Active Storage

 
## Testes


* Esta aplicação inclui testes.

* Rodando os testes:

```bash
$ rspec
```




