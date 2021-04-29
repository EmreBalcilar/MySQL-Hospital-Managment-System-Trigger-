Create schema ozelHastane;

use ozelHastane;

CREATE TABLE doktorlar
(
`doktorID` int(11) NOT NULL AUTO_INCREMENT,
  `kullaniciAdi` varchar(11) NOT NULL,
  `Sifre` varchar(255) DEFAULT NULL,
  `doktorAdiSoyadi` varchar(255) DEFAULT NULL,
  `klinikID` int(11) DEFAULT NULL,
  PRIMARY KEY (`doktorID`),
  CONSTRAINT `klinikID` FOREIGN KEY (`klinikID`) REFERENCES `klinikler` (`klinikID`)
  ) ;
  
  CREATE TABLE doktorlar_log
(
`doktorID` int(11) ,
`kullaniciAdi` varchar(11) ,
`Sifre` varchar(255) ,
`doktorAdiSoyadi` varchar(255)  ,
`klinikID` int(11) ,
log_islem VARCHAR(30),
log_tarih VARCHAR(20)
);

DELIMITER //
CREATE TRIGGER doktor_eklendi_Before BEFORE INSERT
ON doktorlar
FOR EACH ROW
BEGIN
  INSERT INTO 
 doktorlar_log 
 (doktorID, kullaniciAdi, Sifre, doktorAdiSoyadi, klinikID,log_islem, log_tarih)
 VALUES 
 (NEW.doktorID, NEW.kullaniciAdi, NEW.Sifre, NEW.doktorAdiSoyadi, NEW.klinikID,'ÖNCE', NOW());

END//
DELIMITER ;

DELIMITER //
CREATE TRIGGER doktor_before_delete BEFORE DELETE
ON doktorlar
FOR EACH ROW
BEGIN
  INSERT INTO 
 doktorlar_log 
 (doktorID, kullaniciAdi, Sifre, doktorAdiSoyadi, klinikID,log_islem, log_tarih)
 VALUES 
 (OLD.doktorID, OLD.kullaniciAdi, OLD.Sifre, OLD.doktorAdiSoyadi, OLD.klinikID,'DELETE ÖNCE', NOW());

END//
DELIMITER ;

DELIMITER //
CREATE TRIGGER doktor_eklendi_After AFTER INSERT
ON doktorlar
FOR EACH ROW
BEGIN
  INSERT INTO 
 doktorlar_log 
 (doktorID, kullaniciAdi, Sifre, doktorAdiSoyadi, klinikID,log_islem, log_tarih)
 VALUES 
 (NEW.doktorID, NEW.kullaniciAdi, NEW.Sifre, NEW.doktorAdiSoyadi, NEW.klinikID,'İNSERT SONRA', NOW());

END//
DELIMITER ;

DELIMITER //
CREATE TRIGGER doktor_Update_Before BEFORE UPDATE
ON doktorlar
FOR EACH ROW
BEGIN
  INSERT INTO 
 doktorlar_log 
 (doktorID, kullaniciAdi, Sifre, doktorAdiSoyadi, klinikID,log_islem, log_tarih)
 VALUES 
 (OLD.doktorID, OLD.kullaniciAdi, OLD.Sifre, OLD.doktorAdiSoyadi, OLD.klinikID,'UPDATE ÖNCE', NOW());

END//
DELIMITER ;



DELIMITER //
CREATE TRIGGER doktor_Update_After AFTER UPDATE
ON doktorlar
FOR EACH ROW
BEGIN
  INSERT INTO 
 doktorlar_log 
 (doktorID, kullaniciAdi, Sifre, doktorAdiSoyadi, klinikID,log_islem, log_tarih)
 VALUES 
 (NEW.doktorID, NEW.kullaniciAdi, NEW.Sifre, NEW.doktorAdiSoyadi, NEW.klinikID,'UPDATE SONRA', NOW());

END//
DELIMITER ;

