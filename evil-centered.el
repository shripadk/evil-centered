;;; evil-centered.el --- Description -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2024 Shripad Krishna
;;
;; Author: Shripad Krishna <shri@sizzle.run>
;; Maintainer: Shripad Krishna <shri@sizzle.run>
;; Created: June 16, 2024
;; Modified: June 16, 2024
;; Version: 0.0.2
;; Keywords: abbrev convenience emulations
;; Homepage: https://github.com/shripadkrishna/evil-centered
;; Package-Requires: ((emacs "24.3"))
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;;
;;  Vim-like centered navigation — Keeps screen centered while scrolling up/down.
;;
;;; Code:

(require 'evil)

(defvar evil-centered-mode-map (make-sparse-keymap)
  "The evil-centered-mode's keymap.")

(evil-define-command evil-scroll-down-and-center (count)
  "Scroll the window and the cursor count lines downwards and center it."
  :repeat nil
  :keep-visual t
  (interactive "<c>")
  (evil-scroll-down count)
  (evil-scroll-line-to-center count))

(evil-define-command evil-scroll-up-and-center (count)
  "Scroll the window and the cursor count lines upwards and center it."
  :repeat nil
  :keep-visual t
  (interactive "<c>")
  (evil-scroll-up count)
  (evil-scroll-line-to-center count))

(evil-define-key '(normal visual) evil-centered-mode-map
  "C-d" #'evil-scroll-down-and-center
  "C-u" #'evil-scroll-up-and-center)

;;;###autoload
(define-minor-mode evil-centered-mode
  "Integrating Vim-style pager like navigation."
  :global t
  :keymap evil-centered-mode-map
  (let ((prev-state evil-state))
    (evil-normal-state)
    (evil-change-state prev-state)))

;;;###autoload
(defun evil-centered-enable ()
  "Enable `evil-centered-mode' in the current buffer."
  (evil-centered-mode 1))

;;;###autoload
(defun evil-centered-disable ()
  "Disable `evil-centered-mode' in the current buffer."
  (evil-centered-mode -1))

;;;###autoload
(define-globalized-minor-mode evil-centered-mode-global
  evil-centered-mode evil-centered-enable)

(provide 'evil-centered)
;;; evil-centered.el ends here
