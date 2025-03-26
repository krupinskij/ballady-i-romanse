import { z } from 'astro/zod';

export const BalladDBSchema = z.object({
  id: z.string(),
  title: z.string(),
  ordinal: z.number(),
  link: z.string().nullable(),
  prevId: z.string().nullable(),
  nextId: z.string().nullable(),
});

export const ContentDBSchema = z.object({
  balladId: z.string(),
  ordinal: z.number(),
  speaker: z.string().nullable(),
  body: z.string(),
});

export const NoteDBSchema = z.object({
  balladId: z.string(),
  ordinal: z.number(),
  body: z.string(),
});

export const MottoDBSchema = z.object({
  id: z.number(),
  balladId: z.string(),
  body: z.string(),
  author: z.string(),
  translation: z.string().nullable(),
});

export const AnnotationDBSchema = z.object({
  balladId: z.string(),
  id: z.number(),
  body: z.string(),
});
