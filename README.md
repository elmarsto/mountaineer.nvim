# A Telescope Neovim plugin for integration with Himalaya email client

## What and Why

 - [Himalaya](https://github.com/soywod/himalaya) is small Rust CLI program for reading your email, including, notably, IMAP email. 
 - [Telescope](https://github.com/nvim-telescope/telsecope.nvim) is a plugin for [Neovim](https://neovim.io) that allows you to browse lists of things within Neovim (hereinafter, `nvim`.)
 - And thus Mountaineer.nvim is a Telescope extension that allows you to control `himalaya` from within `nvim` via `:Telescope`.

After installing, you can `:Telescope mountaineer` to list your inbox and inspect the contents of individual messages.

Currently, that's all you can do. (I wrote this package in four hours, today, Jun 9, 2023, and that included the time taken to learn the relevant parts of Telescope, Neovim, and Lua.)

Soon, though, you will be able to:

 - Open emails you have inspected in the Telescope preview as regular `nvim` buffers
 - Reply to and forward emails listed in Telescope (which again, will open as regular `nvim` buffers)
 - Open Inboxes on other accounts (not just the default account, as `himalaya` correctly allows you to maintain multiple configs)
 - Open IMAP folders other than the Inbox, e.g. 'Drafts', 'Trash', etc. 
 - Move messages between IMAP folders
 - View your inbox in beautiful colour, just like `himalaya` permits when used on the command line


## Limitations, current and future

 - This is a very raw first cut. Don't use this in production. I literally woke up this morning and said, "Hey, what if I learned more Lua and did a telescope extension for `himalaya` in `nvim`". I had [Learn Lua in 15 Minutes](https://tylerneylon.com/a/learn-lua/) open in a tab the whole time. It's a cute little language.
 - The code is unoptimized and thus slow.
 - Even if the code of Mountaineer.nvim were optimized, `himalaya` itself sets up and tears down an IMAP connection every time it executes (when used for IMAP; it can also be used for Maildir and local mailspool, which is undoubtedly faster.) It would therefore be cool if `himalaya` could persist as a daemon and be controlled via a socket. I am learning Rust, though, so it is not inconceivable that I could contribute this feature upstream to `himalaya`, and/or maintain a fork of the project. 


