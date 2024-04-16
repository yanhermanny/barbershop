CREATE TABLE
    ADMINISTRADOR (
        id_administrador BIGINT NOT NULL,
        PRIMARY KEY (id_administrador)
    ) ENGINE = InnoDB;

CREATE TABLE
    AGENDAMENTO (
        id_agendamento BIGINT NOT NULL AUTO_INCREMENT,
        datahora_agendamento DATETIME(6) NOT NULL,
        datahora_inicio DATETIME(6),
        datahora_fim DATETIME(6),
        status ENUM('PENDENTE', 'CONFIRMADO', 'CANCELADO') NOT NULL,
        id_cliente BIGINT NOT NULL,
        id_barbeiro BIGINT NOT NULL,
        incluido_por BIGINT NOT NULL,
        data_inclusao DATETIME(6) NOT NULL,
        alterado_por BIGINT,
        data_alteracao DATETIME(6),
        excluido_por BIGINT,
        data_exclusao DATETIME(6),
        PRIMARY KEY (id_agendamento)
    ) ENGINE = InnoDB;

CREATE TABLE
    AGENDAMENTO_SERVICO (
        id_agendamento BIGINT NOT NULL,
        id_servico BIGINT NOT NULL,
        PRIMARY KEY (id_agendamento, id_servico)
    ) ENGINE = InnoDB;

CREATE TABLE
    AVALIACAO (
        id_avaliacao BIGINT NOT NULL AUTO_INCREMENT,
        classificacao INTEGER NOT NULL,
        comentario VARCHAR(255),
        id_cliente BIGINT NOT NULL,
        id_barbeiro BIGINT NOT NULL,
        incluido_por BIGINT NOT NULL,
        data_inclusao DATETIME(6) NOT NULL,
        alterado_por BIGINT,
        data_alteracao DATETIME(6),
        excluido_por BIGINT,
        data_exclusao DATETIME(6),
        PRIMARY KEY (id_avaliacao)
    ) ENGINE = InnoDB;

CREATE TABLE
    BARBEIRO (
        id_barbeiro BIGINT NOT NULL,
        especialidade VARCHAR(255),
        PRIMARY KEY (id_barbeiro)
    ) ENGINE = InnoDB;

CREATE TABLE
    CLIENTE (
        id_cliente BIGINT NOT NULL,
        PRIMARY KEY (id_cliente)
    ) ENGINE = InnoDB;

CREATE TABLE
    HORARIO_TRABALHO (
        id_horario_trabalho BIGINT NOT NULL AUTO_INCREMENT,
        dia_semana ENUM('DOM', 'SEG', 'TER', 'QUA', 'QUI', 'SEX', 'SAB') NOT NULL,
        horario_inicio TIME(6) NOT NULL,
        horario_fim TIME(6) NOT NULL,
        incluido_por BIGINT NOT NULL,
        data_inclusao DATETIME(6) NOT NULL,
        alterado_por BIGINT,
        data_alteracao DATETIME(6),
        excluido_por BIGINT,
        data_exclusao DATETIME(6),
        PRIMARY KEY (id_horario_trabalho)
    ) ENGINE = InnoDB;

CREATE TABLE
    HORARIO_TRABALHO_BARBEIRO (
        id_horario_trabalho BIGINT NOT NULL,
        id_barbeiro BIGINT NOT NULL,
        PRIMARY KEY (id_horario_trabalho, id_barbeiro)
    ) ENGINE = InnoDB;

CREATE TABLE
    PRODUTO (
        id_produto BIGINT NOT NULL AUTO_INCREMENT,
        nome VARCHAR(255) NOT NULL,
        descricao VARCHAR(255),
        quantidade INTEGER NOT NULL,
        incluido_por BIGINT NOT NULL,
        data_inclusao DATETIME(6) NOT NULL,
        alterado_por BIGINT,
        data_alteracao DATETIME(6),
        excluido_por BIGINT,
        data_exclusao DATETIME(6),
        PRIMARY KEY (id_produto)
    ) ENGINE = InnoDB;

