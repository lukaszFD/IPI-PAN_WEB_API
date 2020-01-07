using GR_WpfApp.Class;
using System;
using System.Collections.Generic;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace GR_WpfApp.Pages
{
    /// <summary>
    /// Interaction logic for MyAccount.xaml
    /// </summary>
    public partial class MyAccount : Page
    {
        public MyAccount()
        {
            InitializeComponent();
        }


        private async void accountButton_Click(object sender, RoutedEventArgs e)
        {
            dataGirdAccount.ItemsSource = new GetDataFromJson().Account(await new GetDataFromHttp().Request(urlTbx.Text, passwordTbx.Text, loginTbx.Text));  
        }
    }
}
