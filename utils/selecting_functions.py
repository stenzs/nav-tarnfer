from database.Engine import connection

db, cursor, engine = connection.db, connection.cursor, connection.engine


def select_arp_number():
    cursor.execute("""
    SELECT TRIM(LEADING 'RU' FROM AirportHeliportTimeslice.designator)
    FROM AirportHeliportTimeslice
    WHERE locationIndicatorICAO IS NULL AND designator SIMILAR TO 'RU%'
    ORDER BY designator DESC LIMIT 1""")
    row = cursor.fetchone()
    return int(row[0]) if row else 0
