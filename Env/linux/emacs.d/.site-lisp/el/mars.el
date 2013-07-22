;; This buffer is for notes you don't want to save, and for Lisp evaluation.
;; If you want to create a file, visit that file with C-x C-f,
;; then enter the text in that file's own buffer.

(defun open-bug (number)
  "Open the bug in the bugzilla."
  (interactive "sBug number: ")
  (setq bug-url "https://cig-bugzilla.isus.emc.com/show_bug.cgi?id=")
  (browse-url
   (concat bug-url number)))


(defun google-it (search-string)
  "Search for SEARCH-STRING on google."
  (interactive "sSearch for: ")
  (browse-url (concat "http://www.google.com/search?client=emacs&q="
                      (url-hexify-string
                       (encode-coding-string search-string 'utf-8)))))

(defun open-greader ()
  "Open google reader"
  (interactive)
  (browse-url "http://reader.google.com/"))

(defun open-gui-idea ()
  "Open the gui inbox which used to collect gui idea"
  (interactive)
  (browse-url "https://cig-wiki.isus.emc.com/mediawiki/index.php?title=GUI_issue_collect_Inbox&action=edit"))
