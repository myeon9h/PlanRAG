# Data parser

Data parser has three different directories.
* diplomacy
* trading
* industry

Each of these directory provides parsing code for generating data from raw dataset.

## How to use

#### Trading case
if you want to generate data from raw file, execute this code on /GRAND-LLM.
```
python ./src/data_parsers/trading/queries_gen/main.py
```

queries_gen 은 raw 데이터를 structured format 으로 가공하는 코드이다.

### Industry case
...