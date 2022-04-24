// by nota

//com.sulake.habbo.catalog.viewer.FurnitureOffer

package com.sulake.habbo.catalog.viewer
{
    import com.sulake.habbo.catalog._SafeStr_3141;
    import com.sulake.habbo.session.furniture._SafeStr_3130;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.catalog.HabboCatalog;

    public class FurnitureOffer implements _SafeStr_3141 
    {

        private var _SafeStr_4362:_SafeStr_3130;
        private var _SafeStr_4720:int;
        private var _SafeStr_4715:_SafeStr_3211;
        private var _SafeStr_4717:FurniProductContainer;
        private var _SafeStr_6197:Product;

        public function FurnitureOffer(_arg_1:_SafeStr_3130, _arg_2:HabboCatalog)
        {
            _SafeStr_4362 = _arg_1;
            _SafeStr_4717 = new FurniProductContainer(this, new Vector.<_SafeStr_3151>(0), _arg_2, _SafeStr_4362);
            _SafeStr_6197 = new Product(_SafeStr_4362.type, _SafeStr_4362.id, _SafeStr_4362.customParams, 1, _arg_2.getProductData(_SafeStr_4362.className), _SafeStr_4362, _arg_2);
        }

        public function dispose():void
        {
            _SafeStr_4362 = null;
            _SafeStr_4715 = null;
            _SafeStr_4720 = -1;
        }

        public function get disposed():Boolean
        {
            return (_SafeStr_4362 == null);
        }

        public function get offerId():int
        {
            return ((isRentOffer) ? _SafeStr_4362.rentOfferId : _SafeStr_4362.purchaseOfferId);
        }

        public function get priceInActivityPoints():int
        {
            return (0);
        }

        public function get activityPointType():int
        {
            return (0);
        }

        public function get priceInCredits():int
        {
            return (0);
        }

        public function get page():_SafeStr_3211
        {
            return (_SafeStr_4715);
        }

        public function get priceType():String
        {
            return ("");
        }

        public function get productContainer():_SafeStr_3300
        {
            return (_SafeStr_4717);
        }

        public function get product():_SafeStr_3151
        {
            return (_SafeStr_6197);
        }

        public function get gridItem():_SafeStr_3266
        {
            return (_SafeStr_4717 as _SafeStr_3266);
        }

        public function get localizationId():String
        {
            return ("roomItem.name." + _SafeStr_4362.id);
        }

        public function get bundlePurchaseAllowed():Boolean
        {
            return (false);
        }

        public function get isRentOffer():Boolean
        {
            return ((_SafeStr_4362.rentOfferId > -1) && (!((!(_SafeStr_4715 == null)) && (_SafeStr_4715.isBuilderPage))));
        }

        public function get giftable():Boolean
        {
            return (false);
        }

        public function get pricingModel():String
        {
            return ("pricing_model_furniture");
        }

        public function set previewCallbackId(_arg_1:int):void
        {
            _SafeStr_4720 = _arg_1;
        }

        public function get previewCallbackId():int
        {
            return (_SafeStr_4720);
        }

        public function get clubLevel():int
        {
            return (0);
        }

        public function get badgeCode():String
        {
            return ("");
        }

        public function set page(_arg_1:_SafeStr_3211):void
        {
            _SafeStr_4715 = _arg_1;
        }

        public function get localizationName():String
        {
            return (_SafeStr_4362.localizedName);
        }

        public function get localizationDescription():String
        {
            return (_SafeStr_4362.description);
        }


    }
}//package com.sulake.habbo.catalog.viewer

// _SafeStr_3130 = "_-fG" (String#751, DoABC#4)
// _SafeStr_3141 = "_-MT" (String#715, DoABC#4)
// _SafeStr_3151 = "_-22v" (String#1574, DoABC#4)
// _SafeStr_3211 = "_-M1N" (String#2666, DoABC#4)
// _SafeStr_3266 = "_-j1x" (String#3177, DoABC#4)
// _SafeStr_3300 = "_-51I" (String#4277, DoABC#4)
// _SafeStr_4362 = "_-vN" (String#1324, DoABC#4)
// _SafeStr_4715 = "_-Oe" (String#1538, DoABC#4)
// _SafeStr_4717 = "_-wl" (String#3070, DoABC#4)
// _SafeStr_4720 = "_-q1e" (String#2637, DoABC#4)
// _SafeStr_6197 = "_-b1Y" (String#15912, DoABC#4)


