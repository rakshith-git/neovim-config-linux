-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/mahn/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("i", "jj", "<Esc>", { desc = "leave insert mode" })
vim.keymap.set("n", "<leader>sv", "ggVG", { desc = "select all" })

local session_dir = os.getenv("HOME") .. "/mysessions"

function _G.save_session()
  local session_name = vim.fn.input("Enter session name: ", "", "file")
  if session_name == "" then
    return
  end -- Exit if empty string is entered
  vim.cmd("mksession!" .. session_dir .. "/" .. session_name .. ".vim")
end

-- Function to restore a session
function _G.restore_session()
  local session_name = vim.fn.input("Enter session name: ", "", "file")
  if session_name == "" then
    return
  end -- Exit if empty string is entered
  vim.cmd("source " .. session_dir .. "/" .. session_name .. ".vim")
end

-- Map keys for saving and restoring sessions
vim.api.nvim_set_keymap("n", "<Leader>qn", ":lua save_session()<CR>", { desc = "save session", noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>qs", ":lua restore_session()<CR>", { desc = "restore session", noremap = true })
