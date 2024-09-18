import {
  foreignKey,
  integer,
  primaryKey,
  sqliteTable,
  text,
  unique,
} from 'drizzle-orm/sqlite-core';

import { type SupportedLng } from '@i18n';

export const ballads = sqliteTable(
  'ballads',
  {
    id: integer('id').notNull().primaryKey({ autoIncrement: true }),
    key: text('key').notNull().unique(),
    title: text('title').notNull(),
    order: integer('b_order').notNull().unique(),
    link: text('link'),
    prevId: integer('prev_id'),
    nextId: integer('next_id'),
  },
  (table) => ({
    prevFK: foreignKey({ columns: [table.prevId], foreignColumns: [table.id] }),
    nextFK: foreignKey({ columns: [table.nextId], foreignColumns: [table.id] }),
  })
);

export const contents = sqliteTable(
  'contents',
  {
    balladId: integer('ballad_id').notNull(),
    order: integer('c_order').notNull(),
    character: text('character'),
    text: text('c_text').notNull(),
  },
  (table) => ({
    pk: primaryKey({ columns: [table.balladId, table.order] }),
    balladsFK: foreignKey({ columns: [table.balladId], foreignColumns: [ballads.id] }),
  })
);

export const notes = sqliteTable(
  'notes',
  {
    balladId: integer('ballad_id').notNull(),
    order: integer('n_order').notNull(),
    text: text('n_text').notNull(),
  },
  (table) => ({
    pk: primaryKey({ columns: [table.balladId, table.order] }),
    balladsFK: foreignKey({ columns: [table.balladId], foreignColumns: [ballads.id] }),
  })
);

export const mottos = sqliteTable(
  'mottos',
  {
    id: integer('id').notNull().primaryKey({ autoIncrement: true }),
    balladId: integer('ballad_id').notNull(),
    text: text('m_text').notNull(),
    author: text('author').notNull(),
    translation: text('translation'),
  },
  (table) => ({
    balladsFK: foreignKey({ columns: [table.balladId], foreignColumns: [ballads.id] }),
  })
);

export const annotations = sqliteTable(
  'annotations',
  {
    balladId: integer('ballad_id').notNull(),
    key: integer('key').notNull(),
    text: text('a_text').notNull(),
  },
  (table) => ({
    pk: primaryKey({ columns: [table.balladId, table.key] }),
    balladsFK: foreignKey({ columns: [table.balladId], foreignColumns: [ballads.id] }),
  })
);

export type Schema = {
  ballads: typeof ballads;
  contents: typeof contents;
  notes: typeof notes;
  mottos: typeof mottos;
  annotations: typeof annotations;
};

export const schema: Schema = {
  ballads,
  contents,
  notes,
  mottos,
  annotations,
};
