import { z } from 'astro/zod';

import {
  AnnotationDBSchema,
  BalladDBSchema,
  ContentDBSchema,
  MottoDBSchema,
  NoteDBSchema,
} from '@database';

export namespace DB {
  export type Annotation = z.infer<typeof AnnotationDBSchema>;
  export type Ballad = z.infer<typeof BalladDBSchema>;
  export type Content = z.infer<typeof ContentDBSchema>;
  export type Motto = z.infer<typeof MottoDBSchema>;
  export type Note = z.infer<typeof NoteDBSchema>;
}

export type Annotation = DB.Annotation;
export type Content = DB.Content;
export type Motto = DB.Motto;

// export type Motto = DB.Motto;
// export type Note = DB.Note;
// export type Ballad = DB.Ballad & {
//   prevBallad: DB.Ballad | null;
//   nextBallad: DB.Ballad | null;
//   motto: Motto | null;
//   notes: Note[];
//   contents: Content[];
//   annotations: Annotation[];
// };

export const ids = [
  'pierwiosnek',
  'romantycznosc',
  'switez',
  'switezianka',
  'rybka',
  'powrot-taty',
  'kurhanek-maryli',
  'do-przyjaciol',
  'to-lubie',
  'rekawiczka',
  'pani-twardowska',
  'tukaj-albo-proby-przyjazni',
  'lilje',
  'dudarz',
];

export const ListSchema = BalladDBSchema.pick({ id: true, title: true });
export const BalladSchema = z.object({
  id: z.string(),
  title: z.string(),
  ordinal: z.number(),
  link: z.string().nullable(),
  prevBallad: BalladDBSchema.nullable(),
  nextBallad: BalladDBSchema.nullable(),
  annotations: z.array(AnnotationDBSchema),
  contents: z.array(ContentDBSchema),
  mottos: z.array(MottoDBSchema),
  notes: z.array(NoteDBSchema),
});
