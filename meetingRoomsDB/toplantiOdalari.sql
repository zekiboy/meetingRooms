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
insert into lokasyon values ('Ýstanbul', 'Kadýköy', 2)
insert into lokasyon values ('Ýzmir', 'Karþýyaka', 2)
insert into lokasyon values ('Ankara', 'Çankaya', 2)
insert into lokasyon values ('Bursa', 'Nilüfer', 1)
insert into lokasyon values ('Ýstanbul', 'Beþiktaþ', 3)

/*toplantiOdasi tablosu verileri girme:*/
insert into toplantiOdasi values ('Sarý',1)
insert into toplantiOdasi values ('Lacivert',1)
insert into toplantiOdasi values ('Mavi',2)
insert into toplantiOdasi values ('Mor',2)
insert into toplantiOdasi values ('Turuncu',3)
insert into toplantiOdasi values ('Kahverengi',3)
insert into toplantiOdasi values ('Yeþil',4)
insert into toplantiOdasi values ('Siyah',5)
insert into toplantiOdasi values ('Beyaz',5)
insert into toplantiOdasi values ('Kýrmýzý',5)

/*odaOzellik tablosu verileri girme: */
insert into odaOzellik values (50, 1, 0, 1, 0, 1, 1) /*Kadýköy1*/
insert into odaOzellik values (100, 1, 1, 1, 1, 1, 2) /*Kadýköy2*/
insert into odaOzellik values (50, 1, 0, 1, 0, 2, 3) /*Karþýyaka1*/
insert into odaOzellik values (100, 1, 1, 1, 1, 2, 4) /*Karþýyaka*/
insert into odaOzellik values (100, 1, 0, 0, 0, 3, 5) /*Çankaya1*/
insert into odaOzellik values (200, 1, 1, 1, 1, 3, 6) /*Çankaya2*/
insert into odaOzellik values (30, 1, 1, 1, 0, 4, 7) /*Nilüfer*/
insert into odaOzellik values (50, 0, 0, 0, 0, 5, 8) /*Beþiktaþ1*/
insert into odaOzellik values (100, 1, 0, 1, 0, 5, 9) /*Beþiktaþ2*/
insert into odaOzellik values (150, 1, 1, 1, 1, 5, 10) /*Beþiktaþ3*/

/*personel tablosu verileri girme:*/
/*Ýstanbul*/
insert into personel values ('Ali','Türk',2169343434,'kadýköy1@gmail.com','Kadýköy/ÝSTANBUL',10500, 'Oda Sorumlusu',6) 
insert into personel values ('Veli','Býçakçý',2169343435,'kadýköy2@gmail.com','Sancaktepe/ÝSTANBUL',10500, 'Oda Sorumlusu',6)
insert into personel values ('Ahmet','Karaca',2129343436,'besiktas1@gmail.com','Bakýrköy/ÝSTANBUL',10500, 'Oda Sorumlusu',6) 
insert into personel values ('Zeki','Boy',2129343437,'besiktas2@gmail.com','Beylikdüzü/ÝSTANBUL',10500, 'Oda Sorumlusu',6) 
insert into personel values ('Veli','Dursun',2129343438,'besiktas3@gmail.com','Küçükçekmece/ÝSTANBUL',10500, 'Oda Sorumlusu',6) 
insert into personel values ('Hasan','Yýlmaz',2129343439,'yonetici1@gmail.com','Tuzla/ÝSTANBUL',18500, 'Yönetici',null) 
/*Ýzmir*/
insert into personel values ('Alper','Erbek',2329343536,'karsiyaka1@gmail.com','Bayraklý/ÝZMÝR',10000, 'Oda Sorumlusu',9) 
insert into personel values ('Serman','Kaleoðlu',2329343537,'karsiyaka2@gmail.com','Buca/ÝZMÝR',10000, 'Oda Sorumlusu',9) 
insert into personel values ('Hilal','Hantal',2329343538,'yonetici2@gmail.com','Karþýkaya/ÝZMÝR',18000, 'Yönetici',null) 
/*Ankara*/
insert into personel values ('Serkan','Cerk',3129340607,'cankaya1@gmail.com','Dikmen/ANKARA',9500, 'Oda Sorumlusu',12) 
insert into personel values ('Akif','Yýldýz',3129340608,'cankaya2@gmail.com','Çankaya/ANKARA',9500, 'Oda Sorumlusu',12) 
insert into personel values ('Barkýn','Keçe',3129340609,'yonetici3@gmail.com','Çankaya/ANKARA',17500, 'Yönetici',null) 
/*Bursa*/
insert into personel values ('Seda','Kara',2249341617,'nilufer1@gmail.com','Nilüfer/BURSA',9000, 'Oda Sorumlusu',14)
insert into personel values ('Sena','Akbulut',2249341618,'yonetici4@gmail.com','Ýnegöl/BURSA',17000, 'Yönetici',null) 

