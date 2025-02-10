# Wome's 
Este é um projeto da squad-03, onde desenvolvemos uma rede social voltada para as mulheres. A rede social tem como objetivo fornecer um formulário de cadastro para novos usuários na plataforma da Comunidade Wom's, permitindo o registro através de informações básicas.
URL: https://squad03-women.vercel.app/
## Tecnologias usadas
- HTML
- CSS
- BOOTSTRAP
- JAVASCRIPT

URL: - Comunidade Wom's https://squad03-women.vercel.app/index.html

Objetivo
A página tem como objetivo fornecer um formulário de cadastro para novos usuários na plataforma da Comunidade Wom's, permitindo o registro através de informações básicas.

Estrutura do Formulário de Cadastro
Campos de Entrada:
Nome: Campo de texto para o nome completo do usuário.
E-mail: Campo de entrada para o e-mail de contato do usuário.
Telefone: Campo de entrada para o número de telefone, que pode ser usado para recuperação de dados caso necessário.
Senha: Campo de entrada para a criação de uma senha, com as seguintes exigências:
Pelo menos 6 caracteres.
Deve conter letras, números e caracteres especiais.
Botão de Cadastro:
Após preencher os campos, o usuário pode clicar no botão \
Cadastrar\ para completar o processo.

Design e Funcionalidade
A página possui um design limpo e intuitivo.
Campos de entrada são destacados e possuem instruções claras de como devem ser preenchidos.
A senha precisa atender a requisitos de segurança.
É oferecido suporte ao usuário caso ele precise recuperar ou redefinir sua senha através do telefone informado.
Responsividade
A página é adaptada para diferentes dispositivos, proporcionando uma boa experiência tanto em desktops quanto em dispositivos móveis.

Estrutura do Código
Doctype e <html>: O código começa com a definição do tipo de documento HTML (<!DOCTYPE html>) e a especificação do idioma da página, que é português do Brasil (<html lang=\
pt-br\>).

Cabeçalho <head>: A seção <head> contém as meta informações da página, como:
Charset: Definição do conjunto de caracteres (UTF-8).
Viewport: Especificações para garantir a responsividade em dispositivos móveis.
Descrição: Descrição de conteúdo para SEO.
Compatibilidade de navegadores: Definição para compatibilidade com Internet Explorer e outras políticas de segurança.
Fontes externas: Links para importar estilos e ícones de fontes externas, como Bootstrap, MDBootstrap, Font Awesome, Bootstrap Icons e fontes customizadas.

Corpo da Página <body>:
O corpo é dividido em várias seções para organizar o conteúdo da página:
Cabeçalho:
O cabeçalho possui a navbar com a logo da comunidade e links para navegação, como \
Home\, \Sobre
nós\, \Entrar\, \Cadastre-se\, além de um campo de busca.
O menu é responsivo, com a possibilidade de se expandir ou recolher.
Seção 1:
Uma seção com duas imagens para ilustrar a página inicial. A primeira é uma imagem de fundo, e a segunda é uma imagem otimizada para dispositivos móveis.
Seção 2:
Uma introdução ao objetivo da comunidade. Contém texto explicativo sobre o que a plataforma oferece, como espaço para mulheres compartilharem experiências e conexões. Há também um botão \
Participe
da
Comunidade\.
Seção 3:
Exibe três cards informativos, cada um com uma imagem e texto sobre temas como \
Visibilidade
Trans\, \Matriarcado
Indígena\, e \Sociedades
Matriarcais\. Cada card serve para apresentar tópicos relevantes à comunidade.
Rodapé <footer>:
O rodapé contém o logo da comunidade, links para páginas como \
Sobre\, \Contato\ e \Eventos\, além de um botão para \Participar
da
Comunidade\.
Versão \
Logada\ - Página de Usuário Conectado
Quando o usuário está logado, a estrutura é mais personalizada, com a adição de funcionalidades específicas para o usuário. As principais mudanças incluem:
Navegação e Sidebar:
A barra lateral contém o perfil do usuário, mostrando uma foto de capa e uma imagem de perfil, além de uma descrição personalizada.
A barra lateral possui links para seções como \
Feed\, \Contatos\, \Bem-estar\, \Grupos\, \Saúde
da
Mulher\ e outras.
Notificações:
O cabeçalho inclui um ícone de notificação, que exibe um número de notificações pendentes (neste caso, 3). Cada notificação tem a opção de ser aceita ou recusada.
Postagem no Feed:
A seção de feed permite ao usuário postar mensagens, fotos, vídeos e eventos, com a opção de compartilhar atualizações com a comunidade.
A interface inclui botões para carregar imagens, vídeos e eventos.
Scripts e Funcionalidades:
Scripts de Bootstrap:
O script do Bootstrap é incluído para habilitar funcionalidades como a navbar responsiva e a interação dos componentes, como o menu suspenso.
Interatividade no Feed:
O código JavaScript para o feed de postagens (não fornecido diretamente no código) provavelmente lida com interações de postagem e renderização de conteúdo.
Configuração do Menu Responsivo:
O script JavaScript responsável pela lógica do menu de navegação, como a abertura do menu lateral.
Notificações:
As notificações são interativas, com botões para aceitar ou recusar solicitações de amizade ou convites.
Estilo e Design:
Responsividade:
O design da página é responsivo, usando o framework Bootstrap para garantir que o layout se ajuste a diferentes tamanhos de tela.
Imagens:
O uso de imagens otimizadas para a web, incluindo imagens de fundo e de perfil, é parte do design da página.
Design Clean e Funcional:
As cores e a estrutura de layout são simples, mas modernas, com foco na acessibilidade e usabilidade, com botões e ícones bem destacados.


