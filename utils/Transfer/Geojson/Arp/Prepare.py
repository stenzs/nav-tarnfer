from typing import Union
from dataclasses import dataclass
import re
import insert_db_dict
from Transfer.Tools import LatLonTool
from Transfer.Geojson.Query import uq


def adapt_feature(feature):
    for key, value in feature.items():
        if value is None:
            feature[key] = None


def prepare_feature(feature, feature_number, valid_time_begin, id_field_name, airac, numbers):
    attrs = Prepare(feature, feature_number, valid_time_begin, id_field_name, airac, numbers)
    prepared_feature = PreparedFeature(
        validTimeBegin=attrs.validTimeBegin,
        sequencenumber=attrs.sequencenumber,
        geometry=attrs.geometry,
        coordinates=attrs.coordinates,
        latitude=attrs.latitude,
        longitude=attrs.longitude,
        number=attrs.number,
        designator=attrs.designator,
        mask=attrs.mask,
        _transasID=attrs._transasID,
        elevation_origin=attrs.elevation_origin,
        aip_=attrs.aip_,
        type=attrs.type,
        source_=attrs.source_,
        flight_rules_=attrs.flight_rules_,
        md=attrs.md,
        nl_en=attrs.nl_en,
        st=attrs.st,
        tp=attrs.tp,
        nl=attrs.nl,
        flr=attrs.flr,
        fr=attrs.fr,
        state=attrs.state,
        lighting_=attrs.lighting_,
        abandoned=attrs.abandoned,
        magneticvariation=attrs.magneticvariation,
        point_str=attrs.point_str,
        geom=attrs.geom,
        srid=attrs.srid,
        light_nilreason=attrs.light_nilreason,
        le=attrs.le,
        elev=attrs.elev,
        elev_unit=attrs.elev_unit,
        elevation=attrs.elevation,
        name=attrs.name,
        locationindicatoricao=attrs.locationindicatoricao,
        mask_flr=attrs.mask_flr,
        mask_ARP=attrs.mask_ARP,
        mask_AD=attrs.mask_AD,
        mask_fr=attrs.mask_fr,
        field_named_type=attrs.field_named_type,
        controltype=attrs.controltype,
        operationalstatus=attrs.operationalstatus,
        translation=attrs.translation,
        verticaldatum=attrs.verticaldatum
    )
    return prepared_feature.__dict__


@dataclass
class PreparedFeature:
    validTimeBegin: str
    sequencenumber: int
    geometry: str
    coordinates: str
    latitude: str
    longitude: str
    number: str
    designator: str
    mask: str
    _transasID: str
    elevation_origin: str
    aip_: str
    type: str
    source_: str
    flight_rules_: str
    md: str
    nl_en: str
    st: str
    tp: str
    nl: str
    flr: str
    fr: str
    state: str
    lighting_: str
    abandoned: str
    magneticvariation: Union[None, float]
    point_str: str
    geom: str
    srid: str
    light_nilreason: str
    le: str
    elev: str
    elev_unit: str
    elevation: str
    name: str
    locationindicatoricao: str
    mask_flr: str
    mask_ARP: str
    mask_AD: str
    mask_fr: bool
    field_named_type: str
    controltype: str
    operationalstatus: str
    translation: str
    verticaldatum: str


