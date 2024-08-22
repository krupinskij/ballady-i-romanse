import type {
  balladDTOSchema,
  balladInfoSchema,
  balladSchema,
  contentDTOSchema,
  contentSchema,
  mottoDTOSchema,
  mottoSchema,
  noteDTOSchema,
  noteSchema,
} from '@schema';
import { z } from 'zod';

export type ContentDTO = z.infer<typeof contentDTOSchema>;
export type Content = z.infer<typeof contentSchema>;

export type MottoDTO = z.infer<typeof mottoDTOSchema>;
export type Motto = z.infer<typeof mottoSchema>;

export type NoteDTO = z.infer<typeof noteDTOSchema>;
export type Note = z.infer<typeof noteSchema>;

export type BalladDTO = z.infer<typeof balladDTOSchema>;
export type BalladInfo = z.infer<typeof balladInfoSchema>;
export type Ballad = z.infer<typeof balladSchema>;

export const ballads = [
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
  'lilije',
  'dudarz',
];
