   M S B A M L   `   `   `  ����D  @GR_WpfApp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null%clr-namespace:GR_WpfApp	GR_WpfApp  5   	       GR_WpfApp.MainWindow   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   )localclr-namespace:GR_WpfApp     5   	     � Title$   ��5   	   $	��800��6   $
��1000��6   .��5	      � ��5
   
   �� 5       �� ImageSource$! /Images/blue-gradient_0.jpg��6    j� Stretch$ UniformToFill=�6C   .+�5   
   �� .+�5      �� $��5q�6   
������  J� Effect 5      3  -System.Windows.Media.Effects.DropShadowEffect  5      5      �� 5      $��5q�6   
����ح�$	��0.6q�5       �� CornerRadius$ 4��5      
������  5        5      ._�5      �� $y�Visible=�6   .+�5      � ��5      �� 5      $! /Images/blue-gradient_1.jpg��6)   $ UniformToFill=�6S    � ColumnDefinitions 5!      �� 5"      $��* �6/   �� 5#      $��* �6/   �� 5$      $��* �6/   �� 5%      $��* �6/   �� 5&      $��* �6/   .+�5)      �� -   5         ��Name$ btnAdd��5)   !   $��18(�5+   !   
������ $��2��5-   !   $��New account��5.   !   
������ $
��Bold"�50   !   ���#ffff51   6   �� 52      -   5        $ btnShowAccount��52   !   $��18(�54   !   
������ $��3��56   !   $��Audit��57   !   
������ $
��Bold"�59   !   ���#ffff5:   6   �� 5;      -   5        $ btnDoc��5;   !   $��18(�5=   !   
������ $��4��5?   !   $��Documentation��5@   !   
������ $
��Bold"�5B   !   ���#ffff5C   6   5D      5E      5F      �� 5G      $��5q�6   $y�Visible=�5H      .+�5I      � .+�5J       � -   5          �Name$ 	mainFrame��5J      $
��auto��5K      $
��auto��5L        � NavigationUIVisibility$ Hidden=�5M      
������ 5N      5O      5P      5Q      5R      5S      