INSERT INTO `doktorlar` VALUES ('1', 'Hasan', '123', 'Hasan Namık', '1');
  INSERT INTO `doktorlar` VALUES ('2', 'Elif ', '123', 'Elif Turan', '2');
  INSERT INTO `doktorlar` VALUES ('3', 'Suna', '1234', 'Suna Can', '3');
  INSERT INTO `doktorlar` VALUES ('4', 'Gökhan', '123', 'Gökhan Bilgili', '4');
  INSERT INTO `doktorlar` VALUES ('5', 'Murat', '1234', 'Murat Can', '5');
  INSERT INTO `doktorlar` VALUES ('6', 'Seda', '123', 'Seda Sayan', '6');
  INSERT INTO `doktorlar` VALUES ('7', 'Yusuf', '123', 'Yusuf Serezli', '7');
  INSERT INTO `doktorlar` VALUES ('8', 'Selma', '123', 'Selma Filiz', '8');
  INSERT INTO `doktorlar` VALUES ('9', 'Eren', '123', 'Eren Korkmaz', '9');
  INSERT INTO `doktorlar` VALUES ('10', 'Cansu', '123', 'Cansu Bakar', '10');
  UPDATE doktorlar SET doktorAdiSoyadi = "Cansu CANAN" WHERE doktorID = 10;
  INSERT INTO `doktorlar` VALUES ('11', 'Didem', '123', 'Didem Tevek', '11');
  INSERT INTO `doktorlar` VALUES ('12', 'Emre', '123', 'Emre Şimşek', '12');
  INSERT INTO `doktorlar` VALUES ('13', 'Abdullah', '123', 'Abulldah Türk', '13');
  INSERT INTO `doktorlar` VALUES ('14', 'Acun', '123', 'Acun Pirdal', '14');
  INSERT INTO `doktorlar` VALUES ('15', 'Zeynep', '123', 'Zeynep Uzun', '15');
  INSERT INTO `doktorlar` VALUES ('15', 'Zeynep', '123', 'Zeynep Uzun', '15');
  INSERT INTO `doktorlar` VALUES ('16', 'Hasan', '123', 'Hasan Uzun', '16');
  set foreign_key_checks = 1;
  
  CREATE TABLE hemsireler (
  hemsireID int(11) NOT NULL AUTO_INCREMENT,
  kullaniciAdi varchar(11) NOT NULL,
  Sifre varchar(255) DEFAULT NULL,
  hemsireadsoyad varchar(255) DEFAULT NULL,
  klinikID int(11) DEFAULT NULL,
  PRIMARY KEY (`hemsireID`)
  ) ;
  
  CREATE TABLE hemsireler_log (
  hemsireID int(11) ,
  kullaniciAdi varchar(11) ,
  Sifre varchar(255) ,
  hemsireadsoyad varchar(255) ,
  klinikID int(11) ,
  log_islem VARCHAR(30),
  log_tarih VARCHAR(20)
  ) ;
  DELIMITER //
CREATE TRIGGER hemsire_eklendi_before BEFORE INSERT
ON hemsireler
FOR EACH ROW
BEGIN
  INSERT INTO 
 hemsireler_log 
 (hemsireID, kullaniciAdi, Sifre, hemsireadsoyad, klinikID,log_islem, log_tarih)
 VALUES 
 (NEW.hemsireID, NEW.kullaniciAdi, NEW.Sifre, NEW.hemsireadsoyad, NEW.klinikID,'ÖNCE', NOW());

END//
DELIMITER ;

DELIMITER //
CREATE TRIGGER delete_hemsire BEFORE DELETE
ON hemsireler
FOR EACH ROW
BEGIN
  INSERT INTO 
 hemsireler_log 
 (hemsireID, kullaniciAdi, Sifre, hemsireadsoyad, klinikID,log_islem, log_tarih)
 VALUES 
 (OLD.hemsireID, OLD.kullaniciAdi, OLD.Sifre, OLD.hemsireadsoyad, OLD.klinikID,'DELETE ÖNCESİ', NOW());

END//
DELIMITER ;


  DELIMITER //
CREATE TRIGGER hemsire_eklendi_after AFTER INSERT
ON hemsireler
FOR EACH ROW
BEGIN
  INSERT INTO 
 hemsireler_log 
 (hemsireID, kullaniciAdi, Sifre, hemsireadsoyad, klinikID,log_islem, log_tarih)
 VALUES 
 (NEW.hemsireID, NEW.kullaniciAdi, NEW.Sifre, NEW.hemsireadsoyad, NEW.klinikID,'İNSERT SONRA', NOW());

END//
DELIMITER ;

  DELIMITER //
