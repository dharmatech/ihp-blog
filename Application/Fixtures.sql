

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;


SET SESSION AUTHORIZATION DEFAULT;

ALTER TABLE public.posts DISABLE TRIGGER ALL;

INSERT INTO public.posts (id, title, body, created_at) VALUES ('04112b5b-bf81-4eff-a770-fc9959d5931f', '2 Lisp Data Types', 'A Lisp “object” is a piece of data used and manipulated by Lisp programs.  For our purposes, a “type” or “data type” is a set of possible objects.     Every object belongs to at least one type.  Objects of the same type have similar structures and may usually be used in the same contexts. Types can overlap, and objects can belong to two or more types. Consequently, we can ask whether an object belongs to a particular type, but not for _the_ type of an object.', '2021-05-17 11:43:39.029951-07');
INSERT INTO public.posts (id, title, body, created_at) VALUES ('aa4718de-98c0-4cc3-9212-f7a03c10be9b', '', '', '2021-05-17 11:43:39.031223-07');
INSERT INTO public.posts (id, title, body, created_at) VALUES ('64f5239d-b2a9-4dae-bc3f-1f7ff5af54b0', '', '', '2021-05-17 11:43:39.032429-07');
INSERT INTO public.posts (id, title, body, created_at) VALUES ('c1a233c9-04cf-48ab-8d64-84ac4264a99f', '', 'abc', '2021-05-17 11:43:39.033663-07');
INSERT INTO public.posts (id, title, body, created_at) VALUES ('94731bd3-665b-4e44-87f5-4d07aa726814', 'abc', '', '2021-05-17 11:43:39.034884-07');
INSERT INTO public.posts (id, title, body, created_at) VALUES ('98d20954-4609-4f20-acda-ac6f2ac6d953', '1 Introduction', 'Most of the *GNU Emacs* text editor is written in the programming language called `Emacs Lisp`.  You can write new code in Emacs Lisp and install it as an extension to the editor.  However, Emacs Lisp is more than a mere extension language; it is a full computer programming language in its own right.  You can use it as you would any other programming language.     Because Emacs Lisp is designed for use in an editor, it has special features for scanning and parsing text as well as features for handling files, buffers, displays, subprocesses, and so on.  Emacs Lisp is closely integrated with the editing facilities; thus, editing commands are functions that can also conveniently be called from Lisp programs, and parameters for customization are ordinary Lisp variables.', '2021-05-17 11:43:39.028356-07');
INSERT INTO public.posts (id, title, body, created_at) VALUES ('90054e8c-0a88-4663-b221-882a4dec6c32', 'calc-create-buffer', '```
(defun calc-create-buffer ()
  "Create and initialize a buffer for the Calculator."
  (set-buffer (get-buffer-create "*Calculator*"))
  (or (derived-mode-p ''calc-mode)
      (calc-mode))
  (setq max-lisp-eval-depth (max max-lisp-eval-depth 1000))
  (when calc-always-load-extensions
    (require ''calc-ext))
  (when calc-language
    (require ''calc-ext)
    (calc-set-language calc-language calc-language-option t)))
```', '2021-05-17 21:05:08.957032-07');
INSERT INTO public.posts (id, title, body, created_at) VALUES ('9007ddce-eac0-4400-9c30-4270fe65e916', 'abc', '```csharp
123
```', '2021-05-17 21:17:10.643027-07');


ALTER TABLE public.posts ENABLE TRIGGER ALL;


