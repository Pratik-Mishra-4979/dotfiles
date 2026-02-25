;;; denote-review.el --- Spaced repetition review system for Denote notes -*- lexical-binding: t; -*-

;;; Commentary:
;; This sets up a spaced repetition review system using Org-mode, Denote, and Hyperbole.
;; Review TODOs are deleted when marked DONE, and a new TODO is created for a future date.
;; Org agenda is used for scheduling. Hyperbole is used for navigation.

;;; Code:

;; Set your review file
(defvar denote-review-file "~/notes/reviews/review.org"
  "Path to the Org file where Denote review TODOs are stored.")

;; Add review file to agenda
(with-eval-after-load 'org
  (add-to-list 'org-agenda-files denote-review-file))

;; Spaced repetition hook
(defun denote-review--spaced-repetition ()
  "When a review TODO is marked DONE, create a new one with spaced repetition and delete the old."
  (when (and (string= org-state "DONE")
	     (org-entry-get nil "REVIEW"))

    ;; Get properties and context
    (let* ((level (string-to-number (or (org-entry-get nil "REVIEW_LEVEL") "1")))
	   (interval (nth (1- level) '(1 3 7 14 30 60))) ;; intervals in days
	   (next-level (number-to-string (1+ level)))
	   (title (org-get-heading t t t t))
	   (link (save-excursion
		   (re-search-forward "\\[\\[.*?\\]\\[.*?\\]\\]" (line-end-position) t)
		   (match-string 0)))
	   (scheduled (format-time-string "<%Y-%m-%d %a>"
					  (time-add (current-time) (days-to-time interval)))))

      ;; Insert new review task at end of review file
      (with-current-buffer (find-file-noselect denote-review-file)
	(goto-char (point-max))
	(insert (format "* TODO %s\n  :PROPERTIES:\n  :REVIEW: t\n  :REVIEW_LEVEL: %s\n  :END:\n  SCHEDULED: %s\n\n"
			link next-level scheduled))
	(save-buffer))

      ;; Delete current task
      (org-cut-subtree)
      (message "Created next review in %d days and deleted completed task." interval))))

;; Register the hook
(add-hook 'org-after-todo-state-change-hook #'denote-review--spaced-repetition)

(provide 'denote-review)

;;; denote-review.el ends here