CREATE TRIGGER hemsire_Update_Before BEFORE UPDATE
ON hemsireler
FOR EACH ROW
BEGIN
  INSERT INTO 
 hemsireler_log 
 (hemsireID, kullaniciAdi, Sifre, hemsireadsoyad, klinikID,log_islem, log_tarih)
 VALUES 
 (OLD.hemsireID, OLD.kullaniciAdi, OLD.Sifre, OLD.hemsireadsoyad, OLD.klinikID,'UPDATE ÖNCE', NOW());

END//
DELIMITER ;



  DELIMITER //
CREATE TRIGGER hemsire_Update_After AFTEr UPDATE
ON hemsireler
FOR EACH ROW
BEGIN
  INSERT INTO 
 hemsireler_log 
 (hemsireID, kullaniciAdi, Sifre, hemsireadsoyad, klinikID,log_islem, log_tarih)
 VALUES 
 (NEW.hemsireID, NEW.kullaniciAdi, NEW.Sifre, NEW.hemsireadsoyad, NEW.klinikID,'UPDATE SONRA', NOW());

END//
DELIMITER ;

INSERT INTO `hemsireler` VALUES ('1', 'Ali', '123', 'Ali Ergün', '1');
  INSERT INTO `hemsireler` VALUES ('2', 'Sedef ', '123', 'Sedef Yılmaz', '2');
  INSERT INTO `hemsireler` VALUES ('3', 'Vildan', '1234', 'Vildan Bıkkın', '3');
  INSERT INTO `hemsireler` VALUES ('4', 'Remzi', '123', 'Remzi Sıkılmış', '4');
  INSERT INTO `hemsireler` VALUES ('5', 'Ceylan', '1234', 'Ceylan Yenidünya', '5');
  INSERT INTO `hemsireler` VALUES ('6', 'Turgut', '123', 'Turgut Manço', '6');
  INSERT INTO `hemsireler` VALUES ('7', 'Halil', '123', 'Halil ibo', '7');
  INSERT INTO `hemsireler` VALUES ('8', 'Dilaver', '123', 'Dilaver Ek', '8');
  INSERT INTO `hemsireler` VALUES ('9', 'Dündar', '123', 'Dündar Uğur', '9');
  INSERT INTO `hemsireler` VALUES ('10', 'Cem', '123', 'Cem Kaşıkçı', '10');
  INSERT INTO `hemsireler` VALUES ('11', 'Didem', '123', 'Didem Yılmaz', '11');
  INSERT INTO `hemsireler` VALUES ('12', 'Selin', '123', 'Selin Şimşek', '12');
  INSERT INTO `hemsireler` VALUES ('13', 'Selin', '123', 'Selin Okumuş', '13');
  INSERT INTO `hemsireler` VALUES ('14', 'Dündar', '123', 'Dündar Ak', '14');
  INSERT INTO `hemsireler` VALUES ('15', 'Kübra', '123', 'Kübra Kandal', '15');
  
  
  CREATE TABLE hastalar (
  TC varchar(45) NOT NULL,
  adi varchar(45) DEFAULT NULL,
  soyadi varchar(45) DEFAULT NULL,
  Cinsiyeti varchar(50) DEFAULT NULL,
  DogumYeri varchar(45) DEFAULT NULL,
  DogumTarihi varchar(45) DEFAULT NULL,
  babaAdi varchar(45) DEFAULT NULL,
  anneAdi varchar(45) DEFAULT NULL,
  CepTel varchar(45) DEFAULT NULL,
  Eposta varchar(45) DEFAULT NULL,
  PRIMARY KEY (`TC`)
) ;
  CREATE TABLE hastalar_log (
  TC varchar(45) ,
  adi varchar(45) ,
  soyadi varchar(45) ,
  Cinsiyeti varchar(50) ,
  DogumYeri varchar(45) ,
  DogumTarihi varchar(45) ,
  babaAdi varchar(45) ,
  anneAdi varchar(45) ,
  CepTel varchar(45) ,
  Eposta varchar(45),
  log_islem VARCHAR(30),
  log_tarih VARCHAR(20)
) ;

