// by nota

//com.sulake.habbo.catalog.purchase.RoomAdPurchaseData

package com.sulake.habbo.catalog.purchase
{
    public class RoomAdPurchaseData 
    {

        private var _name:String;
        private var _description:String = "";
        private var _flatId:int;
        private var _offerId:int;
        private var _extended:Boolean;
        private var _SafeStr_4673:int;
        private var _roomName:String;
        private var _expirationTime:Date;
        private var _SafeStr_4674:int = -1;


        public function clear():void
        {
            _name = null;
            _description = "";
            _flatId = 0;
            _extended = false;
            _roomName = null;
            _SafeStr_4673 = -1;
            _SafeStr_4674 = -1;
        }

        public function get name():String
        {
            return (_name);
        }

        public function set name(_arg_1:String):void
        {
            _name = _arg_1;
        }

        public function get description():String
        {
            return (_description);
        }

        public function set description(_arg_1:String):void
        {
            _description = _arg_1;
        }

        public function get flatId():int
        {
            return (_flatId);
        }

        public function set flatId(_arg_1:int):void
        {
            _flatId = _arg_1;
        }

        public function get offerId():int
        {
            return (_offerId);
        }

        public function set offerId(_arg_1:int):void
        {
            _offerId = _arg_1;
        }

        public function get extended():Boolean
        {
            return (_extended);
        }

        public function get extendedFlatId():int
        {
            return (_SafeStr_4673);
        }

        public function set extendedFlatId(_arg_1:int):void
        {
            _SafeStr_4673 = _arg_1;
        }

        public function set extended(_arg_1:Boolean):void
        {
            _extended = _arg_1;
        }

        public function get roomName():String
        {
            return (_roomName);
        }

        public function set roomName(_arg_1:String):void
        {
            _roomName = _arg_1;
        }

        public function get expirationTime():Date
        {
            return (_expirationTime);
        }

        public function set expirationTime(_arg_1:Date):void
        {
            _expirationTime = _arg_1;
        }

        public function get categoryId():int
        {
            return (_SafeStr_4674);
        }

        public function set categoryId(_arg_1:int):void
        {
            _SafeStr_4674 = _arg_1;
        }


    }
}//package com.sulake.habbo.catalog.purchase

// _SafeStr_4673 = "_-y1i" (String#13174, DoABC#4)
// _SafeStr_4674 = "_-k10" (String#2944, DoABC#4)


