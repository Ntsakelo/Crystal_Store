CREATE TABLE "customers" (
  "id" integer PRIMARY KEY,
  "first_name" varchar NOT NULL,
  "last_name" varchar NOT NULL,
  "email_address" varchar NOT NULL
);

CREATE TABLE "brands" (
    "id" integer PRIMARY KEY,
    "brand" varchar NOT NULL
)

CREATE TABLE "categories" (
  "id" integer PRIMARY KEY,
  "category" varchar NOT NULL
);

CREATE TABLE "products" (
  "id" integer PRIMARY KEY,
  "product" varchar NOT NULL,
  "category_id" integer NOT NULL,
  "brand_id" integer NOT NULL
);

CREATE TABLE "stock" (
  "id" integer PRIMARY KEY,
  "product_id" integer NOT NULL,
  "qty" integer NOT NULL,
  "product_image" text NOT NULL,
  "size" integer NOT NULL,
  "color" integer NOT NULL,
  "sku_code" text NOT NULL,
  "price" decimal NOT NULL
);

CREATE TABLE "favorites"(
   "id" integer PRIMARY KEY,
   "customer_id" integer NOT NULL,
   "product" varchar NOT NULL
);

CREATE TABLE "catalogue" (
    "id" integer PRIMARY KEY,
    "customer_id" integer NOT NULL,
    "product" varchar NOT NULL,
    "Qty" integer NOT NULL,
    "price" decimal NOT NULL
 );

CREATE TABLE "Orders" (
  "id" integer PRIMARY KEY,
  "customer_id" integer NOT NULL,
  "product" varchar NOT NULL,
  "price" decimal NOT NULL,
  "order_date" datetime NOT NULL
);

CREATE TABLE "deliveries" (
  "id" integer PRIMARY KEY,
  "customer_id" integer NOT NULL,
  "delivery_address" text NOT NULL,
  "contact_no" varchar NOT NULL,
  "delivery_date" date NOT NULL
);

ALTER TABLE "products" ADD FOREIGN KEY ("category_id") REFERENCES "categories" ("id") ON DELETE CASCADE;

ALTER TABLE "Orders" ADD FOREIGN KEY ("customer_id") REFERENCES "customers" ("id") ON DELETE CASCADE;

ALTER TABLE "deliveries" ADD FOREIGN KEY ("customer_id") REFERENCES "customers" ("id") ON DELETE CASCADE;

ALTER TABLE "stock" ADD FOREIGN KEY ("product_id") REFERENCES "products" ("id") ON DELETE CASCADE;

ALTER TABLE "products" ADD FOREIGN KEY ("brand_id") REFERENCES "brands" ("id") ON DELETE CASCADE;

ALTER TABLE "catalogue" ADD FOREIGN KEY ("customer_id") REFERENCES "customers" ("id") ON DELETE CASCADE

