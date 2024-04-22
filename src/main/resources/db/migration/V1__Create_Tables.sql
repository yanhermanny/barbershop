CREATE TABLE
    administrador (
        id_administrador BIGINT NOT NULL,
        PRIMARY KEY (id_administrador)
    ) ENGINE = InnoDB;

CREATE TABLE
    agendamento (
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
    agendamento_servico (
        id_agendamento BIGINT NOT NULL,
        id_servico BIGINT NOT NULL,
        PRIMARY KEY (id_agendamento, id_servico)
    ) ENGINE = InnoDB;

CREATE TABLE
    avaliacao (
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
    barbeiro (
        id_barbeiro BIGINT NOT NULL,
        especialidade VARCHAR(255),
        PRIMARY KEY (id_barbeiro)
    ) ENGINE = InnoDB;

CREATE TABLE
    cliente (
        id_cliente BIGINT NOT NULL,
        PRIMARY KEY (id_cliente)
    ) ENGINE = InnoDB;

CREATE TABLE
    horario_trabalho (
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
    horario_trabalho_barbeiro (
        id_horario_trabalho BIGINT NOT NULL,
        id_barbeiro BIGINT NOT NULL,
        PRIMARY KEY (id_horario_trabalho, id_barbeiro)
    ) ENGINE = InnoDB;

CREATE TABLE
    produto (
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
    produto_barbeiro (
        id_produto_barbeiro BIGINT NOT NULL AUTO_INCREMENT,
        quantidade INTEGER NOT NULL,
        datahora_retirada DATETIME(6),
        id_produto BIGINT NOT NULL,
        id_barbeiro BIGINT NOT NULL,
        PRIMARY KEY (id_produto_barbeiro)
    ) ENGINE = InnoDB;

CREATE TABLE
    servico (
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
    usuario (
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

ALTER TABLE produto
ADD CONSTRAINT UK_nome_produto_unico UNIQUE (nome);

ALTER TABLE produto
ADD CONSTRAINT FK_produto_usuario3 FOREIGN KEY (incluido_por) REFERENCES usuario (id_usuario);

ALTER TABLE produto
ADD CONSTRAINT FK_produto_usuario1 FOREIGN KEY (alterado_por) REFERENCES usuario (id_usuario);

ALTER TABLE produto
ADD CONSTRAINT FK_produto_usuario2 FOREIGN KEY (excluido_por) REFERENCES usuario (id_usuario);

ALTER TABLE servico
ADD CONSTRAINT UK_nome_servico_unico UNIQUE (nome);

ALTER TABLE servico
ADD CONSTRAINT FK_servico_usuario3 FOREIGN KEY (incluido_por) REFERENCES usuario (id_usuario);

ALTER TABLE servico
ADD CONSTRAINT FK_servico_usuario1 FOREIGN KEY (alterado_por) REFERENCES usuario (id_usuario);

ALTER TABLE servico
ADD CONSTRAINT FK_servico_usuario2 FOREIGN KEY (excluido_por) REFERENCES usuario (id_usuario);

ALTER TABLE usuario
ADD CONSTRAINT UK_email_usuario_unico UNIQUE (email);

ALTER TABLE administrador
ADD CONSTRAINT FK_administrador_usuario FOREIGN KEY (id_administrador) REFERENCES usuario (id_usuario);

ALTER TABLE agendamento
ADD CONSTRAINT FK_agendamento_barbeiro FOREIGN KEY (id_barbeiro) REFERENCES barbeiro (id_barbeiro);

ALTER TABLE agendamento
ADD CONSTRAINT FK_agendamento_cliente FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente);

ALTER TABLE agendamento
ADD CONSTRAINT FK_agendamento_usuario3 FOREIGN KEY (incluido_por) REFERENCES usuario (id_usuario);

ALTER TABLE agendamento
ADD CONSTRAINT FK_agendamento_usuario1 FOREIGN KEY (alterado_por) REFERENCES usuario (id_usuario);

ALTER TABLE agendamento
ADD CONSTRAINT FK_agendamento_usuario2 FOREIGN KEY (excluido_por) REFERENCES usuario (id_usuario);

ALTER TABLE agendamento_servico
ADD CONSTRAINT FK_agendamento_servico_servico FOREIGN KEY (id_servico) REFERENCES servico (id_servico);

ALTER TABLE agendamento_servico
ADD CONSTRAINT FK_agendamento_servico_agendamento FOREIGN KEY (id_agendamento) REFERENCES agendamento (id_agendamento);

ALTER TABLE avaliacao
ADD CONSTRAINT FK_avaliacao_barbeiro FOREIGN KEY (id_barbeiro) REFERENCES barbeiro (id_barbeiro);

ALTER TABLE avaliacao
ADD CONSTRAINT FK_avaliacao_cliente FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente);

ALTER TABLE avaliacao
ADD CONSTRAINT FK_avaliacao_usuario3 FOREIGN KEY (incluido_por) REFERENCES usuario (id_usuario);

ALTER TABLE avaliacao
ADD CONSTRAINT FK_avaliacao_usuario1 FOREIGN KEY (alterado_por) REFERENCES usuario (id_usuario);

ALTER TABLE avaliacao
ADD CONSTRAINT FK_avaliacao_usuario2 FOREIGN KEY (excluido_por) REFERENCES usuario (id_usuario);

ALTER TABLE avaliacao
ADD CONSTRAINT CK_classificacao CHECK (classificacao BETWEEN 0 AND 10);

ALTER TABLE barbeiro
ADD CONSTRAINT FK_barbeiro_usuario FOREIGN KEY (id_barbeiro) REFERENCES usuario (id_usuario);

ALTER TABLE cliente
ADD CONSTRAINT FK_cliente_usuario FOREIGN KEY (id_cliente) REFERENCES usuario (id_usuario);

ALTER TABLE horario_trabalho_barbeiro
ADD CONSTRAINT FK_horario_trabalho_barbeiro_barbeiro FOREIGN KEY (id_barbeiro) REFERENCES barbeiro (id_barbeiro);

ALTER TABLE horario_trabalho_barbeiro
ADD CONSTRAINT FK_horario_trabalho_barbeiro_horario_trabalho FOREIGN KEY (id_horario_trabalho) REFERENCES horario_trabalho (id_horario_trabalho);

ALTER TABLE horario_trabalho
ADD CONSTRAINT FK_horario_trabalho_usuario3 FOREIGN KEY (incluido_por) REFERENCES usuario (id_usuario);

ALTER TABLE horario_trabalho
ADD CONSTRAINT FK_horario_trabalho_usuario1 FOREIGN KEY (alterado_por) REFERENCES usuario (id_usuario);

ALTER TABLE horario_trabalho
ADD CONSTRAINT FK_horario_trabalho_usuario2 FOREIGN KEY (excluido_por) REFERENCES usuario (id_usuario);

ALTER TABLE produto_barbeiro
ADD CONSTRAINT FK_produto_barbeiro_barbeiro FOREIGN KEY (id_barbeiro) REFERENCES barbeiro (id_barbeiro);

ALTER TABLE produto_barbeiro
ADD CONSTRAINT FK_produto_barbeiro_produto FOREIGN KEY (id_produto) REFERENCES produto (id_produto);
