local status_ok, spectre = pcall(require, "spectre")
if not status_ok then
  return
end

spectre.setup {
  line_sep_start = '',
  result_padding = '│  ',
  line_sep = '',
  default = {
    find = {
      cmd = 'rg',
      options = {}
    }
  }
}
