export const fonts = {
  small: '12px',
  medium: '16px',
  big: '20px',
};

export const getFontSize = (font: string = 'medium'): string => {
  if (font in fonts) {
    // @ts-ignore
    return fonts[font];
  }
  return fonts['medium'];
};
