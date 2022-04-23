// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.catalog.purchase.PlacedObjectPurchaseData

package com.sulake.habbo.catalog.purchase
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.habbo.session.product._SafeStr_3182;
    import com.sulake.habbo.session.furniture._SafeStr_3130;
    import com.sulake.habbo.catalog._SafeStr_3141;

    public class PlacedObjectPurchaseData implements _SafeStr_13 
    {

        private var _SafeStr_4036:Boolean = false;
        private var _SafeStr_4157:int;
        private var _SafeStr_4158:int;
        private var _SafeStr_3693:int;
        private var _wallLocation:String = "";
        private var _SafeStr_4050:int = 0;
        private var _SafeStr_4051:int = 0;
        private var _direction:int = 0;
        private var _offerId:int;
        private var _SafeStr_4710:int;
        private var _SafeStr_5387:_SafeStr_3182;
        private var _SafeStr_4362:_SafeStr_3130;
        private var _SafeStr_4711:String;

        public function PlacedObjectPurchaseData(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:String, _arg_5:int, _arg_6:int, _arg_7:int, _arg_8:_SafeStr_3141)
        {
            _SafeStr_3693 = _arg_1;
            _SafeStr_4157 = _arg_2;
            _SafeStr_4158 = _arg_3;
            _wallLocation = _arg_4;
            _SafeStr_4050 = _arg_5;
            _SafeStr_4051 = _arg_6;
            _direction = _arg_7;
            setOfferData(_arg_8);
        }

        public function dispose():void
        {
            _SafeStr_4036 = true;
            _SafeStr_5387 = null;
            _SafeStr_4362 = null;
        }

        public function get disposed():Boolean
        {
            return (_SafeStr_4036);
        }

        private function setOfferData(_arg_1:_SafeStr_3141):void
        {
            _offerId = _arg_1.offerId;
            _SafeStr_4710 = _arg_1.product.productClassId;
            _SafeStr_5387 = _arg_1.product.productData;
            _SafeStr_4362 = _arg_1.product.furnitureData;
            _SafeStr_4711 = _arg_1.product.extraParam;
        }

        public function toString():String
        {
            return ([_SafeStr_3693, _SafeStr_4157, _SafeStr_4158, _wallLocation, _SafeStr_4050, _SafeStr_4051, _direction, _offerId, _SafeStr_4710].toString());
        }

        public function get objectId():int
        {
            return (_SafeStr_4157);
        }

        public function get category():int
        {
            return (_SafeStr_4158);
        }

        public function get roomId():int
        {
            return (_SafeStr_3693);
        }

        public function get wallLocation():String
        {
            return (_wallLocation);
        }

        public function get x():int
        {
            return (_SafeStr_4050);
        }

        public function get y():int
        {
            return (_SafeStr_4051);
        }

        public function get direction():int
        {
            return (_direction);
        }

        public function get offerId():int
        {
            return (_offerId);
        }

        public function get productClassId():int
        {
            return (_SafeStr_4710);
        }

        public function get extraParameter():String
        {
            return (_SafeStr_4711);
        }

        public function get furniData():_SafeStr_3130
        {
            return (_SafeStr_4362);
        }


    }
}//package com.sulake.habbo.catalog.purchase

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_3130 = "_-fG" (String#751, DoABC#4)
// _SafeStr_3141 = "_-MT" (String#715, DoABC#4)
// _SafeStr_3182 = "_-Ib" (String#2336, DoABC#4)
// _SafeStr_3693 = "_-KI" (String#730, DoABC#4)
// _SafeStr_4036 = "_-Mr" (String#290, DoABC#4)
// _SafeStr_4050 = "_-22N" (String#402, DoABC#4)
// _SafeStr_4051 = "_-1L" (String#429, DoABC#4)
// _SafeStr_4157 = "_-G8" (String#491, DoABC#4)
// _SafeStr_4158 = "_-pH" (String#830, DoABC#4)
// _SafeStr_4362 = "_-vN" (String#1324, DoABC#4)
// _SafeStr_4710 = "_-L1U" (String#4949, DoABC#4)
// _SafeStr_4711 = "_-91K" (String#4717, DoABC#4)
// _SafeStr_5387 = "_-z1a" (String#3888, DoABC#4)


