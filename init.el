(add-to-list 'load-path
	     (expand-file-name (concat user-emacs-directory "lisp")))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/awesome-tab"))

(require 'awesome-tab)
(awesome-tab-mode t)

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

(require 'init-startup)
(require 'init-elpa)
(require 'init-package)
(require 'init-ui)
(require 'init-keyshort)
(require 'awesome-config)
;; load file

;; 开启server mode
(server-mode 1)

