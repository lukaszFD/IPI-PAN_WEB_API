using GR_WpfApp.Class;
using Newtonsoft.Json;
using System;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
using System.Windows;
using System.Windows.Controls;

namespace GR_WpfApp.Pages
{
    /// <summary>
    /// Interaction logic for NewAccount.xaml
    /// </summary>
    public partial class NewAccount : Page
    {
        public NewAccount()
        {
            InitializeComponent();
        }

        private async void DrawCircleButton_Click(object sender, RoutedEventArgs e)
        {
            GrAccount acc = new GrAccount();
            acc.AccountCountryRegionCode = accCountryRegionCode.Text;
            acc.AccountDescription = accDescription.Text;
            acc.AccountName = accName.Text;
            acc.AccountPasswordExpires = datePickerAccount.SelectedDate.Value;
            acc.AccountType = accType.Text;

            acc.ServerName = servName.Text;
            acc.ServerHost = servHost.Text;
            acc.ServerCountryRegionCode = servCountryRegionCode.Text;
            acc.ServerModel = Convert.ToInt32( servModel.Text);
            acc.ServerSerialNumber = Convert.ToInt32(servSerialNumber.Text);
            acc.ServerWarrantyExpirationDate = datePickerServer.SelectedDate.Value;
            acc.ServerCputype = Convert.ToInt32(servCputype.Text);
            acc.ServerRam = Convert.ToInt32(servRam.Text);
            acc.ServerHardDisk = servHardDisk.Text;
            acc.ServerUps = servUps.Text;
            acc.ServerAntivirusSoftware = servAntivirusSoftware.Text;

            acc.SystemCompanyName = sysCompanyName.Text;
            acc.SystemName = sysName.Text;
            acc.SystemVersion = sysVersion.Text;
            acc.SystemTechSupportExpDate = datePickerSystem.SelectedDate.Value;

            string json = JsonConvert.SerializeObject(acc);

            var httpContent = new StringContent(json, Encoding.UTF8, "application/json");

            try
            {
                var authValue = new AuthenticationHeaderValue("Basic", Convert.ToBase64String(Encoding.UTF8.GetBytes($"{loginTbx.Text}:{passwordTbx.Text}")));

                using (var client = new HttpClient() { DefaultRequestHeaders = { Authorization = authValue } })
                {
                    HttpResponseMessage response = client.PostAsync(urlTbx.Text, httpContent).Result;
                    if (response.IsSuccessStatusCode)
                    {
                        responseTbx.Text = await response.Content.ReadAsStringAsync();
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }
    }
}
