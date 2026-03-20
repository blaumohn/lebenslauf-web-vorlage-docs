---
layout: page
title: Language / Sprache
permalink: /
---

<div class="lang-landing">
  <div class="lang-landing__lead">
    <p>Diese öffentliche Doku bevorzugt keine Sprache.</p>
    <p>Wähle Deutsch oder English. Ohne JavaScript bleibt diese Seite neutral;
    mit JavaScript kann deine zuletzt gewählte oder Browser-Sprache direkt
    vorgeschlagen werden.</p>
  </div>

  <div class="lang-landing__cards">
    <a class="lang-card" href="{{ "/de/" | relative_url }}" data-lang-choice="de">
      <strong>Deutsch</strong>
      <span>Öffentliche Doku und Jira-Übersicht auf Deutsch öffnen</span>
    </a>
    <a class="lang-card" href="{{ "/en/" | relative_url }}" data-lang-choice="en">
      <strong>English</strong>
      <span>Open the public docs and Jira overview in English</span>
    </a>
  </div>
</div>

<script>
  (function () {
    var links = document.querySelectorAll("[data-lang-choice]");
    for (var i = 0; i < links.length; i += 1) {
      links[i].addEventListener("click", function (event) {
        localStorage.setItem("docs-language", event.currentTarget.getAttribute("data-lang-choice"));
      });
    }

    var stored = localStorage.getItem("docs-language");
    var lang = stored;

    if (!lang) {
      var languages = navigator.languages || [navigator.language || ""];
      for (var j = 0; j < languages.length; j += 1) {
        if ((languages[j] || "").toLowerCase().indexOf("de") === 0) {
          lang = "de";
          break;
        }
        if ((languages[j] || "").toLowerCase().indexOf("en") === 0) {
          lang = "en";
          break;
        }
      }
    }

    if (lang === "de" || lang === "en") {
      var target = "{{ '/' | relative_url }}" + lang + "/";
      if (window.location.pathname === "{{ '/' | relative_url }}") {
        window.location.replace(target);
      }
    }
  }());
</script>
