import copy
import itertools
import re

# flatten = itertools.chain.from_iterable


class LatLonTool:

    def set_lat_lon(self, properties):

        properties = copy.deepcopy(properties)
        latitude = properties["coordinates"][1] if not properties.get("latitude") else properties["latitude"]
        longitude = properties["coordinates"][0] if not properties.get("longitude") else properties["longitude"]
        latitude = self.coordlbl_point(latitude)
        longitude = self.coordlbl_point(longitude)

        return latitude, longitude

    @staticmethod
    def coordlbl_point(coord):
        if isinstance(coord, float):
            return coord
        if re.search(r'”', coord) and re.search(r'’', coord):
            latlon = re.split(u' ', re.sub(r',', u'', re.sub(r'\s+$', u'', re.sub(r'°|’|”|E|N|W|S', ' ', coord))))
            degrees, minutes, seconds = float(latlon[0]), float(latlon[1]), float(latlon[2])
            return -(degrees + minutes / 60 + seconds / 3600) if re.search(r'W|S', coord) \
                else degrees + minutes / 60 + seconds / 3600
        # запись вида 050°08,1’ E или 55°12’ N
        if re.search(r'°', coord) and re.search(r'’', coord) and not re.search(r'”', coord):
            latlon = re.split(u' ', re.sub(r',', u'', re.sub(r'\s+$', u'', re.sub(r'°|’|”|E|N|W|S', ' ', coord))))
            degrees, minutes = float(latlon[0]), float(latlon[1])
            return -(degrees + minutes / 60) if re.search(r'W|S', coord) \
                else degrees + minutes / 60
        else:
            if re.search(r',', coord) and coord.split(' ')[0][-1] == '°':
                value = coord.split(' ')[0][:-1]
                return float(str.replace(value, ',', '.'))
            # остались десятичные градусы
            value = re.sub(r',', u'', re.sub(r'\s+$', u'', re.sub(r'°|E|N|W|S', ' ', coord)))
            return float(re.search('\d.+', value).group()) * (-1) if re.search(r'W|S', coord) \
                else re.search('\d.+', value).group()