/*odaAdmin tablosu verileri girme:*/
insert into odaAdmin values ('Ali','Türk',2169343434, 1, 1)
insert into odaAdmin values ('Veli','Býçakçý',2169343435, 2, 2)
insert into odaAdmin values ('Ahmet','Karaca',2129343436, 8, 3)
insert into odaAdmin values ('Zeki','Boy',2129343437, 9, 4)
insert into odaAdmin values ('Veli','Dursun',2129343438, 10, 5)
insert into odaAdmin values ('Alper','Erbek',2329343536, 3, 7)
insert into odaAdmin values ('Serman','Kaleoðlu',2329343537, 4, 8)
insert into odaAdmin values ('Serkan','Cerk',3129340607, 5, 10)
insert into odaAdmin values ('Akif','Yýldýz',3129340608, 6,11)
insert into odaAdmin values ('Seda','Kara',2249341617, 7 ,13)


/*musteri tablosu verileri girme:*/
insert into musteri values ('Halim', 'Aral',5316666660,'halimaral@gmail.com')
insert into musteri values ('Servet', 'Çetin',5316666661,'servetcetin@gmail.com')
insert into musteri values ('Merve', 'Atol',5316666662,'merveatol@gmail.com')
insert into musteri values ('Büþra', 'Atmaca',5316666663,'busraatmaca@gmail.com')
insert into musteri values ('Elif', 'Avþar',5316666664,'elifavsar@gmail.com')
insert into musteri values ('Tuðçe', 'Ayaz',5316666665,'tugceayaz@gmail.com')
insert into musteri values ('Hakan', 'Avcý',5316666666,'hakanavci@gmail.com')
insert into musteri values ('Halim', 'Babacan',5316666667,'halimbabacan@gmail.com')
insert into musteri values ('Mustafa', 'Erdoðan',5316666668,'mustafaerdogan@gmail.com')
insert into musteri values ('Eylül', 'Yýlmaz',5316666669,'eylulyilmaz@gmail.com')
insert into musteri values ('Mustafa', 'Altýok',5317777770,'mustafalatýnok@gmail.com')
insert into musteri values ('Kemal', 'Bahçeli',5317777771,'kemalbahceli@gmail.com')
insert into musteri values ('Berat', 'Kale',5317777772,'beratkale@gmail.com')
insert into musteri values ('Ýbrahim', 'Çakal',5317777773,'ibrahimcakal@gmail.com')
insert into musteri values ('Sercan', 'Avþar',5317777774,'sercanavsar@gmail.com')
insert into musteri values ('Tuðçe', 'Bingöl',5317777775,'tugcebingöl@gmail.com')
insert into musteri values ('Hayrullah', 'Cahit',5317777776,'hayrullahc@gmail.com')
insert into musteri values ('Halime', 'Göl',5317777777,'halimeg@gmail.com')
insert into musteri values ('Ýlayda', 'Erdoðan',5317777778,'ilaydae@gmail.com')
insert into musteri values ('Baki', 'Yýlmaz',5317777779,'bakiyilmaz@gmail.com')


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
/*ilgili lokaysonIDler el ile verildi, bu projenin son halinde query kýsmýnda yapýlacak*/
alter table personel
add lokasyonID int NULL

