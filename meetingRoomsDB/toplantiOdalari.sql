create table lokasyon(
	lokasyonID int primary key identity(1,1) NOT NULL,
	il nvarchar(30) NOT NULL,
	ilce nvarchar (30) NOT NULL,
	odaSayisi int NOT NULL
);

create table toplantiOdasi(
	toplantiID int primary key identity(1,1) NOT NULL,
	odaAdi nvarchar(30) NOT NULL,
);

create table odaOzellik(
	odaID int primary key identity(1,1) NOT NULL,
	kapasite int NOT NULL,
	internet bit NOT NULL,
	projeksiyon bit NOT NULL,
	klima bit NOT NULL,
	bilgisayar bit NOT NULL
);

create table personel(
	personelID int primary key identity(1,1) NOT NULL,
	isim nvarchar(30) NOT NULL,
	soyisim nvarchar(30) NOT NULL,
	telefon char(10) NOT NULL,
	mail nvarchar(30) NOT NULL,
	ikametgah nvarchar(50) NOT NULL,
	maas int NOT NULL,
	departman nvarchar(20) NOT NULL,
	reportTo int NOT NULL
);
alter table personel alter COLUMN reportTo int NULL

create table odaAdmin(
	adminID int primary key identity(1,1) NOT NULL,
	isim nvarchar(30) NOT NULL,
	soyisim nvarchar(30) NOT NULL,
	telefon char(10) NOT NULL
);

create table musteri(
	musteriID int primary key identity(1,1) NOT NULL,
	isim nvarchar(30) NOT NULL,
	soyisim nvarchar(30) NOT NULL,
	telefon char(10) NOT NULL,
	mail nvarchar(30) NOT NULL
);

create table kayit(
	kayitID int primary key identity(1,1) NOT NULL,
	sure int NOT NULL,
	tarih date NOT NULL,
	odemeDurumu bit NOT NULL
);

/*toplantiOdasi ikincil anahtar ekleme*/
alter table toplantiOdasi
add lokasyonID int NOT NULL

/*odaOzellik ikincil anahtar ekleme*/
alter table odaOzellik
add lokasyonID int NOT NULL,  toplantiID int NOT NULL

/*kayit ikincil anahtar ekleme*/
alter table kayit
add toplantiID int NOT NULL, musteriID int NOT NULL

/*odaAdmin ikincil anahtar ekleme*/
alter table odaAdmin
add toplantiID int NOT NULL, personelID int NOT NULL

/*lokasyon tablosu verileri girme:*/
insert into lokasyon values ('�stanbul', 'Kad�k�y', 2)
insert into lokasyon values ('�zmir', 'Kar��yaka', 2)
insert into lokasyon values ('Ankara', '�ankaya', 2)
insert into lokasyon values ('Bursa', 'Nil�fer', 1)
insert into lokasyon values ('�stanbul', 'Be�ikta�', 3)

/*toplantiOdasi tablosu verileri girme:*/
insert into toplantiOdasi values ('Sar�',1)
insert into toplantiOdasi values ('Lacivert',1)
insert into toplantiOdasi values ('Mavi',2)
insert into toplantiOdasi values ('Mor',2)
insert into toplantiOdasi values ('Turuncu',3)
insert into toplantiOdasi values ('Kahverengi',3)
insert into toplantiOdasi values ('Ye�il',4)
insert into toplantiOdasi values ('Siyah',5)
insert into toplantiOdasi values ('Beyaz',5)
insert into toplantiOdasi values ('K�rm�z�',5)

/*odaOzellik tablosu verileri girme: */
insert into odaOzellik values (50, 1, 0, 1, 0, 1, 1) /*Kad�k�y1*/
insert into odaOzellik values (100, 1, 1, 1, 1, 1, 2) /*Kad�k�y2*/
insert into odaOzellik values (50, 1, 0, 1, 0, 2, 3) /*Kar��yaka1*/
insert into odaOzellik values (100, 1, 1, 1, 1, 2, 4) /*Kar��yaka*/
insert into odaOzellik values (100, 1, 0, 0, 0, 3, 5) /*�ankaya1*/
insert into odaOzellik values (200, 1, 1, 1, 1, 3, 6) /*�ankaya2*/
insert into odaOzellik values (30, 1, 1, 1, 0, 4, 7) /*Nil�fer*/
insert into odaOzellik values (50, 0, 0, 0, 0, 5, 8) /*Be�ikta�1*/
insert into odaOzellik values (100, 1, 0, 1, 0, 5, 9) /*Be�ikta�2*/
insert into odaOzellik values (150, 1, 1, 1, 1, 5, 10) /*Be�ikta�3*/

