// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-AE._SafeStr_1611

package _-AE
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1611 
    {

        public static const PRODUCT_TYPE_ITEM:String = "i";
        public static const PRODUCT_TYPE_STUFF:String = "s";
        public static const PRODUCT_TYPE_EFFECT:String = "e";
        public static const PRODUCT_TYPE_BADGE:String = "b";

        private var _SafeStr_4890:String;
        private var _SafeStr_7168:int;
        private var _SafeStr_4131:String;
        private var _SafeStr_5386:int;
        private var _SafeStr_7167:Boolean;
        private var _SafeStr_5389:int;
        private var _SafeStr_5390:int;

        public function _SafeStr_1611(_arg_1:IMessageDataWrapper)
        {
            _SafeStr_4890 = _arg_1.readString();
            switch (_SafeStr_4890)
            {
                case "b":
                    _SafeStr_4131 = _arg_1.readString();
                    _SafeStr_5386 = 1;
                    return;
                default:
                    _SafeStr_7168 = _arg_1.readInteger();
                    _SafeStr_4131 = _arg_1.readString();
                    _SafeStr_5386 = _arg_1.readInteger();
                    _SafeStr_7167 = _arg_1.readBoolean();
                    if (_SafeStr_7167)
                    {
                        _SafeStr_5389 = _arg_1.readInteger();
                        _SafeStr_5390 = _arg_1.readInteger();
                    };
                    return;
            };
        }

        public function get productType():String
        {
            return (_SafeStr_4890);
        }

        public function get furniClassId():int
        {
            return (_SafeStr_7168);
        }

        public function get extraParam():String
        {
            return (_SafeStr_4131);
        }

        public function get productCount():int
        {
            return (_SafeStr_5386);
        }

        public function get uniqueLimitedItem():Boolean
        {
            return (_SafeStr_7167);
        }

        public function get uniqueLimitedItemSeriesSize():int
        {
            return (_SafeStr_5389);
        }

        public function get uniqueLimitedItemsLeft():int
        {
            return (_SafeStr_5390);
        }


    }
}//package _-AE

// _SafeStr_1611 = "_-m6" (String#9821, DoABC#3)
// _SafeStr_4131 = "_-p1c" (String#9989, DoABC#3)
// _SafeStr_4890 = "_-91L" (String#7162, DoABC#3)
// _SafeStr_5386 = "_-c1B" (String#9107, DoABC#3)
// _SafeStr_5389 = "_-32I" (String#6744, DoABC#3)
// _SafeStr_5390 = "_-M1O" (String#7999, DoABC#3)
// _SafeStr_7167 = "_-2v" (String#6708, DoABC#3)
// _SafeStr_7168 = "_-R1P" (String#8344, DoABC#3)


