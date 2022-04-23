// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.catalog.viewer.Offer

package com.sulake.habbo.catalog.viewer
{
    import com.sulake.habbo.catalog._SafeStr_3141;
    import com.sulake.habbo.catalog.HabboCatalog;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.session.product._SafeStr_3182;

    public class Offer implements _SafeStr_3141 
    {

        public static const PRICING_MODEL_UNKNOWN:String = "pricing_model_unknown";
        public static const PRICING_MODEL_SINGLE:String = "pricing_model_single";
        public static const PRICING_MODEL_MULTI:String = "pricing_model_multi";
        public static const PRICING_MODEL_BUNDLE:String = "pricing_model_bundle";
        public static const PRICING_MODEL_FURNI:String = "pricing_model_furniture";
        public static const PRICE_TYPE_NONE:String = "price_type_none";
        public static const PRICE_TYPE_CREDITS:String = "price_type_credits";
        public static const PRICE_TYPE_ACTIVITYPOINTS:String = "price_type_activitypoints";
        public static const PRICE_TYPE_CREDITS_AND_ACTIVITYPOINTS:String = "price_type_credits_and_activitypoints";

        private var _SafeStr_4718:String;
        private var _SafeStr_4719:String;
        private var _offerId:int;
        private var _SafeStr_4263:String;
        private var _SafeStr_4262:int;
        private var _SafeStr_4260:int;
        private var _SafeStr_4261:int;
        private var _SafeStr_4716:Boolean;
        private var _SafeStr_4722:Boolean;
        private var _SafeStr_4715:_SafeStr_3211;
        private var _SafeStr_4717:_SafeStr_3300;
        private var _disposed:Boolean = false;
        private var _SafeStr_3827:int = 0;
        private var _SafeStr_4723:String;
        private var _SafeStr_4721:Boolean = false;
        private var _catalog:HabboCatalog;
        private var _SafeStr_4720:int;

        public function Offer(_arg_1:int, _arg_2:String, _arg_3:Boolean, _arg_4:int, _arg_5:int, _arg_6:int, _arg_7:Boolean, _arg_8:int, _arg_9:Vector.<_SafeStr_3151>, _arg_10:Boolean, _arg_11:HabboCatalog)
        {
            _offerId = _arg_1;
            _SafeStr_4263 = _arg_2;
            _SafeStr_4722 = _arg_3;
            _SafeStr_4262 = _arg_4;
            _SafeStr_4260 = _arg_5;
            _SafeStr_4261 = _arg_6;
            _SafeStr_4716 = _arg_7;
            _SafeStr_3827 = _arg_8;
            _SafeStr_4721 = _arg_10;
            _catalog = _arg_11;
            analyzePricingModel(_arg_9);
            analyzePriceType();
            createProductContainer(_arg_9);
            for each (var _local_12:Product in _arg_9)
            {
                if (_local_12.productType == "b")
                {
                    _SafeStr_4723 = _local_12.extraParam;
                    return;
                };
            };
        }

        public function get clubLevel():int
        {
            return (_SafeStr_3827);
        }

        public function get page():_SafeStr_3211
        {
            return (_SafeStr_4715);
        }

        public function set page(_arg_1:_SafeStr_3211):void
        {
            _SafeStr_4715 = _arg_1;
        }

        public function get offerId():int
        {
            return (_offerId);
        }

        public function get localizationId():String
        {
            return (_SafeStr_4263);
        }

        public function get priceInCredits():int
        {
            return (_SafeStr_4262);
        }

        public function get priceInActivityPoints():int
        {
            return (_SafeStr_4260);
        }

        public function get activityPointType():int
        {
            return (_SafeStr_4261);
        }

        public function get giftable():Boolean
        {
            return (_SafeStr_4716);
        }

        public function get productContainer():_SafeStr_3300
        {
            return (_SafeStr_4717);
        }

        public function get product():_SafeStr_3151
        {
            return ((_SafeStr_4717) ? _SafeStr_4717.firstProduct : null);
        }

        public function get gridItem():_SafeStr_3266
        {
            return (_SafeStr_4717 as _SafeStr_3266);
        }

        public function get pricingModel():String
        {
            return (_SafeStr_4718);
        }

        public function get priceType():String
        {
            return (_SafeStr_4719);
        }

        public function get previewCallbackId():int
        {
            return (_SafeStr_4720);
        }

        public function set previewCallbackId(_arg_1:int):void
        {
            _SafeStr_4720 = _arg_1;
        }

        public function get bundlePurchaseAllowed():Boolean
        {
            return (_SafeStr_4721);
        }

        public function get isRentOffer():Boolean
        {
            return (_SafeStr_4722);
        }

        public function dispose():void
        {
            if (disposed)
            {
                return;
            };
            _disposed = true;
            _offerId = 0;
            _SafeStr_4263 = "";
            _SafeStr_4262 = 0;
            _SafeStr_4260 = 0;
            _SafeStr_4261 = 0;
            _SafeStr_4715 = null;
            _catalog = null;
            if (_SafeStr_4717 != null)
            {
                _SafeStr_4717.dispose();
                _SafeStr_4717 = null;
            };
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        private function createProductContainer(_arg_1:Vector.<_SafeStr_3151>):void
        {
            switch (_SafeStr_4718)
            {
                case "pricing_model_single":
                    _SafeStr_4717 = new SingleProductContainer(this, _arg_1, _catalog);
                    return;
                case "pricing_model_multi":
                    _SafeStr_4717 = new MultiProductContainer(this, _arg_1, _catalog);
                    return;
                case "pricing_model_bundle":
                    _SafeStr_4717 = new BundleProductContainer(this, _arg_1, _catalog);
                    return;
                default:
                    _SafeStr_4717 = new ProductContainer(this, _arg_1, _catalog);
                    _SafeStr_14.log(("[Offer] Unknown pricing model" + _SafeStr_4718));
                    return;
            };
        }

        private function analyzePricingModel(_arg_1:Vector.<_SafeStr_3151>):void
        {
            var _local_2:Vector.<_SafeStr_3151> = Product.stripAddonProducts(_arg_1);
            if (_local_2.length == 1)
            {
                if (_local_2[0].productCount == 1)
                {
                    _SafeStr_4718 = "pricing_model_single";
                }
                else
                {
                    _SafeStr_4718 = "pricing_model_multi";
                };
            }
            else
            {
                if (_local_2.length > 1)
                {
                    _SafeStr_4718 = "pricing_model_bundle";
                }
                else
                {
                    _SafeStr_4718 = "pricing_model_unknown";
                };
            };
        }

        private function analyzePriceType():void
        {
            if (((_SafeStr_4262 > 0) && (_SafeStr_4260 > 0)))
            {
                _SafeStr_4719 = "price_type_credits_and_activitypoints";
            }
            else
            {
                if (_SafeStr_4262 > 0)
                {
                    _SafeStr_4719 = "price_type_credits";
                }
                else
                {
                    if (_SafeStr_4260 > 0)
                    {
                        _SafeStr_4719 = "price_type_activitypoints";
                    }
                    else
                    {
                        _SafeStr_4719 = "price_type_none";
                    };
                };
            };
        }

        public function clone():Offer
        {
            var _local_4:* = null;
            var _local_2:* = null;
            var _local_5:Vector.<_SafeStr_3151> = new Vector.<_SafeStr_3151>(0);
            var _local_6:_SafeStr_3182 = _catalog.getProductData(localizationId);
            for each (var _local_3:_SafeStr_3151 in _SafeStr_4717.products)
            {
                _local_4 = _catalog.getFurnitureData(_local_3.productClassId, _local_3.productType);
                _local_2 = new Product(_local_3.productType, _local_3.productClassId, _local_3.extraParam, _local_3.productCount, _local_6, _local_4, _catalog);
                _local_5.push(_local_2);
            };
            var _local_1:Offer = new Offer(offerId, localizationId, isRentOffer, priceInCredits, priceInActivityPoints, activityPointType, giftable, clubLevel, _local_5, bundlePurchaseAllowed, _catalog);
            _local_1.page = page;
            return (_local_1);
        }

        public function get badgeCode():String
        {
            return (_SafeStr_4723);
        }

        public function get localizationName():String
        {
            var _local_1:_SafeStr_3182 = _catalog.getProductData(_SafeStr_4263);
            return ((_local_1) ? _local_1.name : (("${" + _SafeStr_4263) + "}"));
        }

        public function get localizationDescription():String
        {
            var _local_1:_SafeStr_3182 = _catalog.getProductData(_SafeStr_4263);
            return ((_local_1) ? _local_1.description : (("${" + _SafeStr_4263) + "}"));
        }


    }
}//package com.sulake.habbo.catalog.viewer

// _SafeStr_14 = "_-ED" (String#155, DoABC#4)
// _SafeStr_3130 = "_-fG" (String#751, DoABC#4)
// _SafeStr_3141 = "_-MT" (String#715, DoABC#4)
// _SafeStr_3151 = "_-22v" (String#1574, DoABC#4)
// _SafeStr_3182 = "_-Ib" (String#2336, DoABC#4)
// _SafeStr_3211 = "_-M1N" (String#2666, DoABC#4)
// _SafeStr_3266 = "_-j1x" (String#3177, DoABC#4)
// _SafeStr_3300 = "_-51I" (String#4277, DoABC#4)
// _SafeStr_3827 = "_-81k" (String#3560, DoABC#4)
// _SafeStr_4260 = "_-V1Z" (String#5666, DoABC#4)
// _SafeStr_4261 = "_-m1a" (String#4020, DoABC#4)
// _SafeStr_4262 = "_-qJ" (String#5618, DoABC#4)
// _SafeStr_4263 = "_-u1X" (String#4219, DoABC#4)
// _SafeStr_4715 = "_-Oe" (String#1538, DoABC#4)
// _SafeStr_4716 = "_-i" (String#8227, DoABC#4)
// _SafeStr_4717 = "_-wl" (String#3070, DoABC#4)
// _SafeStr_4718 = "_-B1H" (String#6161, DoABC#4)
// _SafeStr_4719 = "_-a1W" (String#7549, DoABC#4)
// _SafeStr_4720 = "_-q1e" (String#2637, DoABC#4)
// _SafeStr_4721 = "_-x1r" (String#20559, DoABC#4)
// _SafeStr_4722 = "_-I1G" (String#18662, DoABC#4)
// _SafeStr_4723 = "_-41q" (String#3526, DoABC#4)