<br>
<br>
<br>
<br>

Banco de dados
<br>
Modelo Conceitual:

![Modelo_Conceitual_squad](https://github.com/user-attachments/assets/c62f6945-94e1-4893-8791-8ec0035a477a)


<br>
<br>
<br>
<br>

Modelo Lógico
<br>
![Modelo_Logico_squad03](https://github.com/user-attachments/assets/95d3731d-d7bf-4516-a572-0304fc6fb682)




 <br>
<br>
<br>
<br>

Modelo Físico
<br>
-- Tabela de Notificações
CREATE TABLE Notifications (
    notification_id INT PRIMARY KEY,
    read_status BOOLEAN,
    content TEXT,
    created_at TIMESTAMP,
    type VARCHAR(50),
    user_id INT,
    reference_id INT,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- Tabela de Amizades
CREATE TABLE Friendships (
    friendship_id INT PRIMARY KEY,
    updated_at TIMESTAMP,
    user_id_1 INT,
    user_id_2 INT,
    status VARCHAR(20),
    created_at TIMESTAMP,
    FOREIGN KEY (user_id_1) REFERENCES Users(user_id),
    FOREIGN KEY (user_id_2) REFERENCES Users(user_id),
    CHECK (user_id_1 < user_id_2) -- Evita duplicatas
);

-- Tabela de Curtidas
CREATE TABLE Likes (
    like_id INT PRIMARY KEY,
    user_id INT,
    post_id INT,
    comment_id INT,
    created_at TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (post_id) REFERENCES Posts(post_id),
    FOREIGN KEY (comment_id) REFERENCES Comments(comment_id)
);

-- Tabela de Mensagens
CREATE TABLE Messages (
    message_id INT PRIMARY KEY,
    read_status BOOLEAN,
    content TEXT,
    receiver_id INT,
    status VARCHAR(20),
    sender_id INT,
    sent_at TIMESTAMP,
    FOREIGN KEY (sender_id) REFERENCES Users(user_id),
    FOREIGN KEY (receiver_id) REFERENCES Users(user_id)
);

-- Tabela de Usuários
CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    profile_url VARCHAR(255),
    password_hash VARCHAR(255),
    email VARCHAR(100) UNIQUE,
    full_name VARCHAR(100),
    username VARCHAR(50) UNIQUE,
    birthdate DATE
);

-- Tabela de Autenticação
CREATE TABLE Authentication (
    auth_id INT PRIMARY KEY,
    user_id INT,
    login_attempts INT DEFAULT 0,
    last_attempt TIMESTAMP,
    token_expiration TIMESTAMP,
    email_verified BOOLEAN,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- Tabela de Posts
CREATE TABLE Posts (
    post_id INT PRIMARY KEY,
    user_id INT,
    content TEXT,
    created_at TIMESTAMP,
    status VARCHAR(20),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- Tabela de Comentários
CREATE TABLE Comments (
    comment_id INT PRIMARY KEY,
    post_id INT,
    user_id INT,
    content TEXT,
    created_at TIMESTAMP,
    status VARCHAR(20),
    FOREIGN KEY (post_id) REFERENCES Posts(post_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- Tabela de Relacionamentos (Faz)
CREATE TABLE Faz (
    friendship_id INT,
    user_id INT,
    auth_id INT,
    post_id INT,
    comment_id INT,
    FOREIGN KEY (friendship_id) REFERENCES Friendships(friendship_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (auth_id) REFERENCES Authentication(auth_id),
    FOREIGN KEY (post_id) REFERENCES Posts(post_id),
    FOREIGN KEY (comment_id) REFERENCES Comments(comment_id)
);

-- Tabela de Relacionamentos (Recebe)
CREATE TABLE Recebe (
    notification_id INT,
    user_id INT,
    auth_id INT,
    post_id INT,
    comment_id INT,
    FOREIGN KEY (notification_id) REFERENCES Notifications(notification_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (auth_id) REFERENCES Authentication(auth_id),
    FOREIGN KEY (post_id) REFERENCES Posts(post_id),
    FOREIGN KEY (comment_id) REFERENCES Comments(comment_id)
);

-- Tabela de Relacionamentos (Envia)
CREATE TABLE Envia (
    message_id INT,
    user_id INT,
    auth_id INT,
    post_id INT,
    comment_id INT,
    FOREIGN KEY (message_id) REFERENCES Messages(message_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (auth_id) REFERENCES Authentication(auth_id),
    FOREIGN KEY (post_id) REFERENCES Posts(post_id),
    FOREIGN KEY (comment_id) REFERENCES Comments(comment_id)
);

 


