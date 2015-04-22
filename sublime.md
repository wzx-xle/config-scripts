1、本经验目前在Ubuntu14.04环境下，已有搜狗输入法 for Linux和Sublime Text 3的情况下安装成功。

2、保存下面的代码到文件sublime_imfix.c(位于~目录)
#include <gtk/gtkimcontext.h>
void gtk_im_context_set_client_window (GtkIMContext *context,
         GdkWindow    *window)
{
 GtkIMContextClass *klass;
 g_return_if_fail (GTK_IS_IM_CONTEXT (context));
 klass = GTK_IM_CONTEXT_GET_CLASS (context);
 if (klass->set_client_window)
   klass->set_client_window (context, window);
 g_object_set_data(G_OBJECT(context),"window",window);
 if(!GDK_IS_WINDOW (window))
   return;
 int width = gdk_window_get_width(window);
 int height = gdk_window_get_height(window);
 if(width != 0 && height !=0)
   gtk_im_context_focus_in(context);
}

3、将上一步的代码编译成共享库libsublime-imfix.so，命令
cd ~
gcc -shared -o libsublime-imfix.so sublime_imfix.c  `pkg-config --libs --cflags gtk+-2.0` -fPIC

4、然后将libsublime-imfix.so拷贝到sublime_text所在文件夹
sudo mv libsublime-imfix.so /opt/sublime_text/

5、修改文件/usr/bin/subl的内容
sudo gedit /usr/bin/subl
将
#!/bin/sh
exec /opt/sublime_text/sublime_text "$@"
修改为
#!/bin/sh
LD_PRELOAD=/opt/sublime_text/libsublime-imfix.so exec /opt/sublime_text/sublime_text "$@"
此时，在命令中执行 subl 将可以使用搜狗for linux的中文输入

6、为了使用鼠标右键打开文件时能够使用中文输入，还需要修改文件sublime_text.desktop的内容。
命令
sudo gedit /usr/share/applications/sublime_text.desktop
将[Desktop Entry]中的字符串
Exec=/opt/sublime_text/sublime_text %F
修改为
Exec=bash -c "LD_PRELOAD=/opt/sublime_text/libsublime-imfix.so exec /opt/sublime_text/sublime_text %F"
将[Desktop Action Window]中的字符串
Exec=/opt/sublime_text/sublime_text -n
修改为
Exec=bash -c "LD_PRELOAD=/opt/sublime_text/libsublime-imfix.so exec /opt/sublime_text/sublime_text -n"
将[Desktop Action Document]中的字符串
Exec=/opt/sublime_text/sublime_text --command new_file
修改为
Exec=bash -c "LD_PRELOAD=/opt/sublime_text/libsublime-imfix.so exec /opt/sublime_text/sublime_text --command new_file"
注意：
修改时请注意双引号"",否则会导致不能打开带有空格文件名的文件。
此处仅修改了/usr/share/applications/sublime-text.desktop，但可以正常使用了。
opt/sublime_text/目录下的sublime-text.desktop可以修改，也可不修改。

7、经过以上步骤我们能在Sublime中输入中文了。
