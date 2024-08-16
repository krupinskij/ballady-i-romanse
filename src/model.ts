type Motto = {
  text: string;
  author: string;
  translation?: string;
};

type Content = {
  character?: string;
  text: string;
};

type BalladInfo = {
  id: string;
  title: string;
};

export type Ballad = BalladInfo & {
  prev?: BalladInfo;
  next?: BalladInfo;
  notes?: string[];
  motto?: Motto;
  contents: Content[];
};
