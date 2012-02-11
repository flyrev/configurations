(global-set-key '[M-kp-0 M-kp-6 M-kp-0] '(lambda () (interactive)(insert "<")))
(global-set-key '[M-kp-0 M-kp-6 M-kp-2] '(lambda () (interactive)(insert ">")))


(setq cpp-indent-level 8)
(setq cpp-basic-offset 8)
(setq c-indent-level 8)
(setq c-basic-offset 8)


;; Disable startup message.
(setq inhibit-startup-message t)





;; Use y-or-n-p for query prompts instead of yes-or-no-p.
(fset 'yes-or-no-p 'y-or-n-p)

;; Set maximum line length.
(setq fill-column 78)

;; Always add a newline at the end of the file.
(setq require-final-newline t track-eol t)

;; Moving the cursor downwards should not add newlines if point is at
;; end-of-file.
(setq next-line-add-newlines nil)

;; Specify external web browser.
(setq browse-url-browser-function 'browse-url-firefox)

;; Keep versioned backups.
(setq make-backup-files t
      backup-by-copying t
      backup-directory-alist '(("." . "~/.backups"))
      delete-old-versions 2
      kept-old-versions 2
      version-control t)

;; Disable autosaving.
(setq auto-save-default nil
      auto-save-list-file-name nil
      delete-auto-save-files t)

;; Improve buffer handling.
(setq uniquify-buffer-name-style 'reverse)
(iswitchb-mode t)

;; Keybindings.
(global-set-key (kbd "C-w") 'backward-kill-word)
(global-set-key (kbd "C-x C-k") 'kill-region)
(global-set-key (kbd "C-c c") 'comment-region)
(global-set-key (kbd "M-g") 'goto-line)
(global-set-key (kbd "C-x ,") 'execute-extended-command)

;; Set Emacs window title and icon.
(setq frame-title-format '("%b (%m) - Commander flyrev: Emacs")
      icon-title-format '("%b"))

;; Disable GUI cruft.
(menu-bar-mode -1)

;; Show current line number.
(line-number-mode t)

;; Show current column number.
(column-number-mode t)

;; Disable blinking cursor.
(blink-cursor-mode nil)

;; Highlight matching parens.
(show-paren-mode t)

;; Show current date and time.
(setq display-time-24hr-format t
      display-time-day-and-date t)
(display-time)

;; Do as much syntax highlighting as possible.
(setq font-lock-maximum-decoration t)

;; Enable syntax highlighting.
(global-font-lock-mode t)

;; Recompile init file.
(defun recompile-init ()
  (interactive)
  (when (and (file-newer-than-file-p "~/.emacs" "~/.emacs.elc")
             (y-or-n-p "byte-compile ~/.emacs ? "))
    (byte-compile-file "~/.emacs")))

;; text-mode
(add-hook 'text-mode-hook 'auto-fill-mode)

;; TeX-mode
(add-hook 'TeX-mode-hook 'auto-fill-mode)
(add-hook 'TeX-mode-hook 'turn-on-reftex)
(add-hook 'TeX-mode-hook
          '(lambda ()
             (setq TeX-parse-self t
                   reftex-cite-format 'natbib)))

(setq scheme-program-name "mzscheme"
      quack-pretty-lambda-p t
      quack-run-scheme-always-prompts-p nil)

(setq gnus-nntp-server "news.kulnet.kuleuven.ac.be")

(defun insert-time ()
  (interactive)
  (insert (format-time-string "%Y-%m-%d %R")))

(defun linux-c-mode ()
  "C mode with adjusted defaults for use with the Linux kernel."
  (interactive)
  (c-mode)
  (setq c-indent-level 8)
  (setq c-brace-imaginary-offset 0)
  (setq c-brace-offset -8)
  (setq c-argdecl-indent 8)
  (setq c-label-offset 8)
  (setq c-continued-statement-offset 8)
  (setq indent-tabs-mode nil)
  (setq tab-width 8))

(defun my-cpp-hook ()
  (setq c-basic-offset 8))
(add-hook 'c++-mode 'my-cpp-hook)

(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

(setq auto-mode-alist (append '(("\\.pl$" . prolog-mode)
				("\\.m$" . mercury-mode))
			      auto-mode-alist))

(defun fix ()
 (interactive)
 (indent-region (point-min) (point-max) nil))
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

 ; Get rid of the startup message
(setq inhibit-startup-message t)
; Show file full path in title bar
(setq-default frame-title-format
   (list '((buffer-file-name " %f"
             (dired-directory
              dired-directory
              (revert-buffer-function " %b"
              ("%b - Dir:  " default-directory)))))))
; Shows parenthesis 
(show-paren-mode 1)
; Shows column number
(column-number-mode 1)
; Change default colors
(set-background-color "grey14")
(set-foreground-color "white")
(set-cursor-color "white")
; No toolbar
(progn
  (if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
;  (menu-bar-mode -1)
  (scroll-bar-mode -1)
)


(setq split-height-threshold nil)
(setq split-width-threshold 0)

(defalias 'yes-or-no-p 'y-or-n-p)

(defun set-frame-size-according-to-resolution ()
  (interactive)
  (if window-system
  (progn
    ;; use 120 char wide window for largeish displays
    ;; and smaller 80 column windows for smaller displays
    ;; pick whatever numbers make sense for you
    (if (> (x-display-pixel-width) 1280)
           (add-to-list 'default-frame-alist (cons 'width 140))
           (add-to-list 'default-frame-alist (cons 'width 100)))
    ;; for the height, subtract a couple hundred pixels
    ;; from the screen height (for panels, menubars and
    ;; whatnot), then divide by the height of a char to
    ;; get the height we want
    (add-to-list 'default-frame-alist 
         (cons 'height (/ (- (x-display-pixel-height) 200)
                             (frame-char-height)))))))

(set-frame-size-according-to-resolution)
(w32-send-sys-command 61488)

(defun jbr-init ()
  "Called from term-setup-hook after the default
terminal setup is
done or directly from startup if term-setup-hook not
used.  The value
0xF030 is the command for maximizing a window."
  (interactive)
  (w32-send-sys-command #xf030)
  (ecb-redraw-layout)
  (calendar)
)
(setq term-setup-hook 'jbr-init)
(setq window-setup-hook 'jbr-init)


(setq tex-command "pdflatex")
(setq latex-run-command "pdflatex")

(setq make-backup-files nil)

(setq auto-mode-alist (cons '("\\.rc" . c-mode) auto-mode-alist))

(load "~/configurations/haskell-mode/haskell-mode.el")
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)


