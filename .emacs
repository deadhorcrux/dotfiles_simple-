;; ===============================
;; Minimalist portable Emacs init.el
;; ===============================

;; ---------- Basic UI ----------
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq truncate-lines t)
(setq truncate-partial-width-windows t)
(setq visible-bell t)
(setq ring-bell-function 'ignore)

;; ---------- Tabs & Indentation ----------
(setq-default tab-width 4)
(setq-default indent-tabs-mode t)
(setq-default c-basic-offset 4)

(defun my-c-mode-common-hook ()
  (c-set-offset 'substatement-open 0)
  (setq c++-tab-always-indent t)
  (setq tab-stop-list '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60)))
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

;; ---------- Keybindings ----------
(global-set-key (kbd "M-o") 'open-next-line)
(global-set-key (kbd "C-w") 'open-previous-line)
(global-set-key [?\C-a] 'back-to-indentation)
(global-set-key [?\C-o] 'other-window)
(global-set-key [?\C-e] 'end-of-line)
(global-set-key [?\C-v] 'beginning-of-buffer)
(global-set-key [?\C-/] 'goto-line)
(global-set-key [?\M-l] 'forward-word)
(global-set-key [?\M-h] 'backward-word)
(global-set-key [?\C-q] 'end-of-buffer)
(global-set-key [?\C-0] 'delete-window)
(global-set-key [?\C-1] 'delete-other-windows)
(global-set-key [?\C-2] 'split-window-vertically)
(global-set-key [?\C-3] 'split-window-horizontally)
(global-set-key [?\C-z] 'undo)
(global-set-key [?\C-l] 'forward-char)
(global-set-key [?\C-h] 'backward-char)
(global-set-key [?\C-j] 'next-line)
(global-set-key [?\C-k] 'previous-line)
(global-set-key [?\C-p] 'kill-line)

;; ---------- Open lines ----------
(defvar newline-and-indent t)
(defun open-previous-line (arg)
  (interactive "p")
  (beginning-of-line)
  (open-line arg)
  (when newline-and-indent
    (indent-according-to-mode)))
(defun open-next-line (arg)
  (interactive "p")
  (end-of-line)
  (open-line arg)
  (forward-line 1)
  (when newline-and-indent
    (indent-according-to-mode)))

;; ---------- Line numbers ----------
(when (version<= "26.0.50" emacs-version)
  (global-display-line-numbers-mode))

;; ---------- Mode-line ----------
(defun my-mode-line-buffer-progress ()
  (let* ((total (point-max))
         (current (point))
         (percent (if (> total 0)
                      (/ (* 100 current) total)
                    0)))
    (format " %2d%% " percent)))

(setq mode-line-format
      '("%e"
        " "
        (:eval (my-mode-line-buffer-progress))
        " │ "
        mode-line-buffer-identification
        " │ "
        mode-line-modes
        mode-line-end-spaces))

;; ---------- Dired as File Tree ----------
(require 'dired)
(setq dired-listing-switches "-alh --group-directories-first")
(setq dired-dwim-target t)
(add-hook 'dired-mode-hook
          (lambda () (dired-hide-details-mode 1)))

(defun my-file-tree ()
  "Open dired in a side window."
  (interactive)
  (let ((buf (dired-noselect default-directory)))
    (display-buffer-in-side-window
     buf '((side . left)
           (window-width . 30)))))
(global-set-key (kbd "C-c t") 'my-file-tree)

;; ---------- Git support ----------
(global-set-key (kbd "C-x v d") 'vc-dir)
(global-set-key (kbd "C-x v =") 'vc-diff)

;; ---------- Git conflict resolution ----------
(add-hook 'find-file-hook
          (lambda ()
            (when (re-search-forward "^<<<<<<< " nil t)
              (smerge-mode 1))))

(with-eval-after-load 'smerge-mode
  (define-key smerge-mode-map (kbd "C-c n") 'smerge-next)
  (define-key smerge-mode-map (kbd "C-c p") 'smerge-prev)
  (define-key smerge-mode-map (kbd "C-c a") 'smerge-keep-all)
  (define-key smerge-mode-map (kbd "C-c b") 'smerge-keep-base)
  (define-key smerge-mode-map (kbd "C-c u") 'smerge-keep-upper)
  (define-key smerge-mode-map (kbd "C-c l") 'smerge-keep-lower))

;; ===============================
;; End of init.el
;; ===============================
