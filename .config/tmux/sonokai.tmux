set -g status-left-style "none"
set -g message-command-style "fg=#e2e2e3,bg=#414550"
set -g status-right-style "none"
set -g pane-active-border-style "fg=#85d3f2"
set -g status-style "none,bg=#33353f"
set -g message-style "fg=#e7c665,bg=#414550"
set -g pane-border-style "fg=#414550"
setw -g window-status-activity-style "none,fg=#85d3f2,bg=#33353f"
setw -g window-status-separator ""
setw -g window-status-style "none,fg=#e2e2e3,bg=#33353f"
set -g status-left "#[fg=#2c2e34,bg=#9ecd6f, bold] #S "
set -g status-right "#[fg=#e2e2e3,bg=#414550] %R #[fg=#e2e2e3,bg=#33353f, bold] @#H "
setw -g window-status-format " #[fg=#e2e2e3,bg=#33353f] #I: #W "
setw -g window-status-current-format " #[fg=#85d3f2#,bg=#414550, bold] #I: #W#F "
