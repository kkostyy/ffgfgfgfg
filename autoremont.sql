-- Created by Redgate Data Modeler (https://datamodeler.redgate-platform.com)
-- Last modification date: 2026-10-01 09:51:36.071

-- tables
-- Table: Ametikoht
CREATE TABLE Ametikoht (
    AmetikohtID integer  NOT NULL,
    Nimetus varchar(100)  NOT NULL,
    CONSTRAINT Ametikoht_pk PRIMARY KEY  (AmetikohtID)
);

-- Table: ArveStaatus
CREATE TABLE ArveStaatus (
    ArveStaatusID integer  NOT NULL,
    Nimetus varchar(100)  NOT NULL,
    CONSTRAINT ArveStaatus_Nimetus_uk UNIQUE (Nimetus),
    CONSTRAINT ArveStaatus_pk PRIMARY KEY  (ArveStaatusID)
);

-- Table: Auto
CREATE TABLE Auto (
    AutoID integer  NOT NULL,
    MudelID integer  NOT NULL,
    RegNr varchar(10)  NOT NULL,
    VIN char(17)  NOT NULL,
    Valmistamisaasta integer  NOT NULL,
    CONSTRAINT Auto_RegNr_uk UNIQUE (RegNr),
    CONSTRAINT Auto_VIN_uk UNIQUE (VIN),
    CONSTRAINT Auto_pk PRIMARY KEY  (AutoID)
);

-- Table: AutoMudel
CREATE TABLE AutoMudel (
    MudelID integer  NOT NULL,
    Mark varchar(50)  NOT NULL,
    Mudel varchar(50)  NOT NULL,
    CONSTRAINT AutoMudel_pk PRIMARY KEY  (MudelID)
);

-- Table: Kategooria
CREATE TABLE Kategooria (
    KategooriaID integer  NOT NULL,
    Nimetus varchar(100)  NOT NULL,
    Kestvus_min integer  NOT NULL,
    Tunnihind decimal(10,2)  NOT NULL,
    Kirjeldus varchar(255)  NULL,
    CONSTRAINT Kategooria_pk PRIMARY KEY  (KategooriaID)
);

-- Table: KliendiArve
CREATE TABLE KliendiArve (
    KliendiArveID integer  NOT NULL,
    RemonditooID integer  NOT NULL,
    ArveStaatusID integer  NOT NULL,
    Kuupaev date  NOT NULL,
    Maksetahtaeg date  NULL,
    CONSTRAINT KliendiArve_RemonditooID_uk UNIQUE (RemonditooID),
    CONSTRAINT KliendiArve_pk PRIMARY KEY  (KliendiArveID)
);

-- Table: Klient
CREATE TABLE Klient (
    KlientID integer  NOT NULL,
    Eesnimi varchar(50)  NOT NULL,
    Perekonnanimi varchar(50)  NOT NULL,
    Email varchar(100)  NULL,
    Telefon varchar(20)  NULL,
    CONSTRAINT Klient_pk PRIMARY KEY  (KlientID)
);

-- Table: KlientAuto
CREATE TABLE KlientAuto (
    KlientAutoID integer  NOT NULL,
    KlientID integer  NOT NULL,
    AutoID integer  NOT NULL,
    Alguskuupaev date  NOT NULL,
    Loppkuupaev date  NULL,
    CONSTRAINT KlientAuto_pk PRIMARY KEY  (KlientAutoID)
);

-- Table: Ladu
CREATE TABLE Ladu (
    LaduID integer  NOT NULL,
    Nimetus varchar(100)  NOT NULL,
    Aadress varchar(100)  NULL,
    CONSTRAINT Ladu_pk PRIMARY KEY  (LaduID)
);

-- Table: LaduVaruosa
CREATE TABLE LaduVaruosa (
    LaduVaruosaID integer  NOT NULL,
    LaduID integer  NOT NULL,
    VaruosaID integer  NOT NULL,
    Kogus integer  NOT NULL,
    CONSTRAINT LaduVaruosa_pk PRIMARY KEY  (LaduVaruosaID)
);

-- Table: Makse
CREATE TABLE Makse (
    MakseID integer  NOT NULL,
    KliendiArveID integer  NOT NULL,
    Kuupaev date  NOT NULL,
    Summa decimal(10,2)  NOT NULL,
    Meetod varchar(30)  NOT NULL,
    CONSTRAINT Makse_pk PRIMARY KEY  (MakseID)
);

-- Table: RemondiStaatus
CREATE TABLE RemondiStaatus (
    StaatusID integer  NOT NULL,
    Nimetus varchar(100)  NOT NULL,
    CONSTRAINT RemondiStaatus_Nimetus_uk UNIQUE (Nimetus),
    CONSTRAINT RemondiStaatus_pk PRIMARY KEY  (StaatusID)
);

-- Table: Remonditoo
CREATE TABLE Remonditoo (
    RemonditooID integer  NOT NULL,
    AutoID integer  NOT NULL,
    KlientID integer  NOT NULL,
    KategooriaID integer  NOT NULL,
    StaatusID integer  NOT NULL,
    Alguskuupaev date  NOT NULL,
    Loppkuupaev date  NULL,
    Kirjeldus varchar(255)  NULL,
    CONSTRAINT Remonditoo_pk PRIMARY KEY  (RemonditooID)
);

-- Table: Tarnija
CREATE TABLE Tarnija (
    TarnijaID integer  NOT NULL,
    Nimetus varchar(100)  NOT NULL,
    Kontakt varchar(100)  NULL,
    Aadress varchar(100)  NULL,
    CONSTRAINT Tarnija_pk PRIMARY KEY  (TarnijaID)
);

-- Table: TarnijaVaruosa
CREATE TABLE TarnijaVaruosa (
    TarnijaVaruosaID integer  NOT NULL,
    VaruosaID integer  NOT NULL,
    TarnijaID integer  NOT NULL,
    Ostuhind decimal(10,2)  NOT NULL,
    CONSTRAINT TarnijaVaruosa_pk PRIMARY KEY  (TarnijaVaruosaID)
);

-- Table: Tootaja
CREATE TABLE Tootaja (
    TootajaID integer  NOT NULL,
    Eesnimi varchar(50)  NOT NULL,
    Perekonnanimi varchar(50)  NOT NULL,
    Isikukood varchar(11)  NOT NULL,
    Telefon varchar(20)  NULL,
    CONSTRAINT Tootaja_Isikukood_uk UNIQUE (Isikukood),
    CONSTRAINT Tootaja_pk PRIMARY KEY  (TootajaID)
);

-- Table: TootajaAmetikoht
CREATE TABLE TootajaAmetikoht (
    TootajaAmetikohtID integer  NOT NULL,
    TootajaID integer  NOT NULL,
    AmetikohtID integer  NOT NULL,
    Alguskuupaev date  NOT NULL,
    Loppkuupaev date  NULL,
    CONSTRAINT TootajaAmetikoht_pk PRIMARY KEY  (TootajaAmetikohtID)
);

-- Table: TootajaRemont
CREATE TABLE TootajaRemont (
    TootajaRemontID integer  NOT NULL,
    TootajaID integer  NOT NULL,
    RemonditooID integer  NOT NULL,
    Tunnid decimal(6,2)  NOT NULL,
    CONSTRAINT TootajaRemont_pk PRIMARY KEY  (TootajaRemontID)
);

-- Table: Varuosa
CREATE TABLE Varuosa (
    VaruosaID integer  NOT NULL,
    Varuosakood varchar(30)  NOT NULL,
    Nimetus varchar(100)  NOT NULL,
    Tootja varchar(50)  NOT NULL,
    Muugihind decimal(10,2)  NOT NULL,
    CONSTRAINT Varuosa_Varuosakood_uk UNIQUE (Varuosakood),
    CONSTRAINT Varuosa_pk PRIMARY KEY  (VaruosaID)
);

-- Table: VaruosaRemondis
CREATE TABLE VaruosaRemondis (
    VaruosaRemondisID integer  NOT NULL,
    LaduVaruosaID integer  NOT NULL,
    RemonditooID integer  NOT NULL,
    Kogus integer  NOT NULL,
    Uhikuhind decimal(10,2)  NOT NULL,
    CONSTRAINT VaruosaRemondis_pk PRIMARY KEY  (VaruosaRemondisID)
);

-- foreign keys
-- Reference: Auto_MudelID_fk (table: Auto)
ALTER TABLE Auto ADD CONSTRAINT Auto_MudelID_fk
    FOREIGN KEY (MudelID)
    REFERENCES AutoMudel (MudelID);

-- Reference: KliendiArve_ArveStaatusID_fk (table: KliendiArve)
ALTER TABLE KliendiArve ADD CONSTRAINT KliendiArve_ArveStaatusID_fk
    FOREIGN KEY (ArveStaatusID)
    REFERENCES ArveStaatus (ArveStaatusID);

-- Reference: KliendiArve_RemonditooID_fk (table: KliendiArve)
ALTER TABLE KliendiArve ADD CONSTRAINT KliendiArve_RemonditooID_fk
    FOREIGN KEY (RemonditooID)
    REFERENCES Remonditoo (RemonditooID);

-- Reference: KlientAuto_AutoID_fk (table: KlientAuto)
ALTER TABLE KlientAuto ADD CONSTRAINT KlientAuto_AutoID_fk
    FOREIGN KEY (AutoID)
    REFERENCES Auto (AutoID);

-- Reference: KlientAuto_KlientID_fk (table: KlientAuto)
ALTER TABLE KlientAuto ADD CONSTRAINT KlientAuto_KlientID_fk
    FOREIGN KEY (KlientID)
    REFERENCES Klient (KlientID);

-- Reference: LaduVaruosa_LaduID_fk (table: LaduVaruosa)
ALTER TABLE LaduVaruosa ADD CONSTRAINT LaduVaruosa_LaduID_fk
    FOREIGN KEY (LaduID)
    REFERENCES Ladu (LaduID);

-- Reference: LaduVaruosa_VaruosaID_fk (table: LaduVaruosa)
ALTER TABLE LaduVaruosa ADD CONSTRAINT LaduVaruosa_VaruosaID_fk
    FOREIGN KEY (VaruosaID)
    REFERENCES Varuosa (VaruosaID);

-- Reference: Makse_KliendiArveID_fk (table: Makse)
ALTER TABLE Makse ADD CONSTRAINT Makse_KliendiArveID_fk
    FOREIGN KEY (KliendiArveID)
    REFERENCES KliendiArve (KliendiArveID);

-- Reference: Remonditoo_AutoID_fk (table: Remonditoo)
ALTER TABLE Remonditoo ADD CONSTRAINT Remonditoo_AutoID_fk
    FOREIGN KEY (AutoID)
    REFERENCES Auto (AutoID);

-- Reference: Remonditoo_KategooriaID_fk (table: Remonditoo)
ALTER TABLE Remonditoo ADD CONSTRAINT Remonditoo_KategooriaID_fk
    FOREIGN KEY (KategooriaID)
    REFERENCES Kategooria (KategooriaID);

-- Reference: Remonditoo_KlientID_fk (table: Remonditoo)
ALTER TABLE Remonditoo ADD CONSTRAINT Remonditoo_KlientID_fk
    FOREIGN KEY (KlientID)
    REFERENCES Klient (KlientID);

-- Reference: Remonditoo_StaatusID_fk (table: Remonditoo)
ALTER TABLE Remonditoo ADD CONSTRAINT Remonditoo_StaatusID_fk
    FOREIGN KEY (StaatusID)
    REFERENCES RemondiStaatus (StaatusID);

-- Reference: TarnijaVaruosa_TarnijaID_fk (table: TarnijaVaruosa)
ALTER TABLE TarnijaVaruosa ADD CONSTRAINT TarnijaVaruosa_TarnijaID_fk
    FOREIGN KEY (TarnijaID)
    REFERENCES Tarnija (TarnijaID);

-- Reference: TarnijaVaruosa_VaruosaID_fk (table: TarnijaVaruosa)
ALTER TABLE TarnijaVaruosa ADD CONSTRAINT TarnijaVaruosa_VaruosaID_fk
    FOREIGN KEY (VaruosaID)
    REFERENCES Varuosa (VaruosaID);

-- Reference: TootajaAmetikoht_AmetikohtID_fk (table: TootajaAmetikoht)
ALTER TABLE TootajaAmetikoht ADD CONSTRAINT TootajaAmetikoht_AmetikohtID_fk
    FOREIGN KEY (AmetikohtID)
    REFERENCES Ametikoht (AmetikohtID);

-- Reference: TootajaAmetikoht_TootajaID_fk (table: TootajaAmetikoht)
ALTER TABLE TootajaAmetikoht ADD CONSTRAINT TootajaAmetikoht_TootajaID_fk
    FOREIGN KEY (TootajaID)
    REFERENCES Tootaja (TootajaID);

-- Reference: TootajaRemont_RemonditooID_fk (table: TootajaRemont)
ALTER TABLE TootajaRemont ADD CONSTRAINT TootajaRemont_RemonditooID_fk
    FOREIGN KEY (RemonditooID)
    REFERENCES Remonditoo (RemonditooID);

-- Reference: TootajaRemont_TootajaID_fk (table: TootajaRemont)
ALTER TABLE TootajaRemont ADD CONSTRAINT TootajaRemont_TootajaID_fk
    FOREIGN KEY (TootajaID)
    REFERENCES Tootaja (TootajaID);

-- Reference: VaruosaRemondis_LaduVaruosaID_fk (table: VaruosaRemondis)
ALTER TABLE VaruosaRemondis ADD CONSTRAINT VaruosaRemondis_LaduVaruosaID_fk
    FOREIGN KEY (LaduVaruosaID)
    REFERENCES LaduVaruosa (LaduVaruosaID);

-- Reference: VaruosaRemondis_RemonditooID_fk (table: VaruosaRemondis)
ALTER TABLE VaruosaRemondis ADD CONSTRAINT VaruosaRemondis_RemonditooID_fk
    FOREIGN KEY (RemonditooID)
    REFERENCES Remonditoo (RemonditooID);

-- End of file.

-- 1. Справочник должностей (Ametikoht)
INSERT INTO Ametikoht (AmetikohtID, Nimetus) VALUES
(1, 'Meister'),
(2, 'Mehaanik'),
(3, 'Diagnostik'),
(4, 'Vastuvõtja');

-- 2. Статусы счетов (ArveStaatus)
INSERT INTO ArveStaatus (ArveStaatusID, Nimetus) VALUES
(1, 'Ootel'),
(2, 'Makstud'),
(3, 'Tühistatud');

-- 3. Статусы ремонта (RemondiStaatus)
INSERT INTO RemondiStaatus (StaatusID, Nimetus) VALUES
(1, 'Ootel'),
(2, 'Töös'),
(3, 'Lõpetatud'),
(4, 'Tühistatud');

-- 4. Марки и модели авто (AutoMudel)
INSERT INTO AutoMudel (MudelID, Mark, Mudel) VALUES
(1, 'Toyota', 'Corolla'),
(2, 'Volkswagen', 'Passat'),
(3, 'BMW', '530d'),
(4, 'Audi', 'A6');

-- 5. Автомобили (Auto)
INSERT INTO Auto (AutoID, MudelID, RegNr, VIN, Valmistamisaasta) VALUES
(1, 1, '123ABC', 'VNK32100098765432', 2018),
(2, 2, '456DEF', 'WVWZZZ3CZWE001122', 2015),
(3, 3, '789GHI', 'WBA530D0001122334', 2020);

-- 6. Клиенты (Klient)
INSERT INTO Klient (KlientID, Eesnimi, Perekonnanimi, Email, Telefon) VALUES
(1, 'Jaan', 'Tamm', 'jaan.tamm@example.ee', '+37255123456'),
(2, 'Mari', 'Maasik', 'mari.maasik@example.ee', '+37255987654'),
(3, 'Jüri', 'Kask', 'juri.kask@example.ee', '+37255112233');

-- 7. Связь клиентов и автомобилей (KlientAuto)
INSERT INTO KlientAuto (KlientAutoID, KlientID, AutoID, Alguskuupaev, Loppkuupaev) VALUES
(1, 1, 1, '2022-01-15', NULL),
(2, 2, 2, '2021-05-10', NULL),
(3, 3, 3, '2023-03-01', NULL);

-- 8. Категории ремонтных работ (Kategooria)
INSERT INTO Kategooria (KategooriaID, Nimetus, Kestvus_min, Tunnihind, Kirjeldus) VALUES
(1, 'Õlivahetus', 45, 50.00, 'Mootoriõli ja filtri vahetus'),
(2, 'Pidurite remont', 120, 60.00, 'Pidurikatete ja -ketaste vahetus'),
(3, 'Rehvide vahetus', 30, 40.00, 'Täisrehvide vahetus ja tasakaalustus'),
(4, 'Mootori remont', 240, 75.00, 'Mootori põhiosade diagnostika ja remont'),
(5, 'Diagnostika', 60, 65.00, 'Arvutidiagnostika ja vigade tuvastamine');

-- 9. Сотрудники (Tootaja)
INSERT INTO Tootaja (TootajaID, Eesnimi, Perekonnanimi, Isikukood, Telefon) VALUES
(1, 'Mihkel', 'Sepp', '38505120111', '+3725011111'),
(2, 'Andres', 'Kallas', '39008200222', '+3725022222'),
(3, 'Karl', 'Kuusk', '39511300333', '+3725033333');

-- 10. История должностей сотрудников (TootajaAmetikoht)
INSERT INTO TootajaAmetikoht (TootajaAmetikohtID, TootajaID, AmetikohtID, Alguskuupaev, Loppkuupaev) VALUES
(1, 1, 1, '2020-01-01', NULL), -- Mihkel (Meister)
(2, 2, 2, '2021-03-15', NULL), -- Andres (Mehaanik)
(3, 3, 3, '2022-06-01', NULL); -- Karl (Diagnostik)

-- 11. Склады (Ladu)
INSERT INTO Ladu (LaduID, Nimetus, Aadress) VALUES
(1, 'Põhiladu', 'Pärnu mnt 100, Tallinn'),
(2, 'Varuladu', 'Tartu mnt 50, Tallinn');

-- 12. Запчасти (Varuosa)
INSERT INTO Varuosa (VaruosaID, Varuosakood, Nimetus, Tootja, Muugihind) VALUES
(1, 'OIL-5W30-4L', 'Mootoriõli 5W30 4L', 'Castrol', 45.00),
(2, 'OF-101', 'Õlifilter', 'Mann-Filter', 12.00),
(3, 'BP-202', 'Piduriklotsid esimesed', 'Brembo', 65.00),
(4, 'BD-303', 'Piduriketas', 'Bosch', 85.00);

-- 13. Наличие запчастей на складе (LaduVaruosa)
INSERT INTO LaduVaruosa (LaduVaruosaID, LaduID, VaruosaID, Kogus) VALUES
(1, 1, 1, 20),
(2, 1, 2, 35),
(3, 1, 3, 10),
(4, 1, 4, 8);

-- 14. Поставщики (Tarnija)
INSERT INTO Tarnija (TarnijaID, Nimetus, Kontakt, Aadress) VALUES
(1, 'AutoEkspert OÜ', 'info@autoekspert.ee', 'Kadaka tee 1, Tallinn'),
(2, 'Inter Cars Eesti OÜ', 'tellimused@intercars.ee', 'Peterburi tee 4, Tallinn');

-- 15. Цены поставщиков на запчасти (TarnijaVaruosa)
INSERT INTO TarnijaVaruosa (TarnijaVaruosaID, VaruosaID, TarnijaID, Ostuhind) VALUES
(1, 1, 1, 28.00),
(2, 2, 1, 6.50),
(3, 3, 2, 42.00),
(4, 4, 2, 55.00);

-- 16. Ремонтные работы (Remonditoo)
INSERT INTO Remonditoo (RemonditooID, AutoID, KlientID, KategooriaID, StaatusID, Alguskuupaev, Loppkuupaev, Kirjeldus) VALUES
(1, 1, 1, 1, 3, '2026-09-20', '2026-09-20', 'Korraline õlivahetus ja filtri vahetus'),
(2, 2, 2, 2, 3, '2026-09-25', '2026-09-25', 'Esimeste piduriklotside ja -ketaste vahetus'),
(3, 3, 3, 5, 2, '2026-10-01', NULL, 'Mootori tule märgutuli põleb, vajab kontrolli');

-- 17. Участие сотрудников в ремонте (TootajaRemont)
INSERT INTO TootajaRemont (TootajaRemontID, TootajaID, RemonditooID, Tunnid) VALUES
(1, 2, 1, 1.00), -- Andres сделал õlivahetus
(2, 2, 2, 2.50), -- Andres сделал pidurite remont
(3, 3, 3, 1.50); -- Karl делает diagnostika

-- 18. Использованные запчасти в ремонте (VaruosaRemondis)
INSERT INTO VaruosaRemondis (VaruosaRemondisID, LaduVaruosaID, RemonditooID, Kogus, Uhikuhind) VALUES
(1, 1, 1, 1, 45.00), -- Õli
(2, 2, 1, 1, 12.00), -- Õlifilter
(3, 3, 2, 1, 65.00), -- Piduriklotsid
(4, 4, 2, 2, 85.00); -- Pidurikettad (2 tk)

-- 19. Счета клиентам (KliendiArve)
INSERT INTO KliendiArve (KliendiArveID, RemonditooID, ArveStaatusID, Kuupaev, Maksetahtaeg) VALUES
(1, 1, 2, '2026-09-20', '2026-10-04'),
(2, 2, 1, '2026-09-25', '2026-10-09');

-- 20. Оплаты по счетам (Makse)
INSERT INTO Makse (MakseID, KliendiArveID, Kuupaev, Summa, Meetod) VALUES
(1, 1, '2026-09-21', 107.00, 'Pangaülekanne'); -- (50€ töö + 45€ õli + 12€ filter)