--Personel tablosunda ilgili satýrlara LokasyonID girme
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

--Yeni Personel Giriþleri
insert into personel values ('Cihan','Talay',2169349999,'insankaynaklari@gmail.com','Kadýköy/ÝSTANBUL',12500, 'Ýnsan Kaynaklarý',6,1) 

insert into personel values ('Hakan','Aksu',2169349998,'yazilim1@gmail.com','Bayrampaþa/ÝSTANBUL',14500, 'Yazýlým',6,1)
insert into personel values ('Barýþ','Zorlu',2169349997,'yazilim2@gmail.com','Ataþehir/ÝSTANBUL',14500, 'Yazýlým',6,1) 
insert into personel values ('Ýbrahim','Ordo',2169349996,'yazilim3@gmail.com','Ümraniye/ÝSTANBUL',14500, 'Yazýlým',6,1)  

insert into personel values ('Muratcan','Altun',2169345595,'itkadiköy@gmail.com','Maltepe/ÝSTANBUL',14000, 'Bilgi Ýþlem',6,1)
insert into personel values ('Þahin','Kutlu',2129345594,'itbesiktas@gmail.com','Þiþli/ÝSTANBUL',14000, 'Bilgi Ýþlem',6,5)
insert into personel values ('Berke','Eren',2329343591,'itkarsiyaka@gmail.com','Bornova/ÝZMÝR',14000, 'Bilgi Ýþlem',9,2)
insert into personel values ('Yýldýrým','Budak',3129340697,'itcankaya@gmail.com','Sincan/ANKARA',13000, 'Bilgi Ýþlem',12,3)
insert into personel values ('Sinem','Ökten',2249341688,'itnilufer@gmail.com','Nilüfer/BURSA',13500, 'Bilgi Ýþlem',14,4)

use toplantiOdalari

--DENEME SORGULARI

--Kapasitesi en az 100 kiþi olan odalarýn Ýl-Ýlçe-toplantýID ve Kapasitelerinin çaðýrýlmasý
select lokasyon.il,lokasyon.ilce,odaOzellik.toplantiID,odaOzellik.kapasite from lokasyon inner join odaOzellik 
on lokasyon.lokasyonID=odaOzellik.lokasyonID where odaOzellik.kapasite>=100;

--istanbuldaki toplantý odalarýnýn ilçe bilgilerini ve ilgili admin bilgilerini, sorumlu olduðu odayla birlikte getir
--Üç tablo baðlama örnek
select lokasyon.ilce,toplantiOdasi.odaAdi,toplantiOdasi.toplantiID,odaAdmin.isim+' '+odaAdmin.soyisim as [Görevli Personel],odaAdmin.telefon 
from((toplantiOdasi 
	inner join lokasyon on lokasyon.lokasyonID=toplantiOdasi.lokasyonID)
	inner join odaAdmin on toplantiOdasi.toplantiID=odaAdmin.toplantiID);

--Turuncu Odaya ait kayýt bilgilerini getir
select toplantiOdasi.odaAdi, kayit.kayitID,kayit.musteriID,kayit.sure,kayit.tarih
from toplantiOdasi inner join kayit on toplantiOdasi.toplantiID=kayit.toplantiID 
where toplantiOdasi.odaAdi='Turuncu';

--Elif Avþar'ýn kaç defa oda kiralamýþ ve hiç ödeme yapmýþ mý
select musteri.musteriID,musteri.isim,musteri.soyisim, kayit.kayitID,kayit.tarih,kayit.toplantiID,kayit.odemeDurumu
from musteri right join kayit on musteri.musteriID=kayit.musteriID 
where musteri.isim='Elif' and musteri.soyisim='Avþar';

