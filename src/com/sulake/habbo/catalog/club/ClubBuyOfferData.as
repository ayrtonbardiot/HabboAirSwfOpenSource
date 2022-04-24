// by nota

//com.sulake.habbo.catalog.club.ClubBuyOfferData

package com.sulake.habbo.catalog.club
{
    import com.sulake.habbo.catalog._SafeStr_3141;
    import com.sulake.habbo.catalog.viewer._SafeStr_3211;
    import com.sulake.habbo.catalog.viewer._SafeStr_3300;
    import com.sulake.habbo.catalog.viewer._SafeStr_3151;
    import com.sulake.habbo.catalog.viewer._SafeStr_3266;

    public class ClubBuyOfferData implements _SafeStr_3141 
    {

        private var _offerId:int;
        private var _SafeStr_4838:String;
        private var _SafeStr_5094:int;
        private var _SafeStr_5100:int;
        private var _SafeStr_5101:int;
        private var _SafeStr_5095:Boolean;
        private var _SafeStr_5096:int;
        private var _SafeStr_5097:int;
        private var _SafeStr_4715:_SafeStr_3211;
        private var _SafeStr_5098:int;
        private var _month:int;
        private var _SafeStr_5099:int;
        private var _SafeStr_4711:String;
        private var _SafeStr_5102:Boolean = false;
        private var _disposed:Boolean = false;
        private var _SafeStr_5103:int;
        private var _SafeStr_4716:Boolean;

        public function ClubBuyOfferData(_arg_1:int, _arg_2:String, _arg_3:int, _arg_4:int, _arg_5:int, _arg_6:Boolean, _arg_7:int, _arg_8:int, _arg_9:int, _arg_10:int, _arg_11:int, _arg_12:int, _arg_13:Boolean=false)
        {
            _offerId = _arg_1;
            _SafeStr_4838 = _arg_2;
            _SafeStr_5094 = _arg_3;
            _SafeStr_5100 = _arg_4;
            _SafeStr_5101 = _arg_5;
            _SafeStr_5095 = _arg_6;
            _SafeStr_5096 = _arg_7;
            _SafeStr_5103 = _arg_8;
            _SafeStr_5097 = _arg_9;
            _SafeStr_5098 = _arg_10;
            _month = _arg_11;
            _SafeStr_5099 = _arg_12;
            _SafeStr_4716 = _arg_13;
        }

        public function dispose():void
        {
            if (disposed)
            {
                return;
            };
            _disposed = true;
            _SafeStr_4715 = null;
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function get extraParameter():String
        {
            return (_SafeStr_4711);
        }

        public function set extraParameter(_arg_1:String):void
        {
            _SafeStr_4711 = _arg_1;
        }

        public function get offerId():int
        {
            return (_offerId);
        }

        public function get productCode():String
        {
            return (_SafeStr_4838);
        }

        public function get priceCredits():int
        {
            return (_SafeStr_5094);
        }

        public function get vip():Boolean
        {
            return (_SafeStr_5095);
        }

        public function get months():int
        {
            return (_SafeStr_5096);
        }

        public function get daysLeftAfterPurchase():int
        {
            return (_SafeStr_5097);
        }

        public function get year():int
        {
            return (_SafeStr_5098);
        }

        public function get month():int
        {
            return (_month);
        }

        public function get day():int
        {
            return (_SafeStr_5099);
        }

        public function get isGiftable():Boolean
        {
            return (_SafeStr_4716);
        }

        public function get priceInActivityPoints():int
        {
            return (_SafeStr_5100);
        }

        public function get activityPointType():int
        {
            return (_SafeStr_5101);
        }

        public function get priceInCredits():int
        {
            return (_SafeStr_5094);
        }

        public function get page():_SafeStr_3211
        {
            return (_SafeStr_4715);
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
            return (_SafeStr_4838);
        }

        public function set page(_arg_1:_SafeStr_3211):void
        {
            _SafeStr_4715 = _arg_1;
        }

        public function get upgradeHcPeriodToVip():Boolean
        {
            return (_SafeStr_5102);
        }

        public function set upgradeHcPeriodToVip(_arg_1:Boolean):void
        {
            _SafeStr_5102 = _arg_1;
        }

        public function get extraDays():int
        {
            return (_SafeStr_5103);
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
            return (_SafeStr_4716);
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

        public function get localizationName():String
        {
            return (("${" + localizationId) + "}");
        }

        public function get localizationDescription():String
        {
            return (("${" + localizationId) + "}");
        }


    }
}//package com.sulake.habbo.catalog.club

// _SafeStr_3141 = "_-MT" (String#715, DoABC#4)
// _SafeStr_3151 = "_-22v" (String#1574, DoABC#4)
// _SafeStr_3211 = "_-M1N" (String#2666, DoABC#4)
// _SafeStr_3266 = "_-j1x" (String#3177, DoABC#4)
// _SafeStr_3300 = "_-51I" (String#4277, DoABC#4)
// _SafeStr_4711 = "_-91K" (String#4717, DoABC#4)
// _SafeStr_4715 = "_-Oe" (String#1538, DoABC#4)
// _SafeStr_4716 = "_-i" (String#8227, DoABC#4)
// _SafeStr_4838 = "_-T1g" (String#4465, DoABC#4)
// _SafeStr_5094 = "_-p2" (String#8595, DoABC#4)
// _SafeStr_5095 = "_-u1x" (String#20676, DoABC#4)
// _SafeStr_5096 = "_-z1w" (String#19493, DoABC#4)
// _SafeStr_5097 = "_-w15" (String#19423, DoABC#4)
// _SafeStr_5098 = "_-vC" (String#17995, DoABC#4)
// _SafeStr_5099 = "_-se" (String#18469, DoABC#4)
// _SafeStr_5100 = "_-Zt" (String#10034, DoABC#4)
// _SafeStr_5101 = "_-610" (String#19910, DoABC#4)
// _SafeStr_5102 = "_-lL" (String#18226, DoABC#4)
// _SafeStr_5103 = "_-N1c" (String#21343, DoABC#4)


