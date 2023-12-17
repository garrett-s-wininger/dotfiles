with (import <nixpkgs> {});
mkShell {
    buildInputs = [
        firefox
        gobuster
        inetutils
        mysql
        nmap
        redis
        samba
    ];
}
