USE clinica;
CREATE TABLE convenio (
    id_convenio INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    registro_ans CHAR(6) NOT NULL UNIQUE,
    ativo boolean default TRUE
);
CREATE TABLE paciente (
    id_paciente INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    data_nascimento DATE NOT NULL,
      ddd CHAR(2) NOT NULL,
    numero VARCHAR(9) NOT NULL,
    foreign key(id_convenio) references convenio(id_convenio)
);
CREATE TABLE especialidade (
    id_especialidade INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL UNIQUE
);
CREATE TABLE medico (
    id_medico INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) not null,
    crm VARCHAR(20) UNIQUE NOT NULL,
    ativo boolean default true,
    id_especialidade INT NOT NULL,
    foreign key(id_especialidade) 
    references especialidade(id_especialidade)
);
CREATE TABLE agenda(
	id_agenda INT NOT NULL auto_increment PRIMARY KEY,
    id_medico INT NOT NULL,
    situacao ENUM(
    'Livre',
    'Ocupado',
    'Bloqueado'
        ) NOT NULL DEFAULT 'Livre',
	data_slot DATE NOT NULL,
    hora_slot TIME NOT NULL,
    
    UNIQUE( data_slot , hora_slot),
    FOREIGN KEY (id_medico) REFERENCES medico(id_medico)
);
CREATE TABLE consulta (
    id_consulta INT AUTO_INCREMENT PRIMARY KEY,
    
    id_paciente INT NOT NULL,
    id_agenda INT,
    status_consulta ENUM(
        'Agendada', 
        'Confirmada', 
        'Em Espera', 
        'Em Atendimento', 
        'Realizada', 
        'Cancelada', 
        'Faltou'
    ) DEFAULT 'Agendada',
    FOREIGN KEY (id_paciente) references paciente(id_paciente),
    FOREIGN KEY (id_agenda) references agenda(id_agenda),
    UNIQUE(id_agenda)
);
-- 7. Tabela de Usuários (para login no sistema)
CREATE TABLE usuario (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    email varchar(100),
    senha VARCHAR(255),
    perfil ENUM('Paciente', 'medico', 'administrador') NOT NULL 
    default 'administrador'
    );
CREATE TABLE prontuario(
	id_prontuario INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_consulta INT NOT NULL,
    FOREIGN KEY(id_consulta) REFERENCES consulta(id_consulta),
    descricao TEXT NOT NULL,
    prescricao TEXT NOT NULL,
    diagnostico TEXT NOT NULL,
    
    UNIQUE(id_consulta)
)