/*personel tablosu verileri girme:*/
/*�stanbul*/
insert into personel values ('Ali','T�rk',2169343434,'kad�k�y1@gmail.com','Kad�k�y/�STANBUL',10500, 'Oda Sorumlusu',6) 
insert into personel values ('Veli','B��ak��',2169343435,'kad�k�y2@gmail.com','Sancaktepe/�STANBUL',10500, 'Oda Sorumlusu',6)
insert into personel values ('Ahmet','Karaca',2129343436,'besiktas1@gmail.com','Bak�rk�y/�STANBUL',10500, 'Oda Sorumlusu',6) 
insert into personel values ('Zeki','Boy',2129343437,'besiktas2@gmail.com','Beylikd�z�/�STANBUL',10500, 'Oda Sorumlusu',6) 
insert into personel values ('Veli','Dursun',2129343438,'besiktas3@gmail.com','K���k�ekmece/�STANBUL',10500, 'Oda Sorumlusu',6) 
insert into personel values ('Hasan','Y�lmaz',2129343439,'yonetici1@gmail.com','Tuzla/�STANBUL',18500, 'Y�netici',null) 
/*�zmir*/
insert into personel values ('Alper','Erbek',2329343536,'karsiyaka1@gmail.com','Bayrakl�/�ZM�R',10000, 'Oda Sorumlusu',9) 
insert into personel values ('Serman','Kaleo�lu',2329343537,'karsiyaka2@gmail.com','Buca/�ZM�R',10000, 'Oda Sorumlusu',9) 
insert into personel values ('Hilal','Hantal',2329343538,'yonetici2@gmail.com','Kar��kaya/�ZM�R',18000, 'Y�netici',null) 
/*Ankara*/
insert into personel values ('Serkan','Cerk',3129340607,'cankaya1@gmail.com','Dikmen/ANKARA',9500, 'Oda Sorumlusu',12) 
insert into personel values ('Akif','Y�ld�z',3129340608,'cankaya2@gmail.com','�ankaya/ANKARA',9500, 'Oda Sorumlusu',12) 
insert into personel values ('Bark�n','Ke�e',3129340609,'yonetici3@gmail.com','�ankaya/ANKARA',17500, 'Y�netici',null) 
/*Bursa*/
insert into personel values ('Seda','Kara',2249341617,'nilufer1@gmail.com','Nil�fer/BURSA',9000, 'Oda Sorumlusu',14)
insert into personel values ('Sena','Akbulut',2249341618,'yonetici4@gmail.com','�neg�l/BURSA',17000, 'Y�netici',null) 

/*odaAdmin tablosu verileri girme:*/
insert into odaAdmin values ('Ali','T�rk',2169343434, 1, 1)
insert into odaAdmin values ('Veli','B��ak��',2169343435, 2, 2)
insert into odaAdmin values ('Ahmet','Karaca',2129343436, 8, 3)
insert into odaAdmin values ('Zeki','Boy',2129343437, 9, 4)
insert into odaAdmin values ('Veli','Dursun',2129343438, 10, 5)
insert into odaAdmin values ('Alper','Erbek',2329343536, 3, 7)
insert into odaAdmin values ('Serman','Kaleo�lu',2329343537, 4, 8)
insert into odaAdmin values ('Serkan','Cerk',3129340607, 5, 10)
insert into odaAdmin values ('Akif','Y�ld�z',3129340608, 6,11)
insert into odaAdmin values ('Seda','Kara',2249341617, 7 ,13)