-- MüsteriID=4 kiraladýðý odada projeksiyon var mý ve kaç kiþilik odalar kiralamýþ
select kayit.musteriID,toplantiOdasi.odaAdi,odaOzellik.projeksiyon,kayit.tarih
from((toplantiOdasi
	inner join odaOzellik on odaOzellik.toplantiID=toplantiOdasi.toplantiID)
	inner join kayit on kayit.toplantiID=toplantiOdasi.toplantiID) 
WHERE musteriID=4;

--MüsteriID=4 kiraladýðý oda temizlenmemiþ. Kim bu odanýn sorumlusu
select kayit.musteriID,kayit.tarih,toplantiOdasi.odaAdi,odaAdmin.isim+' '+odaAdmin.soyisim as [ODA SORUMLUSU]
from((toplantiOdasi
	inner join odaAdmin on odaAdmin.toplantiID=toplantiOdasi.toplantiID)
	inner join kayit on kayit.toplantiID=toplantiOdasi.toplantiID)
WHERE musteriID=4;



--AÞAÐIDAKÝ SORGULARI ELDE EDEBÝLMEK ÝÇÝN:
--Kayýt Tablosuna Müsteri isim soyisim dahil edilerek kayýtKontrol adý altýnda yeni bir tablo oluþturuldu
select musteri.isim,musteri.soyisim, kayit.musteriID ,kayit.kayitID,kayit.sure,kayit.odemeDurumu,kayit.tarih,kayit.toplantiID
into kayitKontrol
from musteri right join kayit on kayit.musteriID=musteri.musteriID

--Elif Avþar'ýn kiraladýðý odada projeksiyon var mý
select kayitKontrol.musteriID,kayitKontrol.isim,kayitKontrol.soyisim,kayitKontrol.tarih,toplantiOdasi.odaAdi,odaOzellik.projeksiyon
from((toplantiOdasi
	inner join odaOzellik on odaOzellik.toplantiID=toplantiOdasi.toplantiID)
	inner join kayitKontrol on kayitKontrol.toplantiID=toplantiOdasi.toplantiID) 
where kayitKontrol.isim='Elif' and kayitKontrol.soyisim='Avþar';

--Elif Avþar'ýn kiraladýðý oda temizlenmemiþ. Kim bu odanýn sorumlusu	
select kayitKontrol.musteriID,kayitKontrol.isim,kayitKontrol.soyisim,kayitKontrol.tarih,toplantiOdasi.odaAdi,odaAdmin.isim+' '+odaAdmin.soyisim as [ODA SORUMLUSU]
from((toplantiOdasi
	inner join odaAdmin on odaAdmin.toplantiID=toplantiOdasi.toplantiID)
	inner join kayitKontrol on kayitKontrol.toplantiID=toplantiOdasi.toplantiID) 
where kayitKontrol.isim='Elif' and kayitKontrol.soyisim='Avþar';


/*Yeni bir yatýrým aldýk. Yeni toplantý odalarýmýzý oluþturmadan önce, bu zamana kadar oda tutulurken
en çok hangi özelliklere sahip odalar tercih edilmiþ. Bunun bilgisini görmek istiyorum
count kullanýlacak toplantýOdasý tablosu üzerinde üçlü ile çözmeye çalýþ
olmazsa kayýt-odaOzellik baðlantýsý eklenebilir*/
use toplantiOdalari
-- Ýstanbul lokasyonundaki en fazla kiralanan toplantý odasý
select lokasyon.il, count(lokasyon.il)as [Kiralanma Sayýsý]
from((toplantiOdasi
	inner join lokasyon on lokasyon.lokasyonID=toplantiOdasi.lokasyonID)
	inner join kayit on kayit.toplantiID=toplantiOdasi.toplantiID)
group by  lokasyon.il having count(lokasyon.il)>1;

--Sadece istanbulda olanlarýn bilgileri
select lokasyon.il, count(lokasyon.il)as [Kiralanma Sayýsý]
from((toplantiOdasi
	inner join lokasyon on lokasyon.lokasyonID=toplantiOdasi.lokasyonID)
	inner join kayit on kayit.toplantiID=toplantiOdasi.toplantiID)
