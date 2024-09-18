CREATE TABLE `annotations` (
	`ballad_id` integer NOT NULL,
	`key` integer NOT NULL,
	`a_text` text NOT NULL,
	PRIMARY KEY(`ballad_id`, `key`),
	FOREIGN KEY (`ballad_id`) REFERENCES `ballads`(`id`) ON UPDATE no action ON DELETE no action
);
--> statement-breakpoint
CREATE TABLE `ballads` (
	`id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	`key` text NOT NULL,
	`title` text NOT NULL,
	`b_order` integer NOT NULL,
	`link` text,
	`prev_id` integer,
	`next_id` integer,
	FOREIGN KEY (`prev_id`) REFERENCES `ballads`(`id`) ON UPDATE no action ON DELETE no action,
	FOREIGN KEY (`next_id`) REFERENCES `ballads`(`id`) ON UPDATE no action ON DELETE no action
);
--> statement-breakpoint
CREATE TABLE `contents` (
	`ballad_id` integer NOT NULL,
	`c_order` integer NOT NULL,
	`character` text,
	`c_text` text NOT NULL,
	PRIMARY KEY(`ballad_id`, `c_order`),
	FOREIGN KEY (`ballad_id`) REFERENCES `ballads`(`id`) ON UPDATE no action ON DELETE no action
);
--> statement-breakpoint
CREATE TABLE `mottos` (
	`id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	`ballad_id` integer NOT NULL,
	`m_text` text NOT NULL,
	`author` text NOT NULL,
	`translation` text,
	FOREIGN KEY (`ballad_id`) REFERENCES `ballads`(`id`) ON UPDATE no action ON DELETE no action
);
--> statement-breakpoint
CREATE TABLE `notes` (
	`ballad_id` integer NOT NULL,
	`n_order` integer NOT NULL,
	`n_text` text NOT NULL,
	PRIMARY KEY(`ballad_id`, `n_order`),
	FOREIGN KEY (`ballad_id`) REFERENCES `ballads`(`id`) ON UPDATE no action ON DELETE no action
);
--> statement-breakpoint
CREATE UNIQUE INDEX `ballads_key_unique` ON `ballads` (`key`);--> statement-breakpoint
CREATE UNIQUE INDEX `ballads_b_order_unique` ON `ballads` (`b_order`);