PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
INSERT INTO "users" VALUES(1,'admin@admin.com','12345','admin', 'Admin');
INSERT INTO "users" VALUES(2,'test1@test.com','12345','Test1', 'Company');
INSERT INTO "users" VALUES(3,'test2@test.com','abcde','Test2', 'Company');
INSERT INTO "users" VALUES(5,'abc@abc.com','12345','ABC Oy', 'Company');
INSERT INTO "users" VALUES(6,'kone@kone.fi','12345','Kone Oy', 'Company');
INSERT INTO "users" VALUES(7,'elisa@elisa.fi','12345','Elisa Oy', 'Company');
INSERT INTO "users" VALUES(8,'foodie@foodie.fi','12345','Foodie Oy', 'Company');
COMMIT;
