   M S B A M L   `   `   `  ����D  @GR_WpfApp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null%clr-namespace:GR_WpfApp	GR_WpfApp  5   	       GR_WpfApp.MainWindow   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   )localclr-namespace:GR_WpfApp     5   	   -   5          � Title$   ��5   	   $	��650��6   $	��700��6   .��5	      � ��5
   
   �� 5       �� ImageSource$! /Images/blue-gradient_0.jpg��6    j� Stretch$ UniformToFill=�6C   .+�5   
   �� .+�5      �� $��5q�6   
������  J� Effect 5      3  -System.Windows.Media.Effects.DropShadowEffect  5      5      �� 5      $��5q�6   
����ح�$	��0.6q�5       �� CornerRadius$ 4��5      
������  5        5      ._�5      �� $y�Visible=�6   .+�5      � ��5      �� 5      $! /Images/blue-gradient_1.jpg��6)   $ UniformToFill=�6S    � ColumnDefinitions 5!      �� 5"      $��* �6/   �� 5#      $��* �6/   �� 5$      $��* �6/   �� 5%      $��* �6/   �� 5&      $��* �6/   .+�5(      �� -   5         ��Name$ btnSettings��5(   !   $
��Left=�5*   !   $��40��5+   !   
������ $��0��5-   !   
������ .��5/      �� $��/Images/settings.ico��6$   50      51      �� 53      -   5        $ btnAdd��53   !   $��18(�55   !   
������ $��2��57   !   $��New account��58   !   
������ $
��Bold"�5:   !   ���#ffff5;   6   �� 5<      -   5        $ btnShowAccount��5<   !   $��18(�5>   !   
������ $��3��5@   !   $��
My account��5A   !   
������ $
��Bold"�5C   !   ���#ffff5D   6   �� 5E      -   5        $ btnDoc��5E   !   $��18(�5G   !   
������ $��4��5I   !   $��Documentation��5J   !   
������ $
��Bold"�5L   !   ���#ffff5M   6   5N      5O      5P      �� 5Q      $��5q�6   $y�Visible=�5R      .+�5S      � .+�5T       � -   5          �Name$ 	mainFrame��5T      $	��560��5U      $
��auto��5V        � NavigationUIVisibility$ Hidden=�5W      
������ 5X      5Y      5Z      5[      5\      5]      