/*musteri tablosu verileri girme:*/
insert into musteri values ('Halim', 'Aral',5316666660,'halimaral@gmail.com')
insert into musteri values ('Servet', '�etin',5316666661,'servetcetin@gmail.com')
insert into musteri values ('Merve', 'Atol',5316666662,'merveatol@gmail.com')
insert into musteri values ('B��ra', 'Atmaca',5316666663,'busraatmaca@gmail.com')
insert into musteri values ('Elif', 'Av�ar',5316666664,'elifavsar@gmail.com')
insert into musteri values ('Tu��e', 'Ayaz',5316666665,'tugceayaz@gmail.com')
insert into musteri values ('Hakan', 'Avc�',5316666666,'hakanavci@gmail.com')
insert into musteri values ('Halim', 'Babacan',5316666667,'halimbabacan@gmail.com')
insert into musteri values ('Mustafa', 'Erdo�an',5316666668,'mustafaerdogan@gmail.com')
insert into musteri values ('Eyl�l', 'Y�lmaz',5316666669,'eylulyilmaz@gmail.com')
insert into musteri values ('Mustafa', 'Alt�ok',5317777770,'mustafalat�nok@gmail.com')
insert into musteri values ('Kemal', 'Bah�eli',5317777771,'kemalbahceli@gmail.com')
insert into musteri values ('Berat', 'Kale',5317777772,'beratkale@gmail.com')
insert into musteri values ('�brahim', '�akal',5317777773,'ibrahimcakal@gmail.com')
insert into musteri values ('Sercan', 'Av�ar',5317777774,'sercanavsar@gmail.com')
insert into musteri values ('Tu��e', 'Bing�l',5317777775,'tugcebing�l@gmail.com')
insert into musteri values ('Hayrullah', 'Cahit',5317777776,'hayrullahc@gmail.com')
insert into musteri values ('Halime', 'G�l',5317777777,'halimeg@gmail.com')
insert into musteri values ('�layda', 'Erdo�an',5317777778,'ilaydae@gmail.com')
insert into musteri values ('Baki', 'Y�lmaz',5317777779,'bakiyilmaz@gmail.com')


/*kayit sutunu date'ten, datetime'a cevrildi:*/
alter table kayit alter column tarih datetime not null;

/*kayit tablosu verileri girme:*/
insert into kayit values (1, '2023-01-01 10:00:00.000', 1, 1, 1)
insert into kayit values (1, '2023-02-17 12:00:00.000', 1, 8, 2)
insert into kayit values (1, '2023-03-01 15:00:00.000', 1, 3, 3)
insert into kayit values (1, '2023-04-11 14:00:00.000', 1, 5, 4)
insert into kayit values (1, '2023-06-17 10:00:00.000', 1, 7, 5)
insert into kayit values (2, '2023-10-01 10:00:00.000', 0, 2, 6)
insert into kayit values (1, '2023-09-13 11:00:00.000', 0, 4, 9)
insert into kayit values (2, '2023-08-21 18:00:00.000', 1, 6, 8)
insert into kayit values (1, '2023-06-11 19:00:00.000', 0, 9, 7)
insert into kayit values (1, '2023-07-27 11:00:00.000', 1, 10, 10)
insert into kayit values (1, '2022-09-21 09:00:00.000', 0, 5, 1)
insert into kayit values (2, '2022-12-17 15:00:00.000', 0, 1, 2)
insert into kayit values (1, '2022-10-01 18:00:00.000', 1, 2, 3)
insert into kayit values (1, '2022-11-22 14:00:00.000', 1, 6, 4)
insert into kayit values (1, '2022-10-17 10:00:00.000', 1, 8, 5)
insert into kayit values (3, '2022-01-01 10:00:00.000', 1, 1, 17)
insert into kayit values (1, '2022-01-02 12:00:00.000', 1, 8, 19)
insert into kayit values (3, '2022-01-03 15:00:00.000', 0, 3, 20)
insert into kayit values (1, '2022-01-03 14:00:00.000', 0, 5, 16)
insert into kayit values (2, '2022-01-03 10:00:00.000', 1, 7, 15)
 


/*Gerekli gucellemeler:*/


