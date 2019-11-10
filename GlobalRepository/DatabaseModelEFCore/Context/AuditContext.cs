using System;
using DatabaseModelEFCore.AuditModels;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

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
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. See http://go.microsoft.com/fwlink/?LinkId=723263 for guidance on storing connection strings.
                optionsBuilder.UseSqlServer("Server=.\\SQLExpress;Database=GlobalRepository;Trusted_Connection=True;");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<AuditAccounts>(entity =>
            {
                entity.HasNoKey();

                entity.ToView("AuditAccounts", "web");

                entity.Property(e => e.DateFrom).HasColumnType("datetime");

                entity.Property(e => e.DateTo).HasColumnType("datetime");

                entity.Property(e => e.NewCountryRegionCode)
                    .HasColumnName("NEW_CountryRegionCode")
                    .HasMaxLength(3);

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

                entity.Property(e => e.NewServerExId).HasColumnName("NEW_ServerExId");

                entity.Property(e => e.NewSystemExId).HasColumnName("NEW_SystemExId");

                entity.Property(e => e.NewTofix)
                    .HasColumnName("NEW_Tofix")
                    .HasMaxLength(1)
                    .IsUnicode(false)
                    .IsFixedLength();

                entity.Property(e => e.NewType)
                    .HasColumnName("NEW_Type")
                    .HasMaxLength(1)
                    .IsUnicode(false)
                    .IsFixedLength();

                entity.Property(e => e.NewUserId).HasColumnName("NEW_UserId");

                entity.Property(e => e.OldCountryRegionCode)
                    .HasColumnName("OLD_CountryRegionCode")
                    .HasMaxLength(3);

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

                entity.Property(e => e.OldServerExId).HasColumnName("OLD_ServerExId");

                entity.Property(e => e.OldTofix)
                    .HasColumnName("OLD_Tofix")
                    .HasMaxLength(1)
                    .IsUnicode(false)
                    .IsFixedLength();

                entity.Property(e => e.OldType)
                    .HasColumnName("OLD_Type")
                    .HasMaxLength(1)
                    .IsUnicode(false)
                    .IsFixedLength();

                entity.Property(e => e.OldUserId).HasColumnName("OLD_UserId");

                entity.Property(e => e.OldsystemExId).HasColumnName("OLDSystemExId");

                entity.Property(e => e.UserName).HasMaxLength(100);
            });

            modelBuilder.Entity<AuditServers>(entity =>
            {
                entity.HasNoKey();

                entity.ToView("AuditServers", "web");

                entity.Property(e => e.DateFrom).HasColumnType("datetime");

                entity.Property(e => e.DateTo).HasColumnType("datetime");

                entity.Property(e => e.NewAntivirusSoftware)
                    .HasColumnName("NEW_AntivirusSoftware")
                    .HasMaxLength(1)
                    .IsUnicode(false)
                    .IsFixedLength();

                entity.Property(e => e.NewCountryRegionCode)
                    .HasColumnName("NEW_CountryRegionCode")
                    .HasMaxLength(3);

                entity.Property(e => e.NewCputype).HasColumnName("NEW_CPUType");

                entity.Property(e => e.NewHardDisk)
                    .HasColumnName("NEW_HardDisk")
                    .HasMaxLength(1)
                    .IsUnicode(false)
                    .IsFixedLength();

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

                entity.Property(e => e.NewSerialNumber).HasColumnName("NEW_SerialNumber");

                entity.Property(e => e.NewTechSupport)
                    .HasColumnName("NEW_TechSupport")
                    .HasMaxLength(1)
                    .IsUnicode(false)
                    .IsFixedLength();

                entity.Property(e => e.NewUps)
                    .HasColumnName("NEW_UPS")
                    .HasMaxLength(1)
                    .IsUnicode(false)
                    .IsFixedLength();

                entity.Property(e => e.NewWarrantyExpirationDate)
                    .HasColumnName("NEW_WarrantyExpirationDate")
                    .HasColumnType("date");

                entity.Property(e => e.OldAntivirusSoftware)
                    .HasColumnName("OLD_AntivirusSoftware")
                    .HasMaxLength(1)
                    .IsUnicode(false)
                    .IsFixedLength();

                entity.Property(e => e.OldCountryRegionCode)
                    .HasColumnName("OLD_CountryRegionCode")
                    .HasMaxLength(3);

                entity.Property(e => e.OldCputype).HasColumnName("OLD_CPUType");

                entity.Property(e => e.OldHardDisk)
                    .HasColumnName("OLD_HardDisk")
                    .HasMaxLength(1)
                    .IsUnicode(false)
                    .IsFixedLength();

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

                entity.Property(e => e.OldSerialNumber).HasColumnName("OLD_SerialNumber");

                entity.Property(e => e.OldTechSupport)
                    .HasColumnName("OLD_TechSupport")
                    .HasMaxLength(1)
                    .IsUnicode(false)
                    .IsFixedLength();

                entity.Property(e => e.OldUps)
                    .HasColumnName("OLD_UPS")
                    .HasMaxLength(1)
                    .IsUnicode(false)
                    .IsFixedLength();

                entity.Property(e => e.OldWarrantyExpirationDate)
                    .HasColumnName("OLD_WarrantyExpirationDate")
                    .HasColumnType("date");

                entity.Property(e => e.UserName).HasMaxLength(100);
            });

            modelBuilder.Entity<AuditSystems>(entity =>
            {
                entity.HasNoKey();

                entity.ToView("AuditSystems", "web");

                entity.Property(e => e.DateFrom).HasColumnType("datetime");

                entity.Property(e => e.DateTo).HasColumnType("datetime");

                entity.Property(e => e.NewCompanyName)
                    .HasColumnName("NEW_CompanyName")
                    .HasMaxLength(50);

                entity.Property(e => e.NewName)
                    .HasColumnName("NEW_Name")
                    .HasMaxLength(50);

                entity.Property(e => e.NewTechSupport)
                    .HasColumnName("NEW_TechSupport")
                    .HasMaxLength(1)
                    .IsUnicode(false)
                    .IsFixedLength();

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

                entity.Property(e => e.OldTechSupport)
                    .HasColumnName("OLD_TechSupport")
                    .HasMaxLength(1)
                    .IsUnicode(false)
                    .IsFixedLength();

                entity.Property(e => e.OldTechSupportExpDate)
                    .HasColumnName("OLD_TechSupportExpDate")
                    .HasColumnType("date");

                entity.Property(e => e.OldVersion)
                    .HasColumnName("OLD_Version")
                    .HasMaxLength(50);

                entity.Property(e => e.UserName).HasMaxLength(100);
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
