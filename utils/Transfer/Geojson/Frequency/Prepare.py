import copy
import insert_db_dict


def fr_as_list(fr, fir, arp):
    if fir:
        return [{"cs": ["EMERG"], "cs_en": ["EMERG"], "tf": ["121.500 MHz"], "tr": ["121.500 MHz"], "tp": ["EMERG"]}]
    elif arp or len(fr) > 1:
        return fr
    else:
        return [fr]


def get_tr(row):
    if "tr" in row.keys() and row["tr"] != "":
        return float(row["tr"][:-4].replace(",", ".")), insert_db_dict.uomfrequency[row["tr"][-3:]]
    elif "tf" in row.keys() and row["tf"] != "":
        return float(row["tf"][:-4].replace(",", ".")), insert_db_dict.uomfrequency[row["tf"][-3:]]
    return None, None


def prepare_frequency(fr, uuid, arp, valid_time_begin, fir=False):
    fr = copy.deepcopy(fr)
    fr = fr_as_list(fir=fir, fr=fr, arp=arp)

    for fr_row in fr:
        fr_row["validTimeBegin"] = valid_time_begin
        fr_row["uuid"] = uuid
        fr_row["tr_1"], fr_row["tr_2"], fr_row["tf_1"], fr_row["tf_2"] = [None, None, None, None]
        if "tr" in fr_row.keys():
            fr_row["tr_1"], fr_row["tr_2"] = (get_tr(fr_row))
        if "tf" in fr_row.keys():
            fr_row["tf_1"], fr_row["tf_2"] = (get_tr(fr_row))
        fr_row.setdefault("tp", None)
        for key, value in fr_row.items():
            if value is None:
                fr_row[key] = None

        fr_row["tp_fr"] = insert_db_dict.unitType.get(fr_row["tp"], "OTHER: " + fr_row["tp"])
        fr_row["mask_ACP_RMP"] = fr_row["tp"] in ["ACP", "ACC", "APP", "ARR", "CTF", "CTL", "DEP", "TWR", "UAC", "GND", "CPT", "CLD", "RMP"]
        fr_row["mask_ACP"] = fr_row["tp"] in ["ACP", "ACC", "APP", "ARR", "CTF", "CTL", "DEP", "TWR", "UAC"]
        fr_row["mask_GND"] = fr_row["tp"] in ["GND", "CPT", "CLD", "RMP"]
        fr_row["mask_EMR"] = fr_row["tp"] in ["EMR"]
        fr_row["mask_OTHER"] = fr_row["tp"] not in ["ACP", "ACC", "APP", "ARR", "CTF", "CTL", "DEP", "TWR", "UAC", "GND", "CPT", "CLD", "RMP", "EMR"]
        fr_row["tp_fr"] = insert_db_dict.unitType.get(fr_row["tp"], 'OTHER: ' + fr_row["tp"])
        fr_row["service_type"] = insert_db_dict.InformationServiceType.get(fr_row["tp"], 'OTHER: ' + fr_row["tp"])

    return fr
