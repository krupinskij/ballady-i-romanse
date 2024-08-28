import type { ballads, contents, mottos, notes } from '@db';

export namespace DB {
  export type Ballad = typeof ballads.$inferSelect;
  export type Content = typeof contents.$inferSelect;
  export type Motto = typeof mottos.$inferSelect;
  export type Note = typeof notes.$inferSelect;
}

export type Motto = DB.Motto;
export type Note = DB.Note;
export type Content = DB.Content;
export type Ballad = DB.Ballad & {
  prevBallad: DB.Ballad | null;
  nextBallad: DB.Ballad | null;
  motto: Motto | null;
  notes: Note[];
  contents: Content[];
};
