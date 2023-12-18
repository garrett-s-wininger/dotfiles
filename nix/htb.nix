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
        redis
        responder
        samba
    ];
}
