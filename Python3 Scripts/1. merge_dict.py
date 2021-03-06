D1 = {'a': 1, 'b': 2, 'd': 4, 'e': [5], 1: 4}
D2 = {'c': 3, 'd': 11, 'e': [9, 10], 1: 5}

def merge_dict():
    for key in D2:
        if key in D1:
            if isinstance(D1[key], (list,)) and isinstance(D2[key], (list,)):
                D1[key].extend(D2[key])
            elif isinstance(key, str) or isinstance(key, int):
                D1[key] = D2[key]
        else:
            D1[key] = D2[key]
    print(D1)


if __name__ == '__main__':
    merge_dict()
