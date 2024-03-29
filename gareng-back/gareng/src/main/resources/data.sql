DROP TABLE IF EXISTS `TransactionDetail`;
DROP TABLE IF EXISTS `USERS`;
DROP TABLE IF EXISTS `RefreshTokenHistory`;
DROP TABLE IF EXISTS `ITEMS`;
DROP TABLE IF EXISTS `WISHLIST`;
DROP TABLE IF EXISTS `TransactionHeader`;

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
VALUES('1','88fc35f8-c8c4-47f4-b134-00b3754142ca','admin','admin','boulevard hijau harapan indah','male','69','gareng@gmail.com');

CREATE TABLE IF NOT EXISTS `RefreshTokenHistory`(
    `id` BIGINT primary key auto_increment,
    `token` VARCHAR(220)
);

CREATE TABLE IF NOT EXISTS `ITEMS`(
    `id` BIGINT primary key,
    `uuid` VARCHAR(40),
    `title` VARCHAR(30),
    `price` VARCHAR(25),
    `imageUrl` VARCHAR(550)
);
INSERT INTO ITEMS (`id`,`uuid`,`title`,`price`,`imageUrl`)
VALUES('1','88fc35f8-c8c4-47f4-b134-00b3754142ca','Nasi Goreng Ayam','20000','https://images.unsplash.com/photo-1603133872878-684f208fb84b?auto=format&fit=crop&q=80&w=1925&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%%3D%%3D');
INSERT INTO ITEMS (`id`,`uuid`,`title`,`price`,`imageUrl`)
VALUES('2','5d1bdeaa-246e-439d-ac13-7ef5bc72203e','Nasi Goreng Kucing','21000','https://images.unsplash.com/photo-1551326844-4df70f78d0e9?auto=format&fit=crop&q=80&w=1926&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%%3D%%3D');
INSERT INTO ITEMS (`id`,`uuid`,`title`,`price`,`imageUrl`)
VALUES('3','684f67e5-9bb7-43bf-a833-7935f57a58d1','Nasi Goreng Anjing','23000','https://images.unsplash.com/photo-1630914441934-a29bf360934c?auto=format&fit=crop&q=80&w=1887&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%%3D%%3D');
INSERT INTO ITEMS (`id`,`uuid`,`title`,`price`,`imageUrl`)
VALUES('4','0fc88814-fa4e-4e9f-a2bd-1d986bc8a616','Nasi Goreng Babi','24000','https://plus.unsplash.com/premium_photo-1664391771710-4f7eb2a4649a?auto=format&fit=crop&q=80&w=2690&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%%3D%%3D');
INSERT INTO ITEMS (`id`,`uuid`,`title`,`price`,`imageUrl`)
VALUES('5','ccb5339b-5cd6-4bfe-846c-9403a27b0c80','Nasi Goreng Kelelawar','50000','https://images.unsplash.com/photo-1603133872878-684f208fb84b?auto=format&fit=crop&q=80&w=1925&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%%3D%%3D');
INSERT INTO ITEMS (`id`,`uuid`,`title`,`price`,`imageUrl`)
VALUES('6','7755b378-c71e-4679-aee5-fb5e8215cd85','Kwetiau Goreng Ayam','20000','https://images.spoonacular.com/file/wximages/423186-636x393.png');
INSERT INTO ITEMS (`id`,`uuid`,`title`,`price`,`imageUrl`)
VALUES('7','0c9f47a6-718f-45bb-8358-20a0c8021d78','Kwetiau Goreng Kucing','21000','https://images.spoonacular.com/file/wximages/423186-636x393.png');
INSERT INTO ITEMS (`id`,`uuid`,`title`,`price`,`imageUrl`)
VALUES('8','9cdca6f7-e731-4e86-b820-cc5c40d27e2b','Kwetiau Goreng Anjing','23000','https://images.spoonacular.com/file/wximages/423186-636x393.png');
INSERT INTO ITEMS (`id`,`uuid`,`title`,`price`,`imageUrl`)
VALUES('9','f3853ce1-678d-4ea6-b0ce-2b6e2b17f0a1','Kwetiau Goreng Babi','24000','https://images.unsplash.com/photo-1603133872878-684f208fb84b?auto=format&fit=crop&q=80&w=1925&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%%3D%%3D');
INSERT INTO ITEMS (`id`,`uuid`,`title`,`price`,`imageUrl`)
VALUES('10','91cb1a5e-4da7-4bd6-a66d-57d9077c30a3','Kwetiau Goreng Kelelawar','50000','https://images.spoonacular.com/file/wximages/423186-636x393.png');
INSERT INTO ITEMS (`id`,`uuid`,`title`,`price`,`imageUrl`)
VALUES('11','bf654113-407c-4dbd-b888-487fea2ba6a5','Es Teh Manis','2000','https://images.unsplash.com/photo-1499638673689-79a0b5115d87?auto=format&fit=crop&q=80&w=2564&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%%3D%%3D');
INSERT INTO ITEMS (`id`,`uuid`,`title`,`price`,`imageUrl`)
VALUES('12','4b6a865e-d7c4-42c6-9bf4-643ff79a4cc9','Es Teh Pahit','1000','https://images.unsplash.com/photo-1556679343-c7306c1976bc?auto=format&fit=crop&q=80&w=2564&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%%3D%%3D');
INSERT INTO ITEMS (`id`,`uuid`,`title`,`price`,`imageUrl`)
VALUES('13','584a354c-67e4-4a49-8b58-cba95b8749a1','Es Teh Tawar','1500','https://images.unsplash.com/photo-1584279666123-6060b7d9af86?auto=format&fit=crop&q=80&w=2572&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%%3D%%3D');
INSERT INTO ITEMS (`id`,`uuid`,`title`,`price`,`imageUrl`)
VALUES('14','c627b547-3994-47e6-8b66-8895d354206f','Teh Tawar Manis','2000','https://images.unsplash.com/photo-1599767431130-41b1c51d9a7b?auto=format&fit=crop&q=80&w=2574&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%%3D%%3D');
INSERT INTO ITEMS (`id`,`uuid`,`title`,`price`,`imageUrl`)
VALUES('15','89e36646-5756-4bd2-b7e6-541e8ee67d83','Teh Tawar Pahit','1000','https://plus.unsplash.com/premium_photo-1664392087859-815b337c3324?auto=format&fit=crop&q=80&w=2580&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%%3D%%3D');
INSERT INTO ITEMS (`id`,`uuid`,`title`,`price`,`imageUrl`)
VALUES('16','0ee8760e-bb14-4365-8da6-d4302f1802a9','Teh Tawar Tawar','1500','https://plus.unsplash.com/premium_photo-1676202363503-4f44c507bc60?auto=format&fit=crop&q=80&w=2574&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%%3D%%3D');
INSERT INTO ITEMS (`id`,`uuid`,`title`,`price`,`imageUrl`)
VALUES('17','59f75496-d1ae-47b7-8a4e-22cfc2caafac','Bihun Goreng Ayam','20000','https://images.spoonacular.com/file/wximages/423186-636x393.png');
INSERT INTO ITEMS (`id`,`uuid`,`title`,`price`,`imageUrl`)
VALUES('18','62b98c51-5faa-49bb-9d48-e9c493ead45d','Bihun Goreng Kucing','21000','https://images.spoonacular.com/file/wximages/423186-636x393.png');
INSERT INTO ITEMS (`id`,`uuid`,`title`,`price`,`imageUrl`)
VALUES('19','0b5858e3-1018-4f7b-86a6-e7764ea9029f','Bihun Goreng Babi','50000','https://images.spoonacular.com/file/wximages/423186-636x393.png');

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

