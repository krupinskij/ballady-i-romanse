import i18next from 'i18next';

export const supportedLngs = ['pl', 'ru'] as const;
export type SupportedLng = (typeof supportedLngs)[number];

export const isSupportedLng = (value: any): value is SupportedLng => {
  return supportedLngs.includes(value);
};

i18next.init({
  supportedLngs,
  fallbackLng: supportedLngs[0],
  ns: ['general', 'home', 'ballad'],
  resources: {
    pl: {
      general: {
        title: 'Ballady i Romanse',
        author: 'Adam Mickiewicz',
        homepage: 'Strona główna',
      },
      ballad: {
        footer: 'Tekst oraz przypisy pochodzą ze strony:',
      },
      home: {
        footer:
          'Projekt powstał w celach edukacyjnych (programistycznych) oraz ku czci Adama Mickiewicza.',
      },
    },
    ru: {
      general: {
        title: 'Баллады и Романсы',
        author: 'Адам Мицкевич',
        homepage: 'Домашняя страница',
      },
      ballad: {
        footer: 'Текст и сноски взяты с сайта:',
      },
      home: {
        footer:
          'Проект создан в образовательных (программирования) целях и в честь Адама Мицкевича.',
      },
    },
  },
});

export default i18next;
