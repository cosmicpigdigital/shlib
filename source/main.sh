test $SHLIB_SH_LOADED && return;
SHLIB_SH_LOADED=1;

##
## Constants
##

##------------------------------------------------------------------------------
export sh_Platform=$(uname);
export sh_IsGNU=$(test $sh_Platform == "Linux" && echo "1");
export sh_IsMacOS=$(test $sh_Platform == "Darwin" && echo "1");


##
## Functions
##

##------------------------------------------------------------------------------
function sh_get_arg()
{
    ## @brief: Gets the value of the flag if it exits on $@.
    ## @param: $1   - Flag to be searched.
    ## @param: $2.. - The command line args.
    ## @return: The value of the flag - if found - or empty string.
    ## @example: $(sh_get_arg "--force" $@);

    local flag="$1"; shift;

    for i in $(seq 1 $#); do
        if [ "$1" == "$flag" ]; then
            shift; echo $1;
            return;
        fi;
        shift;
    done;
}

##------------------------------------------------------------------------------
function sh_get_file_extension()
{
    ## @brief: Returns the file extension if exists...
    ## @param: $1 - The filename.
    ## @example: $(sh_get_filename "test.sh"); ## -> sh;

    local filename="$1";
    echo "${filename##*.}";
}

##------------------------------------------------------------------------------
## https://stackoverflow.com/a/17841619
function sh_join_by()
{
    local d=${1-} f=${2-}
    if shift 2; then
        printf %s "$f" "${@/#/$d}"
    fi
}
