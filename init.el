(add-to-list 'load-path
	     (expand-file-name (concat user-emacs-directory "lisp")))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/awesome-tab"))

(require 'awesome-tab)
(awesome-tab-mode t)

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(setq make-backup-files nil)

(require 'init-startup)
(require 'init-elpa)
(require 'init-package)
(require 'init-ui)
(require 'init-keyshort)
(require 'awesome-config)
(require 'init-evil)
(require 'init-explorer)
;; load file

;; 开启server mode
(server-mode 1)

