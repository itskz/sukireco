drop database sukkirirecord;
create database sukkirirecord;
use sukkirirecord;

create table account(
  account_id    integer      not null primary key auto_increment
 ,account_name  varchar(30)  not null
 ,mail_address  varchar(100) not null
 ,password      varchar(20)  not null
 ,credit_number char(16)     not null
);

create table artist(
  artist_id   integer     not null primary key auto_increment
 ,artist_name varchar(30) not null
);

create table music(
  music_id   integer      not null primary key auto_increment
 ,music_name varchar(100) not null
 ,artist_id  integer      not null
 ,price      integer      not null
 ,music_link varchar(100) not null
 ,comment    varchar(200) not null
 ,music_path varchar(100) not null
 ,foreign key(artist_id)  references artist(artist_id)
);

create table bought(
  account_id     integer  not null
 ,music_id       integer  not null
 ,cart_state_flag char(1) not null check(cart_state_flag in ('0', '1'))
 ,foreign key(account_id) references account(account_id)
 ,foreign key(music_id  ) references music  (music_id  )
);

INSERT INTO ARTIST VALUES(1,'BUMP OF CHICKEN');
INSERT INTO ARTIST VALUES(2,'Luciano Pavarotti');
INSERT INTO ARTIST VALUES(3,'尾崎豊');
INSERT INTO ARTIST VALUES(4,'中森明菜');
INSERT INTO ARTIST VALUES(5,'藤井 風');
INSERT INTO ARTIST VALUES(6,'Ado');
INSERT INTO ARTIST VALUES(7,'リチャード・クレイダーマン');
INSERT INTO ARTIST VALUES(8,'Superfly');
INSERT INTO ARTIST VALUES(9,'竹内まりや');
INSERT INTO ARTIST VALUES(10,'松任谷由実');
INSERT INTO ARTIST VALUES(11,'宇多田ヒカル');
INSERT INTO ARTIST VALUES(12,'スピッツ');
INSERT INTO ARTIST VALUES(13,'上原ひろみ');
INSERT INTO ARTIST VALUES(14,'Uru');