group by  lokasyon.il having lokasyon.il='Ýstanbul';

---Ýstanbul lokasyonundaki en fazla kiralanan toplantý odasý(süreye göre)
select lokasyon.il, SUM(KAYÝT.sure)as [Toplam Kullaným Süresi]
from((toplantiOdasi
	inner join lokasyon on lokasyon.lokasyonID=toplantiOdasi.lokasyonID)
	inner join kayit on kayit.toplantiID=toplantiOdasi.toplantiID)
group by  lokasyon.il having SUM(KAYÝT.sure)>1;


--Hocanýn sorular
--1-Toplantý odasý tablosundan projeksiyon, klima, bilgisayar olan toplantý odalarýný çaðýr, toplantý odasý id göre sýralayarak
select toplantiOdasi.toplantiID,toplantiOdasi.odaAdi,odaOzellik.projeksiyon,odaOzellik.bilgisayar,odaOzellik.klima 
from toplantiOdasi inner join odaOzellik on toplantiOdasi.toplantiID=odaOzellik.odaID
where (odaOzellik.bilgisayar=1 and odaOzellik.klima=1 and odaOzellik.projeksiyon=1) order by toplantiID

--2-Personel kiþisine bir kiþi ekle, bu kiþiyi baðlý olduðu yöneticiyle birlikte bilgilerini çaðýr
insert into personel values ('Atakan','Deðmez',5549341688,'atakandeger@gmail.com','Baðcýlar/Ýstanbul',4500, 'Stajyer',6,1)

select personel.personelID ,personel.isim,personel.soyisim,departman ,personel.reportTo from personel
where (personelID=24 or personelID=6)

--3-müþteri tablosundan bütün müþteri bilgilerini tarihsel sýralama ile çaðýr
select musteri.musteriID, musteri.isim, musteri.soyisim, musteri.telefon, musteri.mail, kayit.tarih
from musteri inner join kayit on musteri.musteriID = kayit.musteriID
order by tarih desc

--4-müþteri isim ve soyismini kiþiler baþlýðý ile ve ödeme ve tarih bilgisini de bilgiler baþlýðý ile çaðýr
select musteri.isim + ' ' + musteri.soyisim as [Kiþiler],kayit.odemeDurumu as [Ödeme Yapmýþ Mý?], kayit.tarih
from musteri inner join kayit on musteri.musteriID = kayit.musteriID

--4.1 ödeme durumu ve tarih tek sütunda
select musteri.isim + ' ' + musteri.soyisim as [Kiþiler],CAST(kayit.odemeDurumu as nvarchar)+'  -  '+ CAST(kayit.tarih as nvarchar) as [Bilgiler]
from musteri inner join kayit on musteri.musteriID = kayit.musteriID

--5- Dolu olan birgün için yap(sadece boþ odalar gelsin)( en az 100 kiþi ) oda adý, lokasyon adý çaðýr ve toplantý bilgileri baþlýðý altýnda
-- 2023-10-01 10:00:00.000 tarihinde toplantiID=2 dolu
select odaOzellik.kapasite,toplantiOdasi.odaAdi,lokasyon.il+' '+lokasyon.ilce as [Toplantý Bilgileri], kayit.tarih
from (((toplantiOdasi
inner join lokasyon on lokasyon.lokasyonID=toplantiOdasi.lokasyonID)
inner join odaOzellik on odaOzellik.toplantiID = toplantiOdasi.toplantiID)
inner join kayit on kayit.toplantiID=toplantiOdasi.toplantiID)
where (odaOzellik.kapasite>=100 and  kayit.tarih!='2023-10-01 10:00:00.000')

