import {
  type AnySQLiteColumn,
  integer,
  primaryKey,
  sqliteTable,
  text,
} from 'drizzle-orm/sqlite-core';

export const ballads = sqliteTable('ballads', {
  id: integer('id').notNull().primaryKey({ autoIncrement: true }),
  key: text('key').notNull().unique(),
  title: text('title').notNull(),
  order: integer('b_order').notNull().unique(),
  link: text('link'),
  prevId: integer('prev_id').references((): AnySQLiteColumn => ballads.id),
  nextId: integer('next_id').references((): AnySQLiteColumn => ballads.id),
});

export const contents = sqliteTable(
  'contents',
  {
    balladId: integer('ballad_id')
      .notNull()
      .references(() => ballads.id),
    order: integer('c_order').notNull(),
    character: text('character'),
    text: text('c_text').notNull(),
  },
  (table) => ({
    pk: primaryKey({ columns: [table.balladId, table.order] }),
  })
);

export const notes = sqliteTable(
  'notes',
  {
    balladId: integer('ballad_id')
      .notNull()
      .references(() => ballads.id),
    order: integer('n_order').notNull(),
    text: text('n_text').notNull(),
  },
  (table) => ({
    pk: primaryKey({ columns: [table.balladId, table.order] }),
  })
);

export const mottos = sqliteTable('mottos', {
  id: integer('id').notNull().primaryKey({ autoIncrement: true }),
  balladId: integer('ballad_id')
    .notNull()
    .references(() => ballads.id),
  text: text('m_text').notNull(),
  author: text('author').notNull(),
  translation: text('translation'),
});

export const annotations = sqliteTable(
  'annotations',
  {
    balladId: integer('ballad_id')
      .notNull()
      .references(() => ballads.id),
    key: integer('key').notNull(),
    text: text('a_text').notNull(),
  },
  (table) => ({
    pk: primaryKey({ columns: [table.balladId, table.key] }),
  })
);
