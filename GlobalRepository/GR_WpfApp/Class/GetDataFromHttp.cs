using System;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace GR_WpfApp.Class
{
    public partial class GetDataFromHttp
    {
        public async Task<string> Request( string url, string pass, string login)
        {
            string data = "";
            try
            {
                var authValue = new AuthenticationHeaderValue("Basic", Convert.ToBase64String(Encoding.UTF8.GetBytes($"{login}:{pass}")));

                using (var client = new HttpClient() { DefaultRequestHeaders = { Authorization = authValue } })
                {
                    HttpResponseMessage response = client.GetAsync(url).Result;
                    if (response.IsSuccessStatusCode)
                    {
                        data = await response.Content.ReadAsStringAsync();
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            return data;
        }
    }
}
