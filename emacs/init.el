;; Settings managed outside of customize
(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(add-hook 'before-save-hook (lambda ()
                              (interactive)
                              (delete-trailing-whitespace)
                              (untabify (point-min) (point-max))))

;; Base package and archive configuration
(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/"))
(package-initialize)

(setq package-selected-packages
      '(company ;
        consult ;
        doom-modeline ;
        dracula-theme ;
        magit ;
        marginalia ;
        orderless ;
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

(use-package orderless
  :init
  (setq completion-styles '(orderless basic)
        completion-category-overrides '((file (styles partial-completion)))))

;; Completion
(use-package company
  :config (add-to-list 'company-backends 'company-capf)
  :hook prog-mode)

;; Modeline
(use-package doom-modeline
  :init (doom-modeline-mode 1))

;; Theming
(use-package dracula-theme
  :config (load-theme 'dracula t))

;; TreeSitter
(setq treesit-language-source-alist
      '((bash "https://github.com/tree-sitter/tree-sitter-bash")
        (c "https://github.com/tree-sitter/tree-sitter-c")
        (cpp "https://github.com/tree-sitter/tree-sitter-cpp")
        (c-sharp "https://github.com/tree-sitter/tree-sitter-c-sharp")
        (css "https://github.com/tree-sitter/tree-sitter-css")
        (go "https://github.com/tree-sitter/tree-sitter-go")
        (java "https://github.com/tree-sitter/tree-sitter-java")
        (javascript "https://github.com/tree-sitter/tree-sitter-javascript")
        (jsdoc "https://github.com/tree-sitter/tree-sitter-jsdoc")
        (json "https://github.com/tree-sitter/tree-sitter-json")
        (julia "https://github.com/tree-sitter/tree-sitter-julia")
        (haskell "https://github.com/tree-sitter/tree-sitter-haskell")
        (html "https://github.com/tree-sitter/tree-sitter-html")
        (ocaml "https://github.com/tree-sitter/tree-sitter-ocaml" "master" "grammars/ocaml/src")
        (php "https://github.com/tree-sitter/tree-sitter-php" "master" "php/src")
        (python "https://github.com/tree-sitter/tree-sitter-python")
        (ruby "https://github.com/tree-sitter/tree-sitter-ruby")
        (rust "https://github.com/tree-sitter/tree-sitter-rust")
        (scala "https://github.com/tree-sitter/tree-sitter-scala")
        (typescript "https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src")
        (yaml "https://github.com/ikatyang/tree-sitter-yaml")))

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
