using System;
using DatabaseModelEFCore.Models.Repository;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.Extensions.Configuration;

namespace DatabaseModelEFCore.Context
{
    public partial class RepositoryContext : DbContext
    {
        public RepositoryContext()
        {
        }

        public RepositoryContext(DbContextOptions<RepositoryContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Accounts> Accounts { get; set; }
        public virtual DbSet<Servers> Servers { get; set; }
        public virtual DbSet<Systems> Systems { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
                IConfigurationRoot configuration = new ConfigurationBuilder().SetBasePath(AppDomain.CurrentDomain.BaseDirectory).AddJsonFile("appsettings.json").Build();
                optionsBuilder.UseSqlServer(configuration.GetConnectionString("GlobalRepositoryDatabase"));
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Accounts>(entity =>
            {
                entity.HasNoKey();

                entity.ToView("Accounts", "web");

                entity.Property(e => e.AccountExId).HasComment("The identifier transmitted in web communication.");

                entity.Property(e => e.CountryRegionCode)
                    .HasMaxLength(3)
                    .HasComment("Account location - country code.");

                entity.Property(e => e.Description)
                    .HasMaxLength(200)
                    .HasComment("Short description of the account. ");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(50)
                    .HasComment("Account name. ");

                entity.Property(e => e.PasswordExpires)
                    .HasColumnType("date")
                    .HasComment("Password expiration date. Accounts that have invalid passwords have the Tofix flag set to Y.");

                entity.Property(e => e.ServerExId).HasComment("Server ExID on a database.");

                entity.Property(e => e.SystemExId).HasComment("System ExID on a database.");

                entity.Property(e => e.Tofix).HasComment("Flag indicating accounts that have missing attributes. ");

                entity.Property(e => e.Type)
                    .IsRequired()
                    .HasMaxLength(1)
                    .IsUnicode(false)
                    .IsFixedLength()
                    .HasComment("Account type. U - user account, D - database account. ");

                entity.Property(e => e.UserId).HasComment("User ExID on a database.");
            });

            modelBuilder.Entity<Servers>(entity =>
            {
                entity.HasNoKey();

                entity.ToView("Servers", "web");

                entity.Property(e => e.AntivirusSoftware)
                    .IsRequired()
                    .HasMaxLength(1)
                    .IsUnicode(false)
                    .IsFixedLength()
                    .HasComment("Anti-virus software. default value is false. ");

                entity.Property(e => e.CountryRegionCode)
                    .HasMaxLength(3)
                    .HasComment("Server location - country code.");

                entity.Property(e => e.Cputype)
                    .HasColumnName("CPUType")
                    .HasComment("Processor type ");

                entity.Property(e => e.HardDisk)
                    .IsRequired()
                    .HasMaxLength(1)
                    .IsUnicode(false)
                    .IsFixedLength()
                    .HasComment("The type of disk used on the server. D - normal drive, S - SSD");

                entity.Property(e => e.Host)
                    .IsRequired()
                    .HasMaxLength(50)
                    .HasComment("Server host name.");

                entity.Property(e => e.Model)
                    .IsRequired()
                    .HasMaxLength(50)
                    .HasComment("Server model.");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(50)
                    .HasComment("Server name.");

                entity.Property(e => e.Ram)
                    .HasColumnName("RAM")
                    .HasComment("Number of ram memories on the server (MB)");

                entity.Property(e => e.SerialNumber).HasComment("Serial number of the server");

                entity.Property(e => e.ServerExId).HasComment("The identifier transmitted in web communication.");

                entity.Property(e => e.TechSupport).HasComment("Technical support for the server. The default value is false. ");

                entity.Property(e => e.Ups)
                    .IsRequired()
                    .HasColumnName("UPS")
                    .HasMaxLength(1)
                    .IsUnicode(false)
                    .IsFixedLength()
                    .HasComment("Security of the server in elenctic energy. The default value is false. ");

                entity.Property(e => e.WarrantyExpirationDate)
                    .HasColumnType("date")
                    .HasComment("Warranty expiration date. ");
            });

            modelBuilder.Entity<Systems>(entity =>
            {
                entity.HasNoKey();

                entity.ToView("Systems", "web");

                entity.Property(e => e.CompanyName)
                    .IsRequired()
                    .HasMaxLength(50)
                    .HasComment("Name of the system provider");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(50)
                    .HasComment("System name");

                entity.Property(e => e.SystemExId).HasComment("The identifier transmitted in web communication.");

                entity.Property(e => e.TechSupport).HasComment("Flag informing that there is support for the system. Default value is false.  ");

                entity.Property(e => e.TechSupportExpDate)
                    .HasColumnType("date")
                    .HasComment("Expiry date of support for the system ");

                entity.Property(e => e.Version)
                    .IsRequired()
                    .HasMaxLength(50)
                    .HasComment("System version");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