CREATE TABLE
    PRODUTO_BARBEIRO (
        id_produto_barbeiro BIGINT NOT NULL AUTO_INCREMENT,
        quantidade INTEGER NOT NULL,
        datahora_retirada DATETIME(6),
        id_produto BIGINT NOT NULL,
        id_barbeiro BIGINT NOT NULL,
        PRIMARY KEY (id_produto_barbeiro)
    ) ENGINE = InnoDB;

CREATE TABLE
    SERVICO (
        id_servico BIGINT NOT NULL AUTO_INCREMENT,
        nome VARCHAR(255) NOT NULL,
        descricao VARCHAR(255),
        duracao_em_minutos INTEGER,
        preco DECIMAL(6, 2) NOT NULL,
        incluido_por BIGINT NOT NULL,
        data_inclusao DATETIME(6) NOT NULL,
        alterado_por BIGINT,
        data_alteracao DATETIME(6),
        excluido_por BIGINT,
        data_exclusao DATETIME(6),
        PRIMARY KEY (id_servico)
    ) ENGINE = InnoDB;

CREATE TABLE
    USUARIO (
        id_usuario BIGINT NOT NULL AUTO_INCREMENT,
        nome VARCHAR(255) NOT NULL,
        sobrenome VARCHAR(255),
        email VARCHAR(255) NOT NULL,
        senha VARCHAR(20) NOT NULL,
        telefone VARCHAR(13) NOT NULL,
        data_nascimento DATE,
        incluido_por VARCHAR(255) NOT NULL,
        data_inclusao DATETIME(6) NOT NULL,
        alterado_por VARCHAR(255),
        data_alteracao DATETIME(6),
        excluido_por VARCHAR(255),
        data_exclusao DATETIME(6),
        PRIMARY KEY (id_usuario)
    ) ENGINE = InnoDB;

ALTER TABLE PRODUTO
ADD CONSTRAINT UK_nome_produto_unico UNIQUE (nome);

ALTER TABLE PRODUTO
ADD CONSTRAINT FK_produto_usuario3 FOREIGN KEY (incluido_por) REFERENCES USUARIO (id_usuario);

ALTER TABLE PRODUTO
ADD CONSTRAINT FK_produto_usuario1 FOREIGN KEY (alterado_por) REFERENCES USUARIO (id_usuario);

ALTER TABLE PRODUTO
ADD CONSTRAINT FK_produto_usuario2 FOREIGN KEY (excluido_por) REFERENCES USUARIO (id_usuario);

ALTER TABLE SERVICO
ADD CONSTRAINT UK_nome_servico_unico UNIQUE (nome);

ALTER TABLE SERVICO
ADD CONSTRAINT FK_servico_usuario3 FOREIGN KEY (incluido_por) REFERENCES USUARIO (id_usuario);

ALTER TABLE SERVICO
ADD CONSTRAINT FK_servico_usuario1 FOREIGN KEY (alterado_por) REFERENCES USUARIO (id_usuario);

ALTER TABLE SERVICO
ADD CONSTRAINT FK_servico_usuario2 FOREIGN KEY (excluido_por) REFERENCES USUARIO (id_usuario);

ALTER TABLE USUARIO
ADD CONSTRAINT UK_email_usuario_unico UNIQUE (email);

ALTER TABLE ADMINISTRADOR
ADD CONSTRAINT FK_administrador_usuario FOREIGN KEY (id_administrador) REFERENCES USUARIO (id_usuario);

ALTER TABLE AGENDAMENTO
ADD CONSTRAINT FK_agendamento_barbeiro FOREIGN KEY (id_barbeiro) REFERENCES BARBEIRO (id_barbeiro);

ALTER TABLE AGENDAMENTO
ADD CONSTRAINT FK_agendamento_cliente FOREIGN KEY (id_cliente) REFERENCES CLIENTE (id_cliente);

ALTER TABLE AGENDAMENTO
ADD CONSTRAINT FK_agendamento_usuario3 FOREIGN KEY (incluido_por) REFERENCES USUARIO (id_usuario);

