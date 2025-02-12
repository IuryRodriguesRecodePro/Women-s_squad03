CREATE DATABASE agencia_viagens;

USE agencia_viagens;

CREATE TABLE Envia (
    user_id VARCHAR(50),
    message_id VARCHAR(50),
    PRIMARY KEY (user_id, message_id), -- Chave primária composta
    FOREIGN KEY (user_id) REFERENCES Usuário (user_id),
    FOREIGN KEY (message_id) REFERENCES Mensagem (message_id)
);

CREATE TABLE Faz (
    user_id VARCHAR(50),
    friendship_id VARCHAR(50),
    PRIMARY KEY (user_id, friendship_id), -- Chave primária composta
    FOREIGN KEY (user_id) REFERENCES Usuário (user_id),
    FOREIGN KEY (friendship_id) REFERENCES Amigo (friendship_id)
);

CREATE TABLE Recebe (
    user_id VARCHAR(50),
    notification_id VARCHAR(50),
    PRIMARY KEY (user_id, notification_id), -- Chave primária composta
    FOREIGN KEY (user_id) REFERENCES Usuário (user_id),
    FOREIGN KEY (notification_id) REFERENCES Notificações (notification_id)
);

CREATE TABLE Comenta (
    post_id VARCHAR(50),
    comment_id VARCHAR(50),
    PRIMARY KEY (post_id, comment_id), -- Chave primária composta
    FOREIGN KEY (post_id) REFERENCES Post (post_id),
    FOREIGN KEY (comment_id) REFERENCES Comentário (comment_id)
);

ALTER TABLE Post ADD FOREIGN KEY (user_id) REFERENCES Usuário (user_id);