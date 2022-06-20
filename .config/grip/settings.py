import os

# Define the `CACHE_DIRECTORY`
if os.environ.get('XDG_CACHE_HOME'):
    CACHE_DIRECTORY = os.path.join(
        os.environ.get('XDG_CACHE_HOME'),
        'grip/',
    )
elif os.environ.get('HOME'):
    CACHE_DIRECTORY = os.path.join(
        os.environ.get('HOME'),
        '.cache/grip/',
    )
else:
    # will be computed relative to
    # the env variable $GRIPHOME
    CACHE_DIRECTORY = '.cache/'