/*personel'e ikincil anahtar olarak lokasyonID ekleme*/
/*ilgili lokaysonIDler el ile verildi, bu projenin son halinde query k�sm�nda yap�lacak*/
alter table personel
add lokasyonID int NULL

--Personel tablosunda ilgili sat�rlara LokasyonID girme
UPDATE personel SET lokasyonID=1 Where personelID=1
UPDATE personel SET lokasyonID=1 Where personelID=2

UPDATE personel SET lokasyonID=2 Where personelID=7
UPDATE personel SET lokasyonID=2 Where personelID=8

UPDATE personel SET lokasyonID=3 Where personelID=10
UPDATE personel SET lokasyonID=3 Where personelID=11

UPDATE personel SET lokasyonID=4 Where personelID=13

UPDATE personel SET lokasyonID=5 Where personelID=3
UPDATE personel SET lokasyonID=5 Where personelID=4
UPDATE personel SET lokasyonID=5 Where personelID=5

--Yeni Personel Giri�leri
insert into personel values ('Cihan','Talay',2169349999,'insankaynaklari@gmail.com','Kad�k�y/�STANBUL',12500, '�nsan Kaynaklar�',6,1) 

insert into personel values ('Hakan','Aksu',2169349998,'yazilim1@gmail.com','Bayrampa�a/�STANBUL',14500, 'Yaz�l�m',6,1)
insert into personel values ('Bar��','Zorlu',2169349997,'yazilim2@gmail.com','Ata�ehir/�STANBUL',14500, 'Yaz�l�m',6,1) 
insert into personel values ('�brahim','Ordo',2169349996,'yazilim3@gmail.com','�mraniye/�STANBUL',14500, 'Yaz�l�m',6,1)  

insert into personel values ('Muratcan','Altun',2169345595,'itkadik�y@gmail.com','Maltepe/�STANBUL',14000, 'Bilgi ��lem',6,1)
insert into personel values ('�ahin','Kutlu',2129345594,'itbesiktas@gmail.com','�i�li/�STANBUL',14000, 'Bilgi ��lem',6,5)
insert into personel values ('Berke','Eren',2329343591,'itkarsiyaka@gmail.com','Bornova/�ZM�R',14000, 'Bilgi ��lem',9,2)
insert into personel values ('Y�ld�r�m','Budak',3129340697,'itcankaya@gmail.com','Sincan/ANKARA',13000, 'Bilgi ��lem',12,3)
insert into personel values ('Sinem','�kten',2249341688,'itnilufer@gmail.com','Nil�fer/BURSA',13500, 'Bilgi ��lem',14,4)

use toplantiOdalari

--DENEME SORGULARI

--Kapasitesi en az 100 ki�i olan odalar�n �l-�l�e-toplant�ID ve Kapasitelerinin �a��r�lmas�
select lokasyon.il,lokasyon.ilce,odaOzellik.toplantiID,odaOzellik.kapasite from lokasyon inner join odaOzellik 
on lokasyon.lokasyonID=odaOzellik.lokasyonID where odaOzellik.kapasite>=100;

--istanbuldaki toplant� odalar�n�n il�e bilgilerini ve ilgili admin bilgilerini, sorumlu oldu�u odayla birlikte getir
--�� tablo ba�lama �rnek
select lokasyon.ilce,toplantiOdasi.odaAdi,toplantiOdasi.toplantiID,odaAdmin.isim+' '+odaAdmin.soyisim as [G�revli Personel],odaAdmin.telefon 
from((toplantiOdasi 
	inner join lokasyon on lokasyon.lokasyonID=toplantiOdasi.lokasyonID)
	inner join odaAdmin on toplantiOdasi.toplantiID=odaAdmin.toplantiID);

--Turuncu Odaya ait kay�t bilgilerini getir
select toplantiOdasi.odaAdi, kayit.kayitID,kayit.musteriID,kayit.sure,kayit.tarih
from toplantiOdasi inner join kayit on toplantiOdasi.toplantiID=kayit.toplantiID 
where toplantiOdasi.odaAdi='Turuncu';

