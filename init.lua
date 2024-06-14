-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("nvim-treesitter.install").compilers = { "clang" }
if vim.g.neovide then
  -- Put anything you want to happen only in Neovide here
  local alpha = function()
    return string.format("%x", math.floor((255 * vim.g.transparency) or 0.8))
  end
  vim.g.neovide_transparency = 0.9
  vim.g.transparency = 1.0
  vim.g.neovide_background_color = "#0f1117" .. alpha()
  vim.g.neovide_window_blurred = true
  vim.g.neovide_cursor_animate_in_insert_mode = true
  vim.g.neovide_cursor_vfx_mode = "pixiedust"
  vim.g.neovide_cursor_vfx_particle_density = 100.0
  vim.g.neovide_refresh_rate = 144
  vim.g.neovide_floating_shadow = false
  vim.g.neovide_floating_blur_amount_x = 0.0
  vim.g.neovide_floating_blur_amount_y = 0.0

  vim.g.neovide_scale_factor = 0.8
  local change_scale_factor = function(delta)
    vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
  end
  vim.keymap.set("n", "<C-=>", function()
    change_scale_factor(1.1)
  end)
  vim.keymap.set("n", "<C-->", function()
    change_scale_factor(1 / 1.1)
  end)
end
if vim.g.nvui then
  -- Configure through vim commands
  vim.cmd([[NvuiCmdFontFamily FiraCode Nerd Font]])
  vim.opt.guifont = "Hack Nerd Font Mono:h11"
end

function _G.compile_and_run_cpp()
  -- Get the current file name
  local file_name = vim.fn.expand("%:p:r")
  -- Compile the C++ file
  local compile_cmd = "g++ " .. file_name .. ".cpp -o " .. file_name
  -- Run the compiled program
  local run_cmd = "" .. file_name
  -- Open a new toggleterm terminal and execute the commands
  require("toggleterm").exec(compile_cmd .. " && " .. run_cmd)
end
