using DatabaseModelEFCore.Context;
using DatabaseModelEFCore.Models.Audit;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;

namespace ConsoleApp
{
    class Program
    {
        static void Main(string[] args)
        {

            AuditContext context = new AuditContext();

            var account  = context.AuditAccounts;



            foreach (var item in account)
            {
                Console.WriteLine(item.AccountExId);
            }

            

            Console.ReadKey();
        }


    }
}
