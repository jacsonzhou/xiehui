package com.efeiyi.pal.system.product.service;

import com.efeiyi.pal.organization.model.Tenant;
import com.efeiyi.pal.product.model.Product;
import com.efeiyi.pal.product.model.ProductSeries;

/**
 * Created by Administrator on 2015/8/22.
 */
public interface ProductServiceManager {
    boolean getDeliverLabelByProduct(Product product);

    Object getTenantProductSeriesByTenantAndProductSeries(Tenant tenant, ProductSeries productSeries);
}
