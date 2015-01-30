;;; emacsc-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads nil "ediff-batch" "ediff-batch.el" (21673 52872
;;;;;;  745298 257000))
;;; Generated autoloads from ediff-batch.el

(eval-after-load "ediff" '(progn (defvar ediff-batch-saved-window-configuration nil "Saved window configuration for ediff") (defun ediff-batch-save-window-configuration nil (setq ediff-batch-saved-window-configuration (current-window-configuration))) (add-hook 'ediff-before-setup-hook 'ediff-batch-save-window-configuration) (defun ediff-batch-restore-window-configuration nil (set-window-configuration ediff-batch-saved-window-configuration)) (add-hook 'ediff-suspend-hook 'ediff-batch-restore-window-configuration t) (add-hook 'ediff-quit-hook 'ediff-batch-restore-window-configuration t) (ediff-defvar-local ediff-batch-in-batch-mode-p nil "True if in batch mode") (ediff-defvar-local ediff-batch-close-on-quit nil "True if the buffer should be closed on quit.") (defun ediff-batch-batch-mode (&optional mode) (let (ret) (ediff-with-current-buffer ediff-buffer-A (case mode (set (setq ret (setq ediff-batch-in-batch-mode-p t))) (unset (setq ret ediff-batch-in-batch-mode-p) (setq ediff-batch-in-batch-mode-p nil)) (t (setq ret ediff-batch-in-batch-mode-p)))) ret)) (defadvice ediff-find-file (around mark-newly-opened-buffers (file-var buffer-name &optional last-dir hooks-var) activate) (let* ((file (symbol-value file-var)) (existing-p (and find-file-existing-other-name (find-buffer-visiting file)))) ad-do-it (or existing-p (ediff-with-current-buffer (symbol-value buffer-name) (setq ediff-batch-close-on-quit t))))) (defun ediff-batch-save-merge nil (if (ediff-batch-batch-mode) (let ((file ediff-merge-store-file)) (if file (ediff-with-current-buffer ediff-buffer-C (set-visited-file-name file t) (save-buffer)))) (ediff-maybe-save-and-delete-merge))) (remove-hook 'ediff-quit-merge-hook 'ediff-maybe-save-and-delete-merge) (add-hook 'ediff-quit-merge-hook 'ediff-batch-save-merge) (defadvice ediff-cleanup-mess (around support-batch-mode nil activate) (let ((batch-p (ediff-batch-batch-mode 'unset)) (buffers (list ediff-buffer-A ediff-buffer-B ediff-ancestor-buffer)) (buffer-C ediff-buffer-C)) ad-do-it (dolist (buffer buffers) (ediff-with-current-buffer buffer (and ediff-batch-close-on-quit (kill-buffer)))) (when batch-p (ediff-kill-buffer-carefully buffer-C) (delete-frame)))) (defun ediff-files-in-batch-mode (file-A file-B &optional startup-hooks) (ediff-files file-A file-B (cons #'(lambda nil (ediff-batch-batch-mode 'set)) startup-hooks))) (defun ediff-merge-files-in-batch-mode (file-A file-B &optional startup-hooks merge-buffer-file) (ediff-merge-files file-A file-B (cons #'(lambda nil (ediff-batch-batch-mode 'set)) startup-hooks) merge-buffer-file)) (defun ediff-merge-files-with-ancestor-in-batch-mode (file-A file-B file-ancestor &optional startup-hooks merge-buffer-file) (ediff-merge-files-with-ancestor file-A file-B file-ancestor (cons #'(lambda nil (ediff-batch-batch-mode 'set)) startup-hooks) merge-buffer-file))))

(autoload 'ediff-files-in-batch-mode "ediff")

(autoload 'ediff-merge-files-in-batch-mode "ediff")

(autoload 'ediff-merge-files-with-ancestor-in-batch-mode "ediff")

;;;***

;;;### (autoloads nil "emacsc" "emacsc.el" (21673 52872 789298 256000))
;;; Generated autoloads from emacsc.el

(eval-after-load "server" '(defadvice server-eval-and-print (before emacsc-suppress-output (expr proc) activate) (when (string-prefix-p "@" expr) (ad-set-arg 0 (substring expr 1)) (ad-set-arg 1 nil))))

;;;***

;;;### (autoloads nil nil ("emacsc-pkg.el") (21673 52872 837920 65000))

;;;***

(provide 'emacsc-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; emacsc-autoloads.el ends here
