aunmenu PopUp

vnoremenu PopUp.Cut                         "+x
vnoremenu PopUp.Copy                        "+y
vnoremenu PopUp.Paste                       "+P
vnoremenu PopUp.Delete                      "_x
vnoremenu PopUp.Select\ All                 gg0oG$

nnoremenu PopUp.Help                        <Cmd>lua vim.lsp.buf.hover()<CR>
nnoremenu PopUp.Rename                      <Cmd>lua vim.lsp.buf.rename()<CR> 
nnoremenu PopUp.References                  <Cmd>Telescope lsp_references<CR>
nnoremenu PopUp.Definition                  <Cmd>Telescope lsp_definitions<CR>
nnoremenu PopUp.Format                      <Cmd>lua vim.lsp.buf.format({ async = true })<CR>
nnoremenu PopUp.Split\ Right                <Cmd>vsplit<CR>
nnoremenu PopUp.Select\ All                 ggVG
nnoremenu PopUp.Paste                       "+gP

inoremenu PopUp.Help                        <Cmd>lua vim.lsp.buf.hover()<CR>
inoremenu PopUp.Rename                      <Cmd>lua vim.lsp.buf.rename()<CR> 
inoremenu PopUp.References                  <Cmd>Telescope lsp_references<CR>
inoremenu PopUp.Definition                  <Cmd>Telescope lsp_definitions<CR>
inoremenu PopUp.Format                      <Cmd>lua vim.lsp.buf.format({ async = true })<CR>
inoremenu PopUp.Split\ Right                <Cmd>vsplit<CR>
inoremenu PopUp.Select\ All                 <C-Home><C-O>VG
inoremenu PopUp.Paste                       "+gP
