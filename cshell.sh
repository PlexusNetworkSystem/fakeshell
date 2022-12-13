#!/usr/bin/bash
source $dir/modules/system/shells/func.cshell.sh
echo -e "${yellow}CShell By Plexus Network System.${green}
Temel c - cpp komutlarını destekler.
${tp}Önişlemci komutları, Sınıflar ve Nesneler, yapı komutları ${red}DESTEKLENMEZ.${tp}
Özel komutlar.
└─╼${cyan}?help   ${tp}> ${blue}yardım menüsü${tp}
└─╼${cyan}?info   ${tp}> ${blue}son ana kadar girilen kodları gösterir.${tp}
└─╼${cyan}?clear  ${tp}> ${blue}girilen bütün komutları siler.${tp}
└─╼${cyan}?edit   ${tp}> ${blue}girilen komutları düzenlemeye yarar. Kaydet(CTRL + S), Çık(CTRL + X)${tp}
└─╼${cyan}?run    ${tp}> ${blue}komutları çalıştır.${tp}
└─╼${cyan}?exit   ${tp}> ${blue}cshell'den çıkış yap.${tp}
└─╼${cyan}?cls    ${tp}> ${blue}ekranı temizler.${tp}
└─╼${cyan}?export ${tp}> ${blue}kodu dışarı aktarır.${tp}
└─╼${cyan}?inc    ${tp}> ${blue}kütüphane eklemeye yarar.${tp}
└─╼${cyan}?prm    ${tp}> ${blue}kodun çalıştırılması içi kullanılacak parametreleri beliriler.${tp}"

while read -e -p "$(echo -ne "${green}(${IPurple}cshell${green})${blue}>>>${cyan}")" cshell ; do
  [[ -f $dir/music/open-song.mp3 ]] && play $dir/music/shell_sound.mp3 &> /dev/null &
  [[ $cshell = "?help" ]] && control=1 && help_cshell
  [[ $cshell = "?exit" ]] && control=1 && echo -e "${red}exiting..." && break
  [[ $cshell =~ "?inc" ]] && control=1 && add_freamwork_cshell "${cshell#*: *}"
  [[ $cshell =~ "?prm" ]] && control=1 && add_parameters_cshell "${cshell#*: *}"
  [[ $cshell =~ "#include" ]] && control=1 && add_freamwork_cshell "${cshell#*include *}"
  [[ $cshell = "?export" ]] && control=1 && echo -e "${green}exporting..." && export_cshell
  [[ $cshell = "?info" ]] && control=1 && info_cshell
  [[ $cshell =~ "?clear" ]] && control=1 && clear_cshell "${cshell#*: *}"
  [[ $cshell = "?run" ]] && control=1 && echo -e "${green}Yorumlanıyor...${yellow}" && run_cshell
  [[ $cshell =~ "?edit" ]] && control=1 && edit_cshell "${cshell#*: *}"
  [[ $cshell = "?cls" ]] && control=1 && clear && banner
  [[ "$control" != "1" ]] && echo -e "$cshell" >> /opt/Plexus.Network.Apps/commands.cshell.h
  control=0
done
[[ -f /opt/Plexus.Network.Apps/commands.cshell.cpp ]] && rm /opt/Plexus.Network.Apps/commands.cshell.cpp
#Created By @ABRA
