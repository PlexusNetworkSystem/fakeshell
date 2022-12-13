#sharpshell
#sharpshell
! [[ "$(grep -w 'using System;' /opt/Plexus.Network.Apps/frameworks.sharpshell.h)" =~ "using System;" ]] && echo -e "Not detected: using System;, adding" && echo -e "using System;" >> /opt/Plexus.Network.Apps/frameworks.sharpshell.h
! [[ -f /opt/Plexus.Network.Apps/params.sharpshell.h ]] && touch /opt/Plexus.Network.Apps/params.sharpshell.h
help_sharpshell() {
  echo -e "${yellow}sharpshell By Plexus Network System.${green}
  Temel c - cs komutlarını destekler.
  ${tp}Kütüphane Ekleme, Önişlemci komutları, Sınıflar ve Nesneler, yapı komutları ${red}DESTEKLENMEZ.${tp}
  Özel komutlar.
  └─╼${cyan}?help   ${tp}> ${blue} yardım menüsü${tp}
  └─╼${cyan}?info   ${tp}> ${blue} son ana kadar girilen kodları gösterir.${tp}
  └─╼${cyan}?clear ${yellow}(framework/params/code/all)${tp}
      └>${blue} girilen bütün komutları siler.${tp}
  └─╼${cyan}?edit: ${yellow}(framework/params/code)${tp}
      └>${blue} girilen komutları düzenlemeye yarar. Kaydet(CTRL + S), Çık(CTRL + X)${tp}
  └─╼${cyan}?run    ${tp}> ${blue} komutları çalıştır.${tp}
  └─╼${cyan}?exit   ${tp}> ${blue} sharpshell'den çıkış yap.${tp}
  └─╼${cyan}?cls    ${tp}> ${blue} ekranı temizler.${tp}
  └─╼${cyan}?export ${tp}> ${blue} kodu dışarı aktarır.${tp}
  └─╼${cyan}?inc:  ${yellow}<framework>${tp}
      └>${blue} Kütüphane eklemeye yarar.${tp}
  └─╼${cyan}?prm:  ${yellow}<parameters>${tp}
      └>${blue} kodun çalıştırılması içi kullanılacak parametreleri beliriler.${tp}"
}

edit_sharpshell() {
if [[ "$1" = "framework" ]]; then
   nano /opt/Plexus.Network.Apps/frameworks.sharpshell.h
  :
elif [[ "$1" = "params" ]]; then
    nano /opt/Plexus.Network.Apps/params.sharpshell.h
  :
elif [[ "$1" = "code" ]]; then
    nano /opt/Plexus.Network.Apps/commands.sharpshell.h
  :
else
    echo -e "${red}False parameter: ${blue}$1${tp}.\n\tUsage: ${green}?edit: ${tp}(${yellow}framework${tp}/${yellow}params${tp}/${yellow}code${tp})"
  :
fi
}


info_sharpshell() {
if [[ "$(cat /opt/Plexus.Network.Apps/params.sharpshell.h)" =~ "-" ]]; then
echo -ne "
${tp}______________/${purple}parameters${blue}.sharpshell${tp}\______________
${red}$(cat /opt/Plexus.Network.Apps/params.sharpshell.h)
${tp}¯¯¯¯¯¯¯¯¯¯¯¯¯¯\\\\${purple}frameworks${blue}.sharpshell${tp}/¯¯¯¯¯¯¯¯¯¯¯¯¯¯
                ${cyan}---------------
"
fi
if [[ "$(cat /opt/Plexus.Network.Apps/frameworks.sharpshell.h)" =~ "using" ]]; then
echo -ne "\
${tp}______________/${purple}frameworks${blue}.sharpshell${tp}\______________
${green}$(cat /opt/Plexus.Network.Apps/frameworks.sharpshell.h)
${tp}¯¯¯¯¯¯¯¯¯¯¯¯¯¯\\\\${purple}frameworks${blue}.sharpshell${tp}/¯¯¯¯¯¯¯¯¯¯¯¯¯¯
                ${cyan}---------------
"
fi
if [[ "$(cat /opt/Plexus.Network.Apps/commands.sharpshell.h)" != "" ]]; then
echo -ne "\
${tp}_______________/${purple}commands${blue}.sharpshell${tp}\_______________
${yellow}$(cat /opt/Plexus.Network.Apps/commands.sharpshell.h)
${tp}¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯\\\\${purple}commands${blue}.sharpshell${tp}/¯¯¯¯¯¯¯¯¯¯¯¯¯¯
"
fi
}
add_freamwork_sharpshell() {
    if [[ "$(grep -w "$1" /opt/Plexus.Network.Apps/frameworks.sharpshell.h)" =~ "$1" ]]; then
        echo -e "${blue}$1 ${tp}is still ${green}declared."
      :
   else
        echo -e "using $1;" >> /opt/Plexus.Network.Apps/frameworks.sharpshell.h
      :
    fi

}
run_sharpshell() {
  ! [[ "$(grep -w 'using System;' /opt/Plexus.Network.Apps/frameworks.sharpshell.h)" =~ "using System;" ]] && echo -e "Not detected: using System;, adding" && echo -e "using System;" >> /opt/Plexus.Network.Apps/frameworks.sharpshell.h
  echo -e "
  //prm: $(cat /opt/Plexus.Network.Apps/params.sharpshell.h)
  $(cat /opt/Plexus.Network.Apps/frameworks.sharpshell.h 2> /dev/null)
  namespace MainMethod
  {
      class Program
      {
          static void Main()
          {
            $(cat /opt/Plexus.Network.Apps/commands.sharpshell.h 2> /dev/null)
          }
      }
  }
  " > /opt/Plexus.Network.Apps/sharpshell.cs
  run /opt/Plexus.Network.Apps/sharpshell.cs
}



