case $SHELL in 
    "/bin/bash")
        chmod 755 bash.sh
        ./mac_bash.sh
        source ~/.bash_profile
    ;;
    "/bin/zsh")
        chmod 755 zsh.sh
        ./mac_zsh.sh
        source ~/.zshrc
    ;;
esac
