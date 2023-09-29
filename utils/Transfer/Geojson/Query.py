def uq(attr):
    if attr:
        if attr == "NULL":
            return attr
        if isinstance(attr, str) and attr.isdigit():
            return "{attr!s}".format(attr=attr)
        if isinstance(attr, str) and "'" in attr:
            splitted = attr.split("'")
            attr = "##".join(splitted)
            return "{attr!r}".format(attr=attr).replace("#", "'")
        return "{attr!r}".format(attr=attr)
    else:
        return "{attr!s}".format(attr="NULL")