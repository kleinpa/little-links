import { getRules } from "./rules.js";

function shorten(text) {
  for (let { regexp, substr } of getRules()) {
    text = text.replace(regexp, substr);
  }
  return text;
}

let shortUrl = document.getElementById("shortUrl");

document.addEventListener(
  "DOMContentLoaded",
  async () => {
    let tab = await new Promise((resolve) => {
      chrome.tabs.query(
        {
          active: true,
          currentWindow: true,
        },
        (tabs) => {
          resolve(tabs[0].url);
        }
      );
    });

    let short = shorten(tab);
    shortUrl.textContent = short;

    // TODO: figure out how to listen for an event here.
    // Neither visibilitychange nor focus seem to fire, so this is a workaround:
    while (!document.hasFocus()) {
      await new Promise((resolve) => setTimeout(resolve, 1));
    }

    // Write link to clipboard
    await navigator.clipboard.writeText(short);

    // Remove pending class to indicate success
    shortUrl.classList.remove("pending");
  },
  false
);
