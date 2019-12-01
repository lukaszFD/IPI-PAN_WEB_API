using System;
using DB_ModelEFCore.Models.Documentation;

namespace ConsoleApp1
{
    class Program
    {
        static void Main(string[] args)
        {
            DocumentationContext d = new DocumentationContext();

            foreach (var item in d.GrTables)
            {
                Console.WriteLine(item.SchemaName);
            }
            Console.ReadKey();
        }
    }
}
