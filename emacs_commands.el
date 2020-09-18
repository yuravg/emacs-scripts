;; Contents:
;;
;;  Usage notes:
;;  Code:
;;    Unix/Dos file
;;    Recode
;;    Tabify/untabify, indentation
;;      Verilog
;;    Replace-extended-ascii-characters

;;; Usage notes:
;; Commands to use with Emacs bath
;; Usage example:
;;  emacs -batch \
;;   file2edit \
;;   -l <emacs_commands.el \
;;   -f <command_name>


;;; Code:

;;;; Unix/Dos file
;; FIXME: what should use utf-8-unix-file or unix-file?
(defun utf-8-unix-file ()
  "Change the current buffer to 'utf-8-unix"
  (progn
    (set-buffer-file-coding-system 'utf-8-unix :force)
    (save-buffer)
    (message "Convert to utf-8-unix file: %s" (buffer-name))))

(defun utf-8-dos-file ()
  "Change the current buffer to 'utf-8-unix"
  (progn
    (set-buffer-file-coding-system 'utf-8-dos :force)
    (save-buffer)
    (message "Convert to utf-8-dos file: %s" (buffer-name))))

(defun unix-file ()
  "Change the current buffer to Latin 1 with Unix line-ends."
  (progn
    (set-buffer-file-coding-system 'iso-latin-1-unix t)
    (save-buffer)
    (message "Convert to Unix file: %s" (buffer-name))))

(defun dos-file ()
  "Change the current buffer to Latin 1 with Unix line-ends."
  (progn
    (set-buffer-file-coding-system 'iso-latin-1-dos t)
    (save-buffer)
    (message "Convert to Unix file: %s" (buffer-name))))

;;;; Recode
;; FIXME: recode-to-utf8-from-cp1251: recode if current coding is cp1251 only
(defun recode-to-utf8-from-cp1251 ()
  "Recode buffer to UTF-8 from cp1251."
  (progn
    (message "*** FIXME: command under design!!!! ***")
    (let ((coding-system-for-read 'utf-8))
      (revert-buffer :noconfirm t))
    (recode-region (point-min) (point-max) 'cp1251 'utf-8)
    (save-buffer)
    (message "Recode buffer to utf-8(from cp1251): %s" (buffer-name))))

;;;; Tabify/untabify, indentation
(defun tabify-buffer ()
  "Replace Space by Tab at whole buffer."
  (progn
    (setq tab-width 4)
    (tabify (point-min) (point-max))
    (save-buffer)
    (message "Replace Space by Tab(4 Space to 1 Tab): %s" (buffer-name))))

(defun untabify-buffer ()
  "Replace Tab to Space(one tab replace by 4 space)."
  (progn
    (setq tab-width 4)
    (untabify (point-min) (point-max))
    (save-buffer)
    (message "replace Tab to Space(1 tab to 4 space): %s" (buffer-name))))

(defun indent-untabify-buffer ()
  "Indentation and untabify whole buffer."
  (progn
    (setq indent-tabs-mode nil
          tab-width 4)
    (indent-region (point-min) (point-max) nil)
    (untabify (point-min) (point-max))
    (save-buffer)
    (message "Change Indentation and untabify: %s" (buffer-name))))

(defun indent-tabify-buffer ()
  "Indentation and tabify whole `verilog-mode' buffer."
  (progn
    (setq indent-tabs-mode t
          tab-width 4)
    (indent-region (point-min) (point-max) nil)
    (tabify (point-min) (point-max))
    (save-buffer)
    (message "Change Indentation and tabify: %s" (buffer-name))))

;;;;; Verilog
(defun indent-untabify-verilog-buffer ()
  "Indentation and untabify whole `verilog-mode' buffer."
  (progn
    (setq indent-tabs-mode                 nil
          tab-width                        4
          verilog-indent-level             4
          verilog-indent-level-module      0
          verilog-indent-level-declaration 0
          verilog-indent-level-behavioral  4
          verilog-indent-level-directive   4
          verilog-case-indent              4
          verilog-auto-newline             nil
          verilog-auto-indent-on-newline   nil
          verilog-tab-always-indent        nil
          verilog-auto-endcomments         nil
          verilog-minimum-comment-distance 40
          verilog-indent-begin-after-if    nil
          verilog-auto-lineup              nil
          verilog-align-ifelse             nil
          verilog-tab-to-comment           nil
          verilog-highlight-p1800-keywords nil
          verilog-cexp-indent              4
          enable-local-eval                t
          verilog-date-scientific-format   t)
    (indent-region (point-min) (point-max) nil)
    (untabify (point-min) (point-max))
    (save-buffer)
    (message "Change Indentation and untabify Verilog: %s" (buffer-name))))

(defun indent-tabify-verilog-buffer ()
  "Indentation and tabify whole `verilog-mode' buffer."
  (progn
    (setq indent-tabs-mode                 t
          tab-width                        4
          verilog-indent-level             4
          verilog-indent-level-module      0
          verilog-indent-level-declaration 0
          verilog-indent-level-behavioral  4
          verilog-indent-level-directive   4
          verilog-case-indent              4
          verilog-auto-newline             nil
          verilog-auto-indent-on-newline   nil
          verilog-tab-always-indent        nil
          verilog-auto-endcomments         nil
          verilog-minimum-comment-distance 40
          verilog-indent-begin-after-if    nil
          verilog-auto-lineup              nil
          verilog-align-ifelse             nil
          verilog-tab-to-comment           nil
          verilog-highlight-p1800-keywords nil
          verilog-cexp-indent              4
          enable-local-eval                t
          verilog-date-scientific-format   t)
    (indent-region (point-min) (point-max) nil)
    (tabify (point-min) (point-max))
    (save-buffer)
    (message "Change Indentation and tabify Verilog: %s" (buffer-name))))

;;;; Replace-extended-ascii-characters
(defun replace-extended-ascii-characters ()
  "Replace extend ASCII characters to ASCII printable characters."
  (interactive)
  (mapc (lambda (pair)
          (let ((in-expr (car pair))
                (out-expr (cdr pair)))
            (goto-char (point-min))
            (while (re-search-forward in-expr nil t)
              (replace-match out-expr))))
        ;; (replace-regexp in-expr out-expr nil (point-min) (point-max))))
        '(("\“" . "\"")
          ("\”" . "\"")
          ("\«" . "\"")
          ("\»" . "\"")
          ("\‘" . "\'")
          ("\’" . "\'")
          ("— ." "-")
          ("–" . "-")
          ("ˆ"  ."^")))
  (save-buffer)
  (message "Replacement completed (file: %s)." (buffer-name)))