INSERT INTO MUSIC VALUES(1,'SOUVENIR',1,100,'https://www.youtube.com/watch?v=C9vAUfSEh8Q','19枚目のシングル作品は配信限定。アニメ『SPY×FAMILY』（原作：遠藤達哉）の第2クールオープニングテーマ','img/001.jpg');
INSERT INTO MUSIC VALUES(2,'クロノスタシス',1,100,'https://www.youtube.com/watch?v=B--iJ2pNvLU','18枚目のシングル作品。映画『名探偵コナン ハロウィンの花嫁』主題歌','img/002.jpg');
INSERT INTO MUSIC VALUES(3,'Nessun dorma',2,100,'https://www.youtube.com/watch?v=cWc7vYjgnTs','プッチーニ作曲のオペラ『トゥーランドット』の第３幕で登場するアリア。','img/003.jpg');
INSERT INTO MUSIC VALUES(4,'Ave Maria',2,100,'https://www.youtube.com/watch?v=JF4NQpU1WtU&list=PLk1cfCcxl1aSUbkKK8R4eGNgQJ5yfAt7T&index=5','「『アヴェ・マリア』といえば？」で挙げられる作品の中で最も有名な曲。','img/004.jpg');
INSERT INTO MUSIC VALUES(5,'I LOVE YOU',3,100,'https://www.youtube.com/watch?v=pWL9zveNpqg','ピアノ演奏をメインとした若い男女の切ない恋愛をテーマとしたバラードソング。','img/005.jpg');
INSERT INTO MUSIC VALUES(6,'卒業',3,100,'https://www.youtube.com/watch?v=xcJEKjmmHfA','国内外問わず多くのアーティストにカバーされている不朽の名曲','img/006.jpg');
INSERT INTO MUSIC VALUES(7,'少女A',4,100,'https://www.youtube.com/watch?v=aTTkrFIvcLg','デビュー曲「スローモーション」とは正反対に「不良性」をコンセプトにした作品','img/007.jpg');
INSERT INTO MUSIC VALUES(8,'難破船',4,100,'https://www.youtube.com/watch?v=zVplJuWnoAg','加藤登紀子からの既存曲の提供で、加藤は中森に楽曲のテープを送ったことからカバーし大ヒットとなった作品','img/008.jpg');
INSERT INTO MUSIC VALUES(9,'damn',5,100,'https://www.youtube.com/watch?v=yP7K2lXr6GA','過去をまとめ上げ、自分を見つめ直して前へ進む、そんな彼の生き方を象徴するような作品','img/009.jpg');
INSERT INTO MUSIC VALUES(10,'grace',5,100,'https://www.youtube.com/watch?v=rSYoIuyks8g','2022/10/10に配信リリース。NTTドコモが展開するプロジェクト「KAZE FILMS docomo future project」のCM曲','img/010.jpg');
INSERT INTO MUSIC VALUES(11,'Tot Musica（ウタ from ONE PIECE FILM RED）',6,100,'https://www.youtube.com/watch?v=V9_ZpqfqHFI','Ado Full Album『ウタの歌 ONE PIECE FILM RED』','img/011.jpg');
INSERT INTO MUSIC VALUES(12,'行方知れず',6,100,'https://www.youtube.com/watch?v=VQtmqpSE64w','椎名林檎(作詞・作編曲)の世界観溢れる歌詞とバンドサウンドにAdoの力強い歌声が重なるロックなナンバー','img/012.jpg');
INSERT INTO MUSIC VALUES(13,'渚のアデリーヌ',7,100,'https://www.youtube.com/watch?v=eCCan3TFPoc','フランスのピアニスト、リチャード・クレイダーマンのデビュー曲で最もよく知られている曲','img/013.jpg');
INSERT INTO MUSIC VALUES(14,'愛のコンチェルト',7,100,'https://www.youtube.com/watch?v=p03oMRNJF00','フランスのピアニスト、リチャード・クレイダーマンの作品の中で有名な曲の1つ','img/014.jpg');
INSERT INTO MUSIC VALUES(15,'Presence',8,100,'https://www.youtube.com/watch?v=WWcu8yJTqHc','デビュー15周年記念3作目となる作品でTVアニメ『アオアシ』第2クールオープニングテーマ','img/015.jpg');
INSERT INTO MUSIC VALUES(16,'タマシイレボリューション',8,100,'https://www.youtube.com/watch?v=Z2tedgbqJJs','NHKの2010年度サッカーテーマソング。Superfly作詞・作曲で歌うロックで力強い作品。','img/016.jpg');
INSERT INTO MUSIC VALUES(17,'家（うち）に帰ろう（マイ・スイート・ホーム）',9,100,'https://www.youtube.com/watch?v=ACYNHhiQkwI','1992年にTBS系で放送されたドラマ「木曜日の食卓」の主題歌。(当時出演していた西島秀俊が本作のMVにも登場)','img/017.jpg');
INSERT INTO MUSIC VALUES(18,'Plastic Love',9,100,'https://www.youtube.com/watch?v=T_lC2O1oIew','「都会暮らしの若い女性による自由恋愛」という極めてフィクショナルなテーマを独自のセンスで描いた作品','img/018.jpg');
INSERT INTO MUSIC VALUES(19,'Hello,my friend',10,100,'https://www.youtube.com/watch?v=K6dmZhdCYs0','「ストアがたたみだす」晩夏の情景を歌っている作品。フジテレビ系月9ドラマ『君といた夏』主題歌。','img/019.jpg');
INSERT INTO MUSIC VALUES(20,'春よ、来い',10,100,'https://www.youtube.com/watch?v=qX7pFYH9O04','同名のNHK連続テレビ小説の主題歌で多くのアーティストにカバーされている作品','img/020.jpg');
INSERT INTO MUSIC VALUES(21,'あなたがいることで',14,100,'https://www.youtube.com/watch?v=qLMLzBYTTKQ','TBS系日曜劇場『テセウスの船』として書き下ろされたバラード','img/021.jpg');
INSERT INTO MUSIC VALUES(22,'セレナーデ',14,100,'https://www.youtube.com/watch?v=WL_v2HjODKE','短篇集『セレナーデ』は彼女が"自身の楽曲を元に書いた物語"でその中の1つを音楽化','img/022.jpg');
INSERT INTO MUSIC VALUES(23,'First Love',11,100,'https://www.youtube.com/watch?v=o1sUaVJUeB0','アルバム『First Love』からのシングルカット。累計出荷枚数96万枚のヒットとなる[1]。なお、アルバム『First Love』は累計売上800万枚を超えている。','https://content-jp.umgi.net/products/to/toct-4150_ruN_extralarge.jpg?27122018082755');
INSERT INTO MUSIC VALUES(24,'正夢',12,100,'https://www.youtube.com/embed/algaC2jhu8s','11thアルバム『スーベニア』からの先行シングル。フジテレビ系ドラマ『めだか』主題歌、富士フイルム企業CMイメージソングのダブルタイアップがついた。','https://spitz-web.com/wp/wp-content/uploads/2016/12/single_29.jpg');
INSERT INTO MUSIC VALUES(25,'XYZ',13,100,'https://www.youtube.com/embed/G6pgM-NVfWg','「Another Mind」に収録されている楽曲。2003年度　日本ゴールド・ディスク大賞＜ジャズ・アルバム・オブ・ザ・イヤー＞','//simg.mysound.jp/img/disc/425/100_UPC00888072255425.jpg');

INSERT INTO ACCOUNT VALUES(1,'素切 礼子','reko@sukkiri.com','1234','1234567890123456');

INSERT INTO BOUGHT VALUES(1,10,0);
INSERT INTO BOUGHT VALUES(1,11,0);