/*6- X toplantý salonunun herhangi bir tarihteki müsaitlik durumunu hangi il ve ilçede olduðunu
lokasyon baþlýðý altýnda birleþtirerek ve odanýn kapasitesine göre sýralama */
select toplantiOdasi.odaAdi,lokasyon.il,lokasyon.ilce, kayit.tarih,odaOzellik.kapasite
from (((toplantiOdasi
inner join lokasyon on lokasyon.lokasyonID=toplantiOdasi.lokasyonID)
inner join odaOzellik on odaOzellik.toplantiID = toplantiOdasi.toplantiID)
inner join kayit on kayit.toplantiID=toplantiOdasi.toplantiID)
where (kayit.tarih!='2023-10-01 10:00:00.000')
order by odaOzellik.kapasite

--6.1 tarih aralýðýný manuel girerek sorgulama
select toplantiOdasi.odaAdi,lokasyon.il,lokasyon.ilce, kayit.tarih,odaOzellik.kapasite
from (((toplantiOdasi
inner join lokasyon on lokasyon.lokasyonID=toplantiOdasi.lokasyonID)
inner join odaOzellik on odaOzellik.toplantiID = toplantiOdasi.toplantiID)
inner join kayit on kayit.toplantiID=toplantiOdasi.toplantiID)
where kayit.tarih not between '2023-10-01 10:00:00.000' and '2023-10-01 12:00:00.000'
order by odaOzellik.kapasite


--7-En az kapasiteli toplantý odasýnýn oda adý, yönetici adý soyadý as (bilgileiri) ve yöneticinin ikametgahý
-- Top kullanmamýzýn nedeni sýralayýp baþtakini alacak olmamýz
select top 1  odaOzellik.kapasite, toplantiOdasi.odaAdi, personel.isim+' '+ personel.soyisim as [Oda Sorumlusu], personel.ikametgah
from (((odaOzellik
inner join toplantiOdasi on odaOzellik.toplantiID = toplantiOdasi.toplantiID)
inner join odaAdmin on odaOzellik.toplantiID = odaAdmin.toplantiID)
inner join personel on odaAdmin.personelID = personel.personelID) order by odaOzellik.kapasite asc

--8- it departmanýndaki personeli sorumlu olduðu lokasyonlarla birlikte lokasyon kapasitesine göre sýrala
select personel.personelID, personel.isim, personel.soyisim, personel.departman, lokasyon.lokasyonID, lokasyon.il, lokasyon.ilce
from  personel inner join lokasyon on lokasyon.lokasyonID = personel.lokasyonID
where personel.departman = 'Bilgi Ýþlem'
order by lokasyon.odaSayisi desc

--9- istanbulda çalýþan personellerin maillerini alfabetik sýra ile
select personel.isim, personel.soyisim,lokasyon.il, personel.mail
from lokasyon inner join personel
on lokasyon.lokasyonID = personel.lokasyonID
where lokasyon.il = 'Ýstanbul'
order by personel.mail asc

--10- herhangi bir müþterinin tüm rezarvasyonlarýný
select musteri.isim, musteri.soyisim, kayitKontrol.tarih
from musteri inner join kayitKontrol 
on musteri.musteriID = kayitKontrol.musteriID
where kayitKontrol.musteriID = 4

--11- hangi personel hangi toplantý odasýndan sorumlu listele
select toplantiOdasi.toplantiID, toplantiOdasi.odaAdi, odaAdmin.isim, odaAdmin.soyisim
from toplantiOdasi inner join odaAdmin on toplantiOdasi.toplantiID = odaAdmin.toplantiID

--12- belirli bir tarih aralýðýndaki rezervasyonlar, bu rezervasynlarýn hangi müþteri tarafýndan ve hangi odalara yapýldýðý
select *from kayit where tarih between '2023-01-01' and '2023-06-17';

--13- bugüne kadar toplantý odalarýnýn toplam kullaným süresi büyükten küçüðe
select toplantiOdasi.odaAdi,  SUM(KAYÝT.sure)as [Toplam Kullaným Süresi - SAAT]
from toplantiOdasi
	inner join kayit on kayit.toplantiID=toplantiOdasi.toplantiID
group by toplantiOdasi.odaAdi having SUM(KAYÝT.sure)>1 order by SUM(KAYÝT.sure) desc
