import { z } from 'zod';

export const contentDTOSchema = z.object({
  ballad_id: z.number(),
  c_order: z.number(),
  character: z.string().nullable(),
  c_text: z.string(),
});
export const contentSchema = z.object({
  character: z.string().nullable(),
  text: z.string(),
});
export const contentMapper = contentDTOSchema.transform((value) =>
  contentSchema.parse({ character: value.character, text: value.c_text })
);

export const mottoDTOSchema = z.object({
  id: z.number(),
  ballad_id: z.number(),
  m_text: z.string(),
  author: z.string(),
  translation: z.string().nullable(),
});
export const mottoSchema = z.object({
  text: z.string(),
  author: z.string(),
  translation: z.string().nullable(),
});
export const mottoMapper = mottoDTOSchema.transform((value) =>
  mottoSchema.parse({ text: value.m_text, author: value.author, translation: value.translation })
);

export const noteDTOSchema = z.object({
  ballad_id: z.number(),
  n_order: z.number(),
  n_text: z.string(),
});
export const noteSchema = z.object({
  text: z.string(),
});
export const noteMapper = noteDTOSchema.transform((value) =>
  noteSchema.parse({ text: value.n_text })
);

export const balladDTOSchema = z.object({
  id: z.number(),
  key: z.string(),
  title: z.string(),
  b_order: z.number(),
  prev_id: z.number().nullable(),
  next_id: z.number().nullable(),
});
export const balladInfoSchema = z.object({
  key: z.string(),
  title: z.string(),
});
export const balladInfoMapper = balladDTOSchema.transform((value) =>
  balladInfoSchema.parse({ key: value.key, title: value.title })
);
export const balladSchema = balladInfoSchema.extend({
  prev: balladInfoSchema.nullable(),
  next: balladInfoSchema.nullable(),
  notes: z.array(noteSchema),
  motto: mottoSchema.nullable(),
  contents: z.array(contentSchema),
});
export const balladMapper = balladDTOSchema.transform((value) =>
  balladSchema.parse({
    key: value.key,
    title: value.title,
    prev: null,
    next: null,
    notes: [],
    motto: null,
    contents: [],
  })
);
