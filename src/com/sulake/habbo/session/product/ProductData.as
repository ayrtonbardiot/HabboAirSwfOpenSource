// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.session.product.ProductData

package com.sulake.habbo.session.product
{
    public class ProductData implements _SafeStr_3182 
    {

        private var _SafeStr_4028:String;
        private var _name:String;
        private var _description:String = "";

        public function ProductData(_arg_1:String, _arg_2:String)
        {
            _SafeStr_4028 = _arg_1;
            _name = _arg_2;
        }

        public function get type():String
        {
            return (_SafeStr_4028);
        }

        public function get name():String
        {
            return (_name);
        }

        public function get description():String
        {
            return (_description);
        }


    }
}//package com.sulake.habbo.session.product

// _SafeStr_3182 = "_-Ib" (String#2336, DoABC#4)
// _SafeStr_4028 = "_-81R" (String#336, DoABC#4)


