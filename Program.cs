using System;
using System.Collections.Generic;
using System.Text;
using System.Xml;

namespace Reformer
{
    class Program
    {
        static void Main(string[] args)
        {
            var pays = new List<Pay>();

            XmlDocument doc = new XmlDocument();
            doc.Load("Data1.xml");
            XmlElement root = doc.DocumentElement;
            if (root != null)
            {
                foreach (XmlElement xnode in root)
                {

                    pays.Add(new Pay(xnode.Attributes.GetNamedItem("name").Value,
                        xnode.Attributes.GetNamedItem("surname").Value,
                        Convert.ToDecimal(xnode.Attributes.GetNamedItem("amount").Value.Replace('.', ',')),
                        ConvertMount(xnode.Attributes.GetNamedItem("mount").Value)));
                }
            }
        }

        private static Mount ConvertMount (string mount)
        {
            switch (mount)
            {
                case "january":
                    return Mount.January;
                case "february":
                    return Mount.February;
                default:
                    return Mount.March;
            }
        }

        //Из файла Employees.xml следует что орфографию нужно сохранять
        //Хотя amount можно было бы сохранить в decimal а для месяцев использовать enum
        struct Pay{
            string name;
            string sirname;
            decimal amount;
            Mount mount;
            public Pay(string name, string sirname,decimal amount, Mount mount)
            {
                this.name = name;
                this.sirname = sirname;
                this.amount = amount;
                this.mount = mount;
            }
        }

        //Переменная названа как в файле Data1
        enum Mount{ 
            January,
            February,
            March
        }
    }
}
