using System;
using DatabaseModelEFCore.Models.Recon;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace DatabaseModelEFCore.Context
{
    public partial class ReconContext : DbContext
    {
        public ReconContext()
        {
        }

        public ReconContext(DbContextOptions<ReconContext> options)
            : base(options)
        {
        }

        public virtual DbSet<ReconAccounts> ReconAccounts { get; set; }
        public virtual DbSet<ReconServers> ReconServers { get; set; }
        public virtual DbSet<ReconSystems> ReconSystems { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. See http://go.microsoft.com/fwlink/?LinkId=723263 for guidance on storing connection strings.
                optionsBuilder.UseSqlServer("Server=.\\SQLExpress;Database=GlobalRepository;Trusted_Connection=True;");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<ReconAccounts>(entity =>
            {
                entity.HasNoKey();

                entity.ToView("ReconAccounts", "web");

                entity.Property(e => e.AccountExId).HasComment("The identifier transmitted in web communication.");

                entity.Property(e => e.CountryRegionCode)
                    .HasMaxLength(2)
                    .HasComment("Account location - country code.");

                entity.Property(e => e.Description)
                    .HasMaxLength(200)
                    .HasComment("Short description of the account.");

                entity.Property(e => e.Name)
                    .HasMaxLength(50)
                    .HasComment("Account name.");

                entity.Property(e => e.PasswordExpires)
                    .HasColumnType("datetime")
                    .HasComment("Password expiration date. Accounts that have invalid passwords have the Tofix flag set to Y.");

                entity.Property(e => e.ServerExId).HasComment("Server ExID on a database.");

                entity.Property(e => e.SystemExId).HasComment("System ExID on a database.");

                entity.Property(e => e.Type)
                    .HasMaxLength(1)
                    .IsUnicode(false)
                    .IsFixedLength()
                    .HasComment("Account type. U - user account, D - database account.");

                entity.Property(e => e.UserExId).HasComment("User ExID on a database.");
            });

            modelBuilder.Entity<ReconServers>(entity =>
            {
                entity.HasNoKey();

                entity.ToView("ReconServers", "web");

                entity.Property(e => e.AntivirusSoftware)
                    .HasMaxLength(1)
                    .IsUnicode(false)
                    .IsFixedLength()
                    .HasComment("Anti-virus software.");

                entity.Property(e => e.CountryRegionCode)
                    .HasMaxLength(2)
                    .HasComment("Account location - country code.");

                entity.Property(e => e.Cputype)
                    .HasColumnName("CPUType")
                    .HasComment("Processor type.");

                entity.Property(e => e.HardDisk)
                    .HasMaxLength(1)
                    .IsUnicode(false)
                    .IsFixedLength()
                    .HasComment("The type of disk used on the server. D - normal drive, S - SSD");

                entity.Property(e => e.Host)
                    .HasMaxLength(50)
                    .HasComment("Server host name.");

                entity.Property(e => e.Model)
                    .HasMaxLength(50)
                    .HasComment("Server model.");

                entity.Property(e => e.Name)
                    .HasMaxLength(50)
                    .HasComment("Server name.");

                entity.Property(e => e.Ram)
                    .HasColumnName("RAM")
                    .HasComment("Number of ram memories on the server (MB)");

                entity.Property(e => e.SerialNumber).HasComment("Serial number of the server");

                entity.Property(e => e.ServerExId).HasComment("The identifier transmitted in web communication.");

                entity.Property(e => e.Ups)
                    .HasColumnName("UPS")
                    .HasMaxLength(1)
                    .IsUnicode(false)
                    .IsFixedLength()
                    .HasComment("Security of the server in elenctic energy.");

                entity.Property(e => e.WarrantyExpirationDate)
                    .HasColumnType("date")
                    .HasComment("Warranty expiration date.");
            });

            modelBuilder.Entity<ReconSystems>(entity =>
            {
                entity.HasNoKey();

                entity.ToView("ReconSystems", "web");

                entity.Property(e => e.CompanyName)
                    .HasMaxLength(50)
                    .HasComment("Name of the system provider");

                entity.Property(e => e.Name)
                    .HasMaxLength(50)
                    .HasComment("System name");

                entity.Property(e => e.SystemExId).HasComment("The identifier transmitted in web communication.");

                entity.Property(e => e.TechSupportExpDate)
                    .HasColumnType("date")
                    .HasComment("Expiry date of support for the system ");

                entity.Property(e => e.Version)
                    .HasMaxLength(50)
                    .HasComment("System version");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
