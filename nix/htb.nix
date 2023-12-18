with (import <nixpkgs> {});
mkShell {
    buildInputs = [
        evil-winrm
        firefox
        gobuster
        inetutils
        john
        mysql
        nmap
        openvpn
        redis
        responder
        samba
    ];
}
