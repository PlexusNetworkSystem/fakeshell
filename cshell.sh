#!/usr/bin/bash
echo -e "${yellow}CShell By Plexus Network System.${green}
Temel c - cpp komutlarını destekler.
${tp}Kütüphane Ekleme, Önişlemci komutları, Sınıflar ve Nesneler, yapı komutları ${red}DESTEKLENMEZ.${tp}
Özel komutlar.
└─╼?help  > yardım menüsü
└─╼?info  > son ana kadar girilen kodları gösterir.
└─╼?clear > girilen bütün komutları siler.
└─╼?edit  > girilen komutları düzenlemeye yarar. Kaydet(CTRL + S), Çık(CTRL + X)
└─╼?run   > komutları çalıştır.
└─╼?exit  > cshell'den çıkış yap.
└─╼?cls   > ekranı temizler."

while read -e -p "$(echo -ne "${green}(${cyan}cshell${green})${blue}>>>${yellow}")" cshell ; do
  [[ $cshell = "?help" ]] && echo -e "${yellow}CShell By Plexus Network System.${green}
  Temel c - cpp komutlarını destekler.
  ${tp}Kütüphane Ekleme, Önişlemci komutları, Sınıflar ve Nesneler, yapı komutları ${red}DESTEKLENMEZ.${tp}
  Özel komutlar.
  └─╼?help  > yardım menüsü
  └─╼?info  > son ana kadar girilen kodları gösterir.
  └─╼?clear > girilen bütün komutları siler.
  └─╼?edit  > girilen komutları düzenlemeye yarar. Kaydet(CTRL + S), Çık(CTRL + X)
  └─╼?run   > komutları çalıştır.
  └─╼?exit  > cshell'den çıkış yap.
  └─╼?cls   > ekranı temizler."
  [[ $cshell = "?exit" ]] && echo -e "${red}exiting..." && break
  [[ $cshell = "?info" ]] && cat /opt/Plexus.Network.Apps/cshell.h
  [[ $cshell = "?clear" ]] && echo "" > /opt/Plexus.Network.Apps/cshell.h  && echo -e "${green}Memory is cleared."
  [[ $cshell = "?run" ]] && echo -e "${green}Yorumlanıyor...${cyan}" && run_cshell
  [[ $cshell = "?edit" ]] && nano /opt/Plexus.Network.Apps/cshell.h
  [[ $cshell = "?cls" ]] && clear && banner
  [[ $cshell != "?help" && $cshell != "?cls" && $cshell != "?edit" && $cshell != "?run" && $cshell != "?info" && $cshell != "?clear" ]] && echo -e "$cshell" >> /opt/Plexus.Network.Apps/cshell.h
done
[[ -f /opt/Plexus.Network.Apps/cshell.cpp ]] && rm /opt/Plexus.Network.Apps/cshell.cpp
