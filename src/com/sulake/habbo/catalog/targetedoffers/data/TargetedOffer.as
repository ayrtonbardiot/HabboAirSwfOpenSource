// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.catalog.targetedoffers.data.TargetedOffer

package com.sulake.habbo.catalog.targetedoffers.data
{
    import _-AE._SafeStr_1619;
    import com.sulake.habbo.catalog._SafeStr_3141;
    import com.sulake.habbo.catalog.viewer._SafeStr_3211;
    import com.sulake.habbo.catalog.viewer._SafeStr_3151;
    import com.sulake.habbo.catalog.viewer._SafeStr_3300;
    import com.sulake.habbo.catalog.viewer._SafeStr_3266;
    import flash.utils.getTimer;
    import com.sulake.habbo.catalog.purse._SafeStr_3142;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.catalog.IHabboCatalog;

    public class TargetedOffer extends _SafeStr_1619 implements _SafeStr_3141 
    {

        public static const _SafeStr_8327:int = 10;

        public function TargetedOffer(_arg_1:_SafeStr_1619=null)
        {
            super(_arg_1);
        }

        public function get offerId():int
        {
            return (0);
        }

        public function get page():_SafeStr_3211
        {
            return (null);
        }

        public function set page(_arg_1:_SafeStr_3211):void
        {
        }

        public function get priceType():String
        {
            return ("");
        }

        public function get product():_SafeStr_3151
        {
            return (null);
        }

        public function get productContainer():_SafeStr_3300
        {
            return (null);
        }

        public function get gridItem():_SafeStr_3266
        {
            return (null);
        }

        public function get localizationId():String
        {
            return ("");
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

        public function get previewCallbackId():int
        {
            return (0);
        }

        public function set previewCallbackId(_arg_1:int):void
        {
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
            return ("");
        }

        public function get localizationDescription():String
        {
            return ("");
        }

        public function get disposed():Boolean
        {
            return (false);
        }

        public function isExpired():Boolean
        {
            return ((_expirationTime > 0) && (getSecondsRemaining() <= 0));
        }

        public function getSecondsRemaining():int
        {
            var _local_1:uint = uint((((_expirationTime - getTimer()) / 1000) - 10));
            return (Math.max(0, _local_1));
        }

        public function checkPurseBalance(_arg_1:_SafeStr_3142, _arg_2:int):Boolean
        {
            if (((!(_arg_1)) || (_arg_1.credits < (_SafeStr_4262 * _arg_2))))
            {
                return (false);
            };
            if (_arg_1.getActivityPointsForType(_SafeStr_4261) < (_SafeStr_4260 * _arg_2))
            {
                return (false);
            };
            return (true);
        }

        public function getLocalizedSubProductNames(_arg_1:IHabboCatalog):Vector.<String>
        {
            var _local_4:* = null;
            var _local_2:Vector.<String> = new Vector.<String>(0);
            for each (var _local_3:String in _SafeStr_5971)
            {
                _local_4 = _arg_1.getProductData(_local_3);
                _local_2.push(((_local_4) ? _local_4.name : _local_3));
            };
            return (_local_2);
        }

        public function dispose():void
        {
        }


    }
}//package com.sulake.habbo.catalog.targetedoffers.data

// _SafeStr_1619 = "_-12w" (String#24274, DoABC#4)
// _SafeStr_3141 = "_-MT" (String#715, DoABC#4)
// _SafeStr_3142 = "_-z5" (String#4391, DoABC#4)
// _SafeStr_3151 = "_-22v" (String#1574, DoABC#4)
// _SafeStr_3182 = "_-Ib" (String#2336, DoABC#4)
// _SafeStr_3211 = "_-M1N" (String#2666, DoABC#4)
// _SafeStr_3266 = "_-j1x" (String#3177, DoABC#4)
// _SafeStr_3300 = "_-51I" (String#4277, DoABC#4)
// _SafeStr_4260 = "_-V1Z" (String#5666, DoABC#4)
// _SafeStr_4261 = "_-m1a" (String#4020, DoABC#4)
// _SafeStr_4262 = "_-qJ" (String#5618, DoABC#4)
// _SafeStr_5971 = "_-71n" (String#33849, DoABC#4)
// _SafeStr_8327 = "_-91J" (String#33103, DoABC#4)