show triggers;
DELIMITER //
CREATE TRIGGER hastalar_insert_after AFTER INSERT
ON hastalar
FOR EACH ROW
BEGIN
  INSERT INTO 
 hastalar_log 
 (TC, adi, soyadi, Cinsiyeti, DogumYeri,DogumTarihi,babaAdi,anneAdi,CepTel,Eposta,log_islem, log_tarih)
 VALUES 
 (NEW.TC, NEW.adi, NEW.soyadi, NEW.Cinsiyeti, NEW.DogumYeri,NEW.DogumTarihi,NEW.babaAdi,NEW.anneAdi,NEW.CepTel,NEW.Eposta,'İNSERT SONRASI', NOW());
END//
DELIMITER ;

DELIMITER //
CREATE TRIGGER delete_hastalar BEFORE DELETE
ON hastalar
FOR EACH ROW
BEGIN
  INSERT INTO 
 hastalar_log 
 (TC, adi, soyadi, Cinsiyeti, DogumYeri,DogumTarihi,babaAdi,anneAdi,CepTel,Eposta,log_islem, log_tarih)
 VALUES 
 (OLD.TC, OLD.adi, OLD.soyadi, OLD.Cinsiyeti, OLD.DogumYeri,OLD.DogumTarihi,OLD.babaAdi,OLD.anneAdi,OLD.CepTel,OLD.Eposta,'DELETE ÖNCESİ', NOW());
END//
DELIMITER ;

DELIMITER //
CREATE TRIGGER hastalar_UPDATE_BEFORE BEFORE UPDATE
ON hastalar
FOR EACH ROW
BEGIN
  INSERT INTO 
 hastalar_log 
 (TC, adi, soyadi, Cinsiyeti, DogumYeri,DogumTarihi,babaAdi,anneAdi,CepTel,Eposta,log_islem, log_tarih)
 VALUES 
 (OLD.TC, OLD.adi, OLD.soyadi, OLD.Cinsiyeti, OLD.DogumYeri,OLD.DogumTarihi,OLD.babaAdi,OLD.anneAdi,OLD.CepTel,OLD.Eposta,'UPDATE ÖNCESİ', NOW());
END//
DELIMITER ;



DELIMITER //
CREATE TRIGGER hastalar_UPDATE_AFTER AFTER UPDATE
ON hastalar
FOR EACH ROW
BEGIN
  INSERT INTO 
 hastalar_log 
 (TC, adi, soyadi, Cinsiyeti, DogumYeri,DogumTarihi,babaAdi,anneAdi,CepTel,Eposta,log_islem, log_tarih)
 VALUES 
 (NEW.TC, NEW.adi, NEW.soyadi, NEW.Cinsiyeti, NEW.DogumYeri,NEW.DogumTarihi,NEW.babaAdi,NEW.anneAdi,NEW.CepTel,NEW.Eposta,'UPDATE SONRASI', NOW());
END//
DELIMITER ;

