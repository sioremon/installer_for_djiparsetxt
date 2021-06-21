case $SHELL in 
    "/bin/bash")
        chmod 755 bash.sh
        ./bash.sh
        source ~/.bash_profile
        source ~/.bashrc
    ;;
    "/bin/zsh")
        chmod 755 zsh.sh
        ./zsh.sh
        source ~/.zshrc
    ;;
esac



