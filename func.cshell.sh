#cshell
! [[ "$(grep -w "<iostream>" /opt/Plexus.Network.Apps/frameworks.cshell.h)" =~ "<iostream>" ]] && echo -e "Not detected: <iostream>, adding" && echo -e "#include <iostream>" >> /opt/Plexus.Network.Apps/frameworks.cshell.h
! [[ "$(grep -w "<string>" /opt/Plexus.Network.Apps/frameworks.cshell.h)" =~ "<string>" ]] && echo -e "Not detected: <string>, adding" && echo -e "#include <string>" >> /opt/Plexus.Network.Apps/frameworks.cshell.h
! [[ -f /opt/Plexus.Network.Apps/params.cshell.h ]] && touch /opt/Plexus.Network.Apps/params.cshell.h

help_cshell() {
  echo -e "${yellow}CShell By Plexus Network System.${green}
  Temel c - cpp komutlarını destekler.
  ${tp}Kütüphane Ekleme, Önişlemci komutları, Sınıflar ve Nesneler, yapı komutları ${red}DESTEKLENMEZ.${tp}
  Özel komutlar.
  └─╼${cyan}?help   ${tp}> ${blue} yardım menüsü${tp}
  └─╼${cyan}?info   ${tp}> ${blue} son ana kadar girilen kodları gösterir.${tp}
  └─╼${cyan}?clear ${yellow}(framework/params/code/all)${tp}
      └>${blue} girilen bütün komutları siler.${tp}
  └─╼${cyan}?edit: ${yellow}(framework/params/code)${tp}
      └>${blue} girilen komutları düzenlemeye yarar. Kaydet(CTRL + S), Çık(CTRL + X)${tp}
  └─╼${cyan}?run    ${tp}> ${blue} komutları çalıştır.${tp}
  └─╼${cyan}?exit   ${tp}> ${blue} cshell'den çıkış yap.${tp}
  └─╼${cyan}?cls    ${tp}> ${blue} ekranı temizler.${tp}
  └─╼${cyan}?export ${tp}> ${blue} kodu dışarı aktarır.${tp}
  └─╼${cyan}?inc:  ${yellow}<framework>${tp}
      └>${blue} Kütüphane eklemeye yarar.${tp}
  └─╼${cyan}?prm:  ${yellow}<parameters>${tp}
      └>${blue} kodun çalıştırılması içi kullanılacak parametreleri beliriler.${tp}"
}

edit_cshell() {
if [[ "$1" = "framework" ]]; then
   nano /opt/Plexus.Network.Apps/frameworks.cshell.h
  :
elif [[ "$1" = "params" ]]; then
    nano /opt/Plexus.Network.Apps/params.cshell.h
  :
elif [[ "$1" = "code" ]]; then
    nano /opt/Plexus.Network.Apps/commands.cshell.h
  :
else
    echo -e "${red}False parameter: ${blue}$1${tp}.\n\tUsage: ${green}?edit: ${tp}(${yellow}framework${tp}/${yellow}params${tp}/${yellow}code${tp})"
  :
fi
}


info_cshell() {
if [[ "$(cat /opt/Plexus.Network.Apps/params.cshell.h)" =~ "-" ]]; then
echo -ne "
${tp}______________/${purple}parameters${blue}.cshell${tp}\______________
${red}$(cat /opt/Plexus.Network.Apps/params.cshell.h)
${tp}¯¯¯¯¯¯¯¯¯¯¯¯¯¯\\\\${purple}frameworks${blue}.cshell${tp}/¯¯¯¯¯¯¯¯¯¯¯¯¯¯
                ${cyan}---------------
"
fi
if [[ "$(cat /opt/Plexus.Network.Apps/frameworks.cshell.h)" =~ "#" ]]; then
echo -ne "\
${tp}______________/${purple}frameworks${blue}.cshell${tp}\______________
${green}$(cat /opt/Plexus.Network.Apps/frameworks.cshell.h)
${tp}¯¯¯¯¯¯¯¯¯¯¯¯¯¯\\\\${purple}frameworks${blue}.cshell${tp}/¯¯¯¯¯¯¯¯¯¯¯¯¯¯
                ${cyan}---------------
"
fi
if [[ "$(cat /opt/Plexus.Network.Apps/commands.cshell.h)" != "" ]]; then
echo -ne "\
${tp}_______________/${purple}commands${blue}.cshell${tp}\_______________
${yellow}$(cat /opt/Plexus.Network.Apps/commands.cshell.h)
${tp}¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯\\\\${purple}commands${blue}.cshell${tp}/¯¯¯¯¯¯¯¯¯¯¯¯¯¯
"
fi
}
add_freamwork_cshell() {
    if [[ "$(grep -w "$1" /opt/Plexus.Network.Apps/frameworks.cshell.h)" =~ "$1" ]]; then
        echo -e "${blue}$1 ${tp}is still ${green}declared."
      :
    elif [[ "$1" =~ "<" && "$1" =~ ">" ]] || [[ "$1" =~ "\"" && "$1" =~ "\"" ]]; then
      echo -e "#include $1" >> /opt/Plexus.Network.Apps/frameworks.cshell.h
      :
    else
        echo -e "${red}false declaration: ${blue}$1${tp}"
      :
    fi

}
run_cshell() {
  ! [[ "$(grep -w "<iostream>" /opt/Plexus.Network.Apps/frameworks.cshell.h)" =~ "<iostream>" ]] && echo -e "Not detected: <iostream>, adding" && echo -e "#include <iostream>" >> /opt/Plexus.Network.Apps/frameworks.cshell.h
  ! [[ "$(grep -w "<string>" /opt/Plexus.Network.Apps/frameworks.cshell.h)" =~ "<string>" ]] && echo -e "Not detected: <string>, adding" && echo -e "#include <string>" >> /opt/Plexus.Network.Apps/frameworks.cshell.h
  echo -e "
  //prm: $(cat /opt/Plexus.Network.Apps/params.cshell.h)
  $(cat /opt/Plexus.Network.Apps/frameworks.cshell.h 2> /dev/null)
  using namespace std;
  int main(int argc, char * argv[])
  {
    $(cat /opt/Plexus.Network.Apps/commands.cshell.h 2> /dev/null)
    return 0;
  }
  " > /opt/Plexus.Network.Apps/cshell.cpp
  run /opt/Plexus.Network.Apps/cshell.cpp
}