INSERT INTO `hastalar` VALUES ('87293536052', 'Deniz', 'Kara', 'Kadın', 'Ümraniye', '17.12.1990', 'Hakkı', 'İlknur', '05558451525', 'denizkara@gmail.com');
 INSERT INTO `hastalar` VALUES ('90839722137 ', 'Beliz', 'Şimşek', 'Kadın', 'Göktürk', '17.12.1995', 'Halil ', 'Simge', '053555992719', 'belizsimsek@gmail.com');
 INSERT INTO `hastalar` VALUES ('46663019597 ', 'Ece ', 'Babaoğlu ', 'Kadın', 'Kütahya', '17.12.2001', 'Şerif', 'Selma', '053555452719', 'ecebabaoglu@gmail.com');
 INSERT INTO `hastalar` VALUES ('66187685029 ', 'Ümran', 'Doğan', 'Kadın', 'Kayseri', '17.12.1997', 'Emre', 'Ece', '050555140047', '@gmail.com');
 INSERT INTO `hastalar` VALUES ('49139808860 ', 'Aras', 'Karadere', 'Erkek', 'Kayseri', '17.12.1990', 'Tahsin', 'Simge', '055555041590', '@gmail.com');
 INSERT INTO `hastalar` VALUES ('75881869397 ', 'Ege', 'Kıraç', 'Erkek', 'Kayseri', '17.12.1990', 'Güney', 'Ece', '050555037940', 'guneyek@gmail.com');
 INSERT INTO `hastalar` VALUES ('98180326996 ', 'Utku', 'Süleyman', 'Erkek', 'Sivas', '17.12.1990', 'Yasin', 'Cebir', '055555284088', 'utkusu@gmail.com');
 INSERT INTO `hastalar` VALUES ('29703373050 ', 'Batuhan', 'Mustafa', 'Erkek', 'Çorum', '17.12.1990', 'Mustafa', 'Nokta', '054555189491', 'batuhanmmm@gmail.com');
 INSERT INTO `hastalar` VALUES ('79275837272 ', 'Batuhan', 'Okumuş', 'Erkek', 'İstanbul', '17.12.1990', 'Kerem', 'Gülnur', '050555980876', 'okumusbatu@gmail.com');
 INSERT INTO `hastalar` VALUES ('58575625645 ', 'Albert', 'Gonzales', 'Erkek', 'İspanya', '17.12.1990', 'Gustavo', 'Sashadika', '054555603322', 'albertgace@gmail.com');
 INSERT INTO `hastalar` VALUES ('42410087193 ', 'Zehra', 'Yılmaz', 'Kadın', 'Giresun', '17.12.1990', 'Hasan', 'Elif', '050555770604', 'zehhrasyy@gmail.com');
 INSERT INTO `hastalar` VALUES ('43859441769 ', 'İlayda', 'Kandal', 'Kadın', 'Romania', '17.12.1990', 'Aykut', 'Nadia', '053555196456', 'ilaydakkks@gmail.com');
 INSERT INTO `hastalar` VALUES ('84819393372 ', 'Kübra', 'Şimşek', 'Kadın', 'Rize', '17.12.1998', 'Selim', 'Selma', '055555966752', 'lazkizi@gmail.com');
 INSERT INTO `hastalar` VALUES ('27164963068 ', 'Gamze', 'Şişman', 'Kadın', 'Çorum', '17.12.1990', 'Fatih', 'Fatma', '055555272178', 'gamzezayif@gmail.com');
 INSERT INTO `hastalar` VALUES ('94840160309 ', 'Büşra', 'Çolak', 'Kadın', 'Sakarya', '17.12.1990', 'Hasan', 'Satı', '050555882763', 'busraclk@gmail.com');
  
CREATE TABLE klinikler (
  klinikID int(11) NOT NULL AUTO_INCREMENT,
  klinikAdi varchar(255) DEFAULT NULL,
  PRIMARY KEY (`klinikID`)
) ;

   CREATE TABLE klinikler_log (
  klinikID int(11) ,
  klinikAdi varchar(255),
  log_islem VARCHAR(30),
  log_tarih VARCHAR(20)
) ;

DELIMITER //
CREATE TRIGGER Klinikler_UPDATE_BEFORE BEFORE UPDATE
ON klinikler
FOR EACH ROW
BEGIN
  INSERT INTO 
 klinikler_log 
 (klinikID, klinikAdi, log_islem, log_tarih)
 VALUES 
 (OLD.klinikID, OLD.klinikAdi,'INSERT SONRASI', NOW());
END//
DELIMITER ;



DELIMITER //
CREATE TRIGGER delete_klinikler BEFORE DELETE
ON klinikler
FOR EACH ROW
BEGIN
  INSERT INTO 
 klinikler_log 
 (klinikID, klinikAdi, log_islem, log_tarih)
 VALUES 
 (OLD.klinikID, OLD.klinikAdi,'DELETE ÖNCESİ', NOW());
END//
DELIMITER ;

DELIMITER //
CREATE TRIGGER Klinikler_UPDATE_AFTER AFTER UPDATE
ON klinikler
FOR EACH ROW
BEGIN
  INSERT INTO 
 klinikler_log 
 (klinikID, klinikAdi, log_islem, log_tarih)
 VALUES 
 (NEW.klinikID, NEW.klinikAdi,'INSERT SONRASI', NOW());
END//
DELIMITER ;

