with (import <nixpkgs> {});
mkShell {
    buildInputs = [
        awscli2
        evil-winrm
        firefox
        gobuster
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
    ];
}
