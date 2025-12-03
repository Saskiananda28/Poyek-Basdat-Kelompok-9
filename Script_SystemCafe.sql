CREATE TABLE Pelanggan (
    ID_Pelanggan CHAR(10),
    NamaPelanggan VARCHAR(50) NOT NULL,
    NomorHP VARCHAR(12) NOT NULL,
    Alamat VARCHAR(100),
    PRIMARY KEY (ID_Pelanggan),
    CONSTRAINT UQ_NomorHP UNIQUE (NomorHP)
);

 CREATE TABLE AdminCafe (
    ID_Admin CHAR(10) PRIMARY KEY,
    NamaAdmin VARCHAR(50) NOT NULL,
    Akun VARCHAR(30) NOT NULL UNIQUE,
    Password VARCHAR(100) NOT NULL
);

 CREATE TABLE Menu (
    ID_Menu CHAR(10) PRIMARY KEY,
    NamaMenu VARCHAR(50) NOT NULL UNIQUE, 
    Harga INT NOT NULL CHECK (Harga > 0),
    Kategori VARCHAR(20) NOT NULL
);

CREATE TABLE Kopi (
    ID_Menu CHAR(10) PRIMARY KEY,
    Ukuran_Cup VARCHAR(10) NOT NULL,
    FOREIGN KEY (ID_Menu) REFERENCES Menu(ID_Menu)
    ON UPDATE CASCADE ON DELETE CASCADE
);

 CREATE TABLE Cheesecake (
    ID_Menu CHAR(10) PRIMARY KEY,
    VarianRasa VARCHAR(20) NOT NULL,
    FOREIGN KEY (ID_Menu) REFERENCES Menu(ID_Menu)
    ON UPDATE CASCADE ON DELETE CASCADE
);

 CREATE TABLE Pesanan (
    ID_Pesanan CHAR(10) PRIMARY KEY,
    ID_Pelanggan CHAR(10) NOT NULL,
    ID_Admin CHAR(10) NOT NULL,
    Tanggal DATE NOT NULL,
    FOREIGN KEY (ID_Pelanggan) REFERENCES Pelanggan(ID_Pelanggan),
    FOREIGN KEY (ID_Admin) REFERENCES AdminCafe(ID_Admin)
);

CREATE TABLE Detail_Pesanan (
    ID_Detail CHAR(10) PRIMARY KEY,
    ID_Pesanan CHAR(10) NOT NULL,
    ID_Menu CHAR(10) NOT NULL,
    Jumlah INT NOT NULL CHECK (Jumlah > 0),
    FOREIGN KEY (ID_Pesanan) REFERENCES Pesanan(ID_Pesanan),
    FOREIGN KEY (ID_Menu) REFERENCES Menu(ID_Menu)
);

INSERT INTO Pelanggan (ID_Pelanggan, NamaPelanggan, NomorHP, Alamat) VALUES
('P001', 'Budi Santoso', '081234567890', 'Jl. Mawar No. 1, Jakarta'),
('P002', 'Citra Dewi', '087654321098', 'Perumahan Indah Blok B, Bogor'),
('P003', 'Eko Pramana', '085001122334', 'Apartemen Melati, Depok'),
('P004', 'Fanny Aulia', '089988776655', 'Jl. Merdeka No. 45, Bandung'),
('P005', 'Gilang Ramadhan', '081122334455', 'Kp. Durian Runtuh, Bekasi');

INSERT INTO AdminCafe (ID_Admin, NamaAdmin, Akun, Password) VALUES
('A001', 'Rina Agustin', 'rina.admin', 'pass123a'),
('A002', 'Joko Susilo', 'joko.kasir', 'pass456b'),
('A003', 'Dian Safitri', 'dian.super', 'pass789c'),
('A004', 'Hendri Saputra', 'hendri.staff', 'pass111d'),
('A005', 'Marta Wijaya', 'marta.mng', 'pass222e');

INSERT INTO Menu (ID_Menu, NamaMenu, Harga, Kategori) VALUES
('M001', 'Espresso', 20000, 'Kopi'),
('M002', 'Latte', 35000, 'Kopi'),
('M003', 'Red Velvet Cheesecake', 45000, 'Cheesecake'),
('M004', 'Classic Cheesecake', 40000, 'Cheesecake'),
('M005', 'Americano', 25000, 'Kopi'),
('M006', 'Matcha Latte', 38000, 'Non-Kopi');

INSERT INTO Kopi (ID_Menu, Ukuran_Cup) VALUES
('M001', 'Small'),
('M002', 'Medium'),
('M005', 'Large');

INSERT INTO Cheesecake (ID_Menu, VarianRasa) VALUES
('M003', 'Red Velvet'),
('M004', 'Classic');

INSERT INTO Pesanan (ID_Pesanan, ID_Pelanggan, ID_Admin, Tanggal) VALUES
('T001', 'P001', 'A001', '2025-11-18'),
('T002', 'P002', 'A002', '2025-11-18'),
('T003', 'P003', 'A001', '2025-11-17'),
('T004', 'P004', 'A003', '2025-11-17'),
('T005', 'P005', 'A002', '2025-11-16');

INSERT INTO Detail_Pesanan (ID_Detail, ID_Pesanan, ID_Menu, Jumlah) VALUES
('D001', 'T001', 'M001', 2), 
('D002', 'T001', 'M003', 1), 
('D003', 'T002', 'M002', 1), 
('D004', 'T003', 'M005', 3), 
('D005', 'T004', 'M004', 1), 
('D006', 'T005', 'M006', 2);
