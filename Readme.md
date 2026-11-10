# Notepad3

**A fast, lightweight, Scintilla-based text editor for Windows**

[![License](https://img.shields.io/badge/License-BSD%203--Clause-blue.svg?style=flat-square)](https://opensource.org/licenses/BSD-3-Clause)
[![CI](https://img.shields.io/github/actions/workflow/status/ZHBHFUT/Notepad3/apdl-windows.yml?style=flat-square&label=APDL%20%2F%20NASTRAN%20CI)](https://github.com/ZHBHFUT/Notepad3/actions/workflows/apdl-windows.yml)
[![Release](https://img.shields.io/github/v/release/ZHBHFUT/Notepad3?style=flat-square&label=Fork%20Release&color=0e7490)](https://github.com/ZHBHFUT/Notepad3/releases/latest)
[![Nightly](https://img.shields.io/github/v/release/rizonesoft/Notepad3?include_prereleases&style=flat-square&label=Nightly&color=6e40c9)](https://github.com/rizonesoft/Notepad3/releases)

[Website](https://rizonesoft.com/downloads/notepad3/) · [Downloads](https://github.com/rizonesoft/Notepad3/releases) · [Documentation](https://rizonesoft.com/documents/notepad3/) · [FAQ](readme/faq/FAQ.md) · [Changelog](https://rizonesoft.com/downloads/notepad3/update) · [Sponsor](https://github.com/sponsors/rizonesoft)

---

## APDL / NASTRAN fork release

This fork adds **ANSYS APDL** (`.apdl`, `.mac`, `.cdb`) and **NASTRAN** (`.bdf`, `.nas`)
syntax highlighting, completion, and folding, including CDB data blocks and
NASTRAN fixed/free fields and continuations. NASTRAN also has 8/16-character
column-guide presets with column 72/80 boundaries.

**[Download the APDL / NASTRAN Windows x64 release](https://github.com/ZHBHFUT/Notepad3/releases/latest).**
Extract the complete portable ZIP and keep its `lng` directory for Chinese and
other translated menus. See the [package instructions](Build/Docs/README-APDL-NASTRAN.txt)
and [release notes](Build/Docs/RELEASE-APDL-NASTRAN.md).

The upstream project and its download channels are described below.

Notepad3 is a free, open-source text editor with syntax highlighting for Windows. Built on the [Scintilla](https://www.scintilla.org/) editing component and [Lexilla](https://www.scintilla.org/Lexilla.html) lexer library, it has a small memory footprint while being powerful enough for professional programming and everyday text editing.

> Notepad3 is based on code from Florian Balmer's [Notepad2](https://www.flos-freeware.ch/notepad2.html) and XhmikosR's [Notepad2-mod](https://xhmikosr.github.io/notepad2-mod/). MiniPath is based on Florian Balmer's metapath.

<!-- TODO: Add a screenshot of the Notepad3 main window here.
     Save the image as doc/screenshot.png and uncomment the line below:
     ![Notepad3 Screenshot](doc/screenshot.png)
-->

## Features

### APDL / NASTRAN

**ANSYS APDL** — syntax highlighting and CDB data-block folding, including RLBLOCK and NBLOCK.

![ANSYS APDL syntax highlighting and CDB block folding](docs/images/apdl-syntax-folding.png)

**NASTRAN** — syntax highlighting, code folding, and fixed-field column guides.

![NASTRAN syntax highlighting, folding, and fixed-field column guides](docs/images/nastran-column-guides.png)

### Editing
- **Code folding** with toggle-all support
- **Bookmarks** for quick navigation within files
- **Word auto-completion** with configurable fill-up characters
- **Mark all occurrences** of a selected word with occurrence count display
- **Find and Replace** with [PCRE2](https://github.com/PCRE2Project/pcre2) regular expression engine
- **[Focused View](readme/focusedview/FocusedView.md)** — filter display to show only lines matching the current word/selection (Ctrl+Alt+V), with fold, bookmark, and highlight modes
- **[TinyExpr++](readme/tinyexprcpp/TinyExprPP.md)** — inline math expression evaluation with 80+ functions (type `expression=?` to evaluate in-place, use `${expr}` in line numbering).
- **Undo/Redo** that preserves selection state
- **Visual Studio–style** copy/paste of the current line (when nothing is selected)
- **Virtual space** rectangular selection (Alt+Drag)
- **Accelerated word navigation** with configurable delimiters
- **Insert GUIDs** directly into your document
- **Clipboard monitoring mode** (`/b` command-line switch) — automatically appends every clipboard change as a new entry at the end of the document; stop at any time via **Edit → Stop Clipboard Monitoring** without closing the editor.

### Syntax Highlighting
Over 55 languages supported, including:

> ANSI Art, Apache Config, Assembly, AutoHotkey, AutoIt3, AviSynth, Awk, Batch, C/C++, C#, CMake, CoffeeScript, CSS, CSV, D, Dart, Diff, F77/Fortran, Go, HTML/XML, Java, JavaScript, JSON, Julia, Kotlin, KiXtart, LaTeX, Lua, Makefiles, Markdown, MATLAB, Nim, NSIS, Pascal, Perl, PHP, PowerShell, Python, R/S-Plus, Registry, Resource Script, Ruby, Rust, Shell Script, SQL, SystemVerilog, Tcl, TOML, VBScript, VHDL, Verilog, Visual Basic, YAML, and more.

### File Handling
- **[AES-256 Rijndael](readme/encryption/Encryption.md)** encryption/decryption (in-app and command-line batch tool)
- **[Encoding detection](readme/uchardet/EncodingDetection.md)** powered by [uchardet](https://www.freedesktop.org/wiki/Software/uchardet/)
- **File change monitoring** with configurable check intervals
- **[`.LOG` auto-timestamp](readme/config/FileContentFlags.md#log-auto-timestamp)** — files whose first line is `.LOG` get a fresh date + time appended on open, matching classic Notepad behaviour
- **[Emacs file variables](readme/config/FileContentFlags.md#emacs-file-variables)** support (encoding, mode, tab-width, etc.)
- **File history** that preserves caret position and encoding
- **Portable design** — runs from USB drives with relative path storage

### Search
- **grepWin** — integrated search-in-files tool with regex support (**Ctrl+Shift+F**)
- **Hyperlink hotspot highlighting** — Ctrl+Click to open in browser, Alt+Click to load in editor

### User Interface
- **High-DPI aware** with high-definition toolbar icons
- **Dark mode** support with customizable colors
- **Customizable status bar** with 16 configurable fields (line, column, encoding, [TinyExpr++](readme/tinyexprcpp/TinyExprPP.md) evaluation, Unicode code point, and more)
- **Customizable toolbar labels** — display function names next to icons
- **Zoom** from 10% to 1000% (Ctrl+Scroll or toolbar buttons)
- **Transparent window mode** with configurable opacity

### Localization
26 language translations:

> Afrikaans, Belarusian, Chinese (Simplified & Traditional), Dutch, English (US & UK), Finnish, French, German, Greek, Hindi, Hungarian, Indonesian, Italian, Japanese, Korean, Polish, Portuguese (Brazil & Portugal), Russian, Slovak, Spanish, Swedish, Turkish, Vietnamese

### Companion Tools
- **[MiniPath](minipath/)** — fast file browser plugin (Ctrl+M)
- **[grepWin](grepWin/)** — powerful search-and-replace across files

## Official Documentation

For general Notepad3 usage, system requirements, installation, configuration,
command-line options, keyboard shortcuts, and FAQs, refer to the upstream documentation:

- [Official Notepad3 documentation](https://rizonesoft.com/documents/notepad3/)
- [Upstream README, contributing information, and credits](https://github.com/rizonesoft/Notepad3#readme)
- [Official downloads and releases](https://github.com/rizonesoft/Notepad3/releases)

## APDL / NASTRAN Fork Documentation

- [Download this fork's Windows x64 release](https://github.com/ZHBHFUT/Notepad3/releases/latest)
- [Portable package instructions](Build/Docs/README-APDL-NASTRAN.txt)
- [APDL / NASTRAN release notes](Build/Docs/RELEASE-APDL-NASTRAN.md)
- [Contributor documentation and build guidance](docs/README.md)
- [Report an APDL / NASTRAN fork issue](https://github.com/ZHBHFUT/Notepad3/issues)

## License

Notepad3 is licensed under the [BSD 3-Clause License](Build/Docs/License.txt).

Copyright © 2008–2026 [Rizonesoft](https://rizonesoft.com). All rights reserved.

---

[![Sponsor](https://img.shields.io/badge/Sponsor-%E2%9D%A4-ea4aaa?style=flat-square&logo=github)](https://github.com/sponsors/rizonesoft)
[![Donate](https://img.shields.io/badge/Donate-PayPal-blue.svg?style=flat-square&logo=paypal)](https://www.paypal.com/donate/?hosted_button_id=7UGGCSDUZJPFE)