--Elif Av�ar'�n ka� defa oda kiralam�� ve hi� �deme yapm�� m�
select musteri.musteriID,musteri.isim,musteri.soyisim, kayit.kayitID,kayit.tarih,kayit.toplantiID,kayit.odemeDurumu
from musteri right join kayit on musteri.musteriID=kayit.musteriID 
where musteri.isim='Elif' and musteri.soyisim='Av�ar';

-- M�steriID=4 kiralad��� odada projeksiyon var m� ve ka� ki�ilik odalar kiralam��
select kayit.musteriID,toplantiOdasi.odaAdi,odaOzellik.projeksiyon,kayit.tarih
from((toplantiOdasi
	inner join odaOzellik on odaOzellik.toplantiID=toplantiOdasi.toplantiID)
	inner join kayit on kayit.toplantiID=toplantiOdasi.toplantiID) 
WHERE musteriID=4;

--M�steriID=4 kiralad��� oda temizlenmemi�. Kim bu odan�n sorumlusu
select kayit.musteriID,kayit.tarih,toplantiOdasi.odaAdi,odaAdmin.isim+' '+odaAdmin.soyisim as [ODA SORUMLUSU]
from((toplantiOdasi
	inner join odaAdmin on odaAdmin.toplantiID=toplantiOdasi.toplantiID)
	inner join kayit on kayit.toplantiID=toplantiOdasi.toplantiID)
WHERE musteriID=4;



--A�A�IDAK� SORGULARI ELDE EDEB�LMEK ���N:
--Kay�t Tablosuna M�steri isim soyisim dahil edilerek kay�tKontrol ad� alt�nda yeni bir tablo olu�turuldu
select musteri.isim,musteri.soyisim, kayit.musteriID ,kayit.kayitID,kayit.sure,kayit.odemeDurumu,kayit.tarih,kayit.toplantiID
into kayitKontrol
from musteri right join kayit on kayit.musteriID=musteri.musteriID

--Elif Av�ar'�n kiralad��� odada projeksiyon var m�
select kayitKontrol.musteriID,kayitKontrol.isim,kayitKontrol.soyisim,kayitKontrol.tarih,toplantiOdasi.odaAdi,odaOzellik.projeksiyon
from((toplantiOdasi
	inner join odaOzellik on odaOzellik.toplantiID=toplantiOdasi.toplantiID)
	inner join kayitKontrol on kayitKontrol.toplantiID=toplantiOdasi.toplantiID) 
where kayitKontrol.isim='Elif' and kayitKontrol.soyisim='Av�ar';

--Elif Av�ar'�n kiralad��� oda temizlenmemi�. Kim bu odan�n sorumlusu	
select kayitKontrol.musteriID,kayitKontrol.isim,kayitKontrol.soyisim,kayitKontrol.tarih,toplantiOdasi.odaAdi,odaAdmin.isim+' '+odaAdmin.soyisim as [ODA SORUMLUSU]
from((toplantiOdasi
	inner join odaAdmin on odaAdmin.toplantiID=toplantiOdasi.toplantiID)
	inner join kayitKontrol on kayitKontrol.toplantiID=toplantiOdasi.toplantiID) 
where kayitKontrol.isim='Elif' and kayitKontrol.soyisim='Av�ar';


/*Yeni bir yat�r�m ald�k. Yeni toplant� odalar�m�z� olu�turmadan �nce, bu zamana kadar oda tutulurken
en �ok hangi �zelliklere sahip odalar tercih edilmi�. Bunun bilgisini g�rmek istiyorum
count kullan�lacak toplant�Odas� tablosu �zerinde ��l� ile ��zmeye �al��
olmazsa kay�t-odaOzellik ba�lant�s� eklenebilir*/
use toplantiOdalari
-- �stanbul lokasyonundaki en fazla kiralanan toplant� odas�
select lokasyon.il, count(lokasyon.il)as [Kiralanma Say�s�]
from((toplantiOdasi
	inner join lokasyon on lokasyon.lokasyonID=toplantiOdasi.lokasyonID)
	inner join kayit on kayit.toplantiID=toplantiOdasi.toplantiID)
group by  lokasyon.il having count(lokasyon.il)>1;

