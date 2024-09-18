import {
  foreignKey,
  integer,
  primaryKey,
  sqliteTable,
  text,
  unique,
} from 'drizzle-orm/sqlite-core';

import { type SupportedLng } from '@i18n';

const makeBalladsTable = (lng: SupportedLng) => {
  return sqliteTable(
    `${lng}_ballads`,
    {
      id: integer('id').notNull().primaryKey({ autoIncrement: true }),
      key: text('key').notNull(),
      title: text('title').notNull(),
      order: integer('b_order').notNull(),
      link: text('link'),
      prevId: integer('prev_id'),
      nextId: integer('next_id'),
    },
    (table) => ({
      prevFK: foreignKey({ columns: [table.prevId], foreignColumns: [table.id] }),
      nextFK: foreignKey({ columns: [table.nextId], foreignColumns: [table.id] }),
      uniqueKey: unique(`unique_key_${lng}`).on(table.key),
      uniqueOrder: unique(`unique_order_${lng}`).on(table.key),
    })
  );
};

export const ballads_pl = makeBalladsTable('pl');
export const ballads_ru = makeBalladsTable('ru');

const balladsByLng = {
  pl: ballads_pl,
  ru: ballads_ru,
};

const makeContentsTable = (lng: SupportedLng) => {
  return sqliteTable(
    `${lng}_contents`,
    {
      balladId: integer('ballad_id').notNull(),
      order: integer('c_order').notNull(),
      character: text('character'),
      text: text('c_text').notNull(),
    },
    (table) => ({
      pk: primaryKey({ columns: [table.balladId, table.order] }),
      balladsFK: foreignKey({ columns: [table.balladId], foreignColumns: [balladsByLng[lng].id] }),
    })
  );
};

export const contents_pl = makeContentsTable('pl');
export const contents_ru = makeContentsTable('ru');

const makeNotesTable = (lng: SupportedLng) => {
  return sqliteTable(
    `${lng}_notes`,
    {
      balladId: integer('ballad_id').notNull(),
      order: integer('n_order').notNull(),
      text: text('n_text').notNull(),
    },
    (table) => ({
      pk: primaryKey({ columns: [table.balladId, table.order] }),
      balladsFK: foreignKey({ columns: [table.balladId], foreignColumns: [balladsByLng[lng].id] }),
    })
  );
};

export const notes_pl = makeNotesTable('pl');
export const notes_ru = makeNotesTable('ru');

const makeMottosTable = (lng: SupportedLng) => {
  return sqliteTable(
    `${lng}_mottos`,
    {
      id: integer('id').notNull().primaryKey({ autoIncrement: true }),
      balladId: integer('ballad_id').notNull(),
      text: text('m_text').notNull(),
      author: text('author').notNull(),
      translation: text('translation'),
    },
    (table) => ({
      balladsFK: foreignKey({ columns: [table.balladId], foreignColumns: [balladsByLng[lng].id] }),
    })
  );
};

export const mottos_pl = makeMottosTable('pl');
export const mottos_ru = makeMottosTable('ru');

const makeAnnotationsTable = (lng: SupportedLng) => {
  return sqliteTable(
    `${lng}_annotations`,
    {
      balladId: integer('ballad_id').notNull(),
      key: integer('key').notNull(),
      text: text('a_text').notNull(),
    },
    (table) => ({
      pk: primaryKey({ columns: [table.balladId, table.key] }),
      balladsFK: foreignKey({ columns: [table.balladId], foreignColumns: [balladsByLng[lng].id] }),
    })
  );
};

export const annotations_pl = makeAnnotationsTable('pl');
export const annotations_ru = makeAnnotationsTable('ru');

export type Schema = {
  ballads: ReturnType<typeof makeBalladsTable>;
  contents: ReturnType<typeof makeContentsTable>;
  notes: ReturnType<typeof makeNotesTable>;
  mottos: ReturnType<typeof makeMottosTable>;
  annotations: ReturnType<typeof makeAnnotationsTable>;
};

export const schemaByLng: Record<SupportedLng, Schema> = {
  pl: {
    ballads: ballads_pl,
    contents: contents_pl,
    notes: notes_pl,
    mottos: mottos_pl,
    annotations: annotations_pl,
  },
  ru: {
    ballads: ballads_ru,
    contents: contents_ru,
    notes: notes_ru,
    mottos: mottos_ru,
    annotations: annotations_ru,
  },
};
