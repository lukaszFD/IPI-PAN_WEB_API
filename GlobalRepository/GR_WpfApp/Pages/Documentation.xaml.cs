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
            await Request();
        }

        private async Task Request()
        {
            try
            {
                var authValue = new AuthenticationHeaderValue("Basic", Convert.ToBase64String(Encoding.UTF8.GetBytes($"lukasz:test")));

                using (var client = new HttpClient() { DefaultRequestHeaders = { Authorization = authValue } })
                {
                    HttpResponseMessage response = client.GetAsync("https://localhost:44396/GrTables/Documentation/All?pageNumber=0&pageSize=204").Result;
                    if (response.IsSuccessStatusCode)
                    {
                        var data = await response.Content.ReadAsStringAsync();

                        dataGirdDoc.ItemsSource = new GetDataFromJson().Doc(data);
                    }
                    
                    responseTbx.Text = response.Headers.ToString();

                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }


        private void response_SelectionChanged(object sender, RoutedEventArgs e)
        {

        }
    }
}
