# Modus Operandi Theme

set-option -g status-position "top"
set-option -g status-left-length 60
set-option -g status-style bg=#c8c8c8,fg=#0a0a0a
set-option -g status-left '#[bg=#006800,fg=#ffffff]  #S #[bg=#c8c8c8,fg=#0a0a0a,bold]   '
set-option -g status-right ' #[bg=#c8c8c8,fg=#0a0a0a,bold] %H:%M  #[bg=#c8c8c8,fg=#0a0a0a,bold]#{?client_prefix,,  T }#[bg=#0031a9,fg=#f2f2f2,bold]#{?client_prefix,  T ,}'
set-option -g window-status-format ' #I:#W '
set-option -g window-status-current-format '#[bg=#0031a9,fg=#f2f2f2] #I:#W#{?window_zoomed_flag,  , }'
