;;This is for me to configure my own modeline
(defgroup pratik-modeline nil
 "Custom modeline that is close to default but shows what i want"
 :group 'mode-line)

(defgroup pratik-modeline-faces nil
  "Faces for my modeline"
  :group 'pratik-modeline)

(defcustom pratik-modeline-string-truncate-length 9
  "string length after which truncation should be done in small windows."
  :type 'natnum)

;;; Faces

(defface pratik-modeline-indicator-button nil
  "Generic face used for indicators that have a background. Modify this face to , for example, add a :box attribute to all relevant indicators.")

(defface pratik-modeline-indicator-red
  '((default :inherit bold)
    (((class color) (min-colors 88) (background light))
     :foreground "#880000")
    (((class color) (min-colors 88) (background dark))
     :foreground "#ff9f9f")
    (t :foreground "red"))
  "Face for modeline indicators (e.g. see my `notmuch-indicator')."
  :group 'pratik-modeline-faces)

(defface pratik-modeline-indicator-red-bg
  '((default :inherit (bold pratik-modeline-indicator-button))
    (((class color) (min-colors 88) (background light))
     :background "#aa1111" :foreground "white")
    (((class color) (min-colors 88) (background dark))
     :background "#ff9090" :foreground "black")
    (t :background "red" :foreground "black"))
  "Face for modeline indicators with a background."
  :group 'pratik-modeline-faces)

(defface pratik-modeline-indicator-green
  '((default :inherit bold)
    (((class color) (min-colors 88) (background light))
     :foreground "#005f00")
    (((class color) (min-colors 88) (background dark))
     :foreground "#73fa7f")
    (t :foreground "green"))
  "Face for modeline indicators (e.g. see my `notmuch-indicator')."
  :group 'pratik-modeline-faces)

(defface pratik-modeline-indicator-green-bg
  '((default :inherit (bold pratik-modeline-indicator-button))
    (((class color) (min-colors 88) (background light))
     :background "#207b20" :foreground "white")
    (((class color) (min-colors 88) (background dark))
     :background "#77d077" :foreground "black")
    (t :background "green" :foreground "black"))
  "Face for modeline indicators with a background."
  :group 'pratik-modeline-faces)

(defface pratik-modeline-indicator-yellow
  '((default :inherit bold)
    (((class color) (min-colors 88) (background light))
     :foreground "#6f4000")
    (((class color) (min-colors 88) (background dark))
     :foreground "#f0c526")
    (t :foreground "yellow"))
  "Face for modeline indicators (e.g. see my `notmuch-indicator')."
  :group 'pratik-modeline-faces)

(defface pratik-modeline-indicator-yellow-bg
  '((default :inherit (bold pratik-modeline-indicator-button))
    (((class color) (min-colors 88) (background light))
     :background "#805000" :foreground "white")
    (((class color) (min-colors 88) (background dark))
     :background "#ffc800" :foreground "black")
    (t :background "yellow" :foreground "black"))
  "Face for modeline indicators with a background."
  :group 'pratik-modeline-faces)

(defface pratik-modeline-indicator-blue
  '((default :inherit bold)
    (((class color) (min-colors 88) (background light))
     :foreground "#00228a")
    (((class color) (min-colors 88) (background dark))
     :foreground "#88bfff")
    (t :foreground "blue"))
  "Face for modeline indicators (e.g. see my `notmuch-indicator')."
  :group 'pratik-modeline-faces)

(defface pratik-modeline-indicator-blue-bg
  '((default :inherit (bold pratik-modeline-indicator-button))
    (((class color) (min-colors 88) (background light))
     :background "#0000aa" :foreground "white")
    (((class color) (min-colors 88) (background dark))
     :background "#77aaff" :foreground "black")
    (t :background "blue" :foreground "black"))
  "Face for modeline indicators with a background."
  :group 'pratik-modeline-faces)

(defface pratik-modeline-indicator-magenta
  '((default :inherit bold)
    (((class color) (min-colors 88) (background light))
     :foreground "#6a1aaf")
    (((class color) (min-colors 88) (background dark))
     :foreground "#e0a0ff")
    (t :foreground "magenta"))
  "Face for modeline indicators (e.g. see my `notmuch-indicator')."
  :group 'pratik-modeline-faces)

(defface pratik-modeline-indicator-magenta-bg
  '((default :inherit (bold pratik-modeline-indicator-button))
    (((class color) (min-colors 88) (background light))
     :background "#6f0f9f" :foreground "white")
    (((class color) (min-colors 88) (background dark))
     :background "#e3a2ff" :foreground "black")
    (t :background "magenta" :foreground "black"))
  "Face for modeline indicators with a background."
  :group 'pratik-modeline-faces)

(defface pratik-modeline-indicator-cyan
  '((default :inherit bold)
    (((class color) (min-colors 88) (background light))
     :foreground "#004060")
    (((class color) (min-colors 88) (background dark))
     :foreground "#30b7cc")
    (t :foreground "cyan"))
  "Face for modeline indicators (e.g. see my `notmuch-indicator')."
  :group 'pratik-modeline-faces)

(defface pratik-modeline-indicator-cyan-bg
  '((default :inherit (bold pratik-modeline-indicator-button))
    (((class color) (min-colors 88) (background light))
     :background "#006080" :foreground "white")
    (((class color) (min-colors 88) (background dark))
     :background "#40c0e0" :foreground "black")
    (t :background "cyan" :foreground "black"))
  "Face for modeline indicators with a background."
  :group 'pratik-modeline-faces)

(defface pratik-modeline-indicator-gray
  '((t :inherit shadow))
  "Face for modeline indicators (e.g. see my `notmuch-indicator')."
  :group 'pratik-modeline-faces)

(defface pratik-modeline-indicator-gray-bg
  '((default :inherit (bold pratik-modeline-indicator-button))
    (((class color) (min-colors 88) (background light))
     :background "#808080" :foreground "white")
    (((class color) (min-colors 88) (background dark))
     :background "#a0a0a0" :foreground "black")
    (t :inverse-video t))
  "Face for modeline indicatovrs with a background."
  :group 'pratik-modeline-faces)

;;;; Common helper functions


(defun pratik-common-window-narrow-p ()
  "Return non-nil if window is narrow.
Check if the `window-width' is less than `split-width-threshold'."
  (and (numberp split-width-threshold)
       (< (window-total-width) split-width-threshold)))

(defun pratik-modeline--string-truncate-p (str)
  "Return non-nil if STR should be truncated."
  (cond
   ((or (not (stringp str))
	(string-empty-p str)
	(string-blank-p str))
    nil)
   ((and (pratik-common-window-narrow-p)
	 (> (length str) pratik-modeline-string-truncate-length)
	 (not (one-window-p :no-minibuffer))))))

(defun pratik-modeline--truncate-p ()
  "Return non-nil if truncation should happen.
This is a more general and less stringent variant of
`pratik-modeline--string-truncate-p'."
  (and (pratik-common-window-narrow-p)
       (not (one-window-p :no-minibuffer))))

(defun pratik-modeline-string-cut-end (str)
  "Return truncated STR, if appropriate, else return STR.
Cut off the end of STR by counting from its start up to
`pratik-modeline-string-truncate-length'."
  (if (pratik-modeline--string-truncate-p str)
      (concat (substring str 0 pratik-modeline-string-truncate-length) "...")
    str))

(defun pratik-modeline-string-cut-beginning (str)
  "Return truncated STR, if appropriate, else return STR.
Cut off the beginning of STR by counting from its end up to
`pratik-modeline-string-truncate-length'."
  (if (pratik-modeline--string-truncate-p str)
      (concat "..." (substring str (- pratik-modeline-string-truncate-length)))
    str))

(defun pratik-modeline-string-cut-middle (str)
  "Return truncated STR, if appropriate, else return STR.
Cut off the middle of STR by counting half of
`pratik-modeline-string-truncate-length' both from its beginning
and end."
  (let ((half (floor pratik-modeline-string-truncate-length 2)))
    (if (pratik-modeline--string-truncate-p str)
	(concat (substring str 0 half) "..." (substring str (- half)))
      str)))

(defun pratik-modeline--first-char (str)
  "Return first character from STR."
  (substring str 0 1))

(defun pratik-modeline-string-abbreviate (str)
  "Abbreviate STR individual hyphen or underscore separated words.
Also see `pratik-modeline-string-abbreviate-but-last'."
  (if (pratik-modeline--string-truncate-p str)
      (mapconcat #'pratik-modeline--first-char (split-string str "[_-]") "-")
    str))

(defun pratik-modeline-string-abbreviate-but-last (str nthlast)
  "Abbreviate STR, keeping NTHLAST words intact.
Also see `pratik-modeline-string-abbreviate'."
  (if (pratik-modeline--string-truncate-p str)
      (let* ((all-strings (split-string str "[_-]"))
	     (nbutlast-strings (nbutlast (copy-sequence all-strings) nthlast))
	     (last-strings (nreverse (ntake nthlast (nreverse (copy-sequence all-strings)))))
	     (first-component (mapconcat #'pratik-modeline--first-char nbutlast-strings "-"))
	     (last-component (mapconcat #'identity last-strings "-")))
	(if (string-empty-p first-component)
	    last-component
	  (concat first-component "-" last-component)))
    str))

;;;; Input method

;;only useful if you use multiple languages.

(defvar-local pratik-modeline-input-method
    '(:eval
      (when current-input-method-title
	(propertize (format " %s " current-input-method-title)
		    'face 'pratik-modeline-indicator-green-bg
		    'mouse-face 'mode-line-highlight)))
  "Mode line construct to report the multilingual environment.")

;;;; Buffer status

(defvar-local pratik-modeline-buffer-status
    '(:eval
      (when (file-remote-p default-directory)
	(propertize " @ "
		    'face 'pratik-modeline-indicator-red-bg
		    'mouse-face 'mode-line-highlight)))
  "Mode line construct for showing remote file name.")

;;;; Dedicated window

;;dedicated means that you reserve a window solely for a single buffer.

(defvar-local pratik-modeline-window-dedicated-status
    '(:eval
      (when (window-dedicated-p)
	(propertize " = "
		    'face 'pratik-modeline-indicator-gray-bg
		    'mouse-face 'mode-line-highlight)))
  "Mode line construct for dedicated window indicator.")

;;;; Buffer name and modified status

(defun pratik-modeline-buffer-identification-face ()
  "Return appropriate face or face list for `pratik-modeline-buffer-identification'."
  (let ((file (buffer-file-name)))
    (cond
     ((and (mode-line-window-selected-p)
	   file
	   (buffer-modified-p))
      '(italic mode-line-buffer-id))
     ((and file (buffer-modified-p))
      'italic)
     ((mode-line-window-selected-p)
      'mode-line-buffer-id))))

(defun pratik-modeline--buffer-name ()
  "Return `buffer-name', truncating it if necessary.
See `pratik-modeline-string-cut-middle'."
  (when-let* ((name (buffer-name)))
    (pratik-modeline-string-cut-middle name)))

(defun pratik-modeline-buffer-name ()
  "Return buffer name, with read-only indicator if relevant."
  (let ((name (pratik-modeline--buffer-name)))
    (if buffer-read-only
	(format "%s %s" (char-to-string #xE0A2) name)
      name)))

(defun pratik-modeline-buffer-name-help-echo ()
  "Return `help-echo' value for `pratik-modeline-buffer-identification'."
  (concat
   (propertize (buffer-name) 'face 'mode-line-buffer-id)
   "\n"
   (propertize
    (or (buffer-file-name)
	(format "No underlying file.\nDirectory is: %s" default-directory))
    'face 'font-lock-doc-face)))

(defvar-local pratik-modeline-buffer-identification ""
  "Mode line construct for identifying the buffer being displayed.")

(defun pratik-modeline-update-buffer-identification ()
  "Update `pratik-modeline-buffer-identification` only when the buffer changes."
  (let ((new (propertize (pratik-modeline-buffer-name)
			 'face (pratik-modeline-buffer-identification-face)
			 'mouse-face 'mode-line-highlight
			 'help-echo (pratik-modeline-buffer-name-help-echo))))
    (unless (equal new pratik-modeline-buffer-identification)
      (setq pratik-modeline-buffer-identification new)
      (force-mode-line-update))))

;; Specific hooks
(add-hook 'window-buffer-change-functions (lambda (&rest _) (pratik-modeline-update-buffer-identification)))
(add-hook 'after-change-major-mode-hook #'pratik-modeline-update-buffer-identification)
(add-hook 'buffer-list-update-hook #'pratik-modeline-update-buffer-identification)

;;;; Major mode

(defvar-local pratik-modeline-major-mode nil
  "Mode line construct for displaying major modes.")

(defun pratik-modeline-update-major-mode ()
  "Update `pratik-modeline-major-mode' efficiently."
  (let ((indicator (cond
		    ((derived-mode-p 'text-mode) "§")
		    ((derived-mode-p 'prog-mode) "λ")
		    ((derived-mode-p 'comint-mode) ">_")
		    (t "◦")))
	(name (capitalize (string-replace "-mode" "" (symbol-name major-mode))))
	(help (if-let* ((parent (get major-mode 'derived-mode-parent)))
		 (format "Symbol: `%s'.  Derived from: `%s'" major-mode parent)
	       (format "Symbol: `%s'." major-mode))))
    (let ((new (list
		(propertize "%[" 'face 'pratik-modeline-indicator-red)
		(concat
		 (propertize indicator 'face 'pratik-modeline-indicator-magenta)
		 " "
		 (propertize name 'mouse-face 'mode-line-highlight 'help-echo help))
		(propertize "%]" 'face 'pratik-modeline-indicator-red))))
      (unless (equal new pratik-modeline-major-mode)
	(setq pratik-modeline-major-mode new)
	(force-mode-line-update)))))

(add-hook 'after-change-major-mode-hook #'pratik-modeline-update-major-mode)

(defvar-local pratik-modeline-process
    (list '("" mode-line-process))
  "Mode line construct for the running process indicator.")

;;;; Minor modes

;;show minor modes which i care about

;;;; Git branch and diffstat

(declare-function vc-git--symbolic-ref "vc-git" (file))

(defun pratik-modeline--vc-branch-name (file backend)
  "Return capitalized VC branch name for FILE with BACKEND."
  (when-let* ((rev (vc-working-revision file backend))
	      (branch (or (vc-git--symbolic-ref file)
			  (substring rev 0 7))))
    (capitalize branch)))

;; NOTE 2023-07-27: This is a good idea, but it hardcodes Git, whereas
;; I want a generic VC method.  Granted, I only use Git but I still
;; want it to work as a VC extension.

;; (defun pratik-modeline-diffstat (file)
;;   "Return shortened Git diff numstat for FILE."
;;   (when-let* ((output (shell-command-to-string (format "git diff --numstat %s" file)))
;;               (stats (split-string output "[\s\t]" :omit-nulls "[\s\f\t\n\r\v]+"))
;;               (added (nth 0 stats))
;;               (deleted (nth 1 stats)))
;;     (cond
;;      ((and (equal added "0") (equal deleted "0"))
;;       "")
;;      ((and (not (equal added "0")) (equal deleted "0"))
;;       (propertize (format "+%s" added) 'face 'shadow))
;;      ((and (equal added "0") (not (equal deleted "0")))
;;       (propertize (format "-%s" deleted) 'face 'shadow))
;;      (t
;;       (propertize (format "+%s -%s" added deleted) 'face 'shadow)))))

(declare-function vc-git-working-revision "vc-git" (file))

(defvar pratik-modeline-vc-map
  (let ((map (make-sparse-keymap)))
    (define-key map [mode-line down-mouse-1] 'vc-diff)
    (define-key map [mode-line down-mouse-3] 'vc-root-diff)
    map)
  "Keymap to display on VC indicator.")

(defun pratik-modeline--vc-help-echo (file)
  "Return `help-echo' message for FILE tracked by VC."
  (format "Revision: %s\nmouse-1: `vc-diff'\nmouse-3: `vc-root-diff'"
	  (vc-working-revision file)))

(defun pratik-modeline--vc-text (file branch &optional face)
  "Prepare text for Git controlled FILE, given BRANCH.
With optional FACE, use it to propertize the BRANCH."
  (concat
   (propertize (char-to-string #xE0A0) 'face 'shadow)
   " "
   (propertize branch
	       'face face
	       'mouse-face 'mode-line-highlight
	       'help-echo (pratik-modeline--vc-help-echo file)
	       'local-map pratik-modeline-vc-map)
   ;; " "
   ;; (pratik-modeline-diffstat file)
   ))

(defun pratik-modeline--vc-details (file branch &optional face)
  "Return Git BRANCH details for FILE, truncating it if necessary.
The string is truncated if the width of the window is smaller
than `split-width-threshold'."
  (pratik-modeline-string-cut-end
   (pratik-modeline--vc-text file branch face)))

(defvar pratik-modeline--vc-faces
  '((added . vc-locally-added-state)
    (edited . vc-edited-state)
    (removed . vc-removed-state)
    (missing . vc-missing-state)
    (conflict . vc-conflict-state)
    (locked . vc-locked-state)
    (up-to-date . vc-up-to-date-state))
  "VC state faces.")

(defun pratik-modeline--vc-get-face (key)
  "Get face from KEY in `pratik-modeline--vc-faces'."
  (alist-get key pratik-modeline--vc-faces 'vc-up-to-date-state))

(defun pratik-modeline--vc-face (file backend)
  "Return VC state face for FILE with BACKEND."
  (when-let* ((key (vc-state file backend)))
    (pratik-modeline--vc-get-face key)))

(defvar-local pratik-modeline-vc-branch
    '(:eval
      (when-let* (((mode-line-window-selected-p))
		  (file (or buffer-file-name default-directory))
		  (backend (or (vc-backend file) 'Git))
		  ;; ((vc-git-registered file))
		  (branch (pratik-modeline--vc-branch-name file backend))
		  (face (pratik-modeline--vc-face file backend)))
	(pratik-modeline--vc-details file branch face)))
  "Mode line construct to return propertized VC branch.")

;;;; Flymake errors, warnings, notes

(declare-function flymake--severity "flymake" (type))
(declare-function flymake-diagnostic-type "flymake" (diag))

;; Based on `flymake--mode-line-counter'.
(defun pratik-modeline-flymake-counter (type)
  "Compute number of diagnostics in buffer with TYPE's severity.
TYPE is usually keyword `:error', `:warning' or `:note'."
  (let ((count 0))
    (dolist (d (flymake-diagnostics))
      (when (= (flymake--severity type)
	       (flymake--severity (flymake-diagnostic-type d)))
	(cl-incf count)))
    (when (cl-plusp count)
      (number-to-string count))))

(defvar pratik-modeline-flymake-map
  (let ((map (make-sparse-keymap)))
    (define-key map [mode-line down-mouse-1] 'flymake-show-buffer-diagnostics)
    (define-key map [mode-line down-mouse-3] 'flymake-show-project-diagnostics)
    map)
  "Keymap to display on Flymake indicator.")

(defmacro pratik-modeline-flymake-type (type indicator &optional face)
  "Return function that handles Flymake TYPE with stylistic INDICATOR and FACE."
  `(defun ,(intern (format "pratik-modeline-flymake-%s" type)) ()
     (when-let* ((count (pratik-modeline-flymake-counter
			 ,(intern (format ":%s" type)))))
       (concat
	(propertize ,indicator 'face 'shadow)
	(propertize count
		    'face ',(or face type)
		    'mouse-face 'mode-line-highlight
		    ;; FIXME 2023-07-03: Clicking on the text with
		    ;; this buffer and a single warning present, the
		    ;; diagnostics take up the entire frame.  Why?
		    'local-map pratik-modeline-flymake-map
		    'help-echo "mouse-1: buffer diagnostics\nmouse-3: project diagnostics")))))

(pratik-modeline-flymake-type error "☣")
(pratik-modeline-flymake-type warning "!")
(pratik-modeline-flymake-type note "·" success)

(defvar-local pratik-modeline-flymake
    `(:eval
      (when (and (bound-and-true-p flymake-mode)
		 (mode-line-window-selected-p))
	(list
	 ;; See the calls to the macro `pratik-modeline-flymake-type'
	 '(:eval (pratik-modeline-flymake-error))
	 '(:eval (pratik-modeline-flymake-warning))
	 '(:eval (pratik-modeline-flymake-note)))))
  "Mode line construct displaying `flymake-mode-line-format'.
Specific to the current window's mode line.")

;;;; Eglot

(with-eval-after-load 'eglot
  (setq mode-line-misc-info
	(delete '(eglot--managed-mode (" [" eglot--mode-line-format "] ")) mode-line-misc-info)))

(defvar-local pratik-modeline-eglot
    `(:eval
      (when (and (featurep 'eglot) (mode-line-window-selected-p))
	'(eglot--managed-mode eglot--mode-line-format)))
  "Mode line construct displaying Eglot information.
Specific to the current window's mode line.")

;;;; Miscellaneous

(defvar-local pratik-modeline-misc-info nil
  "Mode line construct displaying `mode-line-misc-info' for the current window.")

(defun pratik-modeline-update-misc-info ()
  "Efficiently update `pratik-modeline-misc-info' in all buffers."
  (dolist (win (window-list))
    (with-current-buffer (window-buffer win)
      (when (boundp 'pratik-modeline-misc-info)
	(let ((new (if (eq win (selected-window))
		       (list "" mode-line-misc-info)
		     '(""))))
	  (unless (equal new pratik-modeline-misc-info)
	    (setq pratik-modeline-misc-info new)
	    (force-mode-line-update win))))))
  )

(add-hook 'window-selection-change-functions (lambda (_win) (pratik-modeline-update-misc-info)))
(add-hook 'buffer-list-update-hook #'pratik-modeline-update-misc-info)
(add-hook 'window-configuration-change-hook #'pratik-modeline-update-misc-info)


;;;; Pomodoro timer

(defun pratik-modeline-pomodoro ()
  "Start a Pomodoro Timer."
  (interactive)
  (org-timer-set-timer 25)) ;; Start a 25-min timer

;; Define a function to add the alarm icon to the modeline
(setq pratik-modeline-pomodoro-icon
      (propertize "★ "
		  'help-echo "Click to start a Pomodoro timer!"
		  'local-map (let ((map (make-sparse-keymap)))
			       (define-key map [mode-line down-mouse-1] #'pratik-modeline-pomodoro)
			       map)))

;;;; Risky local variables

;; NOTE 2023-04-28: The `risky-local-variable' is critical, as those
;; variables will not work without it.
(dolist (construct '(
		     pratik-modeline-state
		     pratik-modeline-input-method
		     pratik-modeline-buffer-status
		     pratik-modeline-window-dedicated-status
		     pratik-modeline-buffer-identification
		     pratik-modeline-major-mode
		     pratik-modeline-process
		     pratik-modeline-vc-branch
		     pratik-modeline-flymake
		     pratik-modeline-eglot
		     pratik-modeline-pomodoro-icon
		     pratik-modeline-misc-info))
  (put construct 'risky-local-variable t))

(provide 'pratik-modeline)
