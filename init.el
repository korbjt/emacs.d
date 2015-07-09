;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;                    General Configuration                   ;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Disable startup message
(setq inhibit-startup-message t)

; tabs
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)

; Disable tool bar
(if (functionp 'tool-bar-mode)
    (tool-bar-mode -1))

; Display column numbers
(column-number-mode t)

; Disable auto save
(setq auto-save-default nil)

; Set window title to something more interesting
(setq frame-title-format "%b")

; Disable backup
(setq backup-inhibited t)

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;                     Custom Functions                       ;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun json-format() 
  (interactive)
  (save-excursion
    (shell-command-on-region
     (mark) (point)
     "jq '.'"
     (buffer-name) t)))

(global-set-key "\C-cj" 'json-format)
(global-set-key "\C-cl" 'linum-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;                   Package Configuration                    ;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/"))

(defvar pkgs '(
	       auto-complete
	       go-autocomplete
	       go-eldoc
	       go-mode
           go-snippets
           yasnippet
	       zenburn-theme))

(defun pkg-update ()
  (interactive)
  (message "%s" "updating/installing packages")
  (package-refresh-contents)
  (dolist (p pkgs)
    (when (not (package-installed-p p))
      (package-install p)))
  (message "%s" "done updating/installing packages"))

(with-eval-after-load "auto-complete-autoloads"
  (message "%s" "loaded autocomplete-autoloads")
  (ac-config-default))

(with-eval-after-load "zenburn-theme-autoloads"
  (load-theme 'zenburn))

(with-eval-after-load "yasnippet-autoloads"
  (setq yas-verbosity 1)
  (yas-global-mode))

(with-eval-after-load "go-autocomplete-autoloads"
  (require 'go-autocomplete))

(add-hook 'go-mode-hook (lambda()
			  (setq gofmt-command "goimports")
			  (add-hook 'before-save-hook 'gofmt-before-save)
			  (go-eldoc-setup)))



(package-initialize)
