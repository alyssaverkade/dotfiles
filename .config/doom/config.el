;;; ~/.config/doom/config.el -*- lexical-binding: t; -*-
(after! evil-snipe
  (evil-snipe-mode -1)
  (evil-snipe-override-mode -1)
  (map! :n "s" #'evil-substitute))
(setq doom-theme 'doom-one)
(setq doom-font (font-spec :family "Hasklug Nerd Font" :size 15))
(setq-default flycheck-disabled-checkers '(ruby-reek ruby-rubocop))
(add-hook 'ruby-mode-hook #'robe-mode)
