-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- import your plugins
    { import = "plugins" },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})

-- タブを何文字の空白に変換するか
vim.opt.tabstop=4
-- 自動インデント時に入力する空白の数
vim.opt.shiftwidth=4
-- タブ入力を空白に変換
vim.opt.expandtab=true
-- 画面を縦分割する際に右に開く
vim.opt.splitright=true
-- 画面を横分割する際に下に開く
vim.opt.splitbelow=true
-- VIMの内部エンコードをUTF-8とする
vim.opt.encoding="UTF-8"
-- バックアップファイルを作らない
vim.opt.backup=false
-- スワップファイルを作らない
vim.opt.swapfile=false
-- 編集中のファイルが変更されたら自動で読み直す
vim.opt.autoread=true
-- バッファが編集中でもその他のファイルを開けるように
vim.opt.hidden=true
-- 入力中のコマンドをステータスに表示する
vim.opt.showcmd=true
-- クリップボードの共有
vim.opt.clipboard:append("unnamed")
-- クリップボードをシステムのものと共有
vim.opt.clipboard = "unnamedplus"
-- マウス操作を有効化
vim.opt.mouse = ""
-- マウス選択時にビジュアルモードに入らない
vim.api.nvim_set_option("mousemodel", "extend")
-- バックスペースの挙動を通常と同じにする
vim.opt.backspace="indent,eol,start"


-- 見た目系
-- 行番号を表示
vim.opt.number=true
-- 現在の行を強調表示
vim.opt.cursorline=true
-- 行末の1文字先までカーソルを移動できるように
vim.opt.virtualedit="onemore"
-- インデントはスマートインデント
vim.opt.smartindent=true
-- 改行時にインデントを保持する
vim.opt.autoindent=true
-- ビープ音を可視化
vim.opt.visualbell=true
-- 括弧入力時の対応する括弧を表示
vim.opt.showmatch=true
-- ステータスラインを常に表示
vim.opt.laststatus=2
-- ファイル名を表示
vim.opt.statusline="%f"
-- コマンドラインの補完
wildmode={"list", "longest"}
-- 保存されていない場合に確認する
vim.opt.confirm=true
-- 折り返し時に表示行単位での移動できるようにする
vim.keymap.set("n", "j", "gj", { noremap = true })
vim.keymap.set("n", "k", "gk", { noremap = true })

-- 検索系
-- 検索文字列が小文字の場合は大文字小文字を区別なく検索する
vim.opt.ignorecase=true
-- 検索文字列に大文字が含まれている場合は区別して検索する
vim.opt.smartcase = true
-- 検索文字列入力時に順次対象文字列にヒットさせる
vim.opt.incsearch=true
-- 検索時に最後まで行ったら最初に戻る
vim.opt.wrapscan=true
-- ESC連打でハイライト解除
vim.keymap.set("n", "<Esc><Esc>", ":nohlsearch<CR><Esc>", { silent = true })
vim.api.nvim_set_keymap('n', '<Esc><Esc>', ':<C-u>set nohlsearch!<CR>', { noremap = true, silent = true })
-- 検索語をハイライト表示
vim.opt.hlsearch=true
vim.opt.mouse:remove("-a")

vim.opt.cmdheight=2

-- You will have bad experience for diagnostic messages when it's default 4000.
vim.opt.updatetime=300

-- don't give |ins-completion-menu| messages.
vim.opt.shortmess:append("C")

-- always show signcolumns
vim.opt.signcolumn="yes"
