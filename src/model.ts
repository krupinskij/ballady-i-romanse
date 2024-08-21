export type Motto = {
  text: string;
  author: string;
  translation?: string;
};

export type Content = {
  character?: string;
  text: string;
};

type Note = {
  text: string;
};

export type BalladInfo = {
  key: string;
  title: string;
};

export type Ballad = BalladInfo & {
  prev?: BalladInfo;
  next?: BalladInfo;
  notes?: Note[];
  motto?: Motto;
  contents: Content[];
};
