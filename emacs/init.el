;; Settings managed outside of customize
(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(add-hook 'before-save-hook (lambda ()
                              (interactive)
                              (delete-trailing-whitespace)
                              (indent-region (point-min) (point-max) nil)
                              (untabify (point-min) (point-max))))

;; Base package and archive configuration
(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/"))
(package-initialize)

(setq package-selected-packages
      '(company ;
        consult ;
        dracula-theme ;
        magit ;
        marginalia ;
        mood-line ;
        vertico))

(package-install-selected-packages t)
(package-autoremove)

(require 'use-package)

;; Git integration
(use-package magit
  :commands magit)

;; Minibuffer improvements
(use-package consult
  :hook (completion-list-mode . consult-preview-at-point-mode))

(use-package vertico
  :init (vertico-mode))

(use-package marginalia
  :bind (:map minibuffer-local-map
              ("M-A" . marginalia-cycle))
  :init (marginalia-mode))

;; Completion
(use-package company
  :hook prog-mode)

;; Modeline
(use-package mood-line
  :config
  (setq mood-line-glyph-alist mood-line-glyphs-unicode)
  (mood-line-mode))

;; Theming
(use-package dracula-theme
  :config (load-theme 'dracula t))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(display-line-numbers 'relative)
 '(display-line-numbers-type 'relative)
 '(menu-bar-mode nil)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "JetBrainsMono NF SemiBold" :foundry "outline" :slant italic :weight semi-bold :height 98 :width normal)))))
