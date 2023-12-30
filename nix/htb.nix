with (import <nixpkgs> {});
mkShell {
    buildInputs = [
        awscli2
        evil-winrm
        feroxbuster
        ffuf
        firefox
        gobuster
        hashcat
        inetutils
        john
        metasploit
        mysql
        netcat
        nmap
        openvpn
        redis
        responder
        samba
        sqlite
        sqlmap
        tshark
        wfuzz
        wireshark
    ];
}
