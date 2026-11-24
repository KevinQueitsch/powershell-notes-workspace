# PowerShell Notes Workspace

Eine einfache Notizverwaltung für PowerShell und Vim.

Mit wenigen PowerShell-Funktionen lassen sich Notizen direkt im Terminal erstellen, öffnen, durchsuchen und löschen. Alle Informationen werden als einfache Textdateien gespeichert.

## Features

- Notizen erstellen oder öffnen
- Übersicht aller Notizen
- Volltextsuche
- Notizen löschen
- Vim-Unterstützung
- Reine Textdateien
- Git-kompatibel
- Keine Datenbank erforderlich

---

## Befehle

### Notiz erstellen oder öffnen

```powershell
note <name>
```

Beispiel:

```powershell
note projekt
```

---

### Alle Notizen anzeigen

```powershell
notes
```

---

### Volltextsuche

```powershell
findnote <suchbegriff>
```

Beispiel:

```powershell
findnote projekt
```

---

### Notiz löschen

```powershell
rmnote <name>
```

Beispiel:

```powershell
rmnote projekt
```

---

## Beispiel einer Notiz

Beim Erstellen einer neuen Notiz wird automatisch folgendes Template erzeugt:

```text
Titel: projekt
Datum: 24.11.2026
Uhrzeit: 12:00
```

Die Notiz kann direkt darunter fortgeführt werden.

---

## Installation

Öffnen des PowerShell-Profils:

```powershell
notepad $PROFILE
```

PowerShell-Konfiguration einfügen und speichern.

Anschließend Profil neu laden:

```powershell
. $PROFILE
```

---

## Beispielkonfiguration

**Hinweis:** Den Speicherort an die eigene Umgebung anpassen.

```powershell
# Beispielpfad
$script:noteRoot = "D:\Notes"

function note {
    # ...
}

function notes {
    # ...
}

function findnote {
    # ...
}

function rmnote {
    # ...
}
```

---

## Vim

Wer Vim verwendet und keine temporären Dateien erzeugen möchte, kann folgende Einstellungen verwenden:

```vim
set nobackup
set nowritebackup
set noswapfile
set noundofile
```

Beispielsweise in:

```text
_vimrc
```

Dadurch werden keine zusätzlichen Dateien wie diese erzeugt:

```text
example.txt~
example.txt.swp
example.txt.un~
```

---

## Verzeichnisstruktur

```text
notes
├── projekt.txt
├── meeting.txt
├── todo.txt
├── ideen.txt
└── journal.txt
```

---

## .gitignore

```gitignore
*.sw*
*.swo
*.un~
**
Thumbs.db
.DS_Store
*``

---

## Lizenz

MIT License
``*
