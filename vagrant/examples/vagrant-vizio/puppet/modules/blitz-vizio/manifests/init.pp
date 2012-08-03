class blitz-vizio {
    class{'blitz-vizio::apt-get-update': stage => first }
    class{'blitz-vizio::configuration-actions': stage => last }
}
