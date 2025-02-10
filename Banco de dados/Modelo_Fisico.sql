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