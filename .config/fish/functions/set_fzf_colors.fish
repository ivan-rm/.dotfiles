# Set fzf colors
# Sonokai color profile
function set_fzf_colors

    set -gx FZF_DEFAULT_OPTS " \
--color=fg:#d0d0d0,fg+:#d0d0d0,bg:#2c2e34,bg+:#262626 \
--color=hl:#ff6077,hl+:#9ed072,info:#7f8490,marker:#a7df78 \
--color=prompt:#85d3f2,spinner:#ba9cf3,pointer:#ff6077,header:#e7c664 \
--color=border:#262626,label:#aeaeae,query:#e2e2e3 \
--multi"
end
