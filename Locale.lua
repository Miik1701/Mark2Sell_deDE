-- Mark2Sell language pack: German (deDE).
--
-- This addon is a pure translation pack for Mark2Sell. It contains no code
-- of its own besides the call to `ItemMarker:RegisterLocale(...)`.
--
-- To create a new language pack:
--   1) Copy this folder and rename it accordingly (e.g. Mark2Sell_frFR).
--   2) In the .toc, keep `## Dependencies: Mark2Sell` and adjust
--      `Version` / `Title` / `Notes` for the new language.
--   3) In this file, replace the locale code, display name, and strings.

local LOCALE      = "deDE"
local DISPLAY_NAME = "Deutsch"

local STRINGS = {
    BINDING_HEADER = "Mark2Sell",
    BINDING_TOGGLE = "Item markieren / Markierung entfernen (Maus über Taschen-Slot)",
    BINDING_CLEAR = "Alle Markierungen löschen",
    BINDING_LIST = "Markierte Items auflisten (nur bei aktivem Debug-Modus)",

    MSG_NO_ITEM_SLOT = "Kein Item in diesem Slot.",
    MSG_MARK_REMOVED = "Markierung entfernt.",
    MSG_NO_VENDOR_VALUE = "Kein Händlerwert - Gegenstand kann nicht zum Verkauf markiert werden.",
    MSG_MARKED_FOR_SELL = "Zum Verkauf markiert.",
    MSG_NO_BAG_ITEM_CURSOR = "Kein Taschen-Item unter dem Mauszeiger.",
    MSG_ALL_MARKS_CLEARED = "Alle Markierungen gelöscht.",
    MSG_NO_MARKED = "Keine markierten Items.",
    MSG_MARKED_LIST_HEADER = "Markierte Items (%d):",
    MSG_ALL_SOLD = "Alle markierten Items wurden verkauft.",
    MSG_SELL_STALL = "Verkauf gestoppt: Ein Item ließ sich nicht verkaufen (gesperrt oder nicht verkaufbar).",
    MSG_NO_SELLABLE_MARKED = "Keine markierten, verkaufbaren Items in den Taschen.",

    TOOLTIP_MERCHANT_TITLE = "Mark2Sell",
    TOOLTIP_MERCHANT_DESC = "Verkauft alle in den Taschen markierten Gegenstände an diesen Händler.",
    TOOLTIP_MERCHANT_COUNT = "Verkaufbar markiert: %d",
    TOOLTIP_MERCHANT_HINT_ZERO = "Zum Aktivieren Items in den Taschen markieren.",

    BTN_CLEAR_MARKS_TITLE = "Markierungen löschen",
    BTN_CLEAR_MARKS_DESC = "Entfernt alle Mark2Sell-Verkaufsmarkierungen in den Taschen (verkauft nichts).",

    SETTINGS_DEBUG = "Debug-Modus",
    SETTINGS_DEBUG_TOOLTIP = "Zeigt zusätzliche Info-Meldungen im Chat (z. B. markiert, verkauft, Liste). Hinweise und Warnungen bei Problemen erscheinen weiterhin immer.",
    SETTINGS_LANGUAGE = "Sprache",
    SETTINGS_LANGUAGE_TOOLTIP = "Sprache des Addons. „Automatisch“ nutzt die WoW-Client-Sprache, sofern ein passendes Sprachpaket installiert ist; sonst wird Englisch verwendet.",
    SETTINGS_LANG_AUTO = "Automatisch (Spielsprache)",

    SETTINGS_CLEAR_BTN_OFFSET_X = "Button «Markierungen löschen»: horizontal",
    SETTINGS_CLEAR_BTN_OFFSET_Y = "Button «Markierungen löschen»: vertikal",
    SETTINGS_CLEAR_BTN_OFFSET_TOOLTIP = "Verschiebt den Button zum Löschen der Markierungen relativ zur Standardposition (links vom Taschen-Suchfeld). Wirkt sofort; Taschen öffnen zum Ansehen.",

    SETTINGS_SETUP_RUN_NAME = "Einrichtungsassistent",
    SETTINGS_SETUP_RUN_BUTTON = "Einrichtung öffnen…",
    SETTINGS_SETUP_RUN_TOOLTIP = "Öffnet das Mark2Sell-Setup: Tastenbelegung und Position des Löschen-Buttons. Jederzeit wiederholbar.",

    SETUP_WIZARD_TITLE = "Mark2Sell - Einrichtung",
    SETUP_WIZARD_BODY = "1) Unten ein Tastenfeld anklicken, dann die gewünschte Taste drücken (Esc bricht ab). Rechtsklick auf ein Feld entfernt die Belegung.\n\n2) Taschen öffnen und die Regler weiter unten verschieben, bis der rote Löschen-Button passt (Standard: links vom Suchfeld).\n\n3) Mit «Fertig» abschließen. «Später» schließt nur das Fenster; beim nächsten Login erscheint die Einrichtung erneut, bis du «Fertig» wählst.",
    SETUP_WIZARD_KEYBIND_HEADER = "Tastenbelegung",
    SETUP_WIZARD_POSITION_HEADER = "Position: Markierungen löschen (siehe Inventar)",
    SETUP_WIZARD_DONE = "Fertig",
    SETUP_WIZARD_LATER = "Später",

    LOG_INFO = "INFO",
    LOG_WARNING = "WARNUNG",
    LOG_ERROR = "FEHLER",
}

-- Normal path: Mark2Sell is guaranteed to be loaded first via
-- `## Dependencies: Mark2Sell`, so ItemMarker:RegisterLocale already exists.
if type(ItemMarker) == "table" and type(ItemMarker.RegisterLocale) == "function" then
    ItemMarker:RegisterLocale(LOCALE, DISPLAY_NAME, STRINGS)
    return
end

-- Fallback: if a pack somehow loads before Mark2Sell, push the entry into the
-- global queue. Mark2Sell's Locale.lua drains this queue at startup.
Mark2SellLocaleQueue = Mark2SellLocaleQueue or {}
table.insert(Mark2SellLocaleQueue, {
    locale = LOCALE,
    name = DISPLAY_NAME,
    strings = STRINGS,
})