CREATE TABLE IF NOT EXISTS `TransactionHeader`(
    `id` bigint primary key auto_increment,
    `transactionDate` datetime,
    `payment` int,
    `paymentmethod` VARCHAR(10),
    `UUID` VARCHAR(40),
    `useruuid` VARCHAR(40)
);

INSERT INTO TRANSACTIONHEADER(`id`,`transactionDate`,`payment`,`paymentmethod`,`UUID`,`useruuid`)
VALUES('69','2023-08-31','50000','cash','88fc35f8-c8c4-47f4-b134-00b3754142ci','88fc35f8-c8c4-47f4-b134-00b3754142ca');

CREATE TABLE IF NOT EXISTS `TransactionDetail`(
    `id` bigint primary key auto_increment,
    `transactionHeaderId` bigint not null,
    `itemId` bigint not null,
    `amount` int,
    foreign key(`transactionHeaderId`) references `TransactionHeader`(`id`),
    foreign key(`itemId`) references `items`(`id`)
);

INSERT INTO TRANSACTIONDETAIL(`id`,`transactionHeaderId`,`itemId`,`amount`)
VALUES('101','69','1','1');
INSERT INTO TRANSACTIONDETAIL(`id`,`transactionHeaderId`,`itemId`,`amount`)
VALUES('102','69','2','1');
INSERT INTO TRANSACTIONDETAIL(`id`,`transactionHeaderId`,`itemId`,`amount`)
VALUES('103','69','3','1');