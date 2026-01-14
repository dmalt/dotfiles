return {
  '3rd/image.nvim',
  ft = { 'markdown', 'norg' },
  opts = {
    backend = 'kitty', -- Ghostty supports kitty protocol
    integrations = {
      markdown = {
        enabled = true,
        clear_in_insert_mode = false,
        only_render_image_at_cursor = false,
        filetypes = { 'markdown' },
        resolve_image_path = function(document_path, image_path, fallback)
          -- Handle Obsidian wiki-style links by checking attachments folder
          local vault_dir = vim.fn.expand '~/Documents/notes/'
          local attachments_dir = vault_dir .. 'Files/'
          local full_path = attachments_dir .. image_path
          if vim.fn.filereadable(full_path) == 1 then
            return full_path
          end
          return fallback(document_path, image_path)
        end,
      },
    },
    max_width = 100,
    max_height = 30,
    max_height_window_percentage = 50,
    max_width_window_percentage = nil,
  },
}
