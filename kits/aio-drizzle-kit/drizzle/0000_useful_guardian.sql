-- Current sql file was generated after introspecting the database
-- If you want to run this migration please uncomment this code before executing migrations
/*
CREATE TABLE IF NOT EXISTS "migrations" (
	"id" integer PRIMARY KEY NOT NULL,
	"timestamp" bigint NOT NULL,
	"name" varchar(255) NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "sys_captcha_log" (
	"id" integer PRIMARY KEY NOT NULL,
	"user_id" integer,
	"account" varchar(255),
	"code" varchar(255),
	"provider" varchar(255),
	"created_at" timestamp NOT NULL,
	"updated_at" timestamp NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "sys_config" (
	"id" integer PRIMARY KEY NOT NULL,
	"key" varchar(50) NOT NULL,
	"name" varchar(50) NOT NULL,
	"value" varchar(255),
	"remark" varchar(255),
	"created_at" timestamp NOT NULL,
	"updated_at" timestamp NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "sys_dict_type" (
	"id" integer PRIMARY KEY NOT NULL,
	"created_at" timestamp NOT NULL,
	"updated_at" timestamp NOT NULL,
	"create_by" integer,
	"update_by" integer,
	"name" varchar(50) NOT NULL,
	"status" smallint NOT NULL,
	"remark" varchar(255),
	"code" varchar(50) NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "sys_dict" (
	"id" integer PRIMARY KEY NOT NULL,
	"created_at" timestamp NOT NULL,
	"updated_at" timestamp NOT NULL,
	"create_by" integer NOT NULL,
	"update_by" integer NOT NULL,
	"name" varchar(50) NOT NULL,
	"status" smallint NOT NULL,
	"remark" varchar(255)
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "sys_menu" (
	"id" integer PRIMARY KEY NOT NULL,
	"parent_id" integer,
	"path" varchar(255),
	"name" varchar(255) NOT NULL,
	"permission" varchar(255),
	"type" smallint NOT NULL,
	"icon" varchar(255),
	"order_no" integer,
	"component" varchar(255),
	"keep_alive" smallint NOT NULL,
	"show" smallint NOT NULL,
	"status" smallint NOT NULL,
	"created_at" timestamp NOT NULL,
	"updated_at" timestamp NOT NULL,
	"is_ext" smallint NOT NULL,
	"ext_open_mode" smallint NOT NULL,
	"active_menu" varchar(255),
	"create_by" integer,
	"update_by" integer
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "sys_role" (
	"id" integer PRIMARY KEY NOT NULL,
	"value" varchar(255) NOT NULL,
	"name" varchar(50) NOT NULL,
	"remark" varchar(255),
	"status" smallint,
	"created_at" timestamp NOT NULL,
	"updated_at" timestamp NOT NULL,
	"default" smallint,
	"create_by" integer,
	"update_by" integer
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "sys_task" (
	"id" integer PRIMARY KEY NOT NULL,
	"name" varchar(50) NOT NULL,
	"service" varchar(255) NOT NULL,
	"type" smallint NOT NULL,
	"status" smallint NOT NULL,
	"start_time" timestamp,
	"end_time" timestamp,
	"limit" integer,
	"cron" varchar(255),
	"every" integer,
	"data" text,
	"job_opts" text,
	"remark" varchar(255),
	"created_at" timestamp NOT NULL,
	"updated_at" timestamp NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "todo" (
	"id" integer PRIMARY KEY NOT NULL,
	"value" varchar(255) NOT NULL,
	"user_id" integer,
	"status" smallint NOT NULL,
	"created_at" timestamp NOT NULL,
	"updated_at" timestamp NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "tool_storage" (
	"id" integer PRIMARY KEY NOT NULL,
	"created_at" timestamp NOT NULL,
	"updated_at" timestamp NOT NULL,
	"name" varchar(200) NOT NULL,
	"file_name" varchar(200),
	"ext_name" varchar(255),
	"path" varchar(255) NOT NULL,
	"type" varchar(255),
	"size" varchar(255),
	"user_id" integer
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "sys_dept" (
	"id" integer PRIMARY KEY NOT NULL,
	"name" varchar(255) NOT NULL,
	"order_no" integer,
	"mpath" varchar(255),
	"parentId" integer,
	"created_at" timestamp NOT NULL,
	"updated_at" timestamp NOT NULL,
	"create_by" integer,
	"update_by" integer
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "sys_user" (
	"id" integer PRIMARY KEY NOT NULL,
	"username" varchar(255) NOT NULL,
	"password" varchar(255) NOT NULL,
	"avatar" varchar(255),
	"email" varchar(255),
	"phone" varchar(255),
	"remark" varchar(255),
	"psalt" varchar(32) NOT NULL,
	"status" smallint,
	"qq" varchar(255),
	"created_at" timestamp NOT NULL,
	"updated_at" timestamp NOT NULL,
	"nickname" varchar(255),
	"dept_id" integer
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "sys_login_log" (
	"id" integer PRIMARY KEY NOT NULL,
	"ip" varchar(255),
	"ua" varchar(500),
	"address" varchar(255),
	"provider" varchar(255),
	"created_at" timestamp NOT NULL,
	"updated_at" timestamp NOT NULL,
	"user_id" integer
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "sys_task_log" (
	"id" integer PRIMARY KEY NOT NULL,
	"task_id" integer,
	"status" smallint NOT NULL,
	"detail" text,
	"consume_time" integer,
	"created_at" timestamp NOT NULL,
	"updated_at" timestamp NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "user_access_tokens" (
	"id" varchar(36) PRIMARY KEY NOT NULL,
	"value" varchar(500) NOT NULL,
	"expired_at" timestamp NOT NULL,
	"created_at" timestamp NOT NULL,
	"user_id" integer
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "sys_dict_item" (
	"id" integer PRIMARY KEY NOT NULL,
	"created_at" timestamp NOT NULL,
	"updated_at" timestamp NOT NULL,
	"create_by" integer,
	"update_by" integer,
	"label" varchar(50) NOT NULL,
	"value" varchar(50) NOT NULL,
	"order" integer,
	"status" smallint NOT NULL,
	"remark" varchar(255),
	"type_id" integer,
	"order_no" integer
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "user_refresh_tokens" (
	"id" varchar(36) PRIMARY KEY NOT NULL,
	"value" varchar(500) NOT NULL,
	"expired_at" timestamp NOT NULL,
	"created_at" timestamp NOT NULL,
	"access_tokenId" varchar(36)
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "sys_user_roles" (
	"user_id" integer NOT NULL,
	"role_id" integer NOT NULL,
	CONSTRAINT "sys_user_roles_pkey" PRIMARY KEY("user_id","role_id")
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "sys_role_menus" (
	"role_id" integer NOT NULL,
	"menu_id" integer NOT NULL,
	CONSTRAINT "sys_role_menus_pkey" PRIMARY KEY("role_id","menu_id")
);
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "todo" ADD CONSTRAINT "FK_9cb7989853c4cb7fe427db4b260" FOREIGN KEY ("user_id") REFERENCES "public"."sys_user"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "sys_dept" ADD CONSTRAINT "FK_c75280b01c49779f2323536db67" FOREIGN KEY ("parentId") REFERENCES "public"."sys_dept"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "sys_user" ADD CONSTRAINT "FK_96bde34263e2ae3b46f011124ac" FOREIGN KEY ("dept_id") REFERENCES "public"."sys_dept"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "sys_login_log" ADD CONSTRAINT "FK_3029712e0df6a28edaee46fd470" FOREIGN KEY ("user_id") REFERENCES "public"."sys_user"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "sys_task_log" ADD CONSTRAINT "FK_f4d9c36052fdb188ff5c089454b" FOREIGN KEY ("task_id") REFERENCES "public"."sys_task"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "user_access_tokens" ADD CONSTRAINT "FK_e9d9d0c303432e4e5e48c1c3e90" FOREIGN KEY ("user_id") REFERENCES "public"."sys_user"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "sys_dict_item" ADD CONSTRAINT "FK_d68ea74fcb041c8cfd1fd659844" FOREIGN KEY ("type_id") REFERENCES "public"."sys_dict_type"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "user_refresh_tokens" ADD CONSTRAINT "FK_1dfd080c2abf42198691b60ae39" FOREIGN KEY ("access_tokenId") REFERENCES "public"."user_access_tokens"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "sys_user_roles" ADD CONSTRAINT "FK_6d61c5b3f76a3419d93a4216695" FOREIGN KEY ("role_id") REFERENCES "public"."sys_role"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "sys_user_roles" ADD CONSTRAINT "FK_96311d970191a044ec048011f44" FOREIGN KEY ("user_id") REFERENCES "public"."sys_user"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "sys_role_menus" ADD CONSTRAINT "FK_2b95fdc95b329d66c18f5baed6d" FOREIGN KEY ("menu_id") REFERENCES "public"."sys_menu"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "sys_role_menus" ADD CONSTRAINT "FK_35ce749b04d57e226d059e0f633" FOREIGN KEY ("role_id") REFERENCES "public"."sys_role"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
CREATE UNIQUE INDEX IF NOT EXISTS "IDX_2c363c25cf99bcaab3a7f389ba" ON "sys_config" USING btree ("key" text_ops);--> statement-breakpoint
CREATE UNIQUE INDEX IF NOT EXISTS "IDX_74d0045ff7fab9f67adc0b1bda" ON "sys_dict_type" USING btree ("code" text_ops);--> statement-breakpoint
CREATE UNIQUE INDEX IF NOT EXISTS "IDX_d112365748f740ee260b65ce91" ON "sys_dict" USING btree ("name" text_ops);--> statement-breakpoint
CREATE UNIQUE INDEX IF NOT EXISTS "IDX_05edc0a51f41bb16b7d8137da9" ON "sys_role" USING btree ("value" text_ops);--> statement-breakpoint
CREATE UNIQUE INDEX IF NOT EXISTS "IDX_223de54d6badbe43a5490450c3" ON "sys_role" USING btree ("name" text_ops);--> statement-breakpoint
CREATE UNIQUE INDEX IF NOT EXISTS "IDX_ef8e5ab5ef2fe0ddb1428439ef" ON "sys_task" USING btree ("name" text_ops);--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "FK_9cb7989853c4cb7fe427db4b260" ON "todo" USING btree ("user_id" int4_ops);--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "FK_c75280b01c49779f2323536db67" ON "sys_dept" USING btree ("parentId" int4_ops);--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "FK_96bde34263e2ae3b46f011124ac" ON "sys_user" USING btree ("dept_id" int4_ops);--> statement-breakpoint
CREATE UNIQUE INDEX IF NOT EXISTS "IDX_9e7164b2f1ea1348bc0eb0a7da" ON "sys_user" USING btree ("username" text_ops);--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "FK_3029712e0df6a28edaee46fd470" ON "sys_login_log" USING btree ("user_id" int4_ops);--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "FK_f4d9c36052fdb188ff5c089454b" ON "sys_task_log" USING btree ("task_id" int4_ops);--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "FK_e9d9d0c303432e4e5e48c1c3e90" ON "user_access_tokens" USING btree ("user_id" int4_ops);--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "FK_d68ea74fcb041c8cfd1fd659844" ON "sys_dict_item" USING btree ("type_id" int4_ops);--> statement-breakpoint
CREATE UNIQUE INDEX IF NOT EXISTS "REL_1dfd080c2abf42198691b60ae3" ON "user_refresh_tokens" USING btree ("access_tokenId" text_ops);--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "IDX_6d61c5b3f76a3419d93a421669" ON "sys_user_roles" USING btree ("role_id" int4_ops);--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "IDX_96311d970191a044ec048011f4" ON "sys_user_roles" USING btree ("user_id" int4_ops);--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "IDX_2b95fdc95b329d66c18f5baed6" ON "sys_role_menus" USING btree ("menu_id" int4_ops);--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "IDX_35ce749b04d57e226d059e0f63" ON "sys_role_menus" USING btree ("role_id" int4_ops);
*/