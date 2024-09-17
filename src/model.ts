type Schema = any;

export namespace DB {
  export type Annotation = Schema['annotations']['$inferSelect'];
  export type Ballad = Schema['ballads']['$inferSelect'];
  export type Content = Schema['contents']['$inferSelect'];
  export type Motto = Schema['mottos']['$inferSelect'];
  export type Note = Schema['notes']['$inferSelect'];
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
