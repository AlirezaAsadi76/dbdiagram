CREATE TABLE "Category" (
  "id" bigint PRIMARY KEY,
  "name" varchar NOT NULL,
  "parent_id" bigint NOT NULL
);

CREATE TABLE "Prooduct" (
  "id" bigint PRIMARY KEY,
  "name" varchar NOT NULL,
  "Category_id" bigint NOT NULL,
  "Store_id" bigint NOT NULL,
  "point" int,
  "price" bigint,
  "count" int
);

CREATE TABLE "Cart" (
  "id" bigint PRIMARY KEY,
  "User_id" bigint NOT NULL,
  "Product_id" bigint NOT NULL,
  "count" int,
  "register" boolean
);

CREATE TABLE "Users" (
  "id" bigint PRIMARY KEY,
  "fullname" varchar,
  "username" varchar,
  "email" email,
  "password" varchar,
  "role_id" bigint NOT NULL,
  "description" varchar
);

CREATE TABLE "Address" (
  "id" bigint PRIMARY KEY,
  "State_id" bigint NOT NULL,
  "User_id" bigint,
  "description" varchar
);

CREATE TABLE "State" (
  "id" bigint PRIMARY KEY,
  "city" varchar,
  "parent_id" bigint
);

CREATE TABLE "Comment" (
  "id" bigint PRIMARY KEY,
  "User_id" bigint NOT NULL,
  "text" text,
  "date" datetime,
  "confirmation" boolean,
  "reply_id" bigint NOT NULL
);

CREATE TABLE "Discount" (
  "id" bigint PRIMARY KEY,
  "Product_id" bigint NOT NULL,
  "date" datetime,
  "percent" int
);

CREATE TABLE "UserHistory" (
  "id" bigint PRIMARY KEY,
  "User_id" bigint NOT NULL,
  "UserAttribute_id" bigint,
  "value" varchar,
  "date" datetime
);

CREATE TABLE "UserAttribute" (
  "id" bigint PRIMARY KEY,
  "name" varchar
);

CREATE TABLE "Attribute" (
  "id" bigint PRIMARY KEY,
  "name" varchar
);

CREATE TABLE "Attribute_Category" (
  "id" bigint PRIMARY KEY,
  "Category_id" bigint NOT NULL,
  "Attribute_id" bigint NOT NULL,
  "value" varchar,
  "price" int
);

CREATE TABLE "Store" (
  "id" bigint PRIMARY KEY,
  "name" varchar,
  "phonenumber" varchar,
  "point" int
);

CREATE TABLE "Store_User" (
  "id" bigint PRIMARY KEY,
  "User_id" bigint NOT NULL,
  "Store_id" bigint NOT NULL,
  "role" varchar
);

CREATE TABLE "Role" (
  "id" bigint PRIMARY KEY,
  "name" varchar
);

CREATE TABLE "Route" (
  "id" bigint PRIMARY KEY,
  "path" varchar,
  "valid" boolean
);

CREATE TABLE "Role_Rout" (
  "id" bigint PRIMARY KEY,
  "Role_id" bigint NOT NULL,
  "Route_id" bigint NOT NULL
);

CREATE TABLE "Complaint" (
  "id" bigint PRIMARY KEY,
  "user_id" bigint NOT NULL,
  "Product_id" bigint NOT NULL,
  "description" text
);

ALTER TABLE "Category" ADD FOREIGN KEY ("parent_id") REFERENCES "Category" ("id");

ALTER TABLE "Prooduct" ADD FOREIGN KEY ("Category_id") REFERENCES "Category" ("id");

ALTER TABLE "Prooduct" ADD FOREIGN KEY ("Store_id") REFERENCES "Store" ("id");

ALTER TABLE "Cart" ADD FOREIGN KEY ("User_id") REFERENCES "Users" ("id");

ALTER TABLE "Cart" ADD FOREIGN KEY ("Product_id") REFERENCES "Prooduct" ("id");

ALTER TABLE "Users" ADD FOREIGN KEY ("role_id") REFERENCES "Role" ("id");

ALTER TABLE "Address" ADD FOREIGN KEY ("State_id") REFERENCES "State" ("id");

ALTER TABLE "Address" ADD FOREIGN KEY ("User_id") REFERENCES "Users" ("id");

ALTER TABLE "State" ADD FOREIGN KEY ("parent_id") REFERENCES "State" ("id");

ALTER TABLE "Comment" ADD FOREIGN KEY ("User_id") REFERENCES "Users" ("id");

ALTER TABLE "Comment" ADD FOREIGN KEY ("reply_id") REFERENCES "Comment" ("id");

ALTER TABLE "Discount" ADD FOREIGN KEY ("Product_id") REFERENCES "Prooduct" ("id");

ALTER TABLE "UserHistory" ADD FOREIGN KEY ("User_id") REFERENCES "Users" ("id");

ALTER TABLE "UserHistory" ADD FOREIGN KEY ("UserAttribute_id") REFERENCES "UserAttribute" ("id");

ALTER TABLE "Attribute_Category" ADD FOREIGN KEY ("Category_id") REFERENCES "Category" ("id");

ALTER TABLE "Attribute_Category" ADD FOREIGN KEY ("Attribute_id") REFERENCES "Attribute" ("id");

ALTER TABLE "Store_User" ADD FOREIGN KEY ("User_id") REFERENCES "Users" ("id");

ALTER TABLE "Store_User" ADD FOREIGN KEY ("Store_id") REFERENCES "Store" ("id");

ALTER TABLE "Role_Rout" ADD FOREIGN KEY ("Role_id") REFERENCES "Role" ("id");

ALTER TABLE "Role_Rout" ADD FOREIGN KEY ("Route_id") REFERENCES "Route" ("id");

ALTER TABLE "Complaint" ADD FOREIGN KEY ("user_id") REFERENCES "Users" ("id");

ALTER TABLE "Complaint" ADD FOREIGN KEY ("Product_id") REFERENCES "Prooduct" ("id");
