// by nota

//_-21f._SafeStr_1663

package _-21f
{
    import __AS3__.vec.Vector;
    import _-Ja._SafeStr_1569;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1663 
    {

        public static const _SafeStr_7016:int = 0;
        public static const _SafeStr_7017:int = 1;
        public static const _SafeStr_7018:int = 2;

        private var _SafeStr_5104:String;
        private var _text:String;
        private var _SafeStr_7019:int;
        private var _SafeStr_7020:Boolean;
        private var _SafeStr_5616:int;
        private var _guestRooms:Vector.<_SafeStr_1569> = new Vector.<_SafeStr_1569>(0);

        public function _SafeStr_1663(_arg_1:IMessageDataWrapper)
        {
            var _local_3:int;
            super();
            _SafeStr_5104 = _arg_1.readString();
            _text = _arg_1.readString();
            _SafeStr_7019 = _arg_1.readInteger();
            _SafeStr_7020 = _arg_1.readBoolean();
            _SafeStr_5616 = _arg_1.readInteger();
            var _local_2:int = _arg_1.readInteger();
            _local_3 = 0;
            while (_local_3 < _local_2)
            {
                _guestRooms.push(new _SafeStr_1569(_arg_1));
                _local_3++;
            };
        }

        public function get guestRooms():Vector.<_SafeStr_1569>
        {
            return (_guestRooms);
        }

        public function get searchCode():String
        {
            return (_SafeStr_5104);
        }

        public function get text():String
        {
            return (_text);
        }

        public function get actionAllowed():int
        {
            return (_SafeStr_7019);
        }

        public function get forceClosed():Boolean
        {
            return (_SafeStr_7020);
        }

        public function get viewMode():int
        {
            return (_SafeStr_5616);
        }

        public function set viewMode(_arg_1:int):void
        {
            _SafeStr_5616 = _arg_1;
        }

        public function findGuestRoom(_arg_1:int):_SafeStr_1569
        {
            for each (var _local_2:_SafeStr_1569 in _guestRooms)
            {
                if (_local_2.flatId == _arg_1)
                {
                    return (_local_2);
                };
            };
            return (null);
        }


    }
}//package _-21f

// _SafeStr_1569 = "_-R1p" (String#8356, DoABC#3)
// _SafeStr_1663 = "_-l1U" (String#9748, DoABC#3)
// _SafeStr_5104 = "_-T14" (String#8472, DoABC#3)
// _SafeStr_5616 = "_-qD" (String#10075, DoABC#3)
// _SafeStr_7016 = "_-516" (String#6873, DoABC#3)
// _SafeStr_7017 = "_-7E" (String#7040, DoABC#3)
// _SafeStr_7018 = "_-e1q" (String#9288, DoABC#3)
// _SafeStr_7019 = "_-x1L" (String#10509, DoABC#3)
// _SafeStr_7020 = "_-t1x" (String#10268, DoABC#3)