class Prepare:
    def __init__(self, feature, feature_number, valid_time_begin, id_field_name, airac, numbers):

        self.valid_time_begin = valid_time_begin
        self.id_field_name = id_field_name
        self.airac = airac

        self.feature = feature
        self.properties = feature["properties"]

        self._geometry = feature["geometry"]
        self._coordinates = self._geometry["coordinates"]
        self._latitude, self._longitude = LatLonTool().set_lat_lon(self.properties)
        self._number = numbers[feature_number]
        self._designator, self._mask = self.set_designator()


    def set_designator(self):

        if self.properties.get("nm", False) is False:
            nm, mask = "RU%04d" % self._number, True
        else:
            nm, mask = None, self.properties["nm"] is None or not re.match(u"([A-Z]|\d){3,6}", self.properties["nm"])
            if mask:
                nm, mask = "RU%04d" % self._number, "True"
            if not mask:
                nm, mask = re.search("([A-Z]|\d){3,6}", self.properties["nm"]).group(0), None
        return nm, mask

    @property
    def validTimeBegin(self):
        return str(self.valid_time_begin)

    @property
    def sequencenumber(self):
        return int(self.airac)

    @property
    def geometry(self):
        return self._geometry

    @property
    def coordinates(self):
        return self._coordinates

    @property
    def latitude(self):
        return self._latitude

    @property
    def longitude(self):
        return self._longitude

    @property
    def number(self):
        return self._number

    @property
    def designator(self):
        return self._designator

    @property
    def mask(self):
        return self._mask

    @property
    def _transasID(self):
        return self.properties[self.id_field_name]

    @property
    def elevation_origin(self):
        return self.properties["elevation"]

    @property
    def aip_(self):
        return self.properties["aip"]

    @property
    def source_(self):
        return self.properties["src"]

    @property
    def flight_rules_(self):
        return self.properties.get("flr")

    @property
    def md(self):
        return self.properties.get("md")

    @property
    def nl_en(self):
        return self.properties.get("nl_en")

    @property
    def st(self):
        return self.properties.get("st")

    @property
    def tp(self):
        return self.properties.get("tp")

    @property
    def nl(self):
        return self.properties.get("nl")

    @property
    def flr(self):
        return self.properties.get("flr")

    @property
    def fr(self):
        return self.properties.get("fr")

    @property
    def state(self):
        return self.properties.get("state")

    @property
    def lighting_(self):
        return self.properties.get("le")

    @property
    def abandoned(self):
        return (None, insert_db_dict.abandoned[self.st])

    @property
    def magneticvariation(self):
        if self.md:
            magnetic_variation = float(self.md[:-1].replace(",", ".")) if self.md else None
            magnetic_variation = None if magnetic_variation == 0.0 else magnetic_variation
            return magnetic_variation
        return None

    @property
    def point_str(self):
        return f"POINT({self.coordinates[0]} {self.coordinates[1]})"

    @property
    def geom(self):
        return self.point_str

    @property
    def srid(self):
        srid = self.properties.get("srid", "UNK").replace(" ", "")
        srid = insert_db_dict.srid_type.get(srid)
        srid = int(srid)
        return srid

    @property
    def light_nilreason(self):
        light_nilreason = "missing"
        if self.properties["le"]:
            light_nilreason = insert_db_dict.classLighting_nill.get(self.properties["le"], None)
        return light_nilreason

    @property
    def le(self):
        if self.properties["le"]:
            le = insert_db_dict.classLighting.get(self.properties["le"])
        else:
            le = None
        return le

    @property
    def elev(self):
        if self.properties["elevation"]:
            elev = float(self.elevation_origin.get("value").replace(",", "."))
        else:
            elev = None
        return elev

    @property
    def elev_unit(self):
        if self.properties["elevation"]:
            elev_unit = self.elevation_origin.get("unit")
        else:
            elev_unit = None
        return elev_unit

    @property
    def elevation(self):
        if type(self.elev) in [int, float]:
            elevation_value = int(self.elev)
        else:
            elevation_value = "NULL"
        elevation = uq(f'ROW({elevation_value}, , {uq(self.elev_unit)}, NULL)')

        elevation = (elevation_value, None, self.elev_unit, None)

        return elevation

    @property
    def name(self):
        if self.nl_en is not None:
            name = self.nl_en.replace("(CLOSED)", "").replace("/CLOSED", "").replace("CLOSED", "").replace("'", "`")
        else:
            name = self.nl_en
        return name

    @property
    def locationindicatoricao(self):
        if self.properties.get("nm") \
                and self.properties["nm"] is not None \
                and not any(char.isdigit() for char in self.properties["nm"]) \
                and not re.match(u"[А-Я]+", self.properties["nm"]) \
                and len(self.properties["nm"]) == 4:
            get_location_indicator_icao = self.properties["nm"]
        else:
            get_location_indicator_icao = None
        return get_location_indicator_icao

    @property
    def mask_flr(self):
        if self.flight_rules_:
            mask_flr = re.match(u"ППП", self.flight_rules_) is not None
        else:
            mask_flr = False
        return mask_flr

    @property
    def mask_ARP(self):
        if self._transasID is not None:
            mask_arp = self._transasID[:3] == "ARP"
        else:
            mask_arp = False
        return mask_arp

    @property
    def mask_AD(self):
        if self.tp != u"гидроаэродром" and self.mask_ARP:
            mask_ad = "True"
        else:
            mask_ad = None
        return mask_ad

    @property
    def mask_fr(self):
        if self.fr:
            mask_fr = False if self.fr is None or self.fr == "None" else True
        else:
            mask_fr = False
        return mask_fr

    @property
    def field_named_type(self):
        field_named_type = "OTHER: HA"
        if not self.mask_ARP:
            field_named_type = insert_db_dict.als_type[self.tp]
        if self.mask_ARP and self.mask_AD:
            field_named_type = "AD"
        return field_named_type

    @property
    def controltype(self):
        control_type = None
        if self.mask_ARP:
            control_type = insert_db_dict.control_type[self.tp]
        return control_type

    @property
    def operationalstatus(self):
        return "(,NORMAL)"

    @property
    def translation(self):
        translation = None
        if self.nl:
            translation = self.nl.replace("/ЗАКРЫТ", "").replace("(ЗАКРЫТ)", "").replace("/ЗАКРТЫТ", "")\
                .replace("ЗАКРЫТ", "").replace("'", "`") if self.nl is not None else self.nl
        return translation

    @property
    def verticaldatum(self):
        return "OTHER: Baltic height"

    @property
    def type(self):
        return self.field_named_type
