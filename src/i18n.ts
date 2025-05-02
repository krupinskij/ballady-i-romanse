import i18next from 'i18next';

export const supportedLngs = ['pl', 'ru'] as const;
export type SupportedLng = (typeof supportedLngs)[number];

export const isSupportedLng = (value: any): value is SupportedLng => {
  return supportedLngs.includes(value);
};

const hostnameRegexp = /^(?<lng>[a-z]*).balladyromanse.pl/;

export const getSupportedLng = (url: URL): SupportedLng => {
  const hostname = url.hostname;
  const hostLng = hostname.match(hostnameRegexp)?.groups?.lng;
  const supportedLng = isSupportedLng(hostLng) ? hostLng : supportedLngs[0];

  return supportedLng;
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
        language: {
          pl: 'język polski',
          ru: 'język rosyjski',
        },
        skipNavigation: 'Pomiń nawigację',
      },
      ballad: {
        footer: 'Tekst oraz przypisy pochodzą ze strony:',
      },
      home: {
        footer:
          'Projekt powstał w celach edukacyjnych (programistycznych) oraz ku czci Adama Mickiewicza.',
      },
      drawer: {
        navigation: {
          label: 'Nawigacja',
        },
        settings: {
          label: 'Ustawienia',
          selectLanguage: 'Wybierz wersję językową',
          selectFontSize: 'Wybierz rozmiar czcionki',
        },
      },
    },
    ru: {
      general: {
        title: 'Баллады и Романсы',
        author: 'Адам Мицкевич',
        homepage: 'Домашняя страница',
        language: {
          pl: 'Польский язык',
          ru: 'Русский язык',
        },
        skipNavigation: 'Пропустить навигацию',
      },
      ballad: {
        footer: 'Текст и сноски взяты с сайта:',
      },
      home: {
        footer:
          'Проект создан в образовательных (программирования) целях и в честь Адама Мицкевича.',
      },
      drawer: {
        navigation: {
          label: 'Навигация',
        },
        settings: {
          label: 'Настройки',
          selectLanguage: 'Выберите языковую версию',
          selectFontSize: 'Выберите размер шрифта',
        },
      },
    },
  },
});

export default i18next;
