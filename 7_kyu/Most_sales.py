def top3(products, amounts, prices):
    revenue_index_product = [ (amo*pri,-idx,pro) for (pro,amo,pri,idx) in zip(products,amounts,prices,range(len(prices))) ]
    revenue_index_product = sorted(revenue_index_product, reverse=True )
    return [ pro for (rev,idx,pro) in revenue_index_product[0:3] ]
    