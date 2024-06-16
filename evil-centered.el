;;; evil-centered.el --- Description -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2024 Shripad Krishna
;;
;; Author: Shripad Krishna <shri@sizzle.run>
;; Maintainer: Shripad Krishna <shri@sizzle.run>
;; Created: June 16, 2024
;; Modified: June 17, 2024
;; Version: 1.0.0
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

(evil-define-command evil-centered-scroll-down (count)
  "Scroll the window and the cursor count lines downwards and center it."
  :repeat nil
  :keep-visual t
  (interactive "<c>")
  (evil-scroll-down count)
  (evil-scroll-line-to-center count))

(evil-define-command evil-centered-scroll-up (count)
  "Scroll the window and the cursor count lines upwards and center it."
  :repeat nil
  :keep-visual t
  (interactive "<c>")
  (evil-scroll-up count)
  (evil-scroll-line-to-center count))

(provide 'evil-centered)
;;; evil-centered.el ends here
