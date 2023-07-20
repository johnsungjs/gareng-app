DROP TABLE IF EXISTS `USERS`;
DROP TABLE IF EXISTS `RefreshTokenHistory`;
DROP TABLE IF EXISTS `ITEMS`;
DROP TABLE IF EXISTS `WISHLIST`;

CREATE TABLE IF NOT EXISTS `USERS`(
    `id` BIGINT primary key auto_increment,
    `uuid` VARCHAR(40),
    `username` VARCHAR(50),
    `password` VARCHAR(60),
    `address` VARCHAR(50),
    `gender` VARCHAR(6),
    `age` INT,
    `email` VARCHAR(50)
);

INSERT INTO USERS (`id`,`uuid`,`username`,`password`,`address`,`gender`,`age`,`email`)
VALUES('1','88fc35f8-c8c4-47f4-b134-00b3754142ca','MasGareng','123','boulevard hijau harapan indah','male','69','gareng@gmail.com');

CREATE TABLE IF NOT EXISTS `RefreshTokenHistory`(
    `id` BIGINT primary key auto_increment,
    `token` VARCHAR(220)
);

CREATE TABLE IF NOT EXISTS `ITEMS`(
    `id` BIGINT primary key,
    `uuid` VARCHAR(40),
    `title` VARCHAR(30),
    `price` VARCHAR(25),
    `imageUrl` VARCHAR(150)
);
INSERT INTO ITEMS (`id`,`uuid`,`title`,`price`,`imageUrl`)
VALUES('1','88fc35f8-c8c4-47f4-b134-00b3754142ca','Nasi Goreng Ayam','20000','http://placekitten.com/300/300');
INSERT INTO ITEMS (`id`,`uuid`,`title`,`price`,`imageUrl`)
VALUES('2','5d1bdeaa-246e-439d-ac13-7ef5bc72203e','Nasi Goreng Kucing','21000','http://placekitten.com/300/300');
INSERT INTO ITEMS (`id`,`uuid`,`title`,`price`,`imageUrl`)
VALUES('3','684f67e5-9bb7-43bf-a833-7935f57a58d1','Nasi Goreng Anjing','23000','http://placekitten.com/300/300');
INSERT INTO ITEMS (`id`,`uuid`,`title`,`price`,`imageUrl`)
VALUES('4','0fc88814-fa4e-4e9f-a2bd-1d986bc8a616','Nasi Goreng Babi','24000','http://placekitten.com/300/300');
INSERT INTO ITEMS (`id`,`uuid`,`title`,`price`,`imageUrl`)
VALUES('5','ccb5339b-5cd6-4bfe-846c-9403a27b0c80','Nasi Goreng Kelelawar','50000','http://placekitten.com/300/300');
INSERT INTO ITEMS (`id`,`uuid`,`title`,`price`,`imageUrl`)
VALUES('6','7755b378-c71e-4679-aee5-fb5e8215cd85','Kwetiau Goreng Ayam','20000','http://placekitten.com/300/300');
INSERT INTO ITEMS (`id`,`uuid`,`title`,`price`,`imageUrl`)
VALUES('7','0c9f47a6-718f-45bb-8358-20a0c8021d78','Kwetiau Goreng Kucing','21000','http://placekitten.com/300/300');
INSERT INTO ITEMS (`id`,`uuid`,`title`,`price`,`imageUrl`)
VALUES('8','9cdca6f7-e731-4e86-b820-cc5c40d27e2b','Kwetiau Goreng Anjing','23000','http://placekitten.com/300/300');
INSERT INTO ITEMS (`id`,`uuid`,`title`,`price`,`imageUrl`)
VALUES('9','f3853ce1-678d-4ea6-b0ce-2b6e2b17f0a1','Kwetiau Goreng Babi','24000','http://placekitten.com/300/300');
INSERT INTO ITEMS (`id`,`uuid`,`title`,`price`,`imageUrl`)
VALUES('10','91cb1a5e-4da7-4bd6-a66d-57d9077c30a3','Kwetiau Goreng Kelelawar','50000','http://placekitten.com/300/300');
INSERT INTO ITEMS (`id`,`uuid`,`title`,`price`,`imageUrl`)
VALUES('11','bf654113-407c-4dbd-b888-487fea2ba6a5','Es Teh Manis','2000','http://placekitten.com/300/300');
INSERT INTO ITEMS (`id`,`uuid`,`title`,`price`,`imageUrl`)
VALUES('12','4b6a865e-d7c4-42c6-9bf4-643ff79a4cc9','Es Teh Pahit','1000','http://placekitten.com/300/300');
INSERT INTO ITEMS (`id`,`uuid`,`title`,`price`,`imageUrl`)
VALUES('13','584a354c-67e4-4a49-8b58-cba95b8749a1','Es Teh Tawar','1500','http://placekitten.com/300/300');
INSERT INTO ITEMS (`id`,`uuid`,`title`,`price`,`imageUrl`)
VALUES('14','c627b547-3994-47e6-8b66-8895d354206f','Teh Tawar Manis','2000','http://placekitten.com/300/300');
INSERT INTO ITEMS (`id`,`uuid`,`title`,`price`,`imageUrl`)
VALUES('15','89e36646-5756-4bd2-b7e6-541e8ee67d83','Teh Tawar Pahit','1000','http://placekitten.com/300/300');
INSERT INTO ITEMS (`id`,`uuid`,`title`,`price`,`imageUrl`)
VALUES('16','0ee8760e-bb14-4365-8da6-d4302f1802a9','Teh Tawar Tawar','1500','http://placekitten.com/300/300');
INSERT INTO ITEMS (`id`,`uuid`,`title`,`price`,`imageUrl`)
VALUES('17','59f75496-d1ae-47b7-8a4e-22cfc2caafac','Bihun Goreng Ayam','20000','http://placekitten.com/300/300');
INSERT INTO ITEMS (`id`,`uuid`,`title`,`price`,`imageUrl`)
VALUES('18','62b98c51-5faa-49bb-9d48-e9c493ead45d','Bihun Goreng Kucing','21000','http://placekitten.com/300/300');
INSERT INTO ITEMS (`id`,`uuid`,`title`,`price`,`imageUrl`)
VALUES('19','0b5858e3-1018-4f7b-86a6-e7764ea9029f','Bihun Goreng Babi','50000','http://placekitten.com/300/300');

