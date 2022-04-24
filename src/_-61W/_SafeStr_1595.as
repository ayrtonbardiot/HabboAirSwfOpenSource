// by nota

//_-61W._SafeStr_1595

package _-61W
{
    import _-Go._SafeStr_1594;
    import com.sulake.habbo.room.IStuffData;
    import _-61T._SafeStr_1536;
    import flash.utils.getTimer;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1595 implements _SafeStr_1594 
    {

        private var _SafeStr_5713:int;
        private var _SafeStr_5717:Boolean;
        private var _SafeStr_7007:int;
        private var _SafeStr_4110:String;
        private var _SafeStr_7113:int;
        private var _SafeStr_7114:int;
        private var _SafeStr_4158:int;
        private var _SafeStr_4601:IStuffData;
        private var _SafeStr_4268:int;
        private var _secondsToExpiration:int;
        private var _SafeStr_5714:int;
        private var _creationMonth:int;
        private var _SafeStr_5715:int;
        private var _SafeStr_7115:Boolean;
        private var _SafeStr_4222:int;
        private var _flatId:int;
        private var _SafeStr_5706:Boolean;
        private var _SafeStr_5712:Boolean;

        public function _SafeStr_1595(_arg_1:IMessageDataWrapper)
        {
            _SafeStr_7007 = _arg_1.readInteger();
            _SafeStr_4110 = _arg_1.readString().toUpperCase();
            _SafeStr_7113 = _arg_1.readInteger();
            _SafeStr_7114 = _arg_1.readInteger();
            _SafeStr_4158 = _arg_1.readInteger();
            _SafeStr_7115 = _arg_1.readBoolean();
            _SafeStr_4601 = _SafeStr_1536.parseStuffData(_arg_1);
            _secondsToExpiration = -1;
            _SafeStr_5713 = getTimer();
            _SafeStr_5712 = false;
            _SafeStr_5714 = _arg_1.readInteger();
            _creationMonth = _arg_1.readInteger();
            _SafeStr_5715 = _arg_1.readInteger();
            _SafeStr_4268 = ((itemType == "S") ? _arg_1.readInteger() : -1);
            _flatId = -1;
            _SafeStr_5706 = false;
            _SafeStr_5717 = (_SafeStr_4110 == "I");
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

        public function get extra():int
        {
            return (_SafeStr_4268);
        }

        public function get secondsToExpiration():int
        {
            return (_secondsToExpiration);
        }

        public function get creationDay():int
        {
            return (_SafeStr_5714);
        }

        public function get creationMonth():int
        {
            return (_creationMonth);
        }

        public function get creationYear():int
        {
            return (_SafeStr_5715);
        }

        public function get isGroupable():Boolean
        {
            return (_SafeStr_7115);
        }

        public function get songId():int
        {
            return (_SafeStr_4268);
        }

        public function get flatId():int
        {
            return (_flatId);
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

        public function get isRecyclable():Boolean
        {
            return (true);
        }

        public function get isTradeable():Boolean
        {
            return (true);
        }

        public function get isSellable():Boolean
        {
            return (true);
        }

        public function get slotId():String
        {
            return (null);
        }

        public function get isExternalImageFurni():Boolean
        {
            return (!(_SafeStr_4110.indexOf("external_image") == -1));
        }


    }
}//package _-61W

// _SafeStr_1536 = "_-KW" (String#7917, DoABC#3)
// _SafeStr_1594 = "_-010" (String#6467, DoABC#3)
// _SafeStr_1595 = "_-Wz" (String#8761, DoABC#3)
// _SafeStr_4110 = "_-BF" (String#7329, DoABC#3)
// _SafeStr_4158 = "_-pH" (String#10006, DoABC#3)
// _SafeStr_4222 = "_-Tb" (String#8526, DoABC#3)
// _SafeStr_4268 = "_-8L" (String#7124, DoABC#3)
// _SafeStr_4601 = "_-o1B" (String#9925, DoABC#3)
// _SafeStr_5706 = "_-iY" (String#9563, DoABC#3)
// _SafeStr_5712 = "_-JN" (String#7799, DoABC#3)
// _SafeStr_5713 = "_-ao" (String#9028, DoABC#3)
// _SafeStr_5714 = "_-M1g" (String#8010, DoABC#3)
// _SafeStr_5715 = "_-o1e" (String#9933, DoABC#3)
// _SafeStr_5717 = "_-cq" (String#9159, DoABC#3)
// _SafeStr_7007 = "_-J1n" (String#7783, DoABC#3)
// _SafeStr_7113 = "_-N13" (String#8050, DoABC#3)
// _SafeStr_7114 = "_-m1c" (String#9807, DoABC#3)
// _SafeStr_7115 = "_-IT" (String#7748, DoABC#3)


