export const formatText = (
  text: string,
  formatter: (match: string, key: string, title: string) => string
) => text.replaceAll(/\{\{(\d*):([^\}]*)\}\}/g, formatter);
