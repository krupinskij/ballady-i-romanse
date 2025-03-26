import TOML from '@iarna/toml';
import fs from 'fs';

type Note = {
  balladId: string;
  ordinal: number;
  body: string;
};

type Motto = {
  balladId: string;
  body: string;
  author: string;
  translation?: string;
};

type Content = {
  balladId: string;
  ordinal: number;
  speaker?: string;
  body: string;
};

type Annotation = {
  balladId: string;
  id: number;
  body: string;
};

export type Ballad = {
  id: string;
  title: string;
  ordinal: number;
  link: string;
  notes: Note[];
  mottos: Motto[];
  contents: Content[];
  annotations: Annotation[];
};

export const readTomlFile = (path: string): Ballad => {
  const data = fs.readFileSync(path, 'utf8');
  const ballad = TOML.parse(data) as Ballad;

  ballad.notes =
    ballad.notes?.map((note, i) => ({ ...note, balladId: ballad.id, ordinal: i })) || [];
  ballad.mottos = ballad.mottos?.map((motto) => ({ ...motto, balladId: ballad.id })) || [];
  ballad.contents =
    ballad.contents?.map((content, i) => ({ ...content, balladId: ballad.id, ordinal: i })) || [];
  ballad.annotations =
    ballad.annotations?.map((annotation) => ({ ...annotation, balladId: ballad.id })) || [];

  return ballad;
};
