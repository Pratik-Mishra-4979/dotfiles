;;; package --- Summary
;;; custom minor mode

;;; Code:
(defvar pratik-mode-map (make-sparse-keymap)
  "Keymap for 'pratik-mode'.")

;;defining a minor mode
(define-minor-mode pratik-mode
  "A simple minor mode for keybindings."
  :global t
  :init-value t
  :keymap pratik-mode-map)

;;defining enter and exit funcitons
(defun pratik-enter ()
  "Enter 'pratik-mode'."
  (interactive)
  (pratik-mode 1))

(defun pratik-exit ()
  "Exit 'pratik-mode'."
  (interactive)
  (pratik-mode -1))

;;desable spc so that i can use it as a leader key
(define-key pratik-mode-map (kbd "SPC") nil)

;;Leader key setup using general
(use-package general
  :ensure t
  :demand t
  :config

  (general-create-definer pratik/leader-keys
    :keymaps 'pratik-mode-map
    :prefix "SPC")

;;Define keybindings for various commands in your custom minor mode
 (pratik/leader-keys
    "." '(consult-buffer :wk "Find file")
    "f c" '((lambda () (interactive) (find-file "~/.emacs.d/config.org")) :wk "Edit emacs config")
    "f r" '(consult-recent-file :wk "Find recent files")
    "TAB TAB" '(comment-line :wk "Comment lines"))

   (pratik/leader-keys
    "b" '(:ignore t :wk "buffer")
    "b b" '(consult-buffer :wk "Switch buffer")
    "b i" '(ibuffer :wk "Ibuffer")
    "b k" '(kill-current-buffer :wk "Kill this buffer")
    "b n" '(next-buffer :wk "Next buffer")
    "b p" '(previous-buffer :wk "Previous buffer")
    "b r" '(revert-buffer :wk "Reload buffer"))

   (pratik/leader-keys
    "e" '(:ignore t :wk "Evaluate")
    "e b" '(eval-buffer :wk "Evaluate elisp in buffer")
    "e d" '(eval-defun :wk "Evaluate defun containing or after point")
    "e e" '(eval-expression :wk "Evaluate and elisp expression")
    "e l" '(eval-last-sexp :wk "Evaluate elisp expression before point")
    "e r" '(eval-region :wk "Evaluate elisp in region"))

   (pratik/leader-keys
    "h" '(:ignore t :wk "Help")
    "h f" '(describe-function :wk "Describe function")
    "h v" '(describe-variable :wk "Describe variable"))

   (pratik/leader-keys
    "t" '(:ignore t :wk "Toggle")
    "t l" '(display-line-numbers-mode :wk "Toggle line numbers")
    "t t" '(visual-line-mode :wk "Toggle truncated lines"))

   (pratik/leader-keys
    "w" '(:ignore t :wk "Windows")
    ;; Window splits
    "w c" '(delete-window :wk "Close window")
    "w n" '(split-window-below :wk "New window")
    "w v" '(split-window-right :wk "Vertical split window")
    ;; Window motions
    "w h" '(windmove-left :wk "Window left")
    "w j" '(windmove-down :wk "Window down")
    "w k" '(windmove-up :wk "Window up")
    "w l" '(windmove-right :wk "Window right")
    "w w" '(other-window :wk "Goto next window")
    ;; Move Windows
    "w H" '(buf-move-left :wk "Buffer move left")
    "w J" '(buf-move-down :wk "Buffer move down")
    "w K" '(buf-move-up :wk "Buffer move up")
    "w L" '(buf-move-right :wk "Buffer move right")
)

(pratik/leader-keys
    "s" '(flyspell-mode :wk "Spell Check"))
)

;; Set up basic vim like movement only  in 'pratik-mode'
(define-key pratik-mode-map (kbd "a") 'ignore)
(define-key pratik-mode-map (kbd "b") 'ignore)
(define-key pratik-mode-map (kbd "c") 'ignore)
(define-key pratik-mode-map (kbd "d") 'kill-region)
(define-key pratik-mode-map (kbd "e") 'ignore)
(define-key pratik-mode-map (kbd "f") 'ignore)
(define-key pratik-mode-map (kbd "g") 'ignore)
(define-key pratik-mode-map (kbd "h") 'backward-char)
(define-key pratik-mode-map (kbd "i") 'pratik-exit)
(define-key pratik-mode-map (kbd "j") 'next-line)
(define-key pratik-mode-map (kbd "k") 'previous-line)
(define-key pratik-mode-map (kbd "l") 'forward-char)
(define-key pratik-mode-map (kbd "m") 'ignore)
(define-key pratik-mode-map (kbd "n") 'ignore)
(define-key pratik-mode-map (kbd "o") 'ignore)
(define-key pratik-mode-map (kbd "p") 'yank)
(define-key pratik-mode-map (kbd "q") 'ignore)
(define-key pratik-mode-map (kbd "r") 'undo-redo)
(define-key pratik-mode-map (kbd "s") 'ignore)
(define-key pratik-mode-map (kbd "t") 'ignore)
(define-key pratik-mode-map (kbd "u") 'undo)
(define-key pratik-mode-map (kbd "v") 'ignore)
(define-key pratik-mode-map (kbd "w") 'save-buffer)
(define-key pratik-mode-map (kbd "x") 'delete-char)
(define-key pratik-mode-map (kbd "y") 'kill-ring-save)
(define-key pratik-mode-map (kbd "z") 'ignore)

;; Disable all uppercase keys
(define-key pratik-mode-map (kbd "A") #'ignore)
(define-key pratik-mode-map (kbd "B") #'ignore)
(define-key pratik-mode-map (kbd "C") #'ignore)
(define-key pratik-mode-map (kbd "D") #'ignore)
(define-key pratik-mode-map (kbd "E") #'ignore)
(define-key pratik-mode-map (kbd "F") #'ignore)
(define-key pratik-mode-map (kbd "G") #'ignore)
(define-key pratik-mode-map (kbd "H") #'ignore)
(define-key pratik-mode-map (kbd "I") #'ignore)
(define-key pratik-mode-map (kbd "J") #'ignore)
(define-key pratik-mode-map (kbd "K") #'ignore)
(define-key pratik-mode-map (kbd "L") #'ignore)
(define-key pratik-mode-map (kbd "M") #'ignore)
(define-key pratik-mode-map (kbd "N") #'ignore)
(define-key pratik-mode-map (kbd "O") #'ignore)
(define-key pratik-mode-map (kbd "P") #'ignore)
(define-key pratik-mode-map (kbd "Q") #'ignore)
(define-key pratik-mode-map (kbd "R") #'ignore)
(define-key pratik-mode-map (kbd "S") #'ignore)
(define-key pratik-mode-map (kbd "T") #'ignore)
(define-key pratik-mode-map (kbd "U") #'ignore)
(define-key pratik-mode-map (kbd "V") #'ignore)
(define-key pratik-mode-map (kbd "W") #'ignore)
(define-key pratik-mode-map (kbd "X") #'ignore)
(define-key pratik-mode-map (kbd "Y") #'ignore)
(define-key pratik-mode-map (kbd "Z") #'ignore)

;; Disable other common single key presses
(define-key pratik-mode-map (kbd "0") #'ignore)
(define-key pratik-mode-map (kbd "1") #'ignore)
(define-key pratik-mode-map (kbd "2") #'ignore)
(define-key pratik-mode-map (kbd "3") #'ignore)
(define-key pratik-mode-map (kbd "4") #'ignore)
(define-key pratik-mode-map (kbd "5") #'ignore)
(define-key pratik-mode-map (kbd "6") #'ignore)
(define-key pratik-mode-map (kbd "7") #'ignore)
(define-key pratik-mode-map (kbd "8") #'ignore)
(define-key pratik-mode-map (kbd "9") #'ignore)
(define-key pratik-mode-map (kbd "-") #'ignore)
(define-key pratik-mode-map (kbd "=") #'ignore)
(define-key pratik-mode-map (kbd ";") #'ignore)
(define-key pratik-mode-map (kbd ",") #'ignore)
(define-key pratik-mode-map (kbd ".") #'ignore)
(define-key pratik-mode-map (kbd "/") #'ignore)
(define-key pratik-mode-map (kbd "[") #'ignore)
(define-key pratik-mode-map (kbd "]") #'ignore)
(define-key pratik-mode-map (kbd "/") #'ignore)
(define-key pratik-mode-map (kbd "'") #'ignore)
(define-key pratik-mode-map (kbd "TAB") #'ignore)

;;Set escape as to toggle pratik mode
(global-set-key (kbd "<escape>") 'pratik-enter)

;;Set shift mouse drag to move frame
(global-set-key (kbd "<S-down-mouse-1>") #'mouse-drag-frame-move)

;;Disables pratik-mode in mini buffers and remembers the state before
(defvar pratik--mode-before-special nil
  "Internal var to store 'pratik-mode' state before entering special buffers like minibuffer or Elfeed.")

(defun pratik--maybe-disable-pratik-mode ()
  "Disable 'pratik-mode' if active and remember the state."
  (when (bound-and-true-p pratik-mode)
    (setq pratik--mode-before-special t)
    (pratik-mode -1)))

(defun pratik--maybe-restore-pratik-mode ()
  "Restore'pratik-mode' if it was active before."
  (when pratik--mode-before-special
    (setq pratik--mode-before-special nil)
    (pratik-mode 1)))

;; Hooks for minibuffer
(add-hook 'minibuffer-setup-hook #'pratik--maybe-disable-pratik-mode)
(add-hook 'minibuffer-exit-hook #'pratik--maybe-restore-pratik-mode)

;; pratik-mode finishies here
(provide 'pratik-mode)

;;; pratik-mode.el ends here