--Sadece istanbulda olanlar�n bilgileri
select lokasyon.il, count(lokasyon.il)as [Kiralanma Say�s�]
from((toplantiOdasi
	inner join lokasyon on lokasyon.lokasyonID=toplantiOdasi.lokasyonID)
	inner join kayit on kayit.toplantiID=toplantiOdasi.toplantiID)
group by  lokasyon.il having lokasyon.il='�stanbul';

---�stanbul lokasyonundaki en fazla kiralanan toplant� odas�(s�reye g�re)
select lokasyon.il, SUM(KAY�T.sure)as [Toplam Kullan�m S�resi]
from((toplantiOdasi
	inner join lokasyon on lokasyon.lokasyonID=toplantiOdasi.lokasyonID)
	inner join kayit on kayit.toplantiID=toplantiOdasi.toplantiID)
group by  lokasyon.il having SUM(KAY�T.sure)>1;


--Hocan�n sorular
--1-Toplant� odas� tablosundan projeksiyon, klima, bilgisayar olan toplant� odalar�n� �a��r, toplant� odas� id g�re s�ralayarak
select toplantiOdasi.toplantiID,toplantiOdasi.odaAdi,odaOzellik.projeksiyon,odaOzellik.bilgisayar,odaOzellik.klima 
from toplantiOdasi inner join odaOzellik on toplantiOdasi.toplantiID=odaOzellik.odaID
where (odaOzellik.bilgisayar=1 and odaOzellik.klima=1 and odaOzellik.projeksiyon=1) order by toplantiID

--2-Personel ki�isine bir ki�i ekle, bu ki�iyi ba�l� oldu�u y�neticiyle birlikte bilgilerini �a��r
insert into personel values ('Atakan','De�mez',5549341688,'atakandeger@gmail.com','Ba�c�lar/�stanbul',4500, 'Stajyer',6,1)

select personel.personelID ,personel.isim,personel.soyisim,departman ,personel.reportTo from personel
where (personelID=24 or personelID=6)

--3-m��teri tablosundan b�t�n m��teri bilgilerini tarihsel s�ralama ile �a��r
select musteri.musteriID, musteri.isim, musteri.soyisim, musteri.telefon, musteri.mail, kayit.tarih
from musteri inner join kayit on musteri.musteriID = kayit.musteriID
order by tarih desc

--4-m��teri isim ve soyismini ki�iler ba�l��� ile ve �deme ve tarih bilgisini de bilgiler ba�l��� ile �a��r
select musteri.isim + ' ' + musteri.soyisim as [Ki�iler],kayit.odemeDurumu as [�deme Yapm�� M�?], kayit.tarih
from musteri inner join kayit on musteri.musteriID = kayit.musteriID

--4.1 �deme durumu ve tarih tek s�tunda
select musteri.isim + ' ' + musteri.soyisim as [Ki�iler],CAST(kayit.odemeDurumu as nvarchar)+'  -  '+ CAST(kayit.tarih as nvarchar) as [Bilgiler]
from musteri inner join kayit on musteri.musteriID = kayit.musteriID

--5- Dolu olan birg�n i�in yap(sadece bo� odalar gelsin)( en az 100 ki�i ) oda ad�, lokasyon ad� �a��r ve toplant� bilgileri ba�l��� alt�nda
-- 2023-10-01 10:00:00.000 tarihinde toplantiID=2 dolu
select odaOzellik.kapasite,toplantiOdasi.odaAdi,lokasyon.il+' '+lokasyon.ilce as [Toplant� Bilgileri], kayit.tarih
from (((toplantiOdasi
inner join lokasyon on lokasyon.lokasyonID=toplantiOdasi.lokasyonID)
inner join odaOzellik on odaOzellik.toplantiID = toplantiOdasi.toplantiID)
inner join kayit on kayit.toplantiID=toplantiOdasi.toplantiID)
where (odaOzellik.kapasite>=100 and  kayit.tarih!='2023-10-01 10:00:00.000')

