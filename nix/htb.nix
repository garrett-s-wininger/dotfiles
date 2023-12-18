with (import <nixpkgs> {});
mkShell {
    buildInputs = [
        awscli2
        evil-winrm
        firefox
        gobuster
        inetutils
        john
        mysql
        netcat
        nmap
        openvpn
        redis
        responder
        samba
    ];
}
