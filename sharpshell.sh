#!/usr/bin/bash
echo -e "${yellow}SharpShell By Plexus Network System.${green}
Temel cs komutlarını destekler.
${tp}Kütüphane Ekleme, Önişlemci komutları, Sınıflar ve Nesneler, yapı komutları ${red}DESTEKLENMEZ.${tp}
Özel komutlar.
└─╼?help  > yardım menüsü
└─╼?info  > son ana kadar girilen kodları gösterir.
└─╼?clear > girilen bütün komutları siler.
└─╼?edit  > girilen komutları düzenlemeye yarar. Kaydet(CTRL + S), Çık(CTRL + X)
└─╼?run   > komutları çalıştır.
└─╼?exit  > sharpshell'den çıkış yap.
└─╼?cls   > ekranı temizler."

while read -e -p "$(echo -ne "${green}(${cyan}sharpshell${green})${blue}>>>${yellow}")" sharpshell ; do
  [[ $sharpshell = "?help" ]] && echo -e "${yellow}SharpShell By Plexus Network System.${green}
  Temel cs komutlarını destekler.
  ${tp}Kütüphane Ekleme, Önişlemci komutları, Sınıflar ve Nesneler, yapı komutları ${red}DESTEKLENMEZ.${tp}
  Özel komutlar.
  └─╼?help  > yardım menüsü
  └─╼?info  > son ana kadar girilen kodları gösterir.
  └─╼?clear > girilen bütün komutları siler.
  └─╼?edit  > girilen komutları düzenlemeye yarar. Kaydet(CTRL + S), Çık(CTRL + X)
  └─╼?run   > komutları çalıştır.
  └─╼?exit  > sharpshell'den çıkış yap.
  └─╼?cls   > ekranı temizler."
  [[ $sharpshell = "?exit" ]] && echo -e "${red}exiting..." && break
  [[ $sharpshell = "?info" ]] && cat /opt/Plexus.Network.Apps/sharpshell.h
  [[ $sharpshell = "?clear" ]] && echo "" > /opt/Plexus.Network.Apps/sharpshell.h  && echo -e "${green}Memory is cleared."
  [[ $sharpshell = "?run" ]] && echo -e "${green}Yorumlanıyor...${cyan}" && run_sharpshell
  [[ $sharpshell = "?edit" ]] && nano /opt/Plexus.Network.Apps/sharpshell.h
  [[ $sharpshell = "?cls" ]] && clear && banner
  [[ $sharpshell != "?help" && $sharpshell != "?cls" && $sharpshell != "?edit" && $sharpshell != "?run" && $sharpshell != "?info" && $sharpshell != "?clear" ]] && echo -e "$sharpshell" >> /opt/Plexus.Network.Apps/sharpshell.h
done
[[ -f /opt/Plexus.Network.Apps/sharpshell.cs ]] && rm /opt/Plexus.Network.Apps/sharpshell.cs
