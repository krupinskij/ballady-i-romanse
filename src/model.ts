type Motto = {
  text: string;
  author: string;
  translation?: string;
};

type Content = {
  character?: string;
  text: string;
};

export type Ballad = {
  id: string;
  title: string;
  notes?: string[];
  motto?: Motto;
  contents: Content[];
};
