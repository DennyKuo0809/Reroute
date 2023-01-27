# $1: input file (network scenario)
# $2: the type1 method
# $3: the file contains route of type1
# $4: output file
rm -f tmp
python3.9 cycle/main.py $1 $2 > tmp
python3.9 src/cycle/parse_route.py tmp $3
python3.9 src/cycle/johnson_new_mod.py \
--scenario $1 \
--trim 0.3 \
--reserve 0.3 \
--type1_route $3 \
--output $4 \
--warmup True
