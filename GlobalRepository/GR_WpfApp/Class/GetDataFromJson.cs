using System;
using System.Collections.Generic;
using System.Globalization;
using Newtonsoft.Json;
using Newtonsoft.Json.Converters;

namespace GR_WpfApp.Class
{
    public partial class GetDataFromJson
    {
        public  List<Documentation> Doc(string json) => JsonConvert.DeserializeObject<List<Documentation>>(json);
    }
}

