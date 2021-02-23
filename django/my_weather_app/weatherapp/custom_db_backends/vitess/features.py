from django.db.backends.mysql.features import DatabaseFeatures as MysqlBaseDatabaseFeatures

class DatabaseFeatures(MysqlBaseDatabaseFeatures):
    supports_transactions = True
    uses_savepoints = True
    supports_foreign_keys = True