export_sharpshell() {
  ! [[ "$(grep -w 'using System;' /opt/Plexus.Network.Apps/frameworks.sharpshell.h)" =~ "using System;" ]] && echo -e "Not detected: using System;, adding" && echo -e "using System;" >> /opt/Plexus.Network.Apps/frameworks.sharpshell.h
  echo -e "
  //prm: $(cat /opt/Plexus.Network.Apps/params.sharpshell.h)
  $(cat /opt/Plexus.Network.Apps/frameworks.sharpshell.h 2> /dev/null)
  namespace MainMethod
  {
      class Program
      {
          static void Main()
          {
            $(cat /opt/Plexus.Network.Apps/commands.sharpshell.h 2> /dev/null)
          }
      }
  }
  " >> /home/$USER/sharpshell.cpp
[[ -f /home/$USER/sharpshell.cpp ]] &&  echo -e "${green}Exported Successfully. /home/$USER/sharpshell.cpp${tp}" && notify-send --app-name=Plexus\ Platinum\ Asistan "C Shell" "Code is exporting successfully" --icon="/usr/share/Plexus.Network/Asistan/pictures/PackageInstall.png"
}
add_parameters_sharpshell() {
  if [[ "$(grep -w "${1#*-*}" /opt/Plexus.Network.Apps/params.sharpshell.h)" =~ "$1" ]]; then
      echo -e "${blue}$1 ${tp}is still ${green}declared."
    :
  elif [[ "$1" =~ ^"-" ]]; then
    echo -ne "$1" >> /opt/Plexus.Network.Apps/params.sharpshell.h
    :
  else
      echo -e "${red}false declaration: ${blue}$1${tp}"
    :
  fi
}
add_freamwork_sharpshell() {
    if [[ "$(grep -w "$1" /opt/Plexus.Network.Apps/frameworks.sharpshell.h)" =~ "$1" ]]; then
        echo -e "${blue}$1 ${tp}is still ${green}declared."
      :
    elif [[ "$1" =~ "<" && "$1" =~ ">" ]] || [[ "$1" =~ "\"" && "$1" =~ "\"" ]]; then
      echo -e "#include $1" >> /opt/Plexus.Network.Apps/frameworks.sharpshell.h
      :
    else
        echo -e "${red}false declaration: ${blue}$1${tp}"
      :
    fi

}
clear_sharpshell() {
  if [[ "$1" = "framework" ]]; then
     echo "" > /opt/Plexus.Network.Apps/frameworks.sharpshell.h
     echo -e "${green}Frameworks is cleared."
    :
  elif [[ "$1" = "params" ]]; then
      echo "" > /opt/Plexus.Network.Apps/params.sharpshell.h
      echo -e "${green}Parameters is cleared."
    :
  elif [[ "$1" = "code" ]]; then
      echo "" > /opt/Plexus.Network.Apps/commands.sharpshell.h
      echo -e "${green}Codes is cleared."
    :
  elif [[ "$1" = "all" ]]; then
      echo "" > /opt/Plexus.Network.Apps/frameworks.sharpshell.h
      echo "" > /opt/Plexus.Network.Apps/params.sharpshell.h
      echo "" > /opt/Plexus.Network.Apps/commands.sharpshell.h
      echo -e "${green}Memory is cleared."
    :
  else
      echo -e "${red}False parameter: ${blue}$1${tp}.\n\tUsage: ${green}?clear: ${tp}(${yellow}framework${tp}/${yellow}params${tp}/${yellow}code${tp}/${yellow}all${tp})"
    :
  fi
}
#sharpshell

#sharpshell
