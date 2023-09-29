from dataclasses import dataclass
import re
import insert_db_dict
from Transfer.Tools import LatLonTool
from Transfer.Geojson.Query import uq


def adapt_feature(feature):
    for key in [
        "_transasID", "ah_icao", "ah_name", "coordinates_str", "designator",
        "field_named_type", "isa", "ist", "name", "nilreason",
        "point_str", "purpose", "type_", "validTimeBegin", "channel",
        "translation", "tacan_channel", "uuidarphlp"
    ]:
        value = feature.get(key)
        if isinstance(value, str):
            value = value.replace("'", "''")
            value = f"'{value}'"
            feature[key] = value

    for key, value in feature.items():
        if value is None:
            feature[key] = "NULL"

def return_wkt(coords, geom_tp):
    if geom_tp == 'LineString':
        geom = LineString(coords)
    elif geom_tp == 'Polygon':
        geom = Polygon(coords[0])
    else:
        geom = Point(coords[:2])
    return geom.wkt


def prepare_feature(feature, valid_time_begin, id_field_name, airac, channels_dict, airports_heliports_dict):
    attrs = Prepare(feature, valid_time_begin, id_field_name, airac, channels_dict, airports_heliports_dict)
    prepared_feature = PreparedFeature(
        _transasID=attrs._transasID,
        name=attrs.name,
        ah_icao=attrs.ah_icao,
        ah_name=attrs.ah_name,
        channel=attrs.channel,
        coordinates=attrs.coordinates,
        coordinates_str=attrs.coordinates_str,
        designator=attrs.designator,
        elevation_origin=attrs.elevation_origin,
        geometry=attrs.geometry,
        isa=attrs.isa,
        ist=attrs.ist,
        tf=attrs.tf,
        tp=attrs.tp,
        md=attrs.md,
        translation=attrs.translation,
        type_=attrs.type_,
        validTimeBegin=attrs.validTimeBegin,
        magneticVariation=attrs.magneticVariation,
        tacan_channel=attrs.tacan_channel,
        srid=attrs.srid,
        point_str=attrs.point_str,
        geom=attrs.geom,
        latitude=attrs.latitude,
        longitude=attrs.longitude,
        height_value=attrs.height_value,
        height_uom=attrs.height_uom,
        nilreason=attrs.nilreason,
        non_numeric=attrs.non_numeric,
        elevation=attrs.elevation,
        purpose=attrs.purpose,
        field_named_type=attrs.field_named_type,
        sequencenumber=attrs.sequencenumber,
        uuidarphlp=attrs.uuidarphlp,
        frequency=attrs.frequency
    )
    return prepared_feature.__dict__


@dataclass
class PreparedFeature:
    validTimeBegin: str
    _transasID: str
    name: str
    ah_icao: str
    ah_name: str
    channel: str
    coordinates: str
    coordinates_str: str
    designator: str
    elevation_origin: str
    geometry: str
    isa: str
    ist: str
    tf: str
    tp: str
    md: str
    translation: str
    type_: str
    validTimeBegin: str
    magneticVariation: str
    tacan_channel: str
    srid: str
    point_str: str
    geom: str
    latitude: str
    longitude: str
    height_value: str
    height_uom: str
    nilreason: str
    elevation: str
    non_numeric: str
    purpose: str
    field_named_type: str
    sequencenumber: str
    uuidarphlp: str
    frequency: str


