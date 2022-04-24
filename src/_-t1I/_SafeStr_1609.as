// by nota

//_-t1I._SafeStr_1609

package _-t1I
{
    import __AS3__.vec.Vector;
    import com.sulake.core.communication.messages.IMessageDataWrapper;
    import com.sulake.habbo.utils._SafeStr_401;

    [SecureSWF(rename="true")]
    public class _SafeStr_1609 
    {

        public static const STATE_LOCKED:int = 0;
        public static const _SafeStr_7537:int = 1;
        public static const _SafeStr_7538:int = 2;

        private var _name:String;
        private var _SafeStr_7539:int;
        private var _SafeStr_7540:Vector.<_SafeStr_1677>;


        public function parse(_arg_1:IMessageDataWrapper):void
        {
            var _local_4:int;
            var _local_3:* = null;
            _name = _arg_1.readString();
            _SafeStr_7540 = new Vector.<_SafeStr_1677>();
            var _local_2:int = _arg_1.readInteger();
            _local_4 = 0;
            while (_local_4 < _local_2)
            {
                _local_3 = new _SafeStr_1677();
                _local_3.parse(_arg_1);
                if (_local_3.state == 1)
                {
                    _SafeStr_7539 = _local_4;
                };
                _SafeStr_7540.push(_local_3);
                _local_4++;
            };
        }

        public function findTaskByAchievementId(_arg_1:int):_SafeStr_1664
        {
            var _local_3:* = null;
            var _local_4:_SafeStr_1664;
            for each (var _local_2:_SafeStr_1677 in _SafeStr_7540)
            {
                if (_local_2.state != 0)
                {
                    _local_3 = _local_2.findTaskByAchievementId(_arg_1);
                    if (_local_3 != null)
                    {
                        _local_4 = _local_3;
                    };
                };
            };
            return (_local_4);
        }

        public function get name():String
        {
            return (_name);
        }

        public function get levels():Vector.<_SafeStr_1677>
        {
            return (_SafeStr_7540);
        }

        public function get progressPerLevel():Number
        {
            if (_SafeStr_7540.length > 0)
            {
                return (1 / _SafeStr_7540.length);
            };
            return (0);
        }

        public function get totalProgress():Number
        {
            var _local_1:Number;
            if (_SafeStr_7540.length > 0)
            {
                _local_1 = _SafeStr_7540[_SafeStr_7539].levelProgress;
                return (_SafeStr_401.clamp(((_SafeStr_7539 * progressPerLevel) + (_local_1 * progressPerLevel))));
            };
            return (0);
        }

        public function get progressForCurrentLevel():Number
        {
            if (_SafeStr_7540.length > 0)
            {
                return (_SafeStr_7539 * progressPerLevel);
            };
            return (0);
        }

        public function removeFirstLevel():void
        {
            _SafeStr_7540.shift();
            _SafeStr_7539 = Math.max(0, (_SafeStr_7539 - 1));
        }


    }
}//package _-t1I

// _SafeStr_1609 = "_-g" (String#9382, DoABC#3)
// _SafeStr_1664 = "_-CZ" (String#7397, DoABC#3)
// _SafeStr_1677 = "_-N15" (String#8051, DoABC#3)
// _SafeStr_401 = "_-e1d" (String#9279, DoABC#3)
// _SafeStr_7537 = "_-V1w" (String#8633, DoABC#3)
// _SafeStr_7538 = "_-D5" (String#7441, DoABC#3)
// _SafeStr_7539 = "_-E1o" (String#7481, DoABC#3)
// _SafeStr_7540 = "_-Q1X" (String#8294, DoABC#3)


