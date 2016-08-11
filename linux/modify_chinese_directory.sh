#!/bin/bash

# 备份用户目录明对应文件
user_dirs="$HOME/.config/user-dirs.dirs"
if [ -f $user_dirs.bak ]; then
  echo "备份文件 $user_dirs.bak 已经存在，无法再次备份！"
  exit -1;
fi
mv $user_dirs $user_dirs.bak

# 备份标准书签
bookmark="$HOME/.config/gtk-3.0/bookmarks"
if [ -f $bookmark.bak ]; then
  echo "备份文件 $bookmark.bak 已经存在，无法再次备份！"
  exit -1;
fi
mv $bookmark $bookmark.bak

#  修改用户目录下到中文目录为英文目录

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
desktop_zh="桌面"
desktop_en="Desktop"

#修改目录名
if [ -d "$HOME/$desktop_zh" ]; then
  echo "exist $HOME/$desktop_zh ==> $HOME/$desktop_en"
  mv ~/$desktop_zh ~/$desktop_en
fi
#更新配置文件
if [ -d "$HOME/$desktop_en" ]; then
  echo "XDG_DESKTOP_DIR=\"\$HOME/$desktop_en\"" >> $user_dirs
fi

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
documents_zh="文档"
documents_en="Documents"

if [ -d "$HOME/$documents_zh" ]; then
  echo "exist $HOME/$documents_zh ==> $HOME/$documents_en"
  mv ~/$documents_zh ~/$documents_en
fi
#更新配置文件和书签
if [ -d "$HOME/$documents_en" ]; then
  echo "XDG_DOCUMENTS_DIR=\"\$HOME/$documents_en\"" >> $user_dirs
  echo "file://$HOME/$documents_en $documents_zh" >> $bookmark
fi

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
music_zh="音乐"
music_en="Music"

if [ -d "$HOME/$music_zh" ]; then
  echo "exist $HOME/$music_zh ==> $HOME/$music_en"
  mv ~/$music_zh ~/$music_en
fi
#更新配置文件和书签
if [ -d "$HOME/$music_en" ]; then
  echo "XDG_MUSIC_DIR=\"\$HOME/$music_en\"" >> $user_dirs
  echo "file://$HOME/$music_en $music_zh" >> $bookmark
fi

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
pictures_zh="图片"
pictures_en="Pictures"

if [ -d "$HOME/$pictures_zh" ]; then
  echo "exist $HOME/$pictures_zh ==> $HOME/$pictures_en"
  mv ~/$pictures_zh ~/$pictures_en
fi
#更新配置文件和书签
if [ -d "$HOME/$pictures_en" ]; then
  echo "XDG_PICTURES_DIR=\"\$HOME/$pictures_en\"" >> $user_dirs
  echo "file://$HOME/$pictures_en $pictures_zh" >> $bookmark
fi

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
videos_zh="视频"
videos_en="Videos"

if [ -d "$HOME/$videos_zh" ]; then
  echo "exist $HOME/$videos_zh ==> $HOME/$videos_en"
  mv ~/$videos_zh ~/$videos_en
fi
#更新配置文件和书签
if [ -d "$HOME/$videos_en" ]; then
  echo "XDG_VIDEOS_DIR=\"\$HOME/$videos_en\"" >> $user_dirs
  echo "file://$HOME/$videos_en $videos_zh" >> $bookmark
fi

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
download_zh="下载"
download_en="Download"
#修改目录名
if [ -d "$HOME/$download_zh" ]; then
  echo "exist $HOME/$download_zh ==> $HOME/$download_en"
  mv ~/$download_zh ~/$download_en
fi
#更新配置文件和书签
if [ -d "$HOME/$download_en" ]; then
  echo "XDG_DOWNLOAD_DIR=\"\$HOME/$download_en\"" >> $user_dirs
  echo "file://$HOME/$download_en $download_zh" >> $bookmark
fi

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
templates_zh="模板"
templates_en="Templates"

if [ -d "$HOME/$templates_zh" ]; then
  echo "exist $HOME/$templates_zh ==> $HOME/$templates_en"
  mv ~/$templates_zh ~/$templates_en
fi
#更新配置文件
if [ -d "$HOME/$templates_en" ]; then
  echo "XDG_TEMPLATES_DIR=\"\$HOME/$templates_en\"" >> $user_dirs
fi

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
public_zh="公共的"
public_en="Public"

if [ -d "$HOME/$public_zh" ]; then
  echo "exist $HOME/$public_zh ==> $HOME/$public_en"
  mv ~/$public_zh ~/$public_en
fi
#更新配置文件
if [ -d "$HOME/$public_en" ]; then
  echo "XDG_PUBLIC_DIR=\"\$HOME/$public_en\"" >> $user_dirs
fi
