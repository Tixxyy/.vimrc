def FlagsForFile(filename, **kwargs ):
    flags = []
    data = kwargs['client_data']
    filetype = data['&filetype']
    if filetype == 'c':
        flags = [
            '-Wall',
            'std=c99',
            '-x',
            'c',
            'cc',
            '-I',
            '.',
            '-isystem',
            '/usr/include/'
        ]
    elif filetype == 'cpp':
        flags = [
            '-Wall',
            '-std=c++14',
            '-x',
            'c++',
            '-I',
            '.',
            '-isystem',
            '/usr/include/c++/7/'
        ]
    else:
        flags = []

    return {
        'flags': flags,
        'do_cache': True
    }
