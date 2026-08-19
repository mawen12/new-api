cheatsheet do
    title 'Think GORM'
    docset_file_name 'Think_gorm'
    keyword 'gorm'
    style '
        code {
            border: none;
            white-space: pre;
        }
        
        code::before, code::after {
            content: "";
        }

        tr {
            border-bottom: 2px dashed #b8b8b8;
        }
    '

    category do 
        id '初始化'

        entry do
            name 'MySQL'
            notes <<-'END'
                import (
                    "gorm.io/gorm"
                    "gorm.io/gorm/logger"

                    "gorm.io/driver/mysql"
                )

                db := gorm.Open(mysql.Open(dsn), &gorm.Config{
                    PrepareStmt: true,
                    Logger: logger.New()
                }) 
            END
        end
        entry do
            name 'SQLLite'
            notes <<-'END'
                import (
                    "gorm.io/gorm"
                    "gorm.io/gorm/logger"

                    "github.com/glebarez/sqlite"
                )

                db := gorm.Open(sqlite.Open(dsn), &gorm.Config{
                    PrepareStmt: true,
                    Logger: logger.New()
                }) 
            END
        end
        entry do
            name 'Postgres'
            notes <<-'END'
                import (
                    "gorm.io/gorm"
                    "gorm.io/gorm/logger"

                    "gorm.io/driver/postgres"
                )

                db := gorm.Open(postgres.Open(dsn), &gorm.Config{
                    PrepareStmt: true,
                    Logger: logger.New()
                })
            END
        end
        entry do
            name 'ClickHouse'
            notes <<-'END'
                import (
                    "gorm.io/gorm"
                    "gorm.io/gorm/logger"

                    "gorm.io/driver/clickhouse"
                )

                db := gorm.Open(clickhouse.Open(dsn), &gorm.Config{
                    PrepareStmt: true,
                    Logger: logger.New()
                })
            END
        end
    end

    category do
        id 'CRUD'

        entry do
            name 'Select'
            notes <<-'END'
                var users []User

                // SELECT id, name, age FROM users WHERE age = ?
                err := db.Table("users").
                    Select("id, name, age").
                    Where("age = ?", age).
                    Scan(&users).Error
            END
        end
        entry do
            name 'Select Simple'
            notes <<-'END'
                var users []User

                // SELECT * FROM users WHERE age = ?
                db.Find(&users, "age = ?", age)
            END
        end
        entry do
            name 'Select multi condition'
            notes <<-'END'
                var users []User

                // SELECT * FROM users WHERE name = ? AND age = ?
                db.Find(&users, "name = ? AND age = ?", name, age)
            END
        end
        entry do
            name 'Delete'
            notes <<-'END'
                // DELETE FROM users WHERE age = ? 
                err := db.Where("age = ?", age).Delete(&User{}).Error
            END
        end
        entry do
            name 'Update by ID'
            notes <<-'END'
                // UPDATE users SET age = ? WHERE id = ? 
                err := db.Model(&user).Update("age", age).Error
            END
        end
        entry do
            name 'Update by condition'
            notes <<-'END'
                // UPDATE users SET age = ? WHERE name = ? 
                err := db.Model(&User{}).Update("age", age).Error
            END
        end
        entry do
            name 'Insert'
            notes <<-'END'
                err := db.Create(&user).Error
            END
        end
    end
    
end