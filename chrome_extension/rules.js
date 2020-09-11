let defaultRules = [
  {
    regexp: /https:\/\/www\.amazon\.com\/(?:.*\/)?gp\/product\/([A-Z0-9]*).*/,
    substr: "http://amzn.com/$1",
  },
  {
    regexp: /https:\/\/www\.amazon\.com\/(?:.*\/)?dp\/([A-Z0-9]*).*/,
    substr: "http://amzn.com/$1",
  },
  {
    regexp: /https:\/\/stackoverflow.com\/questions\/([0-9]+)(?:\/.*)/,
    substr: "https://stackoverflow.com/q/$1",
  },
  {
    regexp: /https:\/\/(?:www\.)youtube.com\/watch\?v=([a-zA-Z0-9_]+).*/,
    substr: "https://youtu.be/$1",
  },
  {
    regexp: /^https?:\/\/(?:www\.)?reddit\.com\/r\/\w+\/comments\/(\w+)\/.*$/,
    substr: "https://redd.it/$1",
  },
  {
    regexp: /^https?:\/\/(?:www\.)?instagram\.com\/([^?]+).*$/,
    substr: "http://instagr.am/$1",
  },
];

export function getRules() {
  return defaultRules;
}