export_cshell() {
  ! [[ "$(grep -w "<iostream>" /opt/Plexus.Network.Apps/frameworks.cshell.h)" =~ "<iostream>" ]] && echo -e "Not detected: <iostream>, adding" && echo -e "#include <iostream>" >> /opt/Plexus.Network.Apps/frameworks.cshell.h
  ! [[ "$(grep -w "<string>" /opt/Plexus.Network.Apps/frameworks.cshell.h)" =~ "<string>" ]] && echo -e "Not detected: <string>, adding" && echo -e "#include <string>" >> /opt/Plexus.Network.Apps/frameworks.cshell.h
  echo -e "
  //prm: $(cat /opt/Plexus.Network.Apps/params.cshell.h)
  $(cat /opt/Plexus.Network.Apps/frameworks.cshell.h 2> /dev/null)
  using namespace std;
  int main(int argc, char * argv[])
  {
    $(cat /opt/Plexus.Network.Apps/commands.cshell.h 2> /dev/null)
    return 0;
  }
  " > /home/$USER/cshell.cpp
[[ -f /home/$USER/cshell.cpp ]] &&  echo -e "${green}Exported Successfully. /home/$USER/cshell.cpp${tp}" && notify-send --app-name=Plexus\ Platinum\ Asistan "C Shell" "Code is exporting successfully" --icon="/usr/share/Plexus.Network/Asistan/pictures/PackageInstall.png"
}
add_parameters_cshell() {
  if [[ "$(grep -w "${1#*-*}" /opt/Plexus.Network.Apps/params.cshell.h)" =~ "$1" ]]; then
      echo -e "${blue}$1 ${tp}is still ${green}declared."
    :
  elif [[ "$1" =~ ^"-" ]]; then
    echo -ne "$1" >> /opt/Plexus.Network.Apps/params.cshell.h
    :
  else
      echo -e "${red}false declaration: ${blue}$1${tp}"
    :
  fi
}
add_freamwork_cshell() {
    if [[ "$(grep -w "$1" /opt/Plexus.Network.Apps/frameworks.cshell.h)" =~ "$1" ]]; then
        echo -e "${blue}$1 ${tp}is still ${green}declared."
      :
    elif [[ "$1" =~ "<" && "$1" =~ ">" ]] || [[ "$1" =~ "\"" && "$1" =~ "\"" ]]; then
      echo -e "#include $1" >> /opt/Plexus.Network.Apps/frameworks.cshell.h
      :
    else
        echo -e "${red}false declaration: ${blue}$1${tp}"
      :
    fi

}
clear_cshell() {
  if [[ "$1" = "framework" ]]; then
     echo "" > /opt/Plexus.Network.Apps/frameworks.cshell.h
     echo -e "${green}Frameworks is cleared."
    :
  elif [[ "$1" = "params" ]]; then
      echo "" > /opt/Plexus.Network.Apps/params.cshell.h
      echo -e "${green}Parameters is cleared."
    :
  elif [[ "$1" = "code" ]]; then
      echo "" > /opt/Plexus.Network.Apps/commands.cshell.h
      echo -e "${green}Codes is cleared."
    :
  elif [[ "$1" = "all" ]]; then
      echo "" > /opt/Plexus.Network.Apps/frameworks.cshell.h
      echo "" > /opt/Plexus.Network.Apps/params.cshell.h
      echo "" > /opt/Plexus.Network.Apps/commands.cshell.h
      echo -e "${green}Memory is cleared."
    :
  else
      echo -e "${red}False parameter: ${blue}$1${tp}.\n\tUsage: ${green}?clear: ${tp}(${yellow}framework${tp}/${yellow}params${tp}/${yellow}code${tp}/${yellow}all${tp})"
    :
  fi
}
#cshell
