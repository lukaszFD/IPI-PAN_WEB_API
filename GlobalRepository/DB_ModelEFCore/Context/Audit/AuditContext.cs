using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.Extensions.Configuration;

namespace DB_ModelEFCore.Models.Audit
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
            modelBuilder.HasAnnotation("ProductVersion", "2.2.6-servicing-10079");

            modelBuilder.Entity<Accounts>(entity =>
            {
                entity.HasKey(e => e.AudId)
                    .HasName("PK__Accounts__D2F73E356A7D3ADC");

                entity.ToTable("Accounts", "audit");

                entity.Property(e => e.AudId).HasColumnName("AudID");

                entity.Property(e => e.DateFrom).HasColumnType("datetime");

                entity.Property(e => e.DateTo)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.NewCountryId).HasColumnName("NEW_CountryId");

                entity.Property(e => e.NewDescription)
                    .HasColumnName("NEW_Description")
                    .HasMaxLength(200);

                entity.Property(e => e.NewName)
                    .IsRequired()
                    .HasColumnName("NEW_Name")
                    .HasMaxLength(50);

                entity.Property(e => e.NewPasswordExpires)
                    .HasColumnName("NEW_PasswordExpires")
                    .HasColumnType("datetime");

                entity.Property(e => e.NewRecAccountId).HasColumnName("NEW_RecAccountId");

                entity.Property(e => e.NewServerId).HasColumnName("NEW_ServerId");

                entity.Property(e => e.NewSystemId).HasColumnName("NEW_SystemId");

                entity.Property(e => e.NewTofix)
                    .HasColumnName("NEW_Tofix")
                    .HasMaxLength(1)
                    .IsUnicode(false);

                entity.Property(e => e.NewType)
                    .HasColumnName("NEW_Type")
                    .HasMaxLength(1)
                    .IsUnicode(false);

                entity.Property(e => e.NewUserId).HasColumnName("NEW_UserId");

                entity.Property(e => e.OldCountryId).HasColumnName("OLD_CountryId");

                entity.Property(e => e.OldDescription)
                    .HasColumnName("OLD_Description")
                    .HasMaxLength(200);

                entity.Property(e => e.OldName)
                    .IsRequired()
                    .HasColumnName("OLD_Name")
                    .HasMaxLength(50);

                entity.Property(e => e.OldPasswordExpires)
                    .HasColumnName("OLD_PasswordExpires")
                    .HasColumnType("datetime");

                entity.Property(e => e.OldRecAccountId).HasColumnName("OLD_RecAccountId");

                entity.Property(e => e.OldServerId).HasColumnName("OLD_ServerId");

                entity.Property(e => e.OldSystemId).HasColumnName("OLD_SystemId");

                entity.Property(e => e.OldTofix)
                    .HasColumnName("OLD_Tofix")
                    .HasMaxLength(1)
                    .IsUnicode(false);

                entity.Property(e => e.OldType)
                    .HasColumnName("OLD_Type")
                    .HasMaxLength(1)
                    .IsUnicode(false);

                entity.Property(e => e.OldUserId).HasColumnName("OLD_UserId");

                entity.Property(e => e.UserName)
                    .HasMaxLength(100)
                    .HasDefaultValueSql("(stuff(suser_sname(),(1),charindex('\\',suser_sname()),''))");
            });

            modelBuilder.Entity<Servers>(entity =>
            {
                entity.HasKey(e => e.AudId)
                    .HasName("PK__Servers__D2F73E35FCD40C2D");

                entity.ToTable("Servers", "audit");

                entity.Property(e => e.AudId).HasColumnName("AudID");

                entity.Property(e => e.DateFrom).HasColumnType("datetime");

                entity.Property(e => e.DateTo)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.NewAntivirusSoftware)
                    .HasColumnName("NEW_AntivirusSoftware")
                    .HasMaxLength(1)
                    .IsUnicode(false);

                entity.Property(e => e.NewCountryId).HasColumnName("NEW_CountryId");

                entity.Property(e => e.NewCputype).HasColumnName("NEW_CPUType");

                entity.Property(e => e.NewHardDisk)
                    .HasColumnName("NEW_HardDisk")
                    .HasMaxLength(1)
                    .IsUnicode(false);

                entity.Property(e => e.NewHost)
                    .HasColumnName("NEW_Host")
                    .HasMaxLength(50);

                entity.Property(e => e.NewModel)
                    .HasColumnName("NEW_Model")
                    .HasMaxLength(50);

                entity.Property(e => e.NewName)
                    .HasColumnName("NEW_Name")
                    .HasMaxLength(50);

                entity.Property(e => e.NewRam).HasColumnName("NEW_RAM");

                entity.Property(e => e.NewRecServerId).HasColumnName("NEW_RecServerId");

                entity.Property(e => e.NewSerialNumber).HasColumnName("NEW_SerialNumber");

                entity.Property(e => e.NewTechSupport)
                    .HasColumnName("NEW_TechSupport")
                    .HasMaxLength(1)
                    .IsUnicode(false);

                entity.Property(e => e.NewUps)
                    .HasColumnName("NEW_UPS")
                    .HasMaxLength(1)
                    .IsUnicode(false);

                entity.Property(e => e.NewWarrantyExpirationDate)
                    .HasColumnName("NEW_WarrantyExpirationDate")
                    .HasColumnType("date");

                entity.Property(e => e.OldAntivirusSoftware)
                    .HasColumnName("OLD_AntivirusSoftware")
                    .HasMaxLength(1)
                    .IsUnicode(false);

                entity.Property(e => e.OldCountryId).HasColumnName("OLD_CountryId");

                entity.Property(e => e.OldCputype).HasColumnName("OLD_CPUType");

                entity.Property(e => e.OldHardDisk)
                    .HasColumnName("OLD_HardDisk")
                    .HasMaxLength(1)
                    .IsUnicode(false);

                entity.Property(e => e.OldHost)
                    .HasColumnName("OLD_Host")
                    .HasMaxLength(50);

                entity.Property(e => e.OldModel)
                    .HasColumnName("OLD_Model")
                    .HasMaxLength(50);

                entity.Property(e => e.OldName)
                    .HasColumnName("OLD_Name")
                    .HasMaxLength(50);

                entity.Property(e => e.OldRam).HasColumnName("OLD_RAM");

                entity.Property(e => e.OldRecServerId).HasColumnName("OLD_RecServerId");

                entity.Property(e => e.OldSerialNumber).HasColumnName("OLD_SerialNumber");

                entity.Property(e => e.OldTechSupport)
                    .HasColumnName("OLD_TechSupport")
                    .HasMaxLength(1)
                    .IsUnicode(false);

                entity.Property(e => e.OldUps)
                    .HasColumnName("OLD_UPS")
                    .HasMaxLength(1)
                    .IsUnicode(false);

                entity.Property(e => e.OldWarrantyExpirationDate)
                    .HasColumnName("OLD_WarrantyExpirationDate")
                    .HasColumnType("date");

                entity.Property(e => e.UserName)
                    .HasMaxLength(100)
                    .HasDefaultValueSql("(stuff(suser_sname(),(1),charindex('\\',suser_sname()),''))");
            });

            modelBuilder.Entity<Systems>(entity =>
            {
                entity.HasKey(e => e.AudId)
                    .HasName("PK__Systems__D2F73E35B6FD274B");

                entity.ToTable("Systems", "audit");

                entity.Property(e => e.AudId).HasColumnName("AudID");

                entity.Property(e => e.DateFrom).HasColumnType("datetime");

                entity.Property(e => e.DateTo)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.NewCompanyName)
                    .HasColumnName("NEW_CompanyName")
                    .HasMaxLength(50);

                entity.Property(e => e.NewName)
                    .HasColumnName("NEW_Name")
                    .HasMaxLength(50);

                entity.Property(e => e.NewRecSystemId).HasColumnName("NEW_RecSystemId");

                entity.Property(e => e.NewTechSupport)
                    .HasColumnName("NEW_TechSupport")
                    .HasMaxLength(1)
                    .IsUnicode(false);

                entity.Property(e => e.NewTechSupportExpDate)
                    .HasColumnName("NEW_TechSupportExpDate")
                    .HasColumnType("date");

                entity.Property(e => e.NewVersion)
                    .HasColumnName("NEW_Version")
                    .HasMaxLength(50);

                entity.Property(e => e.OldCompanyName)
                    .HasColumnName("OLD_CompanyName")
                    .HasMaxLength(50);

                entity.Property(e => e.OldName)
                    .HasColumnName("OLD_Name")
                    .HasMaxLength(50);

                entity.Property(e => e.OldRecSystemId).HasColumnName("OLD_RecSystemId");

                entity.Property(e => e.OldTechSupport)
                    .HasColumnName("OLD_TechSupport")
                    .HasMaxLength(1)
                    .IsUnicode(false);

                entity.Property(e => e.OldTechSupportExpDate)
                    .HasColumnName("OLD_TechSupportExpDate")
                    .HasColumnType("date");

                entity.Property(e => e.OldVersion)
                    .HasColumnName("OLD_Version")
                    .HasMaxLength(50);

                entity.Property(e => e.UserName)
                    .HasMaxLength(100)
                    .HasDefaultValueSql("(stuff(suser_sname(),(1),charindex('\\',suser_sname()),''))");
            });
        }
    }
}
