export const supportedLangs = ['pl', 'ru'] as const;
export type SupportedLang = (typeof supportedLangs)[number];

export const isSupportedLang = (value: any): value is SupportedLang => {
  return supportedLangs.includes(value);
};