CREATE TABLE IF NOT EXISTS `Wishlist`(
    `id` BIGINT primary key auto_increment,
    `useruuid` VARCHAR(40),
    `itemuuid` VARCHAR(40)
);

INSERT INTO WISHLIST (`id`,`useruuid`,`itemuuid`)
VALUES('1','88fc35f8-c8c4-47f4-b134-00b3754142ca','5d1bdeaa-246e-439d-ac13-7ef5bc72203e');
INSERT INTO WISHLIST (`id`,`useruuid`,`itemuuid`)
VALUES('2','88fc35f8-c8c4-47f4-b134-00b3754142ca','0b5858e3-1018-4f7b-86a6-e7764ea9029f');
INSERT INTO WISHLIST (`id`,`useruuid`,`itemuuid`)
VALUES('3','88fc35f8-c8c4-47f4-b134-00b3754142ca','59f75496-d1ae-47b7-8a4e-22cfc2caafac');
INSERT INTO WISHLIST (`id`,`useruuid`,`itemuuid`)
VALUES('4','88fc35f8-c8c4-47f4-b134-00b3754142ca','584a354c-67e4-4a49-8b58-cba95b8749a1');
INSERT INTO WISHLIST (`id`,`useruuid`,`itemuuid`)
VALUES('5','88fc35f8-c8c4-47f4-b134-00b3754142ca','f3853ce1-678d-4ea6-b0ce-2b6e2b17f0a1');