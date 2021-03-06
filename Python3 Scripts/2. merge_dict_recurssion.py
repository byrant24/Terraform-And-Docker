D1 = {'a': 1, 'b': {'c': 3, 'd': [4, 5, 6]}, 'f': 7}
D2 = {'a': 1, 'c': 9, 'b': {'d': [8]}}


def merge_dict(dt1, dt2):
    for key in dt2:
        if key in dt1:
            if isinstance(dt1[key], (dict,)) and isinstance(dt2[key], (dict,)):
                merge_dict(dt1[key], dt2[key])
            elif isinstance(dt1[key], (list,)) and isinstance(dt2[key], (list,)):
                dt1[key].extend(dt2[key])
            elif isinstance(key, str) or isinstance(key, int):
                dt1[key] = dt2[key]
        else:
            dt1[key] = dt2[key]
    return dt1


if __name__ == '__main__':
    print(merge_dict(D1,D2))
