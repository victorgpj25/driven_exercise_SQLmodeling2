CREATE TABLE "public.customers" (
	"id" serial NOT NULL,
	"name" varchar(50) NOT NULL,
	"email" TEXT NOT NULL UNIQUE,
	"password" TEXT NOT NULL,
	CONSTRAINT "customers_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.products" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	"price" int NOT NULL,
	"categoryId" int NOT NULL,
	"sizeId" int NOT NULL,
	CONSTRAINT "products_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.categories" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL UNIQUE,
	CONSTRAINT "categories_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.sizes" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL UNIQUE,
	CONSTRAINT "sizes_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.productImages" (
	"id" serial NOT NULL,
	"productId" int NOT NULL,
	"imageURL" TEXT NOT NULL UNIQUE,
	"isMain" bool NOT NULL DEFAULT 'false',
	CONSTRAINT "productImages_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.inCartProducts" (
	"id" serial NOT NULL,
	"customerId" int NOT NULL,
	"productId" int NOT NULL,
	"quantity" int NOT NULL DEFAULT '1',
	CONSTRAINT "inCartProducts_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.sales" (
	"id" serial NOT NULL,
	"customerId" int NOT NULL,
	"deliveryAdress" TEXT NOT NULL,
	"date" serial NOT NULL DEFAULT 'NOW()',
	"status" TEXT NOT NULL DEFAULT 'created',
	CONSTRAINT "sales_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.saleProducts" (
	"id" serial NOT NULL,
	"saleId" int NOT NULL,
	"productId" int NOT NULL,
	"quantity" int NOT NULL,
	CONSTRAINT "saleProducts_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);




ALTER TABLE "products" ADD CONSTRAINT "products_fk0" FOREIGN KEY ("categoryId") REFERENCES "categories"("id");
ALTER TABLE "products" ADD CONSTRAINT "products_fk1" FOREIGN KEY ("sizeId") REFERENCES "sizes"("id");



ALTER TABLE "productImages" ADD CONSTRAINT "productImages_fk0" FOREIGN KEY ("productId") REFERENCES "products"("id");

ALTER TABLE "inCartProducts" ADD CONSTRAINT "inCartProducts_fk0" FOREIGN KEY ("customerId") REFERENCES "customers"("id");
ALTER TABLE "inCartProducts" ADD CONSTRAINT "inCartProducts_fk1" FOREIGN KEY ("productId") REFERENCES "products"("id");

ALTER TABLE "sales" ADD CONSTRAINT "sales_fk0" FOREIGN KEY ("customerId") REFERENCES "customers"("id");

ALTER TABLE "saleProducts" ADD CONSTRAINT "saleProducts_fk0" FOREIGN KEY ("saleId") REFERENCES "sales"("id");
ALTER TABLE "saleProducts" ADD CONSTRAINT "saleProducts_fk1" FOREIGN KEY ("productId") REFERENCES "products"("id");