class Prepare:
    def __init__(self, feature, valid_time_begin, id_field_name, airac, channels_dict, airports_heliports_dict):
        self.valid_time_begin = valid_time_begin
        self.id_field_name = id_field_name
        self.airac = airac
        self.channels_dict = channels_dict
        self.airports_heliports_dict = airports_heliports_dict

        self.feature = feature
        self.properties = feature["properties"]

        self._geometry = feature["geometry"]
        self._coordinates = self._geometry["coordinates"]
        self._latitude, self._longitude = LatLonTool().set_lat_lon(self.properties)

    @property
    def _transasID(self):
        return self.properties[self.id_field_name]

    @property
    def name(self):
        return self.properties["nl_en"].replace("'", "")

    @property
    def ah_icao(self):
        return self.properties.get("ah_icao")

    @property
    def ah_name(self):
        return self.properties.get("ah_name")

    @property
    def channel(self):
        channel = self.properties["tf"].replace("'", "")
        channel = int(channel) if channel.isdigit() else channel
        return channel

    @property
    def coordinates(self):
        return self._coordinates

    @property
    def coordinates_str(self):
        return str(self._coordinates)

    @property
    def designator(self):
        designator = self.properties.get("nm")
        designator = int(designator) if designator.isdigit() else designator
        return designator

    @property
    def elevation_origin(self):
        return self.properties.get("elevation")

    @property
    def geometry(self):
        return self._geometry

    @property
    def isa(self):
        return self.properties.get("isa")

    @property
    def ist(self):
        return self.properties.get("ist")

    @property
    def tf(self):
        return self.properties.get("tf")

    @property
    def tp(self):
        return self.properties.get("tp")

    @property
    def md(self):
        md = self.properties.get("md")
        if md is None:
            return md
        md = float(re.search("[-?\d,]*", md).group().replace(",", "."))
        md = md if md != 0 else None
        return md

    @property
    def translation(self):
        return self.properties.get("nl")

    @property
    def type_(self):
        return self.geometry["type"]

    @property
    def validTimeBegin(self):
        return str(self.valid_time_begin)

    @property
    def magneticVariation(self):
        return self.md

    @property
    def tacan_channel(self):
        if self.tp is None or self.tp not in ["VORTAC", "TACAN", "MILTACAN"]:
            return None

        tf = float(self.tf[:-4].replace(",", "."))
        tacan_channel = self.channels_dict[tf]

        return tacan_channel

    @property
    def srid(self):
        srid = self.properties.get("srid")
        if srid is None:
            return None
        srid = srid.replace(" ", "")
        srid = insert_db_dict.srid_type.get(srid)
        return srid

    @property
    def point_str(self):
        point_str = return_wkt(self._coordinates, "Point")
        return point_str

    @property
    def geom(self):
        geom = self.point_str
        geom = uq(geom)
        geom = f"ST_GeomFromText({geom}, 4326)"
        return geom

    @property
    def latitude(self):
        return self._latitude

    @property
    def longitude(self):
        return self._longitude

    @property
    def height_value(self):
        height = self.properties.get("height")
        if height is None:
            return None
        height_value = int(height[:-2])
        return height_value

    @property
    def height_uom(self):
        height = self.properties.get("height")
        if height is None:
            return None
        height_uom = insert_db_dict.uomdistance[height[-1:]]
        return height_uom

    @property
    def nilreason(self):
        height = self.properties.get("height")
        if height is None:
            return "missing"
        return None

    @property
    def non_numeric(self):
        return None

    @property
    def elevation(self):
        height = self.properties.get("height")
        if height is None:
            return None
        elevation = f"ROW({uq(self.height_value)}, {self.non_numeric}, {uq(self.height_uom)}, {self.nilreason})"
        return elevation

    @property
    def purpose(self):
        purpose = "ENROUTE"
        if self.isa:
            if self.isa == u"да" and self.ist == u"нет":
                purpose = "TERMINAL"
            if self.isa == u"да" and self.ist == u"да":
                purpose = "ALL"
            if self.isa == u"нет" and self.ist == u"нет":
                purpose = None
        return purpose

    @property
    def field_named_type(self):
        return insert_db_dict.navaidtype[self.tp]

    @property
    def sequencenumber(self):
        return self.airac

    @property
    def uuidarphlp(self):
        if self.ah_icao is None:
            return None

        uuidarphlp = self.airports_heliports_dict.get(self.ah_icao)

        return uuidarphlp

    @property
    def frequency(self):
        frequency = None
        if self.tf:
            if self.tf is None:
                frequency = f"ROW(0, 'HZ')"
            elif re.search("[a-zA-Z]", self.tf):
                frequency = f"ROW({uq(float(self.tf[:-4].replace(',', '.')))}, {uq(insert_db_dict.uomfrequency.get(self.tf[-3:]))})"
            else:
                frequency = f"ROW({uq(float(self.tf.replace(',', '.')))}, 'OTHER: ')"
        return frequency





