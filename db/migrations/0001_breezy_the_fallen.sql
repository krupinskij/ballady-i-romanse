CREATE TABLE `annotations` (
	`ballad_id` integer NOT NULL,
	`key` integer NOT NULL,
	`a_text` text NOT NULL,
	PRIMARY KEY(`ballad_id`, `key`),
	FOREIGN KEY (`ballad_id`) REFERENCES `ballads`(`id`) ON UPDATE no action ON DELETE no action
);
--> statement-breakpoint
ALTER TABLE `ballads` ADD `link` text NOT NULL;