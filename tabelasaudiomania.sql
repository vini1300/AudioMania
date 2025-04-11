-- Tabela Cliente
CREATE TABLE Cliente (
    Id_Cliente SERIAL PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    CPF VARCHAR(11),
    Telefone VARCHAR(20),
    Endereco VARCHAR(20),
    DataDeCadastro VARCHAR(20)
);

-- Tabela Funcionario
CREATE TABLE Funcionario (
    Id_Funcionario SERIAL PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    CPF VARCHAR(11),
    Cargo VARCHAR(50),
    Telefone VARCHAR(20),
    Data_Admissao VARCHAR(20)
);

-- Tabela Produto (deve ser criada antes de ser referenciada)
CREATE TABLE produto (
    Id_Produto SERIAL PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Descricao VARCHAR(200),
    Preco DECIMAL(10,2),
    Quantidade_estoque VARCHAR(20),
    Categoria VARCHAR(50),
    Marca VARCHAR(50)
);

-- Tabela Venda
CREATE TABLE Venda (
    Id_Venda SERIAL PRIMARY KEY,
    Data VARCHAR(100),
    Valor_Total DECIMAL(10,2),
    Forma_Pagamento VARCHAR(20),
    Desconto DECIMAL(10,2),
    Id_Cliente INTEGER,
    Id_Funcionario INTEGER,
    CONSTRAINT fk_cliente FOREIGN KEY (Id_Cliente) REFERENCES Cliente(Id_Cliente),
    CONSTRAINT fk_funcionario FOREIGN KEY (Id_Funcionario) REFERENCES Funcionario(Id_Funcionario)
);

-- Tabela Orcamento
CREATE TABLE Orcamento (
    Id_Orcamento SERIAL PRIMARY KEY,
    Data VARCHAR(100),
    Valor_Total DECIMAL(10,2),
    Status VARCHAR(20),
    Observacoes VARCHAR(200),
    Id_Cliente INTEGER,
    CONSTRAINT fk_cliente_orc FOREIGN KEY (Id_Cliente) REFERENCES Cliente(Id_Cliente)
);

-- Tabela itens_Venda (referencia Venda e produto)
CREATE TABLE itens_Venda (
    Id_Venda INTEGER,
    Id_Produto INTEGER,
    Quantidade VARCHAR(20),
    Preco_unitario DECIMAL(10,2),
    Subtotal DECIMAL(10,2),
    PRIMARY KEY (Id_Venda, Id_Produto),
    FOREIGN KEY (Id_Venda) REFERENCES Venda(Id_Venda),
    FOREIGN KEY (Id_Produto) REFERENCES produto(Id_Produto)
);

-- Tabela itens_Orcamento (referencia Orcamento e produto)
CREATE TABLE itens_Orcamento (
    Id_Orcamento INTEGER,
    Id_Produto INTEGER,
    Quantidade VARCHAR(20),
    Preco_unitario DECIMAL(10,2),
    Subtotal DECIMAL(10,2),
    PRIMARY KEY (Id_Orcamento, Id_Produto),
    FOREIGN KEY (Id_Orcamento) REFERENCES Orcamento(Id_Orcamento),
    FOREIGN KEY (Id_Produto) REFERENCES produto(Id_Produto)
);

-- Tabela Estoque (referencia produto)
CREATE TABLE estoque (
    Nome VARCHAR(100) NOT NULL,
    Id_Produto INTEGER,
    Quantidade_Estoque VARCHAR(20),
    Preco DECIMAL(10,2),
    Descricao VARCHAR(200),
    Categoria VARCHAR(50),
    Marca VARCHAR(50),
    Tipo VARCHAR(50),
    PRIMARY KEY (Id_Produto),
    FOREIGN KEY (Id_Produto) REFERENCES produto(Id_Produto)
);
