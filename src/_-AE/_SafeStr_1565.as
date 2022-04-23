// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-AE._SafeStr_1565

package _-AE
{
    import flash.utils.getTimer;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1565 
    {

        public static const _SafeStr_7161:int = 0;
        public static const _SafeStr_7162:int = 1;
        public static const _SafeStr_7163:int = 2;

        private var _SafeStr_4028:int;
        private var _position:int;
        private var _itemName:String;
        private var _SafeStr_7164:String;
        private var _SafeStr_7165:String;
        private var _SafeStr_4838:String;
        private var _SafeStr_7166:int;
        private var _expirationTime:int;

        public function _SafeStr_1565(_arg_1:IMessageDataWrapper)
        {
            if (!_arg_1)
            {
                return;
            };
            _position = _arg_1.readInteger();
            _itemName = _arg_1.readString();
            _SafeStr_7164 = _arg_1.readString();
            _SafeStr_4028 = _arg_1.readInteger();
            switch (_SafeStr_4028)
            {
                case 0:
                    _SafeStr_7165 = _arg_1.readString();
                    break;
                case 2:
                    _SafeStr_4838 = _arg_1.readString();
                    break;
                case 1:
                    _SafeStr_7166 = _arg_1.readInteger();
                default:
            };
            var _local_2:int = _arg_1.readInteger();
            _expirationTime = ((_local_2 > 0) ? ((_local_2 * 1000) + getTimer()) : 0);
        }

        public function get position():int
        {
            return (_position);
        }

        public function get itemName():String
        {
            return (_itemName);
        }

        public function get itemPromoImage():String
        {
            return (_SafeStr_7164);
        }

        public function get cataloguePageLocation():String
        {
            return (_SafeStr_7165);
        }

        public function get offerExpires():Boolean
        {
            return (_expirationTime > 0);
        }

        public function get secondsToExpiration():int
        {
            return (_expirationTime - getTimer());
        }

        public function get type():int
        {
            return (_SafeStr_4028);
        }

        public function get productCode():String
        {
            return (_SafeStr_4838);
        }

        public function get productOfferID():int
        {
            return (_SafeStr_7166);
        }


    }
}//package _-AE

// _SafeStr_1565 = "_-i1o" (String#9540, DoABC#3)
// _SafeStr_4028 = "_-81R" (String#7081, DoABC#3)
// _SafeStr_4838 = "_-T1g" (String#8487, DoABC#3)
// _SafeStr_7161 = "_-22E" (String#6664, DoABC#3)
// _SafeStr_7162 = "_-N1M" (String#8061, DoABC#3)
// _SafeStr_7163 = "_-41J" (String#6808, DoABC#3)
// _SafeStr_7164 = "_-yb" (String#10640, DoABC#3)
// _SafeStr_7165 = "_-U3" (String#8566, DoABC#3)
// _SafeStr_7166 = "_-7k" (String#7057, DoABC#3)


