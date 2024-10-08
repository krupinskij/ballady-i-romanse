import TOML from '@iarna/toml';
import fs from 'fs';

type Motto = {
  text: string;
  author: string;
  translation?: string;
};

type Content = {
  character?: string;
  text: string;
};

type Annotation = {
  key: number;
  text: string;
};

export type Ballad = {
  key: string;
  title: string;
  order: number;
  link: string;
  notes?: string[];
  motto?: Motto;
  contents: Content[];
  annotations?: Annotation[];
};

export const readTomlFile = (path: string): Ballad => {
  const data = fs.readFileSync(path, 'utf8');
  const result = TOML.parse(data) as Ballad;

  return result;
};
