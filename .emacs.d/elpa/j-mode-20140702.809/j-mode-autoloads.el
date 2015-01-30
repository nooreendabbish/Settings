;;; j-mode-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (j-console) "j-console" "j-console.el" (21682 56550
;;;;;;  702260 84000))
;;; Generated autoloads from j-console.el

(autoload 'j-console "j-console" "\
Ensures a running j-console-cmd session and switches focus to
the containing buffer

\(fn)" t nil)

;;;***

;;;### (autoloads (j-help-lookup-symbol-at-point j-help-lookup-symbol)
;;;;;;  "j-help" "j-help.el" (21682 56550 554260 88000))
;;; Generated autoloads from j-help.el

(autoload 'j-help-lookup-symbol "j-help" "\
Lookup symbol in dictionary

\(fn SYMBOL)" t nil)

(autoload 'j-help-lookup-symbol-at-point "j-help" "\
Determine the symbol nearest to POINT and look it up in the dictionary

\(fn POINT)" t nil)

;;;***

;;;### (autoloads (j-mode) "j-mode" "j-mode.el" (21682 56550 634260
;;;;;;  86000))
;;; Generated autoloads from j-mode.el

(autoload 'j-mode "j-mode" "\
Major mode for editing J

\(fn)" t nil)

(add-to-list 'auto-mode-alist '("\\.ij[rstp]$" . j-mode))

;;;***

;;;### (autoloads nil nil ("j-font-lock.el" "j-mode-pkg.el") (21682
;;;;;;  56550 835360 986000))

;;;***

(provide 'j-mode-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; j-mode-autoloads.el ends here