INSERT INTO `klinikler` VALUES ('1', 'Çocuk Sağlığı Ve Hastalıkları');
INSERT INTO `klinikler` VALUES ('2', 'Deri Ve Zührevi Hastalıkları (Cildiye)');
INSERT INTO `klinikler` VALUES ('3', 'Enfeksiyon Hastalıkları');
INSERT INTO `klinikler` VALUES ('4', 'Fizik Tedavi Ve Rehabilitasyon');
INSERT INTO `klinikler` VALUES ('5', 'Genel Cerrahi');
INSERT INTO `klinikler` VALUES ('6', 'Göğüs Cerrahisi');
INSERT INTO `klinikler` VALUES ('7', 'İç Hastalıkları (Dahiliye)');
INSERT INTO `klinikler` VALUES ('8', 'Kadın Hastalıkları ve Doğum');
INSERT INTO `klinikler` VALUES ('9', 'Kalp ve Damar Cerrahisi');
INSERT INTO `klinikler` VALUES ('10', 'Kardiyoloji');
INSERT INTO `klinikler` VALUES ('11', 'Kulak Burun Boğaz Hastalıkları');
INSERT INTO `klinikler` VALUES ('12', 'Nöroloji');
INSERT INTO `klinikler` VALUES ('13', 'Ortopedi Ve Travmatoloji');
INSERT INTO `klinikler` VALUES ('14', 'Ruh Sağlığı Ve Hastalıkları (Psikiyatri)');
INSERT INTO `klinikler` VALUES ('15', 'Üroloji');

CREATE TABLE nakiller (
  nakilID int(11) NOT NULL AUTO_INCREMENT,
  nakilTC varchar(255) DEFAULT NULL,
  nakiledilenHastane varchar(255) DEFAULT NULL,
  doktorID int(255) DEFAULT NULL,
  PRIMARY KEY (`nakilID`),
  CONSTRAINT `doktorID` FOREIGN KEY (`doktorID`) REFERENCES `doktorlar` (`doktorID`),
  CONSTRAINT `nakilTC` FOREIGN KEY (`nakilTC`) REFERENCES `hastalar` (`TC`)
) ;
set foreign_key_checks = 1;
INSERT INTO `nakiller` VALUES ('05', '49139808860 ',"Çapa Tıp"," 5");
INSERT INTO `nakiller` VALUES ('04', '75881869397  ',"Medistate"," 7");
INSERT INTO `nakiller` VALUES ('34', '84819393372  ',"Florya"," 11");
CREATE TABLE nakiller_log (
  nakilID int(11) ,
  nakilTC varchar(255) ,
  nakiledilenHastane varchar(255) ,
  doktorID int(255) ,
  log_islem VARCHAR(30),
  log_tarih VARCHAR(20)
) ;

DELIMITER //
CREATE TRIGGER nakil_update_before BEFORE UPDATE
ON nakiller
FOR EACH ROW
BEGIN
  INSERT INTO 
 nakiller_log 
 (nakilID, nakilTC,nakiledilenHastane,doktorID, log_islem, log_tarih)
 VALUES 
 (OLD.nakilID, OLD.nakilTC,OLD.nakiledilenHastane,OLD.doktorID,'UPDATE ÖNCESİ', NOW());
END//
DELIMITER ;



DELIMITER //
CREATE TRIGGER nakil_delete BEFORE DELETE
ON nakiller
FOR EACH ROW
BEGIN
  INSERT INTO 
 nakiller_log 
 (nakilID, nakilTC,nakiledilenHastane,doktorID, log_islem, log_tarih)
 VALUES 
 (OLD.nakilID, OLD.nakilTC,OLD.nakiledilenHastane,OLD.doktorID,'DELETE ÖNCESİ', NOW());
END//
DELIMITER ;


DELIMITER //
CREATE TRIGGER nakil_update_after AFTER UPDATE
ON nakiller
FOR EACH ROW
BEGIN
  INSERT INTO 
 nakiller_log 
 (nakilID, nakilTC,nakiledilenHastane,doktorID, log_islem, log_tarih)
 VALUES 
 (NEW.nakilID, NEW.nakilTC,NEW.nakiledilenHastane,NEW.doktorID,'UPDATE SONRASI', NOW());
END//
DELIMITER ;

DELIMITER //
CREATE TRIGGER nakil_insert_update AFTER INSERT
ON nakiller
FOR EACH ROW
BEGIN
  INSERT INTO 
 nakiller_log 
 (nakilID, nakilTC,nakiledilenHastane,doktorID, log_islem, log_tarih)
 VALUES 
 (NEW.nakilID, NEW.nakilTC,NEW.nakiledilenHastane,NEW.doktorID,'INSERT SONRASI', NOW());
