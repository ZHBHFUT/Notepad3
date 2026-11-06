这是基于 [Rizonesoft/Notepad3](https://github.com/rizonesoft/Notepad3) 的 fork 发布版，提供 Windows x64 便携包。

- **ANSYS APDL**：`.apdl`、`.mac`、`.cdb` 语法高亮、命令补全、控制结构和 CDB 数据块折叠。
- **NASTRAN**：`.bdf`、`.nas` 语法高亮，支持 8/16 字符固定字段、自由格式、续行与段落折叠。
- **NASTRAN 列标尺**：8/16 字符预设，突出第 72/80 列边界；使用等宽字体、Tab 宽度 8，并关闭自动换行。
- 包含中文等语言包、主题、许可证以及 APDL/NASTRAN 示例。

下载并**完整解压** `Notepad3-APDL-NASTRAN-<版本>-x64.zip`，运行其中的 `Notepad3.exe`。保留同目录下的 `lng` 文件夹；单独下载 EXE 不含中文语言包。更新时可保留自己的 `Notepad3.ini`，同时更新 `lng` 文件夹。

附件中的 `SHA256SUMS.txt` 可用于校验 ZIP 和独立 EXE，`build-info.json` 记录版本与源码提交。此包未签名。功能用于文本编辑，不执行求解或自动对齐固定字段；无需安装 ANSYS 或 NASTRAN。

---

This fork release adds APDL (`.apdl/.mac/.cdb`) and NASTRAN (`.bdf/.nas`) highlighting, completion, and folding to Notepad3, with NASTRAN fixed-field column guides.

Download and extract the **complete Windows x64 portable ZIP**, then run `Notepad3.exe`. Keep its `lng` directory for translated menus. The package includes themes, licenses, and example files. Existing `Notepad3.ini` preferences can be retained when updating.

For fixed-field inspection, use a monospace font, tab width 8, and no visual word wrap. Column guides affect display only; this editor does not run a solver or rewrite card fields. No solver installation is required. SHA-256 checksums and source-commit metadata are attached; binaries are unsigned.
