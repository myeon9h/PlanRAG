import country
import goods

if __name__ == "__main__":

    game_savefile = "./data/building/raw/test.v3"
    goods_file = "./data/building/raw/goods/00_goods.txt"

    country_code = "GBR"

    # cnt = country.country_finder_as_code(game_savefile, country_code)
    cnt = country.country_extracting(game_savefile, country_code)
    market_dict = cnt.market
    goods_list = goods.goods_finder(goods_file)

    print("{:10}|{:20}|{:15}|{:15}|{:10} ".format("id","Goods", "Base prices", "Current prices", "Changes"))
    print("-------------------------------------------------------------------")
    for key in market_dict.keys():
        print("{:10}|{:20}|{:15}|{:15}|{:10}%".format(key,goods_list[key].name, goods_list[key].base_price, round(market_dict[key], 1), round((market_dict[key]/goods_list[key].base_price)*100-100, 1)))
