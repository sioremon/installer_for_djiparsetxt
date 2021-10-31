case $SHELL in 
    "/bin/bash")
        chmod 755 bash.sh
        ./linux_bash.sh
    ;;
    "/bin/zsh")
        chmod 755 zsh.sh
        ./linux_zsh.sh
        source ~/.zshrc
    ;;
esac
