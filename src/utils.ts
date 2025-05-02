import { escape } from 'html-escaper';

export const formatText = (
  text: string,
  formatter: (match: string, key: string, title: string) => string
) => text.replaceAll(/\{\{(\d*):([^\}]*)\}\}/g, formatter);

export const escapeText = (text: string): string => {
  return escape(text);
};