/*6- X toplant� salonunun herhangi bir tarihteki m�saitlik durumunu hangi il ve il�ede oldu�unu
lokasyon ba�l��� alt�nda birle�tirerek ve odan�n kapasitesine g�re s�ralama */
select toplantiOdasi.odaAdi,lokasyon.il,lokasyon.ilce, kayit.tarih,odaOzellik.kapasite
from (((toplantiOdasi
inner join lokasyon on lokasyon.lokasyonID=toplantiOdasi.lokasyonID)
inner join odaOzellik on odaOzellik.toplantiID = toplantiOdasi.toplantiID)
inner join kayit on kayit.toplantiID=toplantiOdasi.toplantiID)
where (kayit.tarih!='2023-10-01 10:00:00.000')
order by odaOzellik.kapasite

--6.1 tarih aral���n� manuel girerek sorgulama
select toplantiOdasi.odaAdi,lokasyon.il,lokasyon.ilce, kayit.tarih,odaOzellik.kapasite
from (((toplantiOdasi
inner join lokasyon on lokasyon.lokasyonID=toplantiOdasi.lokasyonID)
inner join odaOzellik on odaOzellik.toplantiID = toplantiOdasi.toplantiID)
inner join kayit on kayit.toplantiID=toplantiOdasi.toplantiID)
where kayit.tarih not between '2023-10-01 10:00:00.000' and '2023-10-01 12:00:00.000'
order by odaOzellik.kapasite


--7-En az kapasiteli toplant� odas�n�n oda ad�, y�netici ad� soyad� as (bilgileiri) ve y�neticinin ikametgah�
-- Top kullanmam�z�n nedeni s�ralay�p ba�takini alacak olmam�z
select top 1  odaOzellik.kapasite, toplantiOdasi.odaAdi, personel.isim+' '+ personel.soyisim as [Oda Sorumlusu], personel.ikametgah
from (((odaOzellik
inner join toplantiOdasi on odaOzellik.toplantiID = toplantiOdasi.toplantiID)
inner join odaAdmin on odaOzellik.toplantiID = odaAdmin.toplantiID)
inner join personel on odaAdmin.personelID = personel.personelID) order by odaOzellik.kapasite asc

--8- it departman�ndaki personeli sorumlu oldu�u lokasyonlarla birlikte lokasyon kapasitesine g�re s�rala
select personel.personelID, personel.isim, personel.soyisim, personel.departman, lokasyon.lokasyonID, lokasyon.il, lokasyon.ilce
from  personel inner join lokasyon on lokasyon.lokasyonID = personel.lokasyonID
where personel.departman = 'Bilgi ��lem'
order by lokasyon.odaSayisi desc

--9- istanbulda �al��an personellerin maillerini alfabetik s�ra ile
select personel.isim, personel.soyisim,lokasyon.il, personel.mail
from lokasyon inner join personel
on lokasyon.lokasyonID = personel.lokasyonID
where lokasyon.il = '�stanbul'
order by personel.mail asc

--10- herhangi bir m��terinin t�m rezarvasyonlar�n�
select musteri.isim, musteri.soyisim, kayitKontrol.tarih
from musteri inner join kayitKontrol 
on musteri.musteriID = kayitKontrol.musteriID
where kayitKontrol.musteriID = 4

--11- hangi personel hangi toplant� odas�ndan sorumlu listele
select toplantiOdasi.toplantiID, toplantiOdasi.odaAdi, odaAdmin.isim, odaAdmin.soyisim
from toplantiOdasi inner join odaAdmin on toplantiOdasi.toplantiID = odaAdmin.toplantiID

--12- belirli bir tarih aral���ndaki rezervasyonlar, bu rezervasynlar�n hangi m��teri taraf�ndan ve hangi odalara yap�ld���
select *from kayit where tarih between '2023-01-01' and '2023-06-17';

--13- bug�ne kadar toplant� odalar�n�n toplam kullan�m s�resi b�y�kten k����e
select toplantiOdasi.odaAdi,  SUM(KAY�T.sure)as [Toplam Kullan�m S�resi - SAAT]
from toplantiOdasi
	inner join kayit on kayit.toplantiID=toplantiOdasi.toplantiID
group by toplantiOdasi.odaAdi having SUM(KAY�T.sure)>1 order by SUM(KAY�T.sure) desc
