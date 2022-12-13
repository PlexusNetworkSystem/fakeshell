#!/usr/bin/bash
source $dir/modules/system/shells/func.sharpshell.sh
echo -e "${yellow}sharpshell By Plexus Network System.${green}
Temel c - cpp komutlarını destekler.
${tp}Önişlemci komutları, Sınıflar ve Nesneler, yapı komutları ${red}DESTEKLENMEZ.${tp}
Özel komutlar.
└─╼${cyan}?help   ${tp}> ${blue}yardım menüsü${tp}
└─╼${cyan}?info   ${tp}> ${blue}son ana kadar girilen kodları gösterir.${tp}
└─╼${cyan}?clear  ${tp}> ${blue}girilen bütün komutları siler.${tp}
└─╼${cyan}?edit   ${tp}> ${blue}girilen komutları düzenlemeye yarar. Kaydet(CTRL + S), Çık(CTRL + X)${tp}
└─╼${cyan}?run    ${tp}> ${blue}komutları çalıştır.${tp}
└─╼${cyan}?exit   ${tp}> ${blue}sharpshell'den çıkış yap.${tp}
└─╼${cyan}?cls    ${tp}> ${blue}ekranı temizler.${tp}
└─╼${cyan}?export ${tp}> ${blue}kodu dışarı aktarır.${tp}
└─╼${cyan}?inc    ${tp}> ${blue}kütüphane eklemeye yarar.${tp}
└─╼${cyan}?prm    ${tp}> ${blue}kodun çalıştırılması içi kullanılacak parametreleri beliriler.${tp}"

while read -e -p "$(echo -ne "${green}(${IPurple}sharpshell${green})${blue}>>>${cyan}")" sharpshell ; do
  [[ -f $dir/music/open-song.mp3 ]] && play $dir/music/shell_sound.mp3 &> /dev/null &
  [[ $sharpshell = "?help" ]] && control=1 && help_sharpshell
  [[ $sharpshell = "?exit" ]] && control=1 && echo -e "${red}exiting..." && break
  [[ $sharpshell =~ "?inc" ]] && control=1 && add_freamwork_sharpshell "${sharpshell#*: *}"
  [[ $sharpshell =~ "?prm" ]] && control=1 && add_parameters_sharpshell "${sharpshell#*: *}"
  [[ $sharpshell =~ "#include" ]] && control=1 && add_freamwork_sharpshell "${sharpshell#*include *}"
  [[ $sharpshell = "?export" ]] && control=1 && echo -e "${green}exporting..." && export_sharpshell
  [[ $sharpshell = "?info" ]] && control=1 && info_sharpshell
  [[ $sharpshell =~ "?clear" ]] && control=1 && clear_sharpshell "${sharpshell#*: *}"
  [[ $sharpshell = "?run" ]] && control=1 && echo -e "${green}Yorumlanıyor...${yellow}" && run_sharpshell
  [[ $sharpshell =~ "?edit" ]] && control=1 && edit_sharpshell "${sharpshell#*: *}"
  [[ $sharpshell = "?cls" ]] && control=1 && clear && banner
  [[ "$control" != "1" ]] && echo -e "$sharpshell" >> /opt/Plexus.Network.Apps/commands.sharpshell.h
  control=0
done
[[ -f /opt/Plexus.Network.Apps/commands.sharpshell.cpp ]] && rm /opt/Plexus.Network.Apps/commands.sharpshell.cpp
#Created By @ABRA