END//
DELIMITER ;


CREATE TABLE yatisverilenler (
  yatisID int(11) NOT NULL AUTO_INCREMENT,
  yatisTarihi varchar(255) DEFAULT NULL,
  yatanTC varchar(255) DEFAULT NULL,
  PRIMARY KEY (`yatisID`),
  CONSTRAINT `yatanTC` FOREIGN KEY (`yatanTC`) REFERENCES `hastalar` (`TC`)
) ;
set foreign_key_checks = 1;
INSERT INTO `yatisverilenler` VALUES (7, '2021-04-19 ',"90839722137 ");
INSERT INTO `yatisverilenler` VALUES (9, '2021-04-25 ',"98180326996  ");
INSERT INTO `yatisverilenler` VALUES (15, '2021-04-01 ',"90839722137  ");
CREATE TABLE yatisverilenler_log (
  yatisID int(11) ,
  yatisTarihi varchar(255) ,
  yatanTC varchar(255) ,
  log_islem VARCHAR(30),
  log_tarih VARCHAR(20)
) ;

DELIMITER //
CREATE TRIGGER yatis_insert AFTER INSERT
ON yatisverilenler
FOR EACH ROW
BEGIN
  INSERT INTO 
 yatisverilenler_log 
 (yatisID, yatisTarihi,yatanTC, log_islem, log_tarih)
 VALUES 
 (NEW.yatisID, NEW.yatisTarihi,NEW.yatanTC,'INSERT SONRASI', NOW());
END//
DELIMITER ;

DELIMITER //
CREATE TRIGGER yatis_delete BEFORE DELETE
ON yatisverilenler
FOR EACH ROW
BEGIN
  INSERT INTO 
 yatisverilenler_log 
 (yatisID, yatisTarihi,yatanTC, log_islem, log_tarih)
 VALUES 
 (OLD.yatisID, OLD.yatisTarihi,OLD.yatanTC,'DELETE ÖNCESİ', NOW());
END//
DELIMITER ;



DELIMITER //
CREATE TRIGGER yatis_before_update BEFORE UPDATE
ON yatisverilenler
FOR EACH ROW
BEGIN
  INSERT INTO 
 yatisverilenler_log 
 (yatisID, yatisTarihi,yatanTC, log_islem, log_tarih)
 VALUES 
 (OLD.yatisID, OLD.yatisTarihi,OLD.yatanTC,'UPDATE ÖNCESİ', NOW());
END//
DELIMITER ;

DELIMITER //
CREATE TRIGGER yatis_after_update AFTER UPDATE
ON yatisverilenler
FOR EACH ROW
BEGIN
  INSERT INTO 
 yatisverilenler_log 
 (yatisID, yatisTarihi,yatanTC, log_islem, log_tarih)
 VALUES 
 (NEW.yatisID, NEW.yatisTarihi,NEW.yatanTC,'UPDATE SONRASI', NOW());
END//
DELIMITER ;

INSERT INTO `yatisverilenler` VALUES ('13', '30.12.2016', '87293536052');


CREATE TABLE randevular (
  randevuID int(11) NOT NULL AUTO_INCREMENT,
  TC varchar(255) DEFAULT NULL,
  klinikID int(255) DEFAULT NULL,
  doktorID int(255) DEFAULT NULL,
  tarih date DEFAULT NULL,
  saat varchar(255) DEFAULT NULL,
  PRIMARY KEY (`randevuID`),
  CONSTRAINT `TC` FOREIGN KEY (`TC`) REFERENCES `hastalar` (`TC`),
  CONSTRAINT `doktor_ID` FOREIGN KEY (`doktorID`) REFERENCES `doktorlar` (`doktorID`),
  CONSTRAINT `klinik_id` FOREIGN KEY (`klinikID`) REFERENCES `klinikler` (`klinikID`)
) ;

CREATE TABLE randevular_log (
  randevuID int(11) ,
  TC varchar(255) ,
  klinikID int(255) ,
  doktorID int(255) ,
  tarih date ,
  saat varchar(255) ,
  log_islem VARCHAR(30),
  log_tarih VARCHAR(20)
) ;

