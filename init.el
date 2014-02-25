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
(tool-bar-mode -1)

; Display Column Numbers
(column-number-mode t)

; Disable auto save
(setq auto-save-default nil)

; Set window title to something more interesting
(setq frame-title-format "%b")

; Disable backup
(setq backup-inhibited t)

; Theme configuration
(load-theme 'wombat)
(set-face-attribute 'default nil :height 90)
(set-face-attribute 'default nil :weight 'bold)
