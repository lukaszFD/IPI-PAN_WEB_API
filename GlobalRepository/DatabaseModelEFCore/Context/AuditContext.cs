using DatabaseModelEFCore.Models.Audit;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using System;

namespace DatabaseModelEFCore.Context
{
    public partial class AuditContext : DbContext
    {
        public AuditContext()
        {

        }
        public AuditContext(DbContextOptions<AuditContext> options)
            : base(options)
        {
        }

        public virtual DbSet<AuditAccounts> AuditAccounts { get; set; }
        public virtual DbSet<AuditServers> AuditServers { get; set; }
        public virtual DbSet<AuditSystems> AuditSystems { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
                //optionsBuilder.UseSqlServer("Server=.\\SQLExpress;Database=GlobalRepository;Trusted_Connection=True;");
                //optionsBuilder.UseSqlServer(ConfigurationManager.ConnectionStrings["GlobalRepositoryDatabase"].ConnectionString);

                IConfigurationRoot configuration = new ConfigurationBuilder().SetBasePath(AppDomain.CurrentDomain.BaseDirectory).AddJsonFile("appsettings.json").Build();
                optionsBuilder.UseSqlServer(configuration.GetConnectionString("GlobalRepositoryDatabase"));
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<AuditAccounts>(entity =>
            {
                entity.HasNoKey();

                entity.ToView("AuditAccounts", "web");

                entity.Property(e => e.AccountExId).HasComment("The identifier transmitted in web communication .");

                entity.Property(e => e.DateFrom)
                    .HasColumnType("datetime")
                    .HasComment("Date From");

                entity.Property(e => e.DateTo)
                    .HasColumnType("datetime")
                    .HasComment("Date to");

                entity.Property(e => e.NewCountryRegionCode)
                    .HasColumnName("NEW_CountryRegionCode")
                    .HasMaxLength(3)
                    .HasComment("New value - Account location - country code.");

                entity.Property(e => e.NewDescription)
                    .HasColumnName("NEW_Description")
                    .HasMaxLength(200)
                    .HasComment("New value - Short description of the account. ");

                entity.Property(e => e.NewName)
                    .IsRequired()
                    .HasColumnName("NEW_Name")
                    .HasMaxLength(50)
                    .HasComment("New value - Account name. ");

                entity.Property(e => e.NewPasswordExpires)
                    .HasColumnName("NEW_PasswordExpires")
                    .HasColumnType("datetime")
                    .HasComment("New value - Password expiration date. Accounts that have invalid passwords have the Tofix flag set to Y.");

                entity.Property(e => e.NewServerExId)
                    .HasColumnName("NEW_ServerExId")
                    .HasComment("New value - Server ExID on a database.");

                entity.Property(e => e.NewSystemExId)
                    .HasColumnName("NEW_SystemExId")
                    .HasComment("New value - System ExID on a database.");

                entity.Property(e => e.NewTofix)
                    .HasColumnName("NEW_Tofix")
                    .HasMaxLength(1)
                    .IsUnicode(false)
                    .IsFixedLength()
                    .HasComment("New value - Flag indicating Accounts that have missing attributes. ");

                entity.Property(e => e.NewType)
                    .HasColumnName("NEW_Type")
                    .HasMaxLength(1)
                    .IsUnicode(false)
                    .IsFixedLength()
                    .HasComment("New value - Account type. U - user account, D - database account. ");

                entity.Property(e => e.NewUserId)
                    .HasColumnName("NEW_UserId")
                    .HasComment("New value - User ExID on a database.");

                entity.Property(e => e.OldCountryRegionCode)
                    .HasColumnName("OLD_CountryRegionCode")
                    .HasMaxLength(3)
                    .HasComment("Old value - Account location - country code.");

                entity.Property(e => e.OldDescription)
                    .HasColumnName("OLD_Description")
                    .HasMaxLength(200)
                    .HasComment("Old value - Short description of the account. ");

                entity.Property(e => e.OldName)
                    .IsRequired()
                    .HasColumnName("OLD_Name")
                    .HasMaxLength(50)
                    .HasComment("Old value - Account name. ");

                entity.Property(e => e.OldPasswordExpires)
                    .HasColumnName("OLD_PasswordExpires")
                    .HasColumnType("datetime")
                    .HasComment("Old value - Password expiration date. Accounts that have invalid passwords have the Tofix flag set to Y.");

                entity.Property(e => e.OldServerExId)
                    .HasColumnName("OLD_ServerExId")
                    .HasComment("Old value - Server ExID on a database.");

                entity.Property(e => e.OldSystemExId)
                    .HasColumnName("OLD_SystemExId")
                    .HasComment("Old value - System ExID on a database.");

                entity.Property(e => e.OldTofix)
                    .HasColumnName("OLD_Tofix")
                    .HasMaxLength(1)
                    .IsUnicode(false)
                    .IsFixedLength()
                    .HasComment("Old value - Flag indicating Accounts that have missing attributes. ");

                entity.Property(e => e.OldType)
                    .HasColumnName("OLD_Type")
                    .HasMaxLength(1)
                    .IsUnicode(false)
                    .IsFixedLength()
                    .HasComment("Old value - Account type. U - user account, D - database account. ");

                entity.Property(e => e.OldUserId)
                    .HasColumnName("OLD_UserId")
                    .HasComment("Old value - User ExID on a database.");

                entity.Property(e => e.UserName)
                    .HasMaxLength(100)
                    .HasComment("The user who made the change ");
            });

            modelBuilder.Entity<AuditServers>(entity =>
            {
                entity.HasNoKey();

                entity.ToView("AuditServers", "web");

                entity.Property(e => e.DateFrom)
                    .HasColumnType("datetime")
                    .HasComment("Date From");

                entity.Property(e => e.DateTo)
                    .HasColumnType("datetime")
                    .HasComment("Date to");

                entity.Property(e => e.NewAntivirusSoftware)
                    .HasColumnName("NEW_AntivirusSoftware")
                    .HasMaxLength(1)
                    .IsUnicode(false)
                    .IsFixedLength()
                    .HasComment("New value - Anti-virus software. default value is false. ");

                entity.Property(e => e.NewCountryRegionCode)
                    .HasColumnName("NEW_CountryRegionCode")
                    .HasMaxLength(3)
                    .HasComment("New value - Server location - country code.");

                entity.Property(e => e.NewCputype)
                    .HasColumnName("NEW_CPUType")
                    .HasComment("New value - Processor type ");

                entity.Property(e => e.NewHardDisk)
                    .HasColumnName("NEW_HardDisk")
                    .HasMaxLength(1)
                    .IsUnicode(false)
                    .IsFixedLength()
                    .HasComment("New value - The type of disk used on the server. D - normal drive, S - SSD");

                entity.Property(e => e.NewHost)
                    .HasColumnName("NEW_Host")
                    .HasMaxLength(50)
                    .HasComment("New value - Server host name.");

                entity.Property(e => e.NewModel)
                    .HasColumnName("NEW_Model")
                    .HasMaxLength(50)
                    .HasComment("New value - Server model.");

                entity.Property(e => e.NewName)
                    .HasColumnName("NEW_Name")
                    .HasMaxLength(50)
                    .HasComment("New value - Server name.");

                entity.Property(e => e.NewRam)
                    .HasColumnName("NEW_RAM")
                    .HasComment("New value - Number of ram memories on the server (MB)");

                entity.Property(e => e.NewSerialNumber)
                    .HasColumnName("NEW_SerialNumber")
                    .HasComment("New value - Serial number of the server");

                entity.Property(e => e.NewTechSupport)
                    .HasColumnName("NEW_TechSupport")
                    .HasMaxLength(1)
                    .IsUnicode(false)
                    .IsFixedLength()
                    .HasComment("New value - Technical support for the server. The default value is false. ");

                entity.Property(e => e.NewUps)
                    .HasColumnName("NEW_UPS")
                    .HasMaxLength(1)
                    .IsUnicode(false)
                    .IsFixedLength()
                    .HasComment("New value - Security of the server in elenctic energy. The default value is false. ");

                entity.Property(e => e.NewWarrantyExpirationDate)
                    .HasColumnName("NEW_WarrantyExpirationDate")
                    .HasColumnType("date")
                    .HasComment("New value - Warranty expiration date. ");

                entity.Property(e => e.OldAntivirusSoftware)
                    .HasColumnName("OLD_AntivirusSoftware")
                    .HasMaxLength(1)
                    .IsUnicode(false)
                    .IsFixedLength()
                    .HasComment("Old value - Anti-virus software. default value is false. ");

                entity.Property(e => e.OldCountryRegionCode)
                    .HasColumnName("OLD_CountryRegionCode")
                    .HasMaxLength(3)
                    .HasComment("Old value - Server location - country code.");

                entity.Property(e => e.OldCputype)
                    .HasColumnName("OLD_CPUType")
                    .HasComment("Old value - Processor type ");

                entity.Property(e => e.OldHardDisk)
                    .HasColumnName("OLD_HardDisk")
                    .HasMaxLength(1)
                    .IsUnicode(false)
                    .IsFixedLength()
                    .HasComment("Old value - The type of disk used on the server. D - normal drive, S - SSD");

                entity.Property(e => e.OldHost)
                    .HasColumnName("OLD_Host")
                    .HasMaxLength(50)
                    .HasComment("Old value - Server host name.");

                entity.Property(e => e.OldModel)
                    .HasColumnName("OLD_Model")
                    .HasMaxLength(50)
                    .HasComment("Old value - Server model.");

                entity.Property(e => e.OldName)
                    .HasColumnName("OLD_Name")
                    .HasMaxLength(50)
                    .HasComment("Old value - Server name.");

                entity.Property(e => e.OldRam)
                    .HasColumnName("OLD_RAM")
                    .HasComment("Old value - Number of ram memories on the server (MB)");

                entity.Property(e => e.OldSerialNumber)
                    .HasColumnName("OLD_SerialNumber")
                    .HasComment("Old value - Serial number of the server");

                entity.Property(e => e.OldTechSupport)
                    .HasColumnName("OLD_TechSupport")
                    .HasMaxLength(1)
                    .IsUnicode(false)
                    .IsFixedLength()
                    .HasComment("Old value - Technical support for the server. The default value is false. ");

                entity.Property(e => e.OldUps)
                    .HasColumnName("OLD_UPS")
                    .HasMaxLength(1)
                    .IsUnicode(false)
                    .IsFixedLength()
                    .HasComment("Old value - Security of the server in elenctic energy. The default value is false. ");

                entity.Property(e => e.OldWarrantyExpirationDate)
                    .HasColumnName("OLD_WarrantyExpirationDate")
                    .HasColumnType("date")
                    .HasComment("Old value - Warranty expiration date. ");

                entity.Property(e => e.ServerExId).HasComment("Server ExID on a database.");

                entity.Property(e => e.UserName)
                    .HasMaxLength(100)
                    .HasComment("The user who made the change ");
            });

            modelBuilder.Entity<AuditSystems>(entity =>
            {
                entity.HasNoKey();

                entity.ToView("AuditSystems", "web");

                entity.Property(e => e.DateFrom)
                    .HasColumnType("datetime")
                    .HasComment("Date From");

                entity.Property(e => e.DateTo)
                    .HasColumnType("datetime")
                    .HasComment("Date to");

                entity.Property(e => e.NewCompanyName)
                    .HasColumnName("NEW_CompanyName")
                    .HasMaxLength(50)
                    .HasComment("New value - Name of the system provider");

                entity.Property(e => e.NewName)
                    .HasColumnName("NEW_Name")
                    .HasMaxLength(50)
                    .HasComment("New value - System name");

                entity.Property(e => e.NewTechSupport)
                    .HasColumnName("NEW_TechSupport")
                    .HasMaxLength(1)
                    .IsUnicode(false)
                    .IsFixedLength()
                    .HasComment("New value - Flag informing that there is support for the system. Default value is false.  ");

                entity.Property(e => e.NewTechSupportExpDate)
                    .HasColumnName("NEW_TechSupportExpDate")
                    .HasColumnType("date")
                    .HasComment("New value - Expiry date of support for the system ");

                entity.Property(e => e.NewVersion)
                    .HasColumnName("NEW_Version")
                    .HasMaxLength(50)
                    .HasComment("New value - System version");

                entity.Property(e => e.OldCompanyName)
                    .HasColumnName("OLD_CompanyName")
                    .HasMaxLength(50)
                    .HasComment("Old value - Name of the system provider");

                entity.Property(e => e.OldName)
                    .HasColumnName("OLD_Name")
                    .HasMaxLength(50)
                    .HasComment("Old value - System name");

                entity.Property(e => e.OldTechSupport)
                    .HasColumnName("OLD_TechSupport")
                    .HasMaxLength(1)
                    .IsUnicode(false)
                    .IsFixedLength()
                    .HasComment("Old value - Flag informing that there is support for the system. Default value is false.  ");

                entity.Property(e => e.OldTechSupportExpDate)
                    .HasColumnName("OLD_TechSupportExpDate")
                    .HasColumnType("date")
                    .HasComment("Old value - Expiry date of support for the system ");

                entity.Property(e => e.OldVersion)
                    .HasColumnName("OLD_Version")
                    .HasMaxLength(50)
                    .HasComment("Old value - System version");

                entity.Property(e => e.SystemExId).HasComment("System ExID on a database.");

                entity.Property(e => e.UserName)
                    .HasMaxLength(100)
                    .HasComment("The user who made the change ");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
