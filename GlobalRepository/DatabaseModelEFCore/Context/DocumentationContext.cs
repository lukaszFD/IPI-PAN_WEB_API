using System;
using DatabaseModelEFCore.Models.Documentation;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace DatabaseModelEFCore.Context
{
    public partial class DocumentationContext : DbContext
    {
        public DocumentationContext()
        {
        }

        public DocumentationContext(DbContextOptions<DocumentationContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Views> Views { get; set; }

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
            modelBuilder.Entity<Views>(entity =>
            {
                entity.HasNoKey();

                entity.ToView("views", "documentation");

                entity.Property(e => e.ColumnId).HasColumnName("column_id");

                entity.Property(e => e.ColumnName)
                    .HasColumnName("column_name")
                    .HasMaxLength(128);

                entity.Property(e => e.DataType)
                    .HasColumnName("data_type")
                    .HasMaxLength(128);

                entity.Property(e => e.Description).HasColumnType("sql_variant");

                entity.Property(e => e.IsNullable).HasColumnName("is_nullable");

                entity.Property(e => e.MaxLength).HasColumnName("max_length");

                entity.Property(e => e.Precision).HasColumnName("precision");

                entity.Property(e => e.SchemaName)
                    .HasColumnName("schema_name")
                    .HasMaxLength(128);

                entity.Property(e => e.TableName)
                    .IsRequired()
                    .HasColumnName("table_name")
                    .HasMaxLength(128);
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
