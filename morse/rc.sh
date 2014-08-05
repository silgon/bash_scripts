function use_morse {
    export PATH=${PATH}:/opt/morse/$1/bin
    export PYTHONPATH=$PYTHONPATH:/opt/morse/$1/lib/python3:/opt/morse/$1/lib/python3/dist-packages
    # export MORSE_BLENDER=~/tmp/blender-2.69/blender
}
