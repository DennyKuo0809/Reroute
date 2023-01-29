# $1: path to input file (network scenario)
# $2: path to output file (ini file)
# $3: path to output file (ned file)
tmp_file="tmp"
type1_route="$1_type1.pickle"
type2_route="$1_type2.pickle"
python3.9 cycle/main.py $1 shortest_path > tmp_file
python3.9 src/cycle/parse_route.py tmp_file type1_route
python3.9 src/cycle/johnson_new_mod.py \
--scenario $1 \
--trim 0.3 \
--reserve 0.3 \
--type1_route type1_route \
--output type2_route \
--warmup True
python3.9 src/generators/main.py \
--scenario input/5.in \
--type1_route type1_route \
--type2_route type2_route \
--ini_output $2 \
--ned_output $3
rm tmp_file
rm type1_route
rm type2_route