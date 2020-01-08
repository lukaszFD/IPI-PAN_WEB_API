using GR_WpfApp.Class;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;
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
    /// Interaction logic for Documentation.xaml
    /// </summary>
    public partial class Documentation : Page
    {
        public Documentation()
        {
            InitializeComponent();
        }

        private async void DrawCircleButton_Click(object sender, RoutedEventArgs e)
        {

            dataGirdDoc.ItemsSource = new GetDataFromJson().Doc(await new GetDataFromHttp().Request(urlTbx.Text,passwordTbx.Text,loginTbx.Text));
        }
    }
}
