CREATE  DATABASE IF NOT EXISTS ecommerce_pc
    DEFAULT CHARACTER SET = 'utf8mb4';

    USE ecommerce_pc 

    CREATE TABLE Cliente(
        Id INT AUTO_INCREMENT PRIMARY KEY,
        nome VARCHAR (100) NOT NULL,
        email VARCHAR(100) NOT NULL UNIQUE,
        senha VARCHAR(100) NOT NULL,
        endereço TEXT,
        criado_em DATETIME DEFAULT CURRENT_TIMESTAMP
    );

    CREATE TABLE Categoria (
        Id INT AUTO_INCREMENT PRIMARY KEY,
        nome VARCHAR(50),
        descricao TEXT
    );

    CREATE TABLE Produto(
        id INT AUTO_INCREMENT PRIMARY KEY,
        nome VARCHAR (100) NOT NULL,
        descricao TEXT,
        preco DECIMAL (10,2) NOT NULL,
        estoque INT DEFAULT 0,
        categoria INT,
        criado_em DATETIME DEFAULT CURRENT_TIMESTAMP,
        FOREIGN KEY (categoria) REFERENCES Categoria(id)
    );

     CREATE table Pedido(
        id_pedido INT AUTO_INCREMENT PRIMARY KEY,
        cliente_id INT,
        data DATETIME DEFAULT CURRENT_TIMESTAMP,
        status VARCHAR(50) DEFAULT 'Em andamento',
        FOREIGN KEY (cliente_id) REFERENCES Cliente(id)
    );

    CREATE TABLE Item_Pedido(
        id INT AUTO_INCREMENT PRIMARY KEY,
        pedido_id INT,
        produto_id INT,
        quantidade INT DEFAULT 1,
        preco_unitario DECIMAL(10,2),
        FOREIGN KEY (pedido_id) REFERENCES Pedido(id_pedido),
        FOREIGN KEY (produto_id) REFERENCES Produto(id)
        );

        INSERT INTO `Categoria` (nome,descricao) VALUES
        ('Processadores','CPUs para desktops'),
        ('Memória RAM', 'Módulos de memória para PCs'),
        ('Placas de Vídeo', 'GPUs para jogos e renderização'),
        ('Armazenamento', 'Dispositivos como SSDs e HDs'),
        ('Placas-Mães', 'Motherboards compatíveis com CPUs e periféricos');

        INSERT INTO Produto (nome, descricao, preco, estoque, categoria) VALUES
        ('Intel Core i5 5600X', '6 núcleos ,12 threads 2.9GHz', 899.90, 10, 1),
        ('AWD Ryzen 5 5600X', '6 núcleos, até 4.6GHz', 1099.00, 7, 1),
        ('Memória DDR4 8GB 2666MHz', 'Kingston Fury Beast', 189.90, 20, 2),
        ('Memória DDR4 16GB 3200MGHz', 'Corsair Vengeance LPX', 349.50, 15, 2),
        ('NVIDIA GeForce GTX 1660','6GB GDDR5', 1450.00, 5, 3);
