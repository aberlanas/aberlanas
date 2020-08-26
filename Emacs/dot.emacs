;; Modificado: 20200822
;;

;; Inicio
(setq inhibit-splash-screen t
      initial-scratch-message nil)

;; Establecemos el fichero de titulo
(setq frame-title-format "%b")

;; Use package for now...testing...
;; Esto no se si se quedara
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; Install `use-package'.
(straight-use-package 'use-package)

;; Install packages in `use-package' forms with `straight'. (not the built-in
;; package.el)
(setq straight-use-package-by-default t)

;; Key Chord functionality in use-package
(use-package use-package-chords
  :config (key-chord-mode 1))

;; Coloreado de Syntaxis
(global-font-lock-mode 1)

;; Working area
(use-package display-line-numbers
  :straight (:type built-in)
  :hook
  (prog-mode . display-line-numbers-mode))

;; Latex
;; Using pdflatex to compile latex documents
(setq latex-run-command "pdflatex")

;; fontify code in code blocks
(setq org-src-fontify-natively t)

;; backup in one place. flat, no tree structure
(setq backup-directory-alist '(("" . "~/.emacs.d/backup")))

;; Show Paren mode
(show-paren-mode 1)

;; Autoident
(when (fboundp 'electric-indent-mode) (electric-indent-mode -1))
(electric-indent-mode 0)

;; Configurando 
(load "package")
(package-initialize)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)



(defvar aberlanas/packages '(ac-slime
                          autopair
                          markdown-mode
                          org
                          yaml-mode
			  ox-hugo
			  magit
			  )
  "Paquetes Defecto")

(defun aberlanas/packages-installed-p ()
  (cl-loop for pkg in aberlanas/packages
        when (not (package-installed-p pkg)) do (cl-return nil)
        finally (cl-return t)))

(unless (aberlanas/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg aberlanas/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

(require 'auto-complete-config)
(ac-config-default)

(with-eval-after-load 'ox
  (require 'ox-hugo))


;; Temas

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")

;; (load-theme 'tsdh-dark t)
;;(use-package poet-theme
;;  :defer t)


(use-package doom-themes
  :custom-face
  (font-lock-comment-face ((t (:slant italic))))
  (font-lock-string-face ((t (:foreground "PeachPuff3"))))
  (font-lock-function-name-face ((t (:foreground "LightGoldenrod"))))
  (highlight ((t (:underline t :weight bold :background nil :foreground nil))))
  (lazy-highlight ((t (:background nil :foreground nil :box (:line-width -1)))))
  :config
  (load-theme 'doom-spacegrey t)
  (defconst fk/font-color (face-attribute 'default :foreground))
  (defconst fk/background-color (face-attribute 'default :background))
  (defconst fk/dark-color (doom-darken fk/background-color 0.15))
  (defconst fk/dark-color1 (doom-darken fk/background-color 0.01))
  (defconst fk/dark-color2 (doom-darken fk/background-color 0.02))
  (defconst fk/dark-color3 (doom-darken fk/background-color 0.03))
  (defconst fk/dark-color4 (doom-darken fk/background-color 0.04))
  (defconst fk/dark-color5 (doom-darken fk/background-color 0.05))
  (defconst fk/dark-color6 (doom-darken fk/background-color 0.06))
  (defconst fk/dark-color7 (doom-darken fk/background-color 0.07))
  (defconst fk/dark-color8 (doom-darken fk/background-color 0.08))
  (defconst fk/dark-color9 (doom-darken fk/background-color 0.09))
  (defconst fk/light-color (doom-lighten fk/background-color 0.15))
  (defconst fk/light-color1 (doom-lighten fk/background-color 0.09))
  (defconst fk/light-color2 (doom-lighten fk/background-color 0.08))
  (defconst fk/light-color3 (doom-lighten fk/background-color 0.07))
  (defconst fk/light-color4 (doom-lighten fk/background-color 0.06))
  (defconst fk/light-color5 (doom-lighten fk/background-color 0.05))
  (defconst fk/light-color6 (doom-lighten fk/background-color 0.04))
  (defconst fk/light-color7 (doom-lighten fk/background-color 0.03))
  (defconst fk/light-color8 (doom-lighten fk/background-color 0.02))
  (defconst fk/light-color9 (doom-lighten fk/background-color 0.01)))








;; Fuente
;;
(defconst fk/default-font-size 100)
(defconst fk/default-icon-size 20)

(set-face-attribute 'default nil
                    :family "FiraCode"
                    :height fk/default-font-size)

(set-face-attribute 'fixed-pitch-serif nil
                    ;; Characters with fixed pitch face do not shown when height
                    ;; is 90.
                    :height (+ fk/default-font-size 10))