ALTER TABLE AGENDAMENTO
ADD CONSTRAINT FK_agendamento_usuario1 FOREIGN KEY (alterado_por) REFERENCES USUARIO (id_usuario);

ALTER TABLE AGENDAMENTO
ADD CONSTRAINT FK_agendamento_usuario2 FOREIGN KEY (excluido_por) REFERENCES USUARIO (id_usuario);

ALTER TABLE AGENDAMENTO_SERVICO
ADD CONSTRAINT FK_agendamento_servico_servico FOREIGN KEY (id_servico) REFERENCES SERVICO (id_servico);

ALTER TABLE AGENDAMENTO_SERVICO
ADD CONSTRAINT FK_agendamento_servico_agendamento FOREIGN KEY (id_agendamento) REFERENCES AGENDAMENTO (id_agendamento);

ALTER TABLE AVALIACAO
ADD CONSTRAINT FK_avaliacao_barbeiro FOREIGN KEY (id_barbeiro) REFERENCES BARBEIRO (id_barbeiro);

ALTER TABLE AVALIACAO
ADD CONSTRAINT FK_avaliacao_cliente FOREIGN KEY (id_cliente) REFERENCES CLIENTE (id_cliente);

ALTER TABLE AVALIACAO
ADD CONSTRAINT FK_avaliacao_usuario3 FOREIGN KEY (incluido_por) REFERENCES USUARIO (id_usuario);

ALTER TABLE AVALIACAO
ADD CONSTRAINT FK_avaliacao_usuario1 FOREIGN KEY (alterado_por) REFERENCES USUARIO (id_usuario);

ALTER TABLE AVALIACAO
ADD CONSTRAINT FK_avaliacao_usuario2 FOREIGN KEY (excluido_por) REFERENCES USUARIO (id_usuario);

ALTER TABLE AVALIACAO
ADD CONSTRAINT CK_classificacao CHECK (classificacao BETWEEN 0 AND 10);

ALTER TABLE BARBEIRO
ADD CONSTRAINT FK_barbeiro_usuario FOREIGN KEY (id_barbeiro) REFERENCES USUARIO (id_usuario);

ALTER TABLE CLIENTE
ADD CONSTRAINT FK_cliente_usuario FOREIGN KEY (id_cliente) REFERENCES USUARIO (id_usuario);

ALTER TABLE HORARIO_TRABALHO_BARBEIRO
ADD CONSTRAINT FK_horario_trabalho_barbeiro_barbeiro FOREIGN KEY (id_barbeiro) REFERENCES BARBEIRO (id_barbeiro);

ALTER TABLE HORARIO_TRABALHO_BARBEIRO
ADD CONSTRAINT FK_horario_trabalho_barbeiro_horario_trabalho FOREIGN KEY (id_horario_trabalho) REFERENCES HORARIO_TRABALHO (id_horario_trabalho);

ALTER TABLE HORARIO_TRABALHO
ADD CONSTRAINT FK_horario_trabalho_usuario3 FOREIGN KEY (incluido_por) REFERENCES USUARIO (id_usuario);

ALTER TABLE HORARIO_TRABALHO
ADD CONSTRAINT FK_horario_trabalho_usuario1 FOREIGN KEY (alterado_por) REFERENCES USUARIO (id_usuario);

ALTER TABLE HORARIO_TRABALHO
ADD CONSTRAINT FK_horario_trabalho_usuario2 FOREIGN KEY (excluido_por) REFERENCES USUARIO (id_usuario);

ALTER TABLE PRODUTO_BARBEIRO
ADD CONSTRAINT FK_produto_barbeiro_barbeiro FOREIGN KEY (id_barbeiro) REFERENCES BARBEIRO (id_barbeiro);

ALTER TABLE PRODUTO_BARBEIRO
ADD CONSTRAINT FK_produto_barbeiro_produto FOREIGN KEY (id_produto) REFERENCES PRODUTO (id_produto);
