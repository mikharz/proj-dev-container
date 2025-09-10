FROM mcr.microsoft.com/devcontainers/php:8.4
RUN apt update && apt install -y \
    fzf \
    vim \
    vim-fugitive \
    && apt clean
USER vscode
RUN echo "eval \"\$(fzf --bash)\"" >> ~/.bashrc && \
    echo "eval \"\$(fzf --zsh)\"" >> ~/.zshrc