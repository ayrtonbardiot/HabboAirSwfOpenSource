// by nota

//_-Go._SafeStr_1599

package _-Go
{
    import com.sulake.habbo.room.IStuffData;
    import _-61T._SafeStr_1536;
    import flash.utils.getTimer;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1599 implements _SafeStr_1594 
    {

        private static const _SafeStr_7254:String = "I";
        private static const _SafeStr_7255:String = "S";

        private var _SafeStr_5706:Boolean;
        private var _SafeStr_7007:int;
        private var _SafeStr_4110:String;
        private var _SafeStr_7113:int;
        private var _SafeStr_7114:int;
        private var _SafeStr_4158:int;
        private var _SafeStr_4601:IStuffData;
        private var _SafeStr_7115:Boolean;
        private var _SafeStr_7256:Boolean;
        private var _SafeStr_7257:Boolean;
        private var _SafeStr_6912:Boolean;
        private var _secondsToExpiration:int;
        private var _SafeStr_4268:int;
        private var _flatId:int;
        private var _SafeStr_5717:Boolean;
        private var _SafeStr_5712:Boolean;
        private var _SafeStr_5713:int;
        private var _SafeStr_5716:String = "";
        private var _SafeStr_4222:int = -1;

        public function _SafeStr_1599(_arg_1:IMessageDataWrapper)
        {
            _SafeStr_7007 = _arg_1.readInteger();
            _SafeStr_4110 = _arg_1.readString();
            _SafeStr_7113 = _arg_1.readInteger();
            _SafeStr_7114 = _arg_1.readInteger();
            _SafeStr_4158 = _arg_1.readInteger();
            _SafeStr_4601 = _SafeStr_1536.parseStuffData(_arg_1);
            _SafeStr_7256 = _arg_1.readBoolean();
            _SafeStr_7257 = _arg_1.readBoolean();
            _SafeStr_7115 = _arg_1.readBoolean();
            _SafeStr_6912 = _arg_1.readBoolean();
            _secondsToExpiration = _arg_1.readInteger();
            _SafeStr_5713 = getTimer();
            if (secondsToExpiration > -1)
            {
                _SafeStr_5706 = true;
            }
            else
            {
                _SafeStr_5706 = false;
                _secondsToExpiration = -1;
            };
            _SafeStr_5712 = _arg_1.readBoolean();
            _flatId = _arg_1.readInteger();
            _SafeStr_5717 = (_SafeStr_4110 == "I");
            if (_SafeStr_4110 == "S")
            {
                _SafeStr_5716 = _arg_1.readString();
                _SafeStr_4268 = _arg_1.readInteger();
            };
        }

        public function get itemId():int
        {
            return (_SafeStr_7007);
        }

        public function get itemType():String
        {
            return (_SafeStr_4110);
        }

        public function get roomItemId():int
        {
            return (_SafeStr_7113);
        }

        public function get itemTypeId():int
        {
            return (_SafeStr_7114);
        }

        public function get category():int
        {
            return (_SafeStr_4158);
        }

        public function get stuffData():IStuffData
        {
            return (_SafeStr_4601);
        }

        public function get isGroupable():Boolean
        {
            return (_SafeStr_7115);
        }

        public function get isRecyclable():Boolean
        {
            return (_SafeStr_7256);
        }

        public function get isTradeable():Boolean
        {
            return (_SafeStr_7257);
        }

        public function get isSellable():Boolean
        {
            return (_SafeStr_6912);
        }

        public function get secondsToExpiration():int
        {
            return (_secondsToExpiration);
        }

        public function get flatId():int
        {
            return (_flatId);
        }

        public function get slotId():String
        {
            return (_SafeStr_5716);
        }

        public function get songId():int
        {
            return (_SafeStr_4222);
        }

        public function get extra():int
        {
            return (_SafeStr_4268);
        }

        public function get isRented():Boolean
        {
            return (_SafeStr_5706);
        }

        public function get isWallItem():Boolean
        {
            return (_SafeStr_5717);
        }

        public function get hasRentPeriodStarted():Boolean
        {
            return (_SafeStr_5712);
        }

        public function get expirationTimeStamp():int
        {
            return (_SafeStr_5713);
        }

        public function get creationDay():int
        {
            return (0);
        }

        public function get creationMonth():int
        {
            return (0);
        }

        public function get creationYear():int
        {
            return (0);
        }

        public function get isExternalImageFurni():Boolean
        {
            return (!(_SafeStr_4110.indexOf("external_image") == -1));
        }


    }
}//package _-Go

// _SafeStr_1536 = "_-KW" (String#7917, DoABC#3)
// _SafeStr_1594 = "_-010" (String#6467, DoABC#3)
// _SafeStr_1599 = "_-v1l" (String#10394, DoABC#3)
// _SafeStr_4110 = "_-BF" (String#7329, DoABC#3)
// _SafeStr_4158 = "_-pH" (String#10006, DoABC#3)
// _SafeStr_4222 = "_-Tb" (String#8526, DoABC#3)
// _SafeStr_4268 = "_-8L" (String#7124, DoABC#3)
// _SafeStr_4601 = "_-o1B" (String#9925, DoABC#3)
// _SafeStr_5706 = "_-iY" (String#9563, DoABC#3)
// _SafeStr_5712 = "_-JN" (String#7799, DoABC#3)
// _SafeStr_5713 = "_-ao" (String#9028, DoABC#3)
// _SafeStr_5716 = "_-k1L" (String#9672, DoABC#3)
// _SafeStr_5717 = "_-cq" (String#9159, DoABC#3)
// _SafeStr_6912 = "_-Bf" (String#7341, DoABC#3)
// _SafeStr_7007 = "_-J1n" (String#7783, DoABC#3)
// _SafeStr_7113 = "_-N13" (String#8050, DoABC#3)
// _SafeStr_7114 = "_-m1c" (String#9807, DoABC#3)
// _SafeStr_7115 = "_-IT" (String#7748, DoABC#3)
// _SafeStr_7254 = "_-w1w" (String#10470, DoABC#3)
// _SafeStr_7255 = "_-A1s" (String#7233, DoABC#3)
// _SafeStr_7256 = "_-314" (String#6712, DoABC#3)
// _SafeStr_7257 = "_-41Z" (String#6825, DoABC#3)


