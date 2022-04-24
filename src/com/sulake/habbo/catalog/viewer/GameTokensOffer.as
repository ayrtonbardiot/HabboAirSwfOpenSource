// by nota

//com.sulake.habbo.catalog.viewer.GameTokensOffer

package com.sulake.habbo.catalog.viewer
{
    import com.sulake.habbo.catalog._SafeStr_3141;
    import com.sulake.core.runtime._SafeStr_13;

    public class GameTokensOffer implements _SafeStr_3141, _SafeStr_13 
    {

        private var _offerId:int;
        private var _SafeStr_4263:String;
        private var _SafeStr_4262:int;
        private var _SafeStr_4260:int;
        private var _SafeStr_4261:int;

        public function GameTokensOffer(_arg_1:int, _arg_2:String, _arg_3:int, _arg_4:int, _arg_5:int)
        {
            _offerId = _arg_1;
            _SafeStr_4263 = _arg_2;
            _SafeStr_4262 = _arg_3;
            _SafeStr_4260 = _arg_4;
            _SafeStr_4261 = _arg_5;
        }

        public function dispose():void
        {
        }

        public function get disposed():Boolean
        {
            return (false);
        }

        public function get offerId():int
        {
            return (_offerId);
        }

        public function get priceInActivityPoints():int
        {
            return (_SafeStr_4260);
        }

        public function get activityPointType():int
        {
            return (_SafeStr_4261);
        }

        public function get priceInCredits():int
        {
            return (_SafeStr_4262);
        }

        public function get page():_SafeStr_3211
        {
            return (null);
        }

        public function get priceType():String
        {
            return ("price_type_credits");
        }

        public function get productContainer():_SafeStr_3300
        {
            return (null);
        }

        public function get product():_SafeStr_3151
        {
            return ((productContainer) ? productContainer.firstProduct : null);
        }

        public function get gridItem():_SafeStr_3266
        {
            return (null);
        }

        public function get localizationId():String
        {
            return (_SafeStr_4263);
        }

        public function get bundlePurchaseAllowed():Boolean
        {
            return (false);
        }

        public function get isRentOffer():Boolean
        {
            return (false);
        }

        public function get giftable():Boolean
        {
            return (false);
        }

        public function get pricingModel():String
        {
            return ("");
        }

        public function set previewCallbackId(_arg_1:int):void
        {
        }

        public function get previewCallbackId():int
        {
            return (0);
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
        }

        public function get localizationName():String
        {
            return (("${" + localizationId) + "}");
        }

        public function get localizationDescription():String
        {
            return (("${" + localizationId) + "}");
        }


    }
}//package com.sulake.habbo.catalog.viewer

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_3141 = "_-MT" (String#715, DoABC#4)
// _SafeStr_3151 = "_-22v" (String#1574, DoABC#4)
// _SafeStr_3211 = "_-M1N" (String#2666, DoABC#4)
// _SafeStr_3266 = "_-j1x" (String#3177, DoABC#4)
// _SafeStr_3300 = "_-51I" (String#4277, DoABC#4)
// _SafeStr_4260 = "_-V1Z" (String#5666, DoABC#4)
// _SafeStr_4261 = "_-m1a" (String#4020, DoABC#4)
// _SafeStr_4262 = "_-qJ" (String#5618, DoABC#4)
// _SafeStr_4263 = "_-u1X" (String#4219, DoABC#4)


