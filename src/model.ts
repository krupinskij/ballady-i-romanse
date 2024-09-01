import type { annotations, ballads, contents, mottos, notes } from '@db';

export namespace DB {
  export type Annotation = typeof annotations.$inferSelect;
  export type Ballad = typeof ballads.$inferSelect;
  export type Content = typeof contents.$inferSelect;
  export type Motto = typeof mottos.$inferSelect;
  export type Note = typeof notes.$inferSelect;
}

export type Annotation = DB.Annotation;
export type Motto = DB.Motto;
export type Note = DB.Note;
export type Content = DB.Content;
export type Ballad = DB.Ballad & {
  prevBallad: DB.Ballad | null;
  nextBallad: DB.Ballad | null;
  motto: Motto | null;
  notes: Note[];
  contents: Content[];
  annotations: Annotation[];
};

export const keys = [
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
