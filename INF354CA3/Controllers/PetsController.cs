using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Dynamic;
using INF354CA3.Models;

namespace INF354CA3.Controllers
{
    public class PetsController : ApiController
    {
        private INF354CA3Entities db = new INF354CA3Entities();

        [System.Web.Mvc.Route("api/Pets/listProducts")]
        [HttpGet]
        public List<dynamic> listProducts()
        {
            List<dynamic> products = new List<dynamic>();

            foreach (product p in db.products)
            {
                dynamic o = new ExpandoObject();

                o.id = p.product_ID;
                o.name = p.product_name;
                o.price = p.product_price;

                o.categoryId = p.category_ID;
                o.supplierId = p.supplier_ID;

                products.Add(o);
            }

            return products;
        }

        [System.Web.Mvc.Route("api/Pets/listDetailedProducts")]
        [HttpGet]
        public List<dynamic> listDetailedProducts()
        {
            List<dynamic> products = new List<dynamic>();

            foreach (product p in db.products)
            {
                dynamic o = new ExpandoObject();

                o.id = p.product_ID;
                o.name = p.product_name;
                o.price = p.product_price;

                o.category = new ExpandoObject();
                o.category.id = p.category.category_ID;
                o.category.name = p.category.category_name;

                o.supplier = new ExpandoObject();
                o.supplier.id = p.supplier.supplier_ID;
                o.supplier.name = p.supplier.supplier_name;
                o.supplier.email = p.supplier.supplier_email;
                o.supplier.phone = p.supplier.supplier_phone;

                products.Add(o);
            }

            return products;
        }

        [System.Web.Mvc.Route("api/Pets/addProduct")]
        [HttpPost]
        public dynamic addProduct(string name, decimal price, int categoryId, int supplierId)
        {
            dynamic o = new ExpandoObject();

            if (db.categories.Where(c => c.category_ID == categoryId).FirstOrDefault() == null)
            {
                o.error = "Category not found";
                return o;
            }
            if (db.suppliers.Where(s => s.supplier_ID == supplierId).FirstOrDefault() == null)
            {
                o.error = "Supplier not found";
                return o;
            }

            product p = db.products.Add(new product
            {
                product_name = name,
                product_price = price,
                category_ID = categoryId,
                supplier_ID = supplierId,
            });
            db.SaveChanges();

            o.id = p.product_ID;
            o.name = p.product_name;
            o.price = p.product_price;

            o.categoryId = p.category_ID;
            o.supplierId = p.supplier_ID;

            return o;
        }
    }
}