DELIMITER //
CREATE TRIGGER randevular_insert AFTER INSERT
ON randevular
FOR EACH ROW
BEGIN
  INSERT INTO 
 randevular_log 
 (randevuID, TC,klinikID, doktorID,tarih,saat,log_islem, log_tarih)
 VALUES 
 (NEW.randevuID,NEW.TC, NEW.klinikID,NEW.doktorID,NEW.tarih,NEW.saat,'İNSERT SONRASI', NOW());
END//
DELIMITER ;


DELIMITER //
CREATE TRIGGER randevular_before_update BEFORE UPDATE
ON randevular
FOR EACH ROW
BEGIN
  INSERT INTO 
 randevular_log 
 (randevuID, TC,klinikID, doktorID,tarih,saat,log_islem, log_tarih)
 VALUES 
 (OLD.randevuID,OLD.TC, OLD.klinikID,OLD.doktorID,OLD.tarih,OLD.saat,'UPDATE ÖNCESİ', NOW());
END//
DELIMITER ;

DROP TRIGGER randevular_before_update;


DELIMITER //
CREATE TRIGGER randevular_after_Update AFTER UPDATE
ON randevular
FOR EACH ROW
BEGIN
  INSERT INTO 
 randevular_log 
 (randevuID, TC,klinikID, doktorID,tarih,saat,log_islem, log_tarih)
 VALUES 
 (NEW.randevuID,NEW.TC, NEW.klinikID,NEW.doktorID,NEW.tarih,NEW.saat,'UPDATE SONRASI', NOW());
END//
DELIMITER ;

DELIMITER //
CREATE TRIGGER delete_randevular BEFORE DELETE
ON randevular
FOR EACH ROW
BEGIN
  INSERT INTO 
 randevular_log 
 (randevuID, TC,klinikID, doktorID,tarih,saat,log_islem, log_tarih)
 VALUES 
 (OLD.randevuID,OLD.TC, OLD.klinikID,OLD.doktorID,OLD.tarih,OLD.saat,'DELETE ÖNCESİ', NOW());
END//
DELIMITER ;


INSERT INTO `randevular` VALUES ('11' , '94840160309', '3','3','21.02.16','16:30');
INSERT INTO `randevular` VALUES ('16' , '84819393372', '10','10','21.02.16','09:00');
INSERT INTO `randevular` VALUES ('1' , '27164963068', '7','7','21.04.19','15:30');
INSERT INTO `randevular` VALUES ('24' , '66187685029', '2','2','21.03.21','10:30');
INSERT INTO `randevular` VALUES ('45' , '90839722137', '9','9','21.04.8','11:00');
INSERT INTO `randevular` VALUES ('55' , '29703373050', '11','11','21.04.5','11:00');
INSERT INTO `randevular` VALUES ('77' , '42410087193', '3','3','21.02.16','14:30');
UPDATE `ozelhastane`.`randevular` SET `saat` = '15:30' WHERE (`randevuID` = '77');
INSERT INTO `randevular` VALUES ('44' , '87293536052', '3','3','16.01.16','09:30');
INSERT INTO `randevular` VALUES ('58' , '98180326996 ', '15','15','18.02.16','16:30');
INSERT INTO `randevular` VALUES ('7' , '94840160309 ', '14','14','04.03.16','11:30');
INSERT INTO `randevular` VALUES ('37' , '87293536052', '9','9','30.03.16','12:30');
SELECT * FROM doktorlar WHERE
	klinikID in	(
				SELECT klinikID 
				FROM doktorlar 
				WHERE kullaniciAdi='Hasan'
				);
                
CREATE VIEW Enfeksiyon_Hastalıkları AS
SELECT TC,tarih,saat
FROM randevular
WHERE klinikID=3;

CREATE VIEW Kulak_Burun_Boğaz AS
SELECT TC,tarih,saat
FROM randevular
WHERE klinikID=11;


drop VIEW Enfeksiyon_Hastalıkları;

SELECT * from Kulak_Burun_Boğaz;


SELECT doktorlar.doktorAdiSoyadi,klinikler.klinikID
  FROM doktorlar
  INNER JOIN klinikler ON doktorlar.klinikID = klinikler.klinikID;
  
 SELECT * FROM doktorlar WHERE kullaniciAdi = 'Hasan';
