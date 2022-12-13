(require 'org-tempo) ;开启easy template

(use-package org
  :pin nongnu
  :ensure t)

(use-package org-contrib
  :pin nongnu)

(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "STARTED(s)" "|" "DONE(d!/!)")
	      (sequence "WAITING(w@/!)" "SOMEDAY(S)" "|" "CANCELLED(c@/!)" "MEETING(m)" "PHONE(p)"))))


(require 'org-checklist)

(setq org-log-done t)
(setq org-log-into-drawer t)

;; C-c C-s schedule
;; C-c C-d deadline
(global-set-key (kbd "C-c a") 'org-agenda)
(setq org-agenda-files '("~/.emacs.d/gtd.org"))
(setq org-agenda-span 'day)

(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/.emacs.d/gtd.org" "Workspace")
	 "* TODO [#B] %?\n  %i\n %U"
	 :empty-lines 1)))

(global-set-key (kbd "C-c r") 'org-capture)

(setq org-agenda-custom-commands
      '(("c" "重要且紧急的事"
	 ((tags-todo "+PRIORITY=\"A\"")))
	;; ...other commands here
	))

(use-package ox-hugo
  :ensure t   ;Auto-install the package from Melpa
  :pin melpa  ;`package-archives' should already have ("melpa" . "https://melpa.org/packages/")
  :after ox)

(use-package ox-hugo
  :ensure t   ;Auto-install the package from Melpa
  :pin melpa  ;`package-archives' should already have ("melpa" . "https://melpa.org/packages/")
  :after ox)

(provide 'init-